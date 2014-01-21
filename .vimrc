set nocompatible

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
set tabstop=6

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

" Disable arrowkeys navigation
noremap <down> <nop>
noremap <up> <nop>
noremap <left> <nop>
noremap <right> <nop>

" Disable EX mode
noremap Q <nop>

" Disable man lookup
noremap K <nop>

" Disable recording
noremap q <nop>

" No help
inoremap <F1> <nop>
noremap <F1> <nop>

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

" Non-annoying paste-mode
set pastetoggle=<F2>

" Haskell
au filetype haskell set expandtab nojoinspaces shiftwidth=8 smarttab softtabstop=8 tabstop=8

" Define language-specific comment characters
au FileType c,cpp,cs,d,java,javascript let b:commentchar='//'
au FileType fortran let b:commentchar='!'
au FileType haskell let b:commentchar='--'
au FileType conf,make,markdown,python,r,ruby,sh let b:commentchar='#'
au FileType plaintex,tex let b:commentchar='%'
au FileType vim let b:commentchar='"'

" Strip trailing whitespace on save
au FileType c,conf,cpp,cs,d,fortran,haskell,java,javascript,make,markdown,plaintex,python,ruby,sh,tex,vim au BufWritePre <buffer> :%s/\s\+$//e

let mapleader=","

" Define mappings for mass-line commenting
map <leader>c :s/^/<C-R>=escape(b:commentchar,'\/')<CR>/g<CR>
map <leader>C :s/^\V<C-R>=escape(b:commentchar,'\/')<CR>//g<CR>
