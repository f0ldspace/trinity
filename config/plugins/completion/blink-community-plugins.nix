let
  mkBlinkPlugin =
    {
      enable ? true,
      ...
    }@args:
    {
      inherit enable;
      lazyLoad.settings.event = [
        "InsertEnter"
        "CmdlineEnter"
      ];
    }
    // (builtins.removeAttrs args [ "enable" ]);
in
{
  plugins = {
    blink-cmp-dictionary = mkBlinkPlugin { };
    blink-cmp-git = mkBlinkPlugin { };
    blink-cmp-spell = mkBlinkPlugin { };
    blink-cmp-words = mkBlinkPlugin { enable = false; };
    blink-copilot = mkBlinkPlugin { enable = false; };
    blink-emoji = mkBlinkPlugin { enable = false; };
    blink-ripgrep = mkBlinkPlugin { };
  };
}
