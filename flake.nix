{
  description = "My Nix templates";

  outputs =
    { self }:
    {
      templates = {
        cpp = {
          path = ./templates/cpp;
          description = "C++ development shell";

        };

        c = {
          path = ./templates/c;
          description = "C development shell";
        };

        glad = {
          path = ./templates/glad;
          description = "default glad setup for OpenGL 4.6";
        };

        rust = {
          path = ./templates/rust;
          description = "default rust setup";
        };
      };
    };
}
