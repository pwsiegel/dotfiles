# dotfiles

My personal configuration for a development environment on macOS. The
intended audience is future me on a new laptop.

## What's here

| Path | Purpose |
|---|---|
| `nvim/` | Neovim config — Lua, lazy.nvim, LSP + treesitter + completion + snippets. The primary editor. |
| `vim/` | Legacy Vim config (kept as a fallback during the nvim transition). |
| `zsh/zshrc` | Shell config (oh-my-zsh + powerlevel10k + vi-mode + fzf integration). |
| `tmux/tmux.conf` | Tmux config (C-a prefix, powerline theme, mouse on, tpm). |
| `git/` | `gitconfig` + global `gitignore`. |
| `claude/` | Claude Code user-level skills (e.g. `/initiative` for structured multi-phase workflow). |

## Setup on a new machine

Assumes macOS with Command Line Tools installed (`xcode-select --install`).

### 1. Homebrew + core CLIs

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install \
    neovim tree-sitter-cli \
    fzf fd \
    uv \
    tmux \
    git \
    node \
    powerlevel10k

brew install --cask iterm2
```

### 2. Oh My Zsh

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
```

Don't let it overwrite `~/.zshrc` — if it does, restore the symlink in step 4.

### 3. Clone this repo

```sh
git clone git@github.com:pwsiegel/dotfiles.git ~/dotfiles
```

### 4. Link configs into place

```sh
ln -sfn ~/dotfiles/zsh/zshrc          ~/.zshrc
ln -sfn ~/dotfiles/tmux/tmux.conf     ~/.tmux.conf
ln -sfn ~/dotfiles/git/gitconfig      ~/.gitconfig
ln -sfn ~/dotfiles/vim/vimrc          ~/.vim/vimrc          # legacy, optional
mkdir -p ~/.config/git
ln -sfn ~/dotfiles/nvim               ~/.config/nvim
ln -sfn ~/dotfiles/git/gitignore_global ~/.config/git/ignore  # git reads this by default (XDG)
mkdir -p ~/.claude/skills
ln -sfn ~/dotfiles/claude/skills/initiative ~/.claude/skills/initiative   # /initiative skill
```

On a work machine where `~/.gitconfig` is kept separate (different identity,
custom aliases), skip the `gitconfig` link above but keep the `~/.config/git/ignore`
one — git reads it regardless of what your `.gitconfig` says.

### 5. Tmux plugins

Install [tpm](https://github.com/tmux-plugins/tpm):

```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Start tmux, then press `<C-a> I` (capital-i) to install the plugins listed
in `tmux.conf`.

### 6. Fonts (powerline glyphs)

Lualine and the airline-style chevrons use powerline glyphs. Install a
patched font and point iTerm at it:

```sh
git clone https://github.com/powerline/fonts.git --depth=1 /tmp/powerline-fonts
/tmp/powerline-fonts/install.sh
rm -rf /tmp/powerline-fonts
```

In iTerm: `Preferences → Profiles → Text → Font` → pick any
`*-for-Powerline` (e.g. `Roboto Mono Light for Powerline`).

### 7. Neovim bootstrap

Open `nvim`. lazy.nvim self-clones on first launch and installs every
plugin from `nvim/lua/plugins/*.lua`. Quit and relaunch once the install
finishes.

Then inside nvim, install the treesitter parsers and LSP servers:

```vim
:lua require('nvim-treesitter').install({
    'bash','css','diff','dockerfile','gitcommit','gitignore','html',
    'javascript','json','lua','markdown','markdown_inline','python',
    'query','regex','sql','toml','tsx','typescript','vim','vimdoc','yaml',
})

:MasonInstall pyright ruff typescript-language-server eslint-lsp lua-language-server prettier
```

(The `:MasonInstall` line uses Mason's package names, which differ from the
mason-lspconfig short names — `ts_ls` vs `typescript-language-server` etc.)

### 8. Powerlevel10k

On first shell launch, p10k will run its configuration wizard. Answer the
prompts to taste; it writes `~/.p10k.zsh` which `zshrc` sources.

## Updating the config

The repo is the source of truth. Edit files in place under `~/dotfiles/`
and reload:

| What | How |
|---|---|
| Zsh | `source ~/.zshrc` or open a new shell |
| Tmux | `<C-a> r` (if mapped) or `tmux source ~/.tmux.conf` |
| Nvim | `:Lazy sync` for plugin changes; restart nvim for config changes (Lua module cache makes in-place reload unreliable) |

## Caveats

- The `nvim/` config requires Neovim 0.11+ (uses `vim.lsp.config`,
  `vim.diagnostic.jump`, etc.). On macOS just keep brew current.
- The brew-shipped `tree-sitter` package is the library only; you also
  need the `tree-sitter-cli` package for parsers that build from grammar
  (latex in particular).
- The legacy `vim/` config and Vim itself are kept around as a fallback.
  Delete them once nvim is fully settled.
