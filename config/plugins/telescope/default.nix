{ pkgs, config, lib, ... }:
let
  # Helper to create a telescope keymap that ensures telescope is loaded first
  mkTelescopeKey = key: cmd: desc: mode: {
    inherit key;
    mode = if mode == null then "n" else mode;
    action.__raw = ''
      function()
        vim.cmd.packadd("telescope.nvim")
        vim.cmd("${cmd}")
      end
    '';
    options = {
      inherit desc;
      silent = true;
    };
  };
in
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
        # Keys moved to keymaps below with explicit trigger_load
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

  # Telescope keymaps with explicit lazy loading trigger
  keymaps = lib.mkIf (config.plugins.telescope.enable && config.plugins.lz-n.enable) [
    (mkTelescopeKey "<leader>ft" "Telescope todo-comments" "View Todo" null)
    (mkTelescopeKey "<leader><space>" "Telescope find_files hidden=true" "Find project files" null)
    (mkTelescopeKey "<leader>/" "Telescope live_grep" "Grep (root dir)" null)
    (mkTelescopeKey "<leader>f:" "Telescope command_history" "View Command History" null)
    (mkTelescopeKey "<leader>fr" "Telescope oldfiles" "View Recent files" null)
    (mkTelescopeKey "<c-p>" "Telescope registers" "Select register to paste" [ "n" "i" ])
    (mkTelescopeKey "<leader>gc" "Telescope git_commits" "commits" null)
    (mkTelescopeKey "<leader>fa" "Telescope autocommands" "Auto Commands" null)
    (mkTelescopeKey "<leader>fc" "Telescope commands" "View Commands" null)
    (mkTelescopeKey "<leader>fd" "Telescope diagnostics bufnr=0" "View Workspace diagnostics" null)
    (mkTelescopeKey "<leader>fh" "Telescope help_tags" "View Help pages" null)
    (mkTelescopeKey "<leader>fk" "Telescope keymaps" "View Key maps" null)
    (mkTelescopeKey "<leader>fm" "Telescope man_pages" "View Man pages" null)
    (mkTelescopeKey "<leader>f'" "Telescope marks" "View Marks" null)
    (mkTelescopeKey "<leader>fo" "Telescope vim_options" "View Options" null)
    (mkTelescopeKey "<leader>uC" "Telescope colorscheme" "Colorscheme preview" null)
  ];
}
