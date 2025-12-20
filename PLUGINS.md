# Plugins

List of plugins available in Trinity.

## AI

- **copilot-lua** - GitHub Copilot integration with inline suggestions
- **copilot-lsp** - LSP-based Copilot with Next Edit Suggestions (NES)
- **opencode** - AI chat assistant with session management (`<leader>ao`)
- **sidekick** - Multi-provider AI assistant (Claude, Copilot, Gemini) - *disabled by default*
- **avante** - AI coding assistant - *disabled by default*

## Completion

- **blink-cmp** - Fast completion engine with fuzzy matching, ghost text, and signature help
- **friendly-snippets** - Collection of snippets for various languages
- **mini-snippets** - Snippet expansion via mini.nvim

## Debug

- **dap** - Debug Adapter Protocol client with breakpoints and stepping (`<leader>d`)
- **dap-ui** - UI for DAP with scopes, breakpoints, stacks, watches panels
- **dap-virtual-text** - Inline variable values during debugging
- **neotest** - Test runner framework with adapters for Rust, Python, Go, JS, Java, Zig (`<leader>t`)

## Editor

- **which-key** - Keybinding popup helper showing available keys
- **yazi** - Terminal file manager integration (`<leader>e`)
- **undotree** - Visual undo history tree (`<leader>ut`)
- **neogen** - Documentation/annotation generator (`<leader>lA`)
- **yanky** - Enhanced yank/paste with history and cycling (`<leader>fy`)
- **lz-n** - Lazy loading manager for plugins

## Git

- **gitsigns** - Git signs in the gutter, hunk staging/preview, blame (`<leader>gh`)
- **lazygit** - Terminal UI for git via snacks (`<leader>gg`)
- **gitbrowse** - Open files/lines in GitHub/GitLab

## LSP

- **lsp** - Language Server Protocol support with inlay hints
- **conform-nvim** - Code formatting on save with format-on-save (`<leader>lf`)
- **lspsaga** - Enhanced LSP UI for hover, rename, code actions, outline
- **trouble** - Diagnostics list and quickfix viewer (`<leader>x`)
- **fastaction** - Quick code action picker (`<leader>lc`)
- **lsp-signature** - Function signature help while typing
- **lsp-lines** - Inline diagnostic rendering
- **fidget** - LSP progress spinner
- **lightbulb** - Code action indicator in sign column
- **glance** - Preview definitions, references, implementations (`<leader>lg`)

## Telescope

- **telescope** - Fuzzy finder for files, grep, commands, etc. (`<leader><space>`, `<leader>/`)
- **telescope-fzf-native** - FZF sorter for better performance
- **telescope-ui-select** - Use Telescope for vim.ui.select
- **telescope-undo** - Undo history browser
- **telescope-manix** - Nix documentation search

## Treesitter

- **treesitter** - Syntax highlighting and code parsing
- **treesitter-context** - Sticky context showing current function/class (`<leader>uT`)
- **treesitter-refactor** - Smart rename and navigation
- **treesitter-textobjects** - Custom text objects based on syntax

## Snacks

- **snacks** - Utility plugin collection:
  - **lazygit** - Git UI
  - **terminal** - Floating terminal (`<C-/>`)
  - **bufdelete** - Better buffer deletion
  - **gitbrowse** - Open in browser
  - **bigfile** - Disable features for large files
  - **profiler** - Performance profiling
  - **picker** - Alternative picker UI
  - **indent** - Indent guides
  - **input** - Enhanced input UI
  - **scroll** - Smooth scrolling

## Mini

- **mini** - Collection of minimal plugins:
  - **mini-ai** - Extended text objects (around/inside)
  - **mini-basics** - Basic settings and mappings
  - **mini-bracketed** - Bracket-based navigation
  - **mini-comment** - Code commenting
  - **mini-icons** - Icon provider
  - **mini-hipatterns** - Highlight patterns (TODO, FIXME, etc.)
  - **mini-move** - Move lines/selections
  - **mini-splitjoin** - Split/join arguments

## UI

- **alpha** - Start screen dashboard with quick actions
- **bufferline** - Tab-style buffer line with diagnostics
- **lualine** - Statusline with mode, branch, diagnostics, LSP info
- **noice** - Enhanced UI for messages, cmdline, popupmenu
- **notify** - Notification manager
- **flash** - Jump/search navigation with labels (`s`, `gl`)
- **nvim-ufo** - Modern fold management with LSP support (`zR`, `zM`)
- **statuscol** - Customizable status column
- **nui** - UI component library
- **precognition** - Motion hints display

## Theme

- **catppuccin** - Catppuccin Macchiato colorscheme with transparent background

## Utilities

- **colorizer** - Highlight color codes inline (hex, rgb, tailwind)
- **minty** - Color picker (`<leader>uc`)
- **nvim-autopairs** - Auto-close brackets and quotes
- **nvim-surround** - Add/change/delete surrounding pairs
- **persistence** - Session management (`<leader>q`)
- **devdocs** - Offline documentation browser (`<leader>D`)
- **project-nvim** - Project detection and management
- **plenary** - Lua utility library
- **img-clip** - Image paste support
- **kulala** - REST client
- **compiler** - Compiler integration
- **debugprint** - Debug print statement insertion
- **firenvim** - Neovim in browser textareas
- **hardtime** - Break bad Vim habits
- **package-info** - NPM package version info
- **ts-context-commentstring** - Context-aware comment strings

## Language Support

Configured LSP, formatters, and linters for:
- **Nix** - nil_ls, nixd, alejandra/nixfmt
- **Python** - pyright/basedpyright, ruff
- **TypeScript/JavaScript** - ts_ls, eslint, prettier/biome
- **Rust** - rust-analyzer
- **Lua** - lua_ls, stylua
- **Markdown** - marksman, markdownlint, prettier
- **JSON/YAML** - jsonls, yamlls
- **HTML/CSS** - html, cssls, tailwindcss
- **Shell** - bashls, shfmt
- **Docker** - dockerls, docker_compose_language_service
- **C/C++** - clangd
