{
  pkgs,
  ...
}:

{
  networking.hostName = lib.mkDefault "nahemah";

  environment.systemPackages = with pkgs; [

  ];
}
