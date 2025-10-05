{pkgs, ...}: {
  programs.alacritty = {
    enable = true;
    settings = {
      colors = {
        indexed_colors = [
          {
            color = "#ff966c";
            index = 16;
          }
          {
            color = "#c53b53";
            index = 17;
          }
        ];
        bright = {
          black = "#414868";
          red = "#f7768e";
          green = "#9ece6a";
          yellow = "#e0af68";
          blue = "#7aa2f7";
          magenta = "#bb9af7";
          cyan = "#7dcfff";
          white = "#c0caf5";
        };
        cursor = {
          cursor = "#c0caf5";
          text = "#24283b";
        };
        normal = {
          black = "#1d202f";
          red = "#f7768e";
          green = "#9ece6a";
          yellow = "#e0af68";
          blue = "#7aa2f7";
          magenta = "#bb9af7";
          cyan = "#7dcfff";
          white = "#a9b1d6";
        };
        primary = {
          background = "#24283b";
          foreground = "#c0caf5";
        };
      };

      env = {
        LANG = "en_US.UTF-8";
        LC_CTYPE = "en_US.UTF-8";
        TERM = "xterm-256color";
      };

      font = {
        size = 17.0;
        bold = {
          family = "FiraCode Nerd Font Mono";
          style = "SemiBold";
        };
        normal = {
          family = "FiraCode Nerd Font Mono";
          style = "Retina";
        };
      };

      shell = {
        args = ["-l" "-c" "tmux attach -t ALACRITTY || tmux new -s ALACRITTY"];
        program = "${pkgs.zsh}/bin/zsh";
      };

      window = {
        dimensions = {
          columns = 120;
          lines = 40;
        };
        padding = {
          x = 5;
          y = 5;
        };
      };
    };
  };
}
