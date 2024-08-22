{ lib, pkgs, ... }: let
  username = "hurbeana";
in {
  home = {
    packages = with pkgs; [
      vscode
      texliveMedium
    ];

    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "24.05";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
