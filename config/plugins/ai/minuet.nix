{
  config,
  lib,
  ...
}:
{
  plugins.minuet = {
    enable = true;

    lazyLoad.settings.event = [ "InsertEnter" ];

    settings = {
      provider = "codestral";
      request_timeout = 3;
      throttle = 1000;
      debounce = 400;
      n_completions = 3;
      context_window = 16000;
      notify = "warn";

      virtualtext = {
        # Disabled by default - use manual trigger with <A-]> or <A-[>
        auto_trigger_ft = [ ];
        keymap = {
          # Accept whole completion
          accept = "<A-s>";
          # Accept one line
          accept_line = "<A-a>";
          # Accept n lines (prompts for number)
          accept_n_lines = "<A-z>";
          # Cycle to prev completion item, or manually invoke completion
          prev = "<A-[>";
          # Cycle to next completion item, or manually invoke completion
          next = "<A-]>";
          # Toggle virtualtext auto-trigger on/off
          toggle = "<A-m>";
          dismiss = "<A-e>";
        };
      };

      provider_options = {
        openai_compatible = {
          api_key = "OPENROUTER_API_KEY";
          end_point = "https://openrouter.ai/api/v1/chat/completions";
          model = "mistralai/devstral-small";
          name = "Openrouter";
          stream = true;
          optional = {
            max_tokens = 256;
            top_p = 0.9;
          };
        };

        codestral = {
          api_key = "CODESTRAL_API_KEY";
          end_point = "https://codestral.mistral.ai/v1/fim/completions";
          model = "codestral-latest";
          stream = true;
          optional = {
            max_tokens = 256;
            stop = [ "\n\n" ];
          };
        };

        # Pre-configured for local Ollama. Switch with :Minuet change_preset ollama
        openai_fim_compatible = {
          api_key = "TERM";
          name = "Ollama";
          end_point = "http://localhost:11434/v1/completions";
          model = "qwen2.5-coder:7b";
          stream = true;
          optional = {
            max_tokens = 256;
            top_p = 0.9;
          };
        };
      };

      # Presets for quick switching with :Minuet change_preset
      presets = {
        openrouter = {
          provider = "openai_compatible";
          context_window = 16000;
          request_timeout = 3;
          throttle = 1000;
          debounce = 400;
        };
        codestral = {
          provider = "codestral";
          context_window = 32000;
          request_timeout = 3;
          throttle = 1000;
          debounce = 400;
        };
        ollama = {
          provider = "openai_fim_compatible";
          context_window = 2048;
          request_timeout = 5;
          throttle = 400;
          debounce = 100;
          n_completions = 1;
        };
      };
    };
  };

  # Create actual keymap for virtualtext toggle
  keymaps = lib.optionals config.plugins.minuet.enable [
    {
      mode = "i";
      key = "<A-m>";
      action = ''
        <cmd>Minuet virtualtext toggle<cr>
      '';
      options = {
        desc = "Toggle Minuet virtualtext auto-trigger";
      };
    }
  ];

  plugins.which-key.settings.spec = lib.optionals config.plugins.minuet.enable [
    {
      __unkeyed-1 = "<A-a>";
      desc = "Minuet: accept line";
      mode = "i";
    }
    {
      __unkeyed-1 = "<A-s>";
      desc = "Minuet: accept all";
      mode = "i";
    }
    {
      __unkeyed-1 = "<A-]>";
      desc = "Minuet: next / invoke";
      mode = "i";
    }
    {
      __unkeyed-1 = "<A-[>";
      desc = "Minuet: prev / invoke";
      mode = "i";
    }
    {
      __unkeyed-1 = "<A-m>";
      desc = "Minuet: toggle auto-trigger";
      mode = "i";
    }
    {
      __unkeyed-1 = "<A-e>";
      desc = "Minuet: dismiss";
      mode = "i";
    }
  ];
}
