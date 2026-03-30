{ lib, ... }:

{
  options = {
    deaFiles.wm = lib.mkOption {
      type = lib.types.enum [lib.listDir ./ |> builtins.toString];
      default = null;
    };
  };

  config = {
    deaFiles.wm = "mangowc";
  };
}
