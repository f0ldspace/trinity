{ pkgs, ... }:
let
  org-roam-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "org-roam-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "chipsenkbeil";
      repo = "org-roam.nvim";
      rev = "74276a94e9e4af463e7ba35c22259eeced9c90f9";
      hash = "sha256-Zzq4JK3iFBVr8QmMmv5vm/R8QyYqmL44fRMZa15m7eo=";
    };
    doCheck = false;
  };
in
{
  plugins.orgmode = {
    enable = true;
    settings = {
      org_agenda_files = "/home/f0ld/wiki/**/*";
      org_default_notes_file = "/home/f0ld/wiki/refile.org";
    };
  };

  extraPlugins = [ org-roam-nvim ];

  extraConfigLua = ''
    require("org-roam").setup({
      directory = "/home/f0ld/wiki",
      -- Disable default bindings since we define our own
      bindings = false,
    })
  '';

  keymaps = [
    # Roam commands (<leader>r prefix)
    {
      mode = "n";
      key = "<leader>rf";
      action.__raw = ''function() require("org-roam").api.find_node() end'';
      options = {
        desc = "Find roam node";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>ri";
      action.__raw = ''function() require("org-roam").api.insert_node() end'';
      options = {
        desc = "Insert node link";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>rc";
      action.__raw = ''function() require("org-roam").api.capture_node() end'';
      options = {
        desc = "Capture to roam";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>rb";
      action.__raw = ''function() require("org-roam").ui.toggle_node_buffer() end'';
      options = {
        desc = "Toggle backlinks";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>rn";
      action.__raw = ''
        function()
          -- Add ID to current file to make it a roam node
          local file = require('orgmode').files:get_current_file()
          if file then
            file:set_property('ID', require('orgmode.org.id').new())
            vim.cmd('write')
            vim.notify('Added ID - file is now a roam node', vim.log.levels.INFO)
          end
        end
      '';
      options = {
        desc = "Convert to roam node";
        silent = true;
      };
    }
    # Orgmode commands (<leader>o prefix)
    {
      mode = "n";
      key = "<leader>oa";
      action = "<cmd>lua require('orgmode').action('agenda.prompt')<CR>";
      options = {
        desc = "Org agenda";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>oc";
      action = "<cmd>lua require('orgmode').action('capture.prompt')<CR>";
      options = {
        desc = "Org capture";
        silent = true;
      };
    }
  ];
}
