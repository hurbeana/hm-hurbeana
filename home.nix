{ lib, pkgs, ... }: let
  username = "hurbeana";
  homeDirectory = "/home/${username}";
in {
  imports = [
    packages/cli.nix
    packages/vim.nix
  ];

  home = {
    packages = with pkgs; [
      vscode
      texliveMedium
    ];

    inherit username;
    inherit homeDirectory;
    stateVersion = "24.05";
  };

  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;
  };
}
