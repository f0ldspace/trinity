{
  config,
  lib,
  ...
}:
{
  autoCmd = lib.mkIf config.plugins.obsidian.enable [
    {
      event = [ "FileType" ];
      pattern = [ "markdown" ];
      callback.__raw = ''
        function()
          vim.opt_local.conceallevel = 2
        end
      '';
    }
  ];

  plugins.obsidian = {
    enable = true;

    settings = {
      workspaces = [
        {
          name = "wiki";
          path = "~/wiki";
        }
      ];

      notes_subdir = "/";
      daily_notes = {
        folder = "daily";
        date_format = "%Y-%m-%d";
      };

      completion = {
        nvim_cmp = false;
        blink = false;
        min_chars = 2;
      };

      note_id_func.__raw = ''
        function(title)
          local date = os.date("%y%m%d")
          if title ~= nil then
            local suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
            return date .. "-" .. suffix
          else
            return date
          end
        end
      '';

      new_notes_location = "notes_subdir";

      preferred_link_style = "wiki";

      legacy_commands = false;

      callbacks = {
        enter_note.__raw = ''
          function(note)
            vim.keymap.set("n", "gf", function()
              if require("obsidian").util.cursor_on_markdown_link() then
                return "<cmd>Obsidian follow_link<CR>"
              else
                return "gf"
              end
            end, { buffer = true, expr = true, desc = "Follow link" })

            vim.keymap.set("n", "<leader>ch", "<cmd>Obsidian toggle_checkbox<CR>", {
              buffer = true,
              desc = "Toggle checkbox",
            })

            vim.keymap.set("n", "<CR>", function()
              if require("obsidian").util.cursor_on_markdown_link() then
                return "<cmd>Obsidian follow_link<CR>"
              else
                return "<CR>"
              end
            end, { buffer = true, expr = true, desc = "Smart action" })
          end
        '';
      };

      ui = {
        enable = true;
      };
    };
  };

  keymaps = lib.optionals config.plugins.obsidian.enable [
    {
      mode = "n";
      key = "<leader>on";
      action = "<cmd>Obsidian new<CR>";
      options = {
        desc = "New note";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>oo";
      action = "<cmd>Obsidian open<CR>";
      options = {
        desc = "Open in Obsidian";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>os";
      action = "<cmd>Obsidian quick_switch<CR>";
      options = {
        desc = "Quick switch note";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>of";
      action = "<cmd>Obsidian search<CR>";
      options = {
        desc = "Search notes";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>ob";
      action = "<cmd>Obsidian backlinks<CR>";
      options = {
        desc = "Show backlinks";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>ot";
      action = "<cmd>Obsidian tags<CR>";
      options = {
        desc = "Search tags";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>od";
      action = "<cmd>Obsidian today<CR>";
      options = {
        desc = "Today's daily note";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>oy";
      action = "<cmd>Obsidian yesterday<CR>";
      options = {
        desc = "Yesterday's daily note";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>ol";
      action = "<cmd>Obsidian links<CR>";
      options = {
        desc = "Show links";
        silent = true;
      };
    }
    {
      mode = "v";
      key = "<leader>ol";
      action = "<cmd>Obsidian link<CR>";
      options = {
        desc = "Link selection";
        silent = true;
      };
    }
    {
      mode = "v";
      key = "<leader>oL";
      action = "<cmd>Obsidian link_new<CR>";
      options = {
        desc = "Link selection to new note";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>op";
      action = "<cmd>Obsidian paste_img<CR>";
      options = {
        desc = "Paste image";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>or";
      action = "<cmd>Obsidian rename<CR>";
      options = {
        desc = "Rename note";
        silent = true;
      };
    }
  ];

  plugins.which-key.settings.spec = lib.optionals config.plugins.obsidian.enable [
    {
      __unkeyed-1 = "<leader>o";
      group = "Obsidian";
    }
  ];
}
