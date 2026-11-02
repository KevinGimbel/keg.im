{
  inputs = {
    nixpkgs = {
      # Randomly chosen commit on 2026-10-29 to have a
      # truely reproducible environment with
      # New commit version can be found on
      # https://github.com/NixOS/nixpkgs/tree/nixos-unstable-small
      url = "github:NixOS/nixpkgs/715d20f576d746adbf5a871ed37e6e3ee4b280e2";
    };
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShell = with pkgs; mkShell {
          buildInputs = [
            # neocities cli for uploading site
            neocities

            # build env
            nodejs_26

            # Extra tooling
            just
            mktoc
            prek
            direnv
          ];
        };
      }
    );
}
