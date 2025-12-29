{ pkgs, ... }:
{
  extraPlugins = with pkgs.vimPlugins; [ leetcode-nvim ];

  extraConfigLua = ''
    require("leetcode").setup({
      lang = "python3",

      picker = { provider = "telescope" },

      injector = {
        ["python3"] = {
          before = true,
        },
      },
    })
  '';
}
