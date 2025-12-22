{ config, lib, ... }:
{
  plugins.debugprint = {
    enable = true;
    lazyLoad.settings.keys = lib.mkIf config.plugins.lz-n.enable [
      { __unkeyed-1 = "<leader>pb"; desc = "Debug print below"; }
      { __unkeyed-1 = "<leader>pB"; desc = "Debug print above"; }
      { __unkeyed-1 = "<leader>pv"; desc = "Debug print variable below"; }
      { __unkeyed-1 = "<leader>pV"; desc = "Debug print variable above"; }
      { __unkeyed-1 = "<leader>po"; desc = "Debug print textobj below"; }
      { __unkeyed-1 = "<leader>pO"; desc = "Debug print textobj above"; }
    ];

    settings = {
      commands = {
        toggle_comment_debug_prints = "ToggleCommentDebugPrints";
        delete_debug_prints = "DeleteDebugPrints";
      };

      display_counter = true;
      display_snippet = true;

      keymaps = {
        normal = {
          plain_below = "<leader>pb";
          plain_above = "<leader>pB";
          variable_below = "<leader>pv";
          variable_above = "<leader>pV";
          variable_below_alwaysprompt.__raw = "nil";
          variable_above_alwaysprompt.__raw = "nil";
          textobj_below = "<leader>po";
          textobj_above = "<leader>pO";
          toggle_comment_debug_prints.__raw = "nil";
          delete_debug_prints.__raw = "nil";
        };
        visual = {
          variable_below = "<leader>pv";
          variable_above = "<leader>pV";
        };
      };
    };
  };
}
