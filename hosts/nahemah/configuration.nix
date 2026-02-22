{
  lib,
  pkgs,
  ...
}:

{
  networking.hostName = lib.mkForce "nahemah";

  environment.systemPackages = with pkgs; [

  ];
}
