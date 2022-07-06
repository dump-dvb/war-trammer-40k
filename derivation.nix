{ naersk, src, lib, pkg-config, cmake, protobuf, stops, zlib }:

naersk.buildPackage {
  pname = "data-accumulator";
  version = "0.1.0";

  src = ./.;

  cargoSha256 = lib.fakeSha256;

  patchPhase = ''
    cp ${stops}/stops.json ./stops.json
  '';

  nativeBuildInputs = [ pkg-config cmake protobuf zlib ];

  meta = with lib; {
    description = "Simple rust server which collects data from telegram stations";
    homepage = "https://github.com/dump-dvb/data-accumulator";
  };
}
