{
  description = "My Nix templates";

  outputs = { self }: {
    templates.cpp = {
      path = ./templates/cpp;
      description = "C++ development shell";
    };

    templates.glad = {
      path = ./templates/glad;
      description = "default glad setup for OpenGL 4.6";
    };
  };
}
