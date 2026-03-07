{...}: {
  programs.starship = {
    enable = true;
    settings =
      builtins.readFile ./starship.toml
      |> builtins.fromTOML;
  };
}
