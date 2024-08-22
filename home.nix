{ lib, pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      hello
    ];

    username = "hurbeana";
    homeDirectory = "/home/hurbeana";

    stateVersion = "24.05";
  };
}
