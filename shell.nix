{ pkgs ? (import <nixpkgs> {}) }:

let
  env = with pkgs; [
    bundler
    ruby_2_2_0
    zlib
    sqlite
  ];
in

pkgs.stdenv.mkDerivation rec {
    name = "cashctrl";
    src = ./.;
    version = "0.1";

    buildInputs = [ env ];

}

