{
  description = "C development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:

    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          name = "c-dev";

          packages = with pkgs; [
            # ── Compilers ──────────────────────────────────────────────────
            gcc

            # ── Build systems ──────────────────────────────────────────────
            cmake
            ninja
            gnumake
            xmake

            # ── Debuggers & profilers ──────────────────────────────────────
            gdb
            valgrind

            # ── Static analysis & formatting ───────────────────────────────
            clang-tools

            # ── Libraries ──────────────────────────────────────────────────
          ];

          # Shell hook: printed when you enter the shell
          # shellHook = ''
          #   echo "🔧  C++ dev shell ready"
          #   echo "   compiler : $(c++ --version | head -1)"
          #   echo "   cmake    : $(cmake --version | head -1)"
          #   echo ""
          # '';

          # Make clangd find the right headers
          CMAKE_EXPORT_COMPILE_COMMANDS = "1";
        };
      }
    );
}
