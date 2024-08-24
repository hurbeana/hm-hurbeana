{ pkgs, ... }:

{
  programs = {
    vscode = {
      enable = true;
      enableUpdateCheck = true;
      enableExtensionUpdateCheck = true;
      userSettings = {
        # general things
        "window.dialogStyle" = "custom";
        "window.titleBarStyle" = "custom";
        "latex-workshop.latex.outDir" = "%DIR%/aux";
        "editor.wordWrap" = "wordWrapColumn";
        "editor.ruler" = "[80]";
        "git.enableSmartCommit" = true;
        # Whitespaces
        "files.trimTrailingWhitespace" = true;
        "files.trimFinalNewlines" = true;
        "files.insertFinalNewline" = true;
        "diffEditor.ignoreTrimWhitespace" = false;
        # Other
        "telemetry.telemetryLevel" = "off";
        "update.showReleaseNotes" = false;
      };
      keybindings = [
        {
          key = "ctrl+space";
          command = "workbench.action.terminal.toggleTerminal";
        }
      ];
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
