{ lib, pkgs, ... }: let
  username = "hurbeana";
  homeDirectory = "/home/${username}";
in {
  home = {
    packages = with pkgs; [
      vscode
      texliveMedium
      trash-cli
      fish
    ];

    inherit username;
    inherit homeDirectory;
    stateVersion = "24.05";
  };

  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;

    fish = {
      enable = true;
      interactiveShellInit = "
        set fish_greeting
      ";
      plugins = [
        {
          name = "fzf.fish";
          src = pkgs.fishPlugins.fzf-fish.src;
        }
      ];
      shellInit = "
        fish_add_path ~/.local/share/bin/
        fzf_configure_bindings --directory=\\cf
        fzf_configure_bindings --git_log=\\cg
        fzf_configure_bindings --git_status=\\cs
        fzf_configure_bindings --history=\\cr
        fzf_configure_bindings --variables=\\cv
        fzf_configure_bindings --processes=\\cp
      ";
      shellAbbrs = {
        hms = "cd ${homeDirectory}/hm-hurbeana && make update";
        nrs = "sudo nixos-rebuild switch";
        rm = "trash";
        vic = "vim /etc/nixos/configuration.nix";
        vih = "vim ${homeDirectory}/hm-hurbeana/home.nix";
        sys = "systemctl";
        syu = "systemctl --user";
      };
    };

    bash = {
      enable = true;
      initExtra = ''
         if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
         then
           shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
           exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
         fi
       '';
    };

    fzf.enable = true;

    git = {
      enable = true;
      delta.enable = true;
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
