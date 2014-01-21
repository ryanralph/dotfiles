set nocompatible
set number
" Search ignores case, unless case is specified
set ignorecase
set smartcase

" Highlight search as its typed
set incsearch

" Maintain same indentation on new lines
set autoindent

" Always show cursor position
set ruler

" Always show status line
set laststatus=1
set showcmd
set showmode

" Indentation rules
set joinspaces
set noexpandtab
set shiftround
set shiftwidth=6
set tabstop=2

" No more epilepsy
set noerrorbells
set visualbell
set t_vb=

" Ignore these files
set wildignore=*.class,*.hi,*.o,*.so,*.os,*.pyc

" Don't worry about backups
set nobackup
set noswapfile
set nowb

" Fast terminal connection
set ttyfast

" Non-annoying paste-mode
set pastetoggle=<F2>

" Disable EX mode
noremap Q <nop>

" Disable man lookup
noremap K <nop>

" Disable recording
noremap q <nop>

" Navigate wrapped lines
nnoremap j gj
nnoremap k gk

" Find replace in vselection
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Paste but use dead register
vmap p "_dp
vmap P "_dP

" Colorscheme settings
syntax on
set t_Co=256
set background=dark
colorscheme wombat256mod
