{
  pkgs,
  ...
}:

{
  networking.hostName = "nahemah";

  environment.systemPackages = with pkgs; [

  ];
}
