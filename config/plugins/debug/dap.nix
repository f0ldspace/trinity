{ config, lib, ... }:
{
  plugins = {
    dap-virtual-text.enable = true;
    dap = {
      enable = true;

      lazyLoad.settings.keys = lib.mkIf config.plugins.lz-n.enable [
        {
          __unkeyed-1 = "<leader>dc";
          __unkeyed-2 = ":DapContinue<cr>";
          mode = [ "n" ];
          desc = "Continue";
        }
        {
          __unkeyed-1 = "<leader>dO";
          __unkeyed-2 = ":DapStepOver<cr>";
          mode = [ "n" ];
          desc = "Step over";
        }
        {
          __unkeyed-1 = "<leader>di";
          __unkeyed-2 = ":DapStepInto<cr>";
          mode = [ "n" ];
          desc = "Step Into";
        }
        {
          __unkeyed-1 = "<leader>do";
          __unkeyed-2 = ":DapStepOut<cr>";
          mode = [ "n" ];
          desc = "Step Out";
        }
        {
          __unkeyed-1 = "<leader>dp";
          __unkeyed-2 = "<cmd>lua require('dap').pause()<cr>";
          mode = [ "n" ];
          desc = "Pause";
        }
        {
          __unkeyed-1 = "<leader>db";
          __unkeyed-2 = ":DapToggleBreakpoint<cr>";
          mode = [ "n" ];
          desc = "Toggle Breakpoint";
        }
        {
          __unkeyed-1 = "<leader>dB";
          __unkeyed-2 = "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>";
          mode = [ "n" ];
          desc = "Breakpoint (conditional)";
        }
        {
          __unkeyed-1 = "<leader>dR";
          __unkeyed-2 = ":DapToggleRepl<cr>";
          mode = [ "n" ];
          desc = "Toggle REPL";
        }
        {
          __unkeyed-1 = "<leader>dr";
          __unkeyed-2 = "<cmd>lua require('dap').run_last()<cr>";
          mode = [ "n" ];
          desc = "Run Last";
        }
        {
          __unkeyed-1 = "<leader>ds";
          __unkeyed-2 = "<cmd>lua require('dap').session()<cr>";
          mode = [ "n" ];
          desc = "Session";
        }
        {
          __unkeyed-1 = "<leader>dt";
          __unkeyed-2 = ":DapTerminate<cr>";
          mode = [ "n" ];
          desc = "Terminate";
        }
        {
          __unkeyed-1 = "<leader>dw";
          __unkeyed-2 = "<cmd>lua require('dap.ui.widgets').hover()<cr>";
          mode = [ "n" ];
          desc = "Hover Widget";
        }
        {
          __unkeyed-1 = "<leader>du";
          __unkeyed-2 = "<cmd>lua require('dapui').toggle()<cr>";
          mode = [ "n" ];
          desc = "Toggle UI";
        }
        {
          __unkeyed-1 = "<leader>de";
          __unkeyed-2 = "<cmd>lua require('dapui').eval()<cr>";
          mode = [ "n" ];
          desc = "Eval";
        }
      ];

      signs = {
        dapBreakpoint = {
          text = " ";
          texthl = "DiagnosticInfo";
        };
        dapBreakpointCondition = {
          text = " ";
          texthl = "DiagnosticInfo";
        };
        dapBreakpointRejected = {
          text = " ";
          texthl = "DiagnosticError";
        };
        dapLogPoint = {
          text = " ";
          texthl = "DiagnosticInfo";
        };
        dapStopped = {
          text = "󰁕 ";
          texthl = "DiagnosticWarn";
          linehl = "DapStoppedLine";
          numhl = "DapStoppedLine";
        };
      };
    };

    dap-ui = {
      enable = true;
      settings = {
        layouts = [
          {
            elements = [
              {
                id = "scopes";
                size = 0.25;
              }
              {
                id = "breakpoints";
                size = 0.25;
              }
              {
                id = "stacks";
                size = 0.25;
              }
              {
                id = "watches";
                size = 0.25;
              }
            ];
            position = "left";
            size = 40;
          }
          {
            elements = [
              {
                id = "repl";
                size = 0.5;
              }
              {
                id = "console";
                size = 0;
              }
            ];
            position = "bottom";
            size = 10;
          }
        ];
      };
    };

    which-key.settings.spec = [
      {
        __unkeyed-1 = "<leader>d";
        mode = [
          "n"
          "v"
        ];
        group = "Debug";
      }
    ];
  };
}
