{ pkgs, ... }:

{
  programs = {

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
