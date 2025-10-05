{ config, ... }: {
  sops.secrets.age-keys = {
    sopsFile = ../../secrets/age-keys.txt;
    format = "binary";
  };

  xdg.configFile."sops/age/keys.txt" = {
    source = config.lib.file.mkOutOfStoreSymlink config.sops.secrets.age-keys.path;
  };
}
