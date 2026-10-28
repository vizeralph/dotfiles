{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = [
          #########################
          # JAVASCRIPT/TYPESCRIPT #
          #########################
          pkgs.typescript
          pkgs.typescript-language-server

          #######
          # LUA #
          #######
          pkgs.lua-language-server
          pkgs.stylua

          ############
          # MARKDOWN #
          ############
          pkgs.marksman

          #######
          # NIX #
          #######
          pkgs.nixd
          pkgs.nixfmt

          #########
          # SHELL #
          #########
          pkgs.bash-language-server
          pkgs.shellcheck
          pkgs.shfmt

          ########
          # TOML #
          ########
          pkgs.taplo

          #######
          # XML #
          #######
          pkgs.lemminx
          pkgs.libxml2

          ########
          # YAML #
          ########
          pkgs.yaml-language-server

          ##########
          # SHARED #
          ##########
          pkgs.prettier
          pkgs.vscode-langservers-extracted
        ];
      };
    };
}
