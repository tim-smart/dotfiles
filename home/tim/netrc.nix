{config, ...}: {
  sops.secrets.netrc = {
    sopsFile = ../../secrets/netrc;
    format = "binary";
  };

  home.file.".netrc".source = config.lib.file.mkOutOfStoreSymlink config.sops.secrets.netrc.path;
}
