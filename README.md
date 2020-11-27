# fzfurlview.vim

List, fuzzily search, and open URLs easily.

## Usage

```vim
:FzfUrlView
```

Optionally, you can assign it to a keybinding. For instance:

```vim
nnoremap <silent> <leader>uv :FzfUrlView<CR>
```

## Installation

Pick your favorite plugin manager:

```vim
Plug 'jordelver/fzfurlview.vim'
```

## Dependencies

- [fzf.vim](https://github.com/junegunn/fzf.vim)

## Acknowledgments

Majority of code taken from [urlview.vim](https://github.com/strboul/urlview.vim)
and re-worked to use fzf.vim.
