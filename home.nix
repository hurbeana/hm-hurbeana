{ lib, pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      hello
      texliveMedium
    ];

    username = "hurbeana";
    homeDirectory = "/home/hurbeana";

    stateVersion = "24.05";
  };
}
