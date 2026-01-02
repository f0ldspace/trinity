{ lib, config, ... }:
{
  plugins.vimwiki = {
    enable = true;
    settings = {
      list = [
        {
          path = "~/vimwiki/";
          syntax = "markdown";
          ext = ".md";
        }
        {
          name = "personal";
          path = "~/personal/";
          syntax = "markdown";
          ext = ".md";
          diary_rel_path = "";
        }
      ];
    };
  };

  keymaps = lib.mkIf config.plugins.vimwiki.enable [
    {
      mode = "n";
      key = "<leader>ww";
      action = "<cmd>VimwikiIndex<CR>";
      options.desc = "Open Wiki Index";
    }
    {
      mode = "n";
      key = "<leader>wt";
      action = "<cmd>VimwikiTabIndex<CR>";
      options.desc = "Open Wiki in Tab";
    }
    {
      mode = "n";
      key = "<leader>wc";
      action = "<cmd>VimwikiUISelect<CR>";
      options.desc = "Select Wiki";
    }
    {
      mode = "n";
      key = "<leader>wi";
      action = "<cmd>VimwikiDiaryIndex<CR>";
      options.desc = "Open Diary Index";
    }
    {
      mode = "n";
      key = "<leader>wl";
      action = "<cmd>VimwikiMakeDiaryNote<CR>";
      options.desc = "Create Diary Note";
    }
  ];
}
