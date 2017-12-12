set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" plugins
" {
Plugin 'VundleVim/Vundle.vim'

"colorschemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'croaker/mustang-vim'

Plugin 'hlissner/vim-multiedit'
Plugin 'bitc/vim-bad-whitespace'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'ervandew/supertab'
Plugin 'bkad/CamelCaseMotion'
Plugin 'Valloric/YouCompleteMe'
Plugin 'martinda/Jenkinsfile-vim-syntax'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'mhinz/vim-startify'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdcommenter'

" }

call vundle#end()

filetype plugin on
filetype indent on

if &t_Co >= 256 || has("gui_running")
	colorscheme mustang
endif

if &t_Co > 2 || has("gui_runnig")
	syntax on
endif

autocmd BufEnter *.cls set syntax=tex

" plugins
" {
    let g:airline_powerline_fonts = 1
    let g:session_autosave = 'no'

    if executable('ag')
      " Use Ag over Grep
      set grepprg=ag\ --nogroup\ --nocolor

      " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
      let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
      let g:ackprg = 'ag --vimgrep'
    endif
" }

" must-have
" {
    set hidden
    set wildmenu
    set showcmd
    set hlsearch
" }

" usability
" {
    set ignorecase
    set smartcase
    set backspace=indent,eol,start
    set autoindent
    set nostartofline
    set ruler
    set laststatus=2
    set confirm
    set visualbell
    set t_vb=
    set mouse=a
    set cmdheight=2
    set number
    set notimeout ttimeout ttimeoutlen=200
    set list
    set listchars=tab:>.,trail:!,extends:#,nbsp:_

    set wildignore+=*/tmp/*,*.so,*.swp,*.zip
" }

" indentation
" {
    set shiftwidth=4
    set softtabstop=4
    set tabstop=4
    set expandtab
" }

" fold
" {
    set foldmethod=syntax
    set foldnestmax=10

    nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
    vnoremap <Space> zf
" }

" script inits
" {
    call camelcasemotion#CreateMotionMappings('')
    let g:ycm_server_python_interpreter = 'python2'
" }

" mappings
" {
    " bepo
    nnoremap . :
    let mapleader=","
    imap ,, <Esc>

    " usability
    map Y y$
    map <F1> <nop>
    nnoremap <C-L> :nohl<CR><C-L>
    nnoremap <C-S> :w<CR>
    vnoremap // y/<C-R>"<CR>

    " buffers
    map <C-Right> <C-w>l
    map <C-Left> <C-w>h
    map <C-Up> <C-w>k
    map <C-Down> <C-w>j
    nmap <tab> :CtrlP<CR>

    " plugins
    nmap /** :Dox<CR>
" }

" functions
" {
    fun!<SID>StripTrailingWhitespaces()
        let _s=@/
        let l = line(".")
        let c = col(".")
        %s/\s\+$//e
        call cursor(l,c)
        let @/=_s
    endfun

    autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
" }
