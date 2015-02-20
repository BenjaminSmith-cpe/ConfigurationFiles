set nocompatible              " be iMproved, required

"Vundle Setup
        filetype off                  " required
        filetype plugin indent on     " required
        " set the runtime path to include Vundle and initialize
        set rtp+=~/.vim/bundle/Vundle.vim
        call vundle#begin()
        " alternatively, pass a path where Vundle should install plugins
        "call vundle#begin('~/some/path/here')

        " let Vundle manage Vundle, required
        Plugin 'gmarik/Vundle.vim'
        "Plugin 'scrooloose/nerdtree'
        Plugin 'sjl/badwolf.git'
        Plugin 'kien/ctrlp.vim'
        Plugin 'rking/ag.vim'
        Plugin 'tpope/vim-fugitive'
        Plugin 'bling/vim-airline'
        Plugin 'airblade/vim-gitgutter'
        Plugin 'nachumk/systemverilog.vim'
        Plugin 'ervandew/supertab'
        Plugin 'scrooloose/syntastic'
        Plugin 'jistr/vim-nerdtree-tabs'
        Plugin 'terryma/vim-multiple-cursors'
        Plugin 'tmhedberg/matchit'
        Plugin 'majutsushi/tagbar'
        Plugin 'hdima/python-syntax'

        " All of your Plugins must be added before the following line
        call vundle#end()            " required

"misc control settings 
        set ignorecase
        set incsearch

        set smarttab
        set mouse=a

        set tabstop=4       	" number of visual spaces per TAB
        set softtabstop=4   	" number of spaces in tab when editing
        set expandtab       	" tabs are spaces

        " Flipping between windows
        nmap <silent> <A-Up> :wincmd k<CR>
        nmap <silent> <A-Down> :wincmd j<CR>
        nmap <silent> <A-Left> :wincmd h<CR>
        nmap <silent> <A-Right> :wincmd l<CR>

"Colors
        set t_Co=256
        syntax on               " enable syntax processing
        colorscheme badwolf     " awesome colorscheme
        filetype plugin on

        "detection for syntax highlighting
        autocmd BufNewFile,BufRead *.vs   set syntax=systemverilog
        autocmd BufNewFile,BufRead *.v    set syntax=systemverilog
        autocmd BufNewFile,BufRead *.sv   set syntax=systemverilog

"UI
        set number              " show line numbers
        set showcmd             " show command in bottom bar
        set cursorline          " highlight current line
        set wildmenu            " visual autocomplete for command menu
        "set lazyredraw          " redraw only when we need to.
        set showmatch           " highlight matching [{()}]

        "Search options
        set incsearch           " search as characters are entered
        set hlsearch            " highlight matches

        set backspace=2

        "Code Folding"
        set foldenable          " enable folding
        set foldlevelstart=10   " open most folds by default
        set foldnestmax=10      " 10 nested fold max
        nnoremap <space> za     " space open/closes folds
        set foldmethod=indent   " fold based on indent level

"Movement Controls
        " move vertically by visual line
        nnoremap j gj
        nnoremap k gk
        " move to beginning/end of line
        nnoremap B ^
        nnoremap E $
        " $/^ doesn't do anything
        nnoremap $ <nop>
        nnoremap ^ <nop>

        " highlight last inserted text
        nnoremap gV `[v`]
        inoremap jk <esc>

"CTRL P settings"
        let g:ctrlp_match_window = 'bottom,order:ttb'
        let g:ctrlp_switch_buffer = 0
        let g:ctrlp_working_path_mode = 'ra'
        "let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

"Airline Setup
        let g:airline#extensions#tabline#enabled = 1
        let g:airline_powerline_fonts=1
        set laststatus=2

        let g:airline#extensions#tabline#enabled = 0        " ricier airline tabs
        let g:airline#extensions#tabline#tab_nr_type = 1    " do show tab numbers
        let g:airline#extensions#tabline#tab_min_count = 2  " disappearing tabs
        let g:airline#extensions#tabline#show_buffers = 0   " don't show buffers
        let g:airline#extensions#tabline#show_tab_type = 0  " don't need this
        let g:airline#extensions#tabline#fnamemod = ':t'    " filename on tabs

        let g:airline#extensions#tagbar#enabled = 1           " slow tagbar is slow
        let g:airline#extensions#disable_rtp_load = 1         " extra speed
        "   let g:airline#extensions#tabline#buffer_nr_show = 0
        "   let g:airline#extensions#tabline#left_sep = '|'
        "   let g:airline#extensions#tabline#right_sep = '|'

"Git gutter setup"
        let g:gitgutter_sign_column_always = 1
        let g:gitgutter_realtime = 1

"ctags
        let Tlist_Use_Right_Window = 0
        let Tlist_Ctags_Cmd = '/usr/intel/bin/ctags'
        let Tlist_Exit_OnlyWindow = 1
        let Tlist_Dislplay_Prototype = 1
        let Tlist_Use_Right_Window = 1
        let Tlist_Auto_Open = 0
        "let tlist_systemverilog_settings = 'systemverilog;c:class;t:task;m:module;p:program;i:interface;s:struct;e:typedef;f:function;v:variable;a:sda;w:mda;r:parameter;o:macro;k:assert;d:define'
        "let tlist_verilog_systemverilog_settings = 'systemverilog;c:class;t:task;m:module;p:program;i:interface;s:struct;e:typedef;f:function;r:parameter;a:sda;w:mda;o:macro;k:assert;d:define'
        let tlist_systemverilog_settings = 'systemverilog;a:assignment;c:class;t:task;f:function;m:module;p:program;P:parameter;i:interface;I:input;e:typedef;O:output;T:internal'
        nnoremap <silent> <F8> :Tlist<CR>
        nnoremap <silent> <F9> :TlistSync<CR>
        "let tlist_verilog_systemverilog_settings = 'verilog;s:struct;y:typedef;c:constant;e:event;E:enum,f:function;m:module;n:net;p:port;r:register;t:task'
        "let tlist_def_verilog_systemverilog_settings = 'verilog;d:macro;g:enum;s:struct;u:union;t:typedef;v:variable;f:function'

"matchit
        let b:match_ignorecase=0
        let b:match_words=
          \ '\<begin\>:\<end\>,' .
          \ '\<if\>:\<else\>,' .
          \ '\<module\>:\<endmodule\>,' .
          \ '\<class\>:\<endclass\>,' .
          \ '\<program\>:\<endprogram\>,' .
          \ '\<clocking\>:\<endclocking\>,' .
          \ '\<property\>:\<endproperty\>,' .
          \ '\<sequence\>:\<endsequence\>,' .
          \ '\<package\>:\<endpackage\>,' .
          \ '\<covergroup\>:\<endgroup\>,' .
          \ '\<primitive\>:\<endprimitive\>,' .
          \ '\<specify\>:\<endspecify\>,' .
          \ '\<generate\>:\<endgenerate\>,' .
          \ '\<interface\>:\<endinterface\>,' .
          \ '\<function\>:\<endfunction\>,' .
          \ '\<task\>:\<endtask\>,' .
          \ '\<case\>\|\<casex\>\|\<casez\>:\<endcase\>,' .
          \ '\<fork\>:\<join\>\|\<join_any\>\|\<join_none\>,' .
          \ 'ifdef\>:else\>:endif\>,'
