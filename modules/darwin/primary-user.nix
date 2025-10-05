{lib, ...}: let
  inherit (lib) mkOption types;
in {
  options.modules.darwin.primary-user = {
    username = mkOption {
      type = types.nullOr types.str;
      default = null;
    };

    fullName = mkOption {
      type = types.nullOr types.str;
      default = null;
    };

    email = mkOption {
      type = types.nullOr types.str;
      default = null;
    };
  };
}
