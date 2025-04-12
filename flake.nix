{
  inputs = {
    utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  outputs = { self, nixpkgs, utils }:
    utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            nixfmt
            nixd
            just
            pre-commit
            # TODO: Add project specific dependencies
          ];

          shellHook = ''
            just setup
            echo -e "\e[32;1mReady! \e[0m"
          '';
        };
      });
}
