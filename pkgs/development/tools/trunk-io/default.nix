{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  pname = "trunk-io";
  version = "1.2.3";

  src = fetchurl {
    url = "https://trunk.io/releases/launcher/${version}/trunk";
    hash = "sha256-arWege61fb7NiYSIL3ZaDQr75QEbDDJ7rVgdRUKqP4A=";
  };

  dontUnpack = true;
  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    install -D $src $out/bin/trunk
  '';

  passthru.updateScript = ./update.sh;

  meta = with lib; {
    homepage = "https://trunk.io/";
    description = "Developer experience toolkit used to check, test, merge, and monitor code";
    license = licenses.unfree;
    maintainers = with maintainers; [ aaronjheng ];
  };
}
