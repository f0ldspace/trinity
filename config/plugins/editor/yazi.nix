{ config, lib, ... }:
{
  plugins.yazi = {
    enable = true;

    lazyLoad.settings = {
      cmd = [ "Yazi" ];
      keys = lib.mkIf config.plugins.lz-n.enable [
        {
          __unkeyed-1 = "<leader>e";
          __unkeyed-2 = "<cmd>Yazi<cr>";
          desc = "Yazi toggle";
        }
      ];
    };
  };
}
