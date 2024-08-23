{ pkgs, ... }:

{
  programs = {
    vscode = {
      enable = true;
      enableExtensionUpdateCheck = true;
      enableUpdateCheck = true;
      userSettings = {
        "window.dialogStyle" = "custom";
        "window.titleBarStyle" = "custom";
        "latex-workshop.latex.outDir" = "%DIR%/aux";
        "editor.wordWrap" = "wordWrapColumn";
        "editor.wordWrapColmn" = 80;
      };
      extensions = with pkgs.vscode-extensions; [
        ms-python.python
        ms-python.debugpy
        ms-python.black-formatter
        ms-python.isort
        vscodevim.vim
        james-yu.latex-workshop
        oderwat.indent-rainbow
        github.copilot
        github.copilot-chat
        shd101wyy.markdown-preview-enhanced
        eamodio.gitlens
        ibm.output-colorizer
        esbenp.prettier-vscode
        mechatroner.rainbow-csv
        jnoortheen.nix-ide
      ];
    };
  };
}
