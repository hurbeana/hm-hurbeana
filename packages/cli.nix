{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      thrash-cli
      fish
    ];

  programs = {

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

  };
}
