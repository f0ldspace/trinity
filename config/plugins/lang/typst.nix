{ pkgs, ... }:
{
  plugins.lsp.servers.tinymist = {
    enable = true;
    settings = {
      exportPdf = "onSave";
      formatterMode = "typstyle";
    };
  };

  extraPackages = [ pkgs.typstyle ];

  plugins.conform-nvim.settings.formatters_by_ft.typst = [ "typstyle" ];
}
