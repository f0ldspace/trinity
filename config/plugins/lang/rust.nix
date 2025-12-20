{
  plugins.rustaceanvim = {
    enable = true;
    settings = {
      server.default_settings.rust-analyzer = {
        cargo.allFeatures = true;
        check.command = "clippy";
      };
    };
  };
}
