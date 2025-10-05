{
  lib,
  stdenv,
  buildGoModule,
  fetchFromGitHub,
  pinentry_mac,
  ...
}:
buildGoModule rec {
  pname = "pinentry-touchid";
  version = "0.0.3-rc1";

  src = fetchFromGitHub {
    owner = "jorgelbg";
    repo = "pinentry-touchid";
    rev = "1170eb6bc7b23313aee622887b47b77be6e5fb5f";
    hash = "sha256-asLFY7ztRKXEFsetB3Ym/0tJ1BBOn0yYpL8MIn1Z//0=";
  };

  vendorHash = "sha256-UgdJauwle/9FqglmO1eyVsplq6Bw2GHCYtcGIhdZZ+Q=";

  subPackages = ["."];

  nativeBuildInputs = [pinentry_mac];

  doCheck = false;

  meta = with lib; {
    description = "Custom GPG pinentry program for macOS that allows using Touch ID";
    inherit (src.meta) homepage;
    license = licenses.asl20;
    maintainers = [maintainers.tim-smart];
    platforms = platforms.darwin;
    skip.ci = !stdenv.isDarwin;
  };
}
