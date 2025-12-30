{ config, lib, ... }:
{
  plugins = {
    bufferline = {
      enable = true;

      lazyLoad.settings = {
        event = lib.mkIf config.plugins.lz-n.enable [ "BufAdd" ];
        keys = lib.mkIf config.plugins.lz-n.enable [
          {
            __unkeyed-1 = "<C-Tab>";
            __unkeyed-2 = "<cmd>BufferLineCycleNext<cr>";
            desc = "Cycle to next buffer";
          }
          {
            __unkeyed-1 = "<C-S-Tab>";
            __unkeyed-2 = "<cmd>BufferLineCyclePrev<cr>";
            desc = "Cycle to previous buffer";
          }
          {
            __unkeyed-1 = "<leader>br";
            __unkeyed-2 = "<cmd>BufferLineCloseRight<cr>";
            desc = "Delete buffers to the right";
          }
          {
            __unkeyed-1 = "<leader>bl";
            __unkeyed-2 = "<cmd>BufferLineCloseLeft<cr>";
            desc = "Delete buffers to the left";
          }
          {
            __unkeyed-1 = "<leader>bp";
            __unkeyed-2 = "<cmd>BufferLineTogglePin<cr>";
            desc = "Toggle pin";
          }
          {
            __unkeyed-1 = "<leader>bP";
            __unkeyed-2 = "<Cmd>BufferLineGroupClose ungrouped<CR>";
            desc = "Delete non-pinned buffers";
          }
        ];
      };

      settings = {
        highlights =
          let
            commonBgColor = "#f2e9e1";  # rose-pine overlay
            commonFgColor = "#faf4ed";  # rose-pine base

            commonSelectedAttrs = {
              bg = commonBgColor;
            };

            # Define a set with common selected attributes
            selectedAttrsSet = builtins.listToAttrs (
              map
                (name: {
                  inherit name;
                  value = commonSelectedAttrs;
                })
                [
                  # "separator_selected" # Handled uniquely
                  "buffer_selected"
                  "tab_selected"
                  "numbers_selected"
                  "close_button_selected"
                  "duplicate_selected"
                  "modified_selected"
                  "info_selected"
                  "warning_selected"
                  "error_selected"
                  "hint_selected"
                  "diagnostic_selected"
                  "info_diagnostic_selected"
                  "warning_diagnostic_selected"
                  "error_diagnostic_selected"
                  "hint_diagnostic_selected"
                ]
            );
          in
          # Merge the common selected attributes with the unique attributes
          selectedAttrsSet
          // {
            fill = {
              bg = commonFgColor;
            };
            separator = {
              fg = commonFgColor;
            };
            separator_visible = {
              fg = commonFgColor;
            };
            separator_selected = {
              bg = commonBgColor;
              fg = commonFgColor;
            };
          };

        options = {
          diagnostics = "nvim_lsp";
          diagnostics_indicator = /* Lua */ ''
            function(count, level, diagnostics_dict, context)
              local s = ""
              for e, n in pairs(diagnostics_dict) do
                local sym = e == "error" and " "
                  or (e == "warning" and " " or "" )
                if(sym ~= "") then
                  s = s .. " " .. n .. sym
                end
              end
              return s
            end
          '';
          # Will make sure all names in bufferline are unique
          enforce_regular_tabs = false;

          offsets = [
            {
              filetype = "neo-tree";
              text = "Neo-tree";
              highlight = "Directory";
              text_align = "left";
            }
          ];

          left_trunc_marker = "";
          max_name_length = 18;
          max_prefix_length = 15;
          modified_icon = "●";

          persist_buffer_sort = true;
          right_trunc_marker = "";
          separator_style = "thin";
          show_buffer_close_icons = true;
          show_buffer_icons = true;
          show_close_icon = true;
          show_tab_indicators = true;
          sort_by = "extension";
          tab_size = 18;
        };
      };
    };
  };
}
