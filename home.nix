{ lib, pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      vscode
      texliveMedium
    ];

    username = "hurbeana";
    homeDirectory = "/home/hurbeana";

    stateVersion = "24.05";
  };
}
