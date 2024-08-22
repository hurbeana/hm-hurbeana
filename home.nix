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

  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;

    # bash
    bash = {
      enable = true;
      enableCompletion = true;
      shellAliases = {
        "ll" = "ls -l";
        ".." = "cd ..";
      };
    };

    # vim config
    vim = {
      enable = true;
      defaultEditor = true;
      settings = {
        expandtab = true;
        mouse = null;
        number = true;
        relativenumber = true;
        shiftwidth = 2;
        tabstop = 2;
        history = 1000;
      };
      extraConfig = ''
        set autoindent
        set backspace=indent,eol,start
        syntax on
      '';
    };
  };
}
