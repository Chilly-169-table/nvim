:set number
":set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
":setqflist()

call plug#begin('~/.config/nvim/plugged')
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'Xuyuanp/nerdtree-git-plugin' "Indicates Modified and Staged Files in NERDTree 
Plug 'airblade/vim-gitgutter' "Indicates Added lines and deleted lines in the editor since last commit
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'tpope/vim-fugitive' "Shows in the Status bar which Branch you're working on
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'https://github.com/mattn/emmet-vim' 
Plug 'https://github.com/mattn/webapi-vim'
Plug 'ctrlpvim/ctrlp.vim' "Fuzzy File Finder
"Plug 'https://github.com/frazrepo/vim-rainbow'
} " this is for auto complete, prettier and tslinting
"Plug 'neoclide/coc.nvim', {'tag': '*', 'do': 'yarn install', 'for': ['json', 'lua', 'vim', 'js', 'css',]}
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-json']  " list of CoC extensions needed
"let g:coc_global_extensions = ['coc-eslint']
Plug 'jiangmiao/auto-pairs' "this will auto close ( [ {
"Plug 'https://github.com/LunarWatcher/auto-pairs'
"Plug 'windwp/nvim-autopairs'
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'  "TypeScript Highlighting	
Plug 'https://github.com/MaxMEllon/vim-jsx-pretty'
Plug 'https://github.com/styled-components/vim-styled-components'
set encoding=UTF-8

call plug#end()
let g:vim_jsx_pretty_highlight_close_tag = 1	
autocmd VimEnter * NERDTree  "Opens NERDTree automatically whenever NVim is Opened
autocmd VimEnter * wincmd p "Focuses cursor on the editor window instead of NERDTree which is opening along with Vim.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "Closes NERDTREE along with vim

"" vim-prettier
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
"The Above 2 snippets will autoformat upon hitting the save-command :w
"command! -nargs=0 Prettier :CocCommand prettier.formatFile
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
"The Above snippet make sure Preetier runs for all the above mentioned files
"as by default somehow Preetier wasn't running on html files

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

nmap <F8> :TagbarToggle<CR>

:set completeopt-=preview " For No Previews

":colorscheme abstract 
":colorscheme gruvbox 
:colorscheme jellybeans 
":colorscheme carbonized 
":colorscheme abstract 
":colorscheme abstract 
"g:NERDTreeDirArrowExpandable="+"
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
"emmet shortcuts
let g:user_emmet_leader_key=','
let g:user_emmet_mode='n'
"Emmet-Config-File(Adding custom snippets)
let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.config/nvim/snippets.json')), "\n"))
"EsLint Configuration-On what files should eslint act on when the file gets
"saved using 
"{
  "eslint.autoFixOnSave": true,
  "eslint.filetypes": ["javascript", "javascriptreact", "typescript", "typescriptreact"]
"}
