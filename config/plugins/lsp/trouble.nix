{ config, lib, ... }:
{
  plugins = {
    trouble = {
      enable = true;

      lazyLoad.settings = {
        cmd = [ "Trouble" ];
        keys = lib.mkIf config.plugins.lz-n.enable [
          {
            __unkeyed-1 = "<leader>xx";
            __unkeyed-2 = "<cmd>Trouble preview_split toggle<cr>";
            desc = "Diagnostics toggle";
          }
          {
            __unkeyed-1 = "<leader>xX";
            __unkeyed-2 = "<cmd>Trouble preview_split toggle filter.buf=0<cr>";
            desc = "Buffer Diagnostics toggle";
          }
          {
            __unkeyed-1 = "<leader>us";
            __unkeyed-2 = "<cmd>Trouble symbols toggle focus=false<cr>";
            desc = "Symbols toggle";
          }
          {
            __unkeyed-1 = "<leader>xl";
            __unkeyed-2 = "<cmd>Trouble lsp toggle focus=false win.position=right<cr>";
            desc = "LSP Definitions / references / ... toggle";
          }
          {
            __unkeyed-1 = "<leader>xL";
            __unkeyed-2 = "<cmd>Trouble loclist toggle<cr>";
            desc = "Location List toggle";
          }
          {
            __unkeyed-1 = "<leader>xQ";
            __unkeyed-2 = "<cmd>Trouble qflist toggle<cr>";
            desc = "Quickfix List toggle";
          }
        ];
      };

      settings = {
        auto_close = true;
        modes = {
          preview_split = {
            # NOTE: can automatically open when diagnostics exist
            # auto_open = true;
            mode = "diagnostics";
            preview = {
              type = "split";
              relative = "win";
              position = "right";
              size = 0.5;
            };
          };
        };
      };
    };

    which-key.settings.spec = [
      {
        __unkeyed-1 = "<leader>x";
        mode = "n";
        icon = "";
        group = "Trouble";
      }
    ];
  };
}
