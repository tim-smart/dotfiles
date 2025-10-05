{config, ...}: {
  services.syncthing = {
    enable = true;
    # dataDir = "${config.home.homeDirectory}/Sync";
  };
}
