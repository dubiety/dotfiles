"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
"syntax enable
syntax on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    " alternatively, pass a path where Vundle should install plugins
    "call vundle#begin('~/some/path/here')

    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'

    """ Plugin on GitHub repo

    " vim-gitgutter
    Plugin 'airblade/vim-gitgutter'
    " vim-markdown
    Plugin 'plasticboy/vim-markdown'
    " tagbar
    Plugin 'majutsushi/tagbar'
    " Nerdtree
    Plugin 'scrooloose/nerdtree'
    " ack.vim
    Plugin 'mileszs/ack.vim'
    " vim-fugitive
    Plugin 'tpope/vim-fugitive'
    " Syntastic
    Plugin 'vim-syntastic/syntastic'
     " vim-go
    Plugin 'fatih/vim-go', { 'for': ['mod', 'go'] }
    " auto formatter
    Plugin 'Townk/vim-autoclose'
    " OmniCppComplete
    Plugin 'vim-scripts/OmniCppComplete'
    " YouCompleteMe
    Plugin 'Valloric/YouCompleteMe', { 'for': ['go', 'python'] }
    " hjson syntax support
    Plugin 'hjson/vim-hjson'
    " python linter
    Plugin 'nvie/vim-flake8'
    " Jinja highlighting
    Plugin 'Glench/Vim-Jinja2-Syntax'
    " Ansible Syntax highlighting
    Plugin 'pearofducks/ansible-vim', { 'for': ['yaml.ansible'] }
    " vim-systemd syntax
    Plugin 'Matt-Deacalion/vim-systemd-syntax', { 'for': 'systemd' }
	" vim syntax setup/highlight for terraform
	Plugin 'hashivim/vim-terraform', { 'for': 'terraform' }
	" yaml
	Plugin 'avakhov/vim-yaml', { 'for': 'yaml' }
    " gocode autocompletion
    Plugin 'mdempsky/gocode', {'rtp': 'vim/'}
	" Vue syntax highlighting
	Plugin 'posva/vim-vue'
	" SCSS syntax highlighting
	Plugin 'cakebaker/scss-syntax.vim'
	" vim for nginx
	Plugin 'chr4/nginx.vim'
	" vim auto format
	Plugin 'Chiel92/vim-autoformat'
	" vim mustache syntax
	Plugin 'mustache/vim-mustache-handlebars'
	" vim for toml
	Plugin 'cespare/vim-toml'
	" Deep TabNine
	Plugin 'zxqfl/tabnine-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set t_Co=256
set background=dark

" highlight current line
set cursorline

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Disable folding
set nofoldenable

set fileencodings=utf-8,cp950
set nocompatible
set ai
set confirm

nnoremap <F7>  <ESC>:FufFile<CR>
noremap  <F9>  <ESC>:NERDTreeToggle<CR>
nnoremap <F8>  :TagbarToggle<CR>
nnoremap <C-o> :tabprevious<CR>
nnoremap <C-p> :tabnext<CR>
nnoremap <C-l> :tabclose<CR>
" Set paset mode
nnoremap <F3> :set invpaste paste?<CR>
set pastetoggle=<F3>

let g:tagbar_width = 30
let g:tagbar_left = 1
set tags=./tags,tags
set t_Co=256
colorscheme darknight256

setl omnifunc=nullcomplete#Complete
autocmd FileType * setl omnifunc=nullcomplete#Complete
autocmd FileType python setl omnifunc=pythoncomplete#Complete
autocmd FileType javascript setl omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html setl omnifunc=htmlcomplete#CompleteTags noci
autocmd FileType css setl omnifunc=csscomplete#CompleteCSS noci
autocmd FileType xml setl omnifunc=xmlcomplete#CompleteTags
autocmd FileType php setl omnifunc=phpcomplete#CompletePHP
autocmd FileType c setl omnifunc=ccomplete#Completei
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType vue syntax sync fromstart
autocmd FileType scss set iskeyword+=-
autocmd BufRead,BufNewFile */deploy/*.yml set filetype=yaml.ansible
autocmd BufRead,BufNewFile *.j2 setlocal ts=2 sts=2 sw=2 expandtab filetype=jinja
autocmd BufRead,BufNewFile Jenkinsfile* setlocal expandtab filetype=groovy
autocmd BufRead,BufNewFile *.sh.* setlocal filetype=sh
autocmd BufRead,BufNewFile *.tmux.conf.* setlocal filetype=tmux
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
autocmd BufRead,BufNewFile *.scss set filetype=scss
autocmd BufRead,BufNewFile *.toml set filetype=toml
autocmd BufRead,BufNewFile */nginx/*.conf,*/nginx/*/*.conf,*/nginx/*/default set filetype=nginx

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=100

" Enable filetype plugins
filetype plugin on
"filetype indent on
filetype on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>
nmap <leader>q :q!<cr>

" Shortcut utilities
nmap <leader>p :echo expand('%:p')<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

" Always show current position
set ruler

" Precede line number
set nu

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
"[??]set hid

" Configure backspace so it acts as it should act
set backspace=2
set whichwrap+=<,>,[,]

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Highlight matches without moving
nnoremap <F5> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Maximum number of tab pages to be opened by the -p option
set tabpagemax=50

" show trailing white spaces
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Abbreviation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets auto-correct some easily typos
:iabbrev raelly really

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't use spaces instead of tabs
set noexpandtab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Wrap line
set wrap

" Line break
set linebreak
set breakat="^I!@*-+;:,./?"

" Be smart when using tabs ;)
"set smarttab
" Do smart autoindenting when starting a new line
set smartindent
" Enables automatic C program indenting
set cin


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Smart way to move between windows
noremap <C-j> <C-W>h
noremap <C-k> <C-W>j
noremap <C-i> <C-W>k
noremap <C-l> <C-W>l

" git-fugitive hotkey
nmap <C-g> :Gblame<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
"map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Removes trailing spaces
function DeleteTrailingWS()
  %s/\s*$//
  ''
:endfunction
autocmd FileWritePre *   :call DeleteTrailingWS()
autocmd FileAppendPre *  :call DeleteTrailingWS()
autocmd FilterWritePre * :call DeleteTrailingWS()
autocmd BufWritePre *    :call DeleteTrailingWS()
map <F2> :call DeleteTrailingWS()<CR>

if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ack \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

"au BufNewFile,BufRead *.py,*.pyw set expandtab textwidth=80

""""""""""""""""""""""""""""""
" => Go section
""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

""""""""""""""""""""""""""""""
" => Systemd section
""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.service set filetype=systemd
au BufRead,BufNewFile *.timer set filetype=systemd
au BufRead,BufNewFile *.mount set filetype=systemd
au BufRead,BufNewFile *.target set filetype=systemd
au BufRead,BufNewFile *.socket set filetype=systemd
au BufRead,BufNewFile *.slice set filetype=systemd
au BufRead,BufNewFile *.busname set filetype=systemd

""""""""""""""""""""""""""""""
" => Plugin section
""""""""""""""""""""""""""""""
" powerline
" source <path-to-powerline-pip-package>/powerline.vim
set laststatus=2
set showtabline=2
set noshowmode
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_pylint_post_args='--max-line-length=150'
let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_lua_checkers = ['luacheck']
let g:syntastic_yaml_checkers = ['yamllint']
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++17'
" let g:syntastic_go_checkers = ['golangci-lint'] use vim-go's golangci-lint
nnoremap <leader>c :SyntasticCheck<CR>
nnoremap <leader>t :SyntasticToggleMode<CR>

" ----- ansible-vim -----
let g:ansible_unindent_after_newline = 1
let g:ansible_extra_keywords_highlight = 1
let g:ansible_normal_keywords_highlight = 'Constant'
let g:ansible_with_keywords_highlight = 'Constant'

" ----- ag -----
let g:ackprg = 'ag --vimgrep'

" ----- vim-go -----
let g:go_fmt_command = "goimports"
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_auto_type_info = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'varcheck', 'gosimple']
let g:go_metalinter_command = "golangci-lint run --fast"
let g:go_metalinter_autosave = 1
let g:go_list_type = 'quickfix'
let g:go_metalinter_autosave_enabled = ['govet', 'golint', 'varcheck', 'gofmt']
let g:go_metalinter_deadline = "5s"
let g:go_highlight_functions = 1
let g:go_highlight_types = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
nnoremap <leader>T :GoAlternate<CR>

" --- ycm ---
let g:loaded_youcompleteme = 1

" --- terraform ---
au BufRead,BufNewFile *.tf setlocal filetype=terraform expandtab tabstop=2 shiftwidth=2
au BufRead,BufNewFile *.tfvars setlocal filetype=terraform expandtab tabstop=2 shiftwidth=2
au BufRead,BufNewFile *.tfstate setlocal filetype=terraform expandtab tabstop=2 shiftwidth=2

let g:terraform_align = 1
let g:terraform_fmt_on_save = 1

" --- ctags ---
set tags=tags
set autochdir
