{ pkgs, lib, ... }:
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

  keymaps = lib.mapAttrsToList
    (
      key:
      { action, ... }@attrs:
      {
        mode = attrs.mode or "n";
        inherit action key;
        options = {
          desc = attrs.desc;
          silent = true;
        };
      }
    )
    {
      "<leader>Tb" = {
        action = "<cmd>lua require('taskwarrior_nvim').browser()<CR>";
        desc = "Task browser (Telescope)";
      };
      "<leader>Tl" = {
        action = "<cmd>lua require('taskwarrior_nvim').pending()<CR>";
        desc = "List pending tasks";
      };
      "<leader>Tc" = {
        action = "<cmd>lua require('taskwarrior_nvim').completed()<CR>";
        desc = "List completed tasks";
      };
      "<leader>Ts" = {
        action = "<cmd>lua require('taskwarrior_nvim').toggle()<CR>";
        desc = "Start/stop current task";
      };
      "<leader>Td" = {
        action = "<cmd>lua require('taskwarrior_nvim').done()<CR>";
        desc = "Mark task done";
      };
      "<leader>TD" = {
        action = "<cmd>lua require('taskwarrior_nvim').delete()<CR>";
        desc = "Delete task";
      };
    };
}
