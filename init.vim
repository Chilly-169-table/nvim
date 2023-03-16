:set number
":set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:syntax on
:set list lcs=tab:\|\

call plug#begin('~/.config/nvim/plugged')
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
"Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'https://github.com/mattn/emmet-vim' 
Plug 'https://github.com/neoclide/coc.nvim'
"'} " this is for auto complete, prettier and tslinting
"Plug 'neoclide/coc.nvim', {'tag': '*', 'do': 'yarn install', 'for': ['json', 'lua', 'vim', 'js', 'css',]}
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-json']  " list of CoC extensions needed

Plug 'jiangmiao/auto-pairs' "this will auto close ( [ {
" these two plugins will add highlighting and indenting to JSX and TSX files.
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'


Plug 'Xuyuanp/nerdtree-git-plugin' "Indicates Modified and Staged Files in NERDTree
Plug 'airblade/vim-gitgutter' "Indicates Added lines and deleted lines in the editor since last commit
Plug 'tpope/vim-fugitive' "Shows in the Status bar which Branch you're working on
Plug 'https://github.com/frazrepo/vim-rainbow'
Plug 'https://github.com/pangloss/vim-javascript'
Plug 'https://github.com/MaxMEllon/vim-jsx-pretty'
set encoding=UTF-8
Plug 'https://github.com/morhetz/gruvbox'
Plug 'https://github.com/preservim/vim-indent-guides'
Plug 'https://github.com/Yggdroot/indentLine'
Plug 'https://github.com/kien/rainbow_parentheses.vim'
call plug#end()
"Vim-JSX-pretty
let g:vim_jsx_pretty_highlight_close_tag = 1
let g:vim_jsx_pretty_colorful_config = 1
"Vim-Rainbow
let g:rainbow_active = 1
let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']
"" vim-prettier
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
"The Above 2 snippets will autoformat upon hitting the save-command :w
"command! -nargs=0 Prettier :CocCommand prettier.formatFile
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
"The Above snippet makes sure Preetier runs for all the above mentioned files
"as by default somehow Preetier wasn't running on html files

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

nmap <F8> :TagbarToggle<CR>

:set completeopt-=preview " For No Previews
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italic=1
" let g:gruvbox_underline=1
" let g:gruvbox_transparent_bg=1
" let g:gruvbox_number_column='gcc'
" let g:gruvbox_transparent_bg=1
" let g:gruvbox_color_column='blue'
:colorscheme gruvbox 

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
"Emmet
let g:user_emmet_leader_key=','
"let g:user_emmet_mode='n'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

"Vim-Indent Guides
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_auto_colors = 0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
" let g:indent_guides_guide_size = 4
" Vim-Indent Lines 
" let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" let g:indentLine_setColors = 0
" let g:indentLine_color_term ='blue'  
" let g:indentLine_defaultGroup = 'SpecialKey'
let g:indentLine_char = '\'
"Rainbow-Parentheses
" let g:rbpt_colorpairs=[['brown',       'SeaGreen3'],]
" au VimEnter * RainbowParenthesesToggle
