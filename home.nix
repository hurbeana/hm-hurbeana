{ lib, pkgs, ... }: let
  username = "hurbeana";
  homeDirectory = "/home/${username}";
in {
  imports = [
    packages/cli.nix
    packages/vim.nix
    packages/code.nix
  ];

  home = {
    packages = with pkgs; [
      python3
      python311Packages.pygments
      texliveFull
      thunderbird
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
