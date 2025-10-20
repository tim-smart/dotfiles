{
  config,
  pkgs,
  ...
}: {
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    sensibleOnTop = false;
    terminal = "screen-256color";
    escapeTime = 0;
    historyLimit = 50000;
    aggressiveResize = true;
    plugins = with pkgs; [
      tmuxPlugins.power-theme
      tmuxPlugins.yank
    ];
    extraConfig = ''
      set-option -g display-time 4000
      set-option -g status-interval 5
      set-option -g default-command "${pkgs.reattach-to-user-namespace}/bin/reattach-to-user-namespace -l ${pkgs.zsh}/bin/zsh"
      set-option -g focus-events on

      bind  c  new-window      -c "#{pane_current_path}"
      bind  %  split-window -h -c "#{pane_current_path}"
      bind '"' split-window -v -c "#{pane_current_path}"

      bind LEFT resize-pane -L 20
      bind RIGHT resize-pane -R 20
      bind UP resize-pane -U 5
      bind DOWN resize-pane -D 5
    '';
  };
}
