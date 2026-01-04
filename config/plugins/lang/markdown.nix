{
  lib,
  pkgs,
  ...
}:
let
  inherit (lib.nixvim) enableExceptInTests;
in
{
  extraPackages = with pkgs; [
    marksman
  ];

  plugins = {
    clipboard-image = {
      enable = true;
      clipboardPackage = pkgs.wl-clipboard;
    };

    image = {
      enable = false;
      settings = {
        integrations.markdown = {
          clearInInsertMode = true;
          onlyRenderImageAtCursor = true;
        };
      };
    };

    markdown-preview = {
      enable = true;
    };

    conform-nvim.settings = {
      formatters_by_ft.markdown = [ "deno_fmt" ];
      formatters.deno_fmt.append_args = [ "--prose-wrap" "preserve" ];
    };

    lsp.servers = {
      marksman.enable = true;
    };

    lint = {
      lintersByFt.markdown = [ "markdownlint" ];
      linters.markdownlint.cmd = lib.getExe pkgs.markdownlint-cli;
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>m";
      action = "<cmd>MarkdownPreviewToggle<cr>";
      options = {
        silent = true;
        desc = "Toggle markdown preview";
      };
    }
  ];
}
