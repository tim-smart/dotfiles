{
  config,
  pkgs,
  ...
}: let
  aerospace-swipe = pkgs.stdenv.mkDerivation {
    name = "aerospace-swipe";
    src = pkgs.fetchFromGitHub {
      owner = "acsandmann";
      repo = "aerospace-swipe";
      rev = "main";
      hash = "sha256-Qfj6+qZ/SQND+LMOSdUiYGDXFxU6+xmXxkYerxsdkcE=";
    };

    NIX_ENFORCE_NO_NATIVE = false;
    preferLocalBuild = true;
    allowSubstitutes = false;

    buildInputs = with pkgs; [
      gcc
      apple-sdk_15
      (darwinMinVersionHook "15")
    ];
    buildPhase = ''
      make bundle
    '';
    installPhase = ''
      mkdir -p $out/bin
      cp swipe $out/bin/swipe
    '';
  };
in {
  home.packages = with pkgs; [
    aerospace
    jankyborders
  ];

  xdg.configFile."aerospace/aerospace.toml" = {
    source = config.lib.file.mkOutOfStoreSymlink "/Volumes/Code/dotfiles/home/tim/aerospace/aerospace.toml";
  };
  xdg.configFile."aerospace/gaps" = {
    text = ''
      #!/usr/bin/env zsh

      # Configuration
      FULL_WINDOW_GAP=8                                 # Gap when no centered window gap is applied
      WINDOW_PERCENTAGE_DEFAULT=66                      # Default percentage for automatic mode
      WINDOW_PERCENTAGE_STEPS=(33 50 66)                # Percentages to cycle through in cycle mode
      MONITOR_PATTERN="main"                            # Monitor pattern to match in AeroSpace config (matches monitor name pattern)
      ULTRAWIDE_ASPECT_RATIO=2.3                        # Minimum aspect ratio to consider a monitor ultrawide (21:9 ≈ 2.33, 32:9 ≈ 3.56)
      STATE_FILE="/tmp/aerospace-ultrawide-cycle-state" # File to store current cycle index

      # Function to calculate gap for a given percentage
      calculate_gap() {
          local percentage=$1

          # Get the focused monitor's name
          monitor_name=$(aerospace list-monitors --focused | awk -F ' \\| ' '{print $2}')

          # Get the resolution for this specific monitor from system_profiler
          resolution=$(system_profiler SPDisplaysDataType | grep -A2 "$monitor_name" | grep "UI Looks like:" | head -1)
          width=$(echo "$resolution" | awk '{print $4}')
          height=$(echo "$resolution" | awk '{print $6}')

          # Check if monitor is ultrawide
          if [[ -n "$width" && -n "$height" && $height -gt 0 ]]; then
              aspect_ratio=$(echo "scale=2; $width / $height" | bc)
              is_ultrawide=$(echo "$aspect_ratio >= $ULTRAWIDE_ASPECT_RATIO" | bc)

              if [[ $is_ultrawide -eq 1 ]]; then
                  # Calculate gap: (100 - window_percentage) / 2
                  gap_value=$(((width * (100 - percentage)) / 200))
                  echo -n "[{ monitor.\"$MONITOR_PATTERN\" = $gap_value }, $FULL_WINDOW_GAP]"
                  return 0
              fi
          fi

          # Not ultrawide or couldn't determine resolution
          return 1
      }

      # Initialize defaults
      window_count=$(aerospace list-windows --workspace focused --count)
      config_path=/Volumes/Code/dotfiles/home/tim/aerospace/aerospace.toml
      size=$FULL_WINDOW_GAP

      # Early exit: can't apply centered gap without exactly one window
      if [[ $window_count -ne 1 ]]; then
          # Apply default gap and exit
          sed -i ''' "s/^outer\.left = .*/outer.left = $size/; s/^outer\.right = .*/outer.right = $size/" "$config_path"
          aerospace reload-config
          exit 0
      fi

      # At this point, we have exactly 1 window

      # Cycle mode: cycle through different window percentages
      if [[ "$1" == "cycle" ]]; then
          # Read current cycle index (default to -1 to start at 0)
          if [[ -f "$STATE_FILE" ]]; then
              current_index=$(cat "$STATE_FILE")
          else
              current_index=-1
          fi

          # Increment and wrap around
          next_index=$(((current_index + 1) % ''${#WINDOW_PERCENTAGE_STEPS[@]}))
          echo "$next_index" >"$STATE_FILE"

          # Get the percentage for this cycle
          percentage=''${WINDOW_PERCENTAGE_STEPS[$next_index]}

          # Try to calculate gap with the cycled percentage
          calculated_size=$(calculate_gap "$percentage")
          if [[ $? -eq 0 ]]; then
              size=$calculated_size
          fi
          # If not ultrawide, size remains at default and we exit without applying
          # (cycle mode should only work on ultrawide)
          [[ $? -eq 0 ]] || exit 0

      # Manual toggle mode: check current state and toggle
      elif [[ "$1" == "toggle" ]]; then
          current_left=$(grep -E "^[[:space:]]*outer\.left" "$config_path")
          if [[ "$current_left" =~ "monitor" ]]; then
              # Gap is currently applied, remove it (size already set to default)
              : # size already set to FULL_WINDOW_GAP, will apply at end
          else
              # Gap not applied, try to apply it
              # Use cycle state if exists, otherwise use default
              if [[ -f "$STATE_FILE" ]]; then
                  current_index=$(cat "$STATE_FILE")
                  percentage=''${WINDOW_PERCENTAGE_STEPS[$current_index]}
              else
                  percentage=$WINDOW_PERCENTAGE_DEFAULT
              fi

              calculated_size=$(calculate_gap "$percentage")
              if [[ $? -eq 0 ]]; then
                  size=$calculated_size
              else
                  # Not ultrawide, can't toggle
                  exit 0
              fi
          fi

      # Automatic mode (no argument)
      else
          # Determine which percentage to use
          # If we have a cycle state, use it; otherwise use default
          if [[ -f "$STATE_FILE" ]]; then
              current_index=$(cat "$STATE_FILE")
              percentage=''${WINDOW_PERCENTAGE_STEPS[$current_index]}
          else
              percentage=$WINDOW_PERCENTAGE_DEFAULT
          fi

          # Try to apply gap for single window on ultrawide monitor
          calculated_size=$(calculate_gap "$percentage")
          if [[ $? -eq 0 ]]; then
              size=$calculated_size
          fi
          # If not ultrawide, size remains at default
      fi

      # Apply the gap and reload config
      sed -i ''' "s/^outer\.left = .*/outer.left = $size/; s/^outer\.right = .*/outer.right = $size/" "$config_path"
      aerospace reload-config
    '';
    executable = true;
  };
}
