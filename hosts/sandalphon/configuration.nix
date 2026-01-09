{
  pkgs,
  ...
}:

{
  networking.hostName = "sandalphon";

  environment.systemPackages = with pkgs; [
    prismlauncher
  ];
}
