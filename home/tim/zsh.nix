{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [fasd];

  programs.zsh = {
    dotDir = "${config.xdg.configHome}/zsh";
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autocd = true;
    profileExtra = ''
      ${lib.readFile ./zsh/profile.zsh}
    '';
    history = {
      path = "${config.xdg.dataHome}/zsh/zsh_history";
      expireDuplicatesFirst = true;
      extended = false;
      ignoreDups = true;
      ignoreSpace = true;
      share = true;
      save = 100000;
      size = 100000;
    };
    initContent = ''
      source ${config.sops.secrets.env_secrets.path}
      ${lib.readFile ./zsh/init.zsh}
      ${lib.readFile ./zsh/lscolors.zsh}
      source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

      function after_zvm() {
        if [[ $options[zle] = on ]]; then
          . ${pkgs.fzf}/share/fzf/completion.zsh
          . ${pkgs.fzf}/share/fzf/key-bindings.zsh
        fi
      }
      zvm_after_init_commands+=(after_zvm)
    '';
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = ./zsh;
        file = "p10k.zsh";
      }
    ];
    oh-my-zsh = {
      enable = true;
      plugins = [
        "asdf"
        "fasd"
        "git"
        "kubectl"
      ];
    };
  };

  programs.fd = {
    enable = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = false;
    defaultCommand = "fd --type f --strip-cwd-prefix --hidden --follow --exclude .git";
    fileWidgetCommand = "fd --type f --strip-cwd-prefix --hidden --follow --exclude .git";
  };

  sops.secrets.env_secrets = {
    sopsFile = ../../secrets/env_secrets.sh;
    format = "binary";
  };

  home.shellAliases = {
    ls = "ls --color=auto";
  };

  home.sessionVariables = {
    SHELL = "${pkgs.zsh}/bin/zsh";
  };
}
