{ config, lib, ... }:
{
  plugins = {
    nvim-surround = {
      enable = true;
      lazyLoad.settings.event = lib.mkIf config.plugins.lz-n.enable [ "BufReadPost" "BufNewFile" ];
    };
  };
}
