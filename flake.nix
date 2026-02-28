{
  description = "My Nix templates";

  outputs = { self }: {
    templates.cpp = {
      path = ./templates/cpp;
      description = "C++ development shell";
    };
  };
}
