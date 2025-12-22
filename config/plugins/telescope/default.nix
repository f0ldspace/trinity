{ pkgs, config, lib, ... }:
{
  imports = [
    ./manix.nix
    ./undo.nix
  ];

  plugins = {
    telescope = {
      enable = true;
      highlightTheme = "Catppuccin Macchiato";

      lazyLoad.settings = {
        cmd = [ "Telescope" ];
        keys = lib.mkIf config.plugins.lz-n.enable [
          {
            __unkeyed-1 = "<leader>ft";
            __unkeyed-2 = "<cmd>Telescope todo-comments<cr>";
            desc = "View Todo";
          }
          {
            __unkeyed-1 = "<leader><space>";
            __unkeyed-2 = "<cmd>Telescope find_files hidden=true<cr>";
            desc = "Find project files";
          }
          {
            __unkeyed-1 = "<leader>/";
            __unkeyed-2 = "<cmd>Telescope live_grep<cr>";
            desc = "Grep (root dir)";
          }
          {
            __unkeyed-1 = "<leader>f:";
            __unkeyed-2 = "<cmd>Telescope command_history<cr>";
            desc = "View Command History";
          }
          {
            __unkeyed-1 = "<leader>fr";
            __unkeyed-2 = "<cmd>Telescope oldfiles<cr>";
            desc = "View Recent files";
          }
          {
            __unkeyed-1 = "<c-p>";
            __unkeyed-2 = "<cmd>Telescope registers<cr>";
            mode = [ "n" "i" ];
            desc = "Select register to paste";
          }
          {
            __unkeyed-1 = "<leader>gc";
            __unkeyed-2 = "<cmd>Telescope git_commits<cr>";
            desc = "commits";
          }
          {
            __unkeyed-1 = "<leader>fa";
            __unkeyed-2 = "<cmd>Telescope autocommands<cr>";
            desc = "Auto Commands";
          }
          {
            __unkeyed-1 = "<leader>fc";
            __unkeyed-2 = "<cmd>Telescope commands<cr>";
            desc = "View Commands";
          }
          {
            __unkeyed-1 = "<leader>fd";
            __unkeyed-2 = "<cmd>Telescope diagnostics bufnr=0<cr>";
            desc = "View Workspace diagnostics";
          }
          {
            __unkeyed-1 = "<leader>fh";
            __unkeyed-2 = "<cmd>Telescope help_tags<cr>";
            desc = "View Help pages";
          }
          {
            __unkeyed-1 = "<leader>fk";
            __unkeyed-2 = "<cmd>Telescope keymaps<cr>";
            desc = "View Key maps";
          }
          {
            __unkeyed-1 = "<leader>fm";
            __unkeyed-2 = "<cmd>Telescope man_pages<cr>";
            desc = "View Man pages";
          }
          {
            __unkeyed-1 = "<leader>f'";
            __unkeyed-2 = "<cmd>Telescope marks<cr>";
            desc = "View Marks";
          }
          {
            __unkeyed-1 = "<leader>fo";
            __unkeyed-2 = "<cmd>Telescope vim_options<cr>";
            desc = "View Options";
          }
          {
            __unkeyed-1 = "<leader>uC";
            __unkeyed-2 = "<cmd>Telescope colorscheme<cr>";
            desc = "Colorscheme preview";
          }
        ];
      };

      extensions = {
        fzf-native.enable = true;
        ui-select = {
          enable = true;
          settings = {
            __unkeyed-1.__raw = ''require("telescope.themes").get_dropdown{}'';
            specific_opts = {
              codeactions = true;
            };
          };
        };
      };

      settings.defaults = {
        prompt_prefix = "   ";
        color_devicons = true;
        set_env.COLORTERM = "truecolor";
        file_ignore_patterns = [
          "^.git/"
          "^.mypy_cache/"
          "^__pycache__/"
          "^output/"
          "^data/"
          "%.ipynb"
        ];

        mappings = {
          i = {
            # Have Telescope not to enter a normal-like mode when hitting escape (and instead exiting), you can map <Esc> to do so via:
            "<esc>".__raw = ''
              function(...)
                return require("telescope.actions").close(...)
              end'';
            "<c-t>".__raw = ''
              function(...)
                require('trouble.providers.telescope').open_with_trouble(...);
              end
            '';
          };
          n = {
            "<c-t>".__raw = ''
              function(...)
                require('trouble.providers.telescope').open_with_trouble(...);
              end
            '';
          };
        };
        # trim leading whitespace from grep
        vimgrep_arguments = [
          "${pkgs.ripgrep}/bin/rg"
          "--color=never"
          "--no-heading"
          "--with-filename"
          "--line-number"
          "--column"
          "--smart-case"
          "--trim"
        ];
      };
    };
  };
}
