{ pkgs ? import <nixpkgs> {} }:

(pkgs.buildFHSUserEnv {
  name = "ninja-env";
  targetPkgs = pkgs: with pkgs; [
    dpkg
    glibc
    zlib
    openssl
    curl
    stdenv.cc.cc.lib

    # Extraction Tools
    binutils
    #tar
    xz
    zstd
    
    # Dependencies for the Agent
    glibc
    ];
  multiPkgs = pkgs: with pkgs; [
    zlib
  ];
  runScript = "bash";
}).env