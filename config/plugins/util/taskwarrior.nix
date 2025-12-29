{ pkgs, lib, ... }:
# TODO: Better Keybinds
let
  taskwarrior-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "taskwarrior-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "ribelo";
      repo = "taskwarrior.nvim";
      rev = "5383427b88912ff3c37653d76e48b1fc197844dc";
      hash = "sha256-KwUnAoPDlDMYL2KZo94yyNqwwhXLstt2Fy95RB7rZpw=";
    };
    doCheck = false;
  };
in
{
  extraPlugins = [ taskwarrior-nvim ];

  extraConfigLua = ''
    require("taskwarrior_nvim").setup({})
  '';

  # Taskwarrior keymaps
  # Browser has internal keymaps: <M-d> done, <M-S-d> delete, <M-s> start/stop, <M-a> add, <M-y> yank uuid
  keymaps = [
    {
      mode = "n";
      key = "<leader>Tb";
      action.__raw = ''function() require("taskwarrior_nvim").browser({"ready"}) end'';
      options = {
        desc = "Task browser (ready)";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>Ta";
      action.__raw = ''function() require("taskwarrior_nvim").browser({}) end'';
      options = {
        desc = "Task browser (all)";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>Tc";
      action.__raw = ''function() require("taskwarrior_nvim").go_to_config_file() end'';
      options = {
        desc = "Taskwarrior config";
        silent = true;
      };
    }
  ];
}
