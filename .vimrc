set nocompatible  " be iMproved, required
filetype off      " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plugin 'sheerun/vim-polyglot'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
" Plugin 'alvan/vim-closetag'
Plugin '907th/vim-auto-save'
Plugin 'crusoexia/vim-monokai'      " Color theme

"-------------------
" Elixir
"-------------------
Plugin 'elixir-editors/vim-elixir'  " Syntax highlighting and indentation.
Plugin 'slashmili/alchemist.vim'    " Gotodef, autocomplete and tooling.
let g:alchemist_tag_map = '<C-]>'
let g:alchemist_tag_stack_map = '<C-[>'

"-------------------
" NerdTree
"-------------------
Plugin 'scrooloose/nerdtree'        " File explorer
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Map NerdTree toggle
nmap <F6> :NERDTreeToggle<CR>
nmap <leader>, :NERDTreeToggle<CR>

" Shuts vim if NerdTree is the last window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Starts NERDTree at the start.
autocmd vimenter * NERDTree
let NERDTreeShowHidden=1

call vundle#end()           " required
filetype plugin indent on   " required

"-------------------
" General config
"-------------------
set ttimeout          " time out for key codes
set ttimeoutlen=0     " wait up to 100ms after Esc for special key

let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

set list listchars=tab:»·,trail:·,nbsp:· " Display extra whitespace

" Show trailing whitespace and spaces before a tab:
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\\t/

set foldmethod=syntax
set nofoldenable  " Files don't start folded
set backspace=indent,eol,start
set nosmartindent
set autoindent
set cursorline 		" highlight the current line the cursor is on
set cuc cul    		" highlight the current column the cursor is on

set laststatus=2  " Shows the current status of the file.
set expandtab     " Replaces a <TAB> with spaces
set shiftwidth=2  " The amount to block indent when using < and >
set shiftround    " Shift to the next round tab stop
set tabstop=2     " 2 space tab
set softtabstop=2 " Causes backspace to delete 2 spaces = converted <TAB>
set smarttab      " Uses shiftwidth instead of tabstop at start of lines

" Show line numbers
set nu
set number
set numberwidth=5

" Searching
set hlsearch   " Highlights the areas that you search for.
set incsearch  " Searches incrementally as you type.
set ignorecase " Case Insensitivity Pattern Matching
set smartcase  " Overrides ignorecase if pattern contains upcase

set showmatch "sm: flashes matching brackets or parentheses
set clipboard=unnamed " Copy&Paste works with the system too.

" When scrolling off-screen do so 3 lines at a time, not 1
set scrolloff=3

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Highlights with a small shadow all code surpassing 80 characters.
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

"-------------------
" Colors
"-------------------
" turn on syntax highlighting
syntax on
colorscheme monokai

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

" ------------------------------------------------------------------------------
" Mappings
" ------------------------------------------------------------------------------
" Arrow keys no op
" map <Left> <Nop> 
" map <Right> <Nop>
" map <Up> <Nop>
" map <Down> <Nop>

" https://vim.fandom.com/wiki/Avoid_the_escape_key
imap jj <Esc>

" Don't complain on some obvious fat-fingers
nmap :W :w
nmap :W! :w!
nmap :Q :q
nmap :Q! :q!
nmap :Qa :qa
nmap :Wq! :wq!
nmap :WQ! :wq!

" No arrows key
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" -----------------------------------------------------------------------------
"  General Settings
" -----------------------------------------------------------------------------

" disable the creation of .swp file
set noswapfile

" enable autoindent
set autoindent

" change the displayed colour for line numbers
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE

" use Ag with ack.vim
let g:ackprg = 'ag --nogroup --nocolor --column'

" enable spellcheck for commit messages
autocmd Filetype gitcommit setlocal spell

" underscore line across editor to show where cursor is in the file
" set cursorline

" Autosave when window loses focus (i.e. when change window)
let g:auto_save_events = ["FocusLost"]
