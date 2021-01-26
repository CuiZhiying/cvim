set nocompatible              " be iMproved, required
filetype on                   " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" Plugin 'vim-syntastic/syntastic'
" Plugin 'w0rp/ale'

Plugin 'mileszs/ack.vim'

Plugin 'hesselbom/vim-hsftp'

Plugin 'scrooloose/nerdtree'

Plugin 'ervandew/supertab'

" show markdown ontime
" Plugin 'suan/vim-instant-markdown'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'


" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'


" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



"""""""""""""""""""""""
"" 
" NERDTree config
"open a NERDTree automatically when vim starts up
" autocmd vimenter * NERDTree
"open a NERDTree automatically when vim starts up if no files were specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"open NERDTree automatically when vim starts up on opening a directory
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"map F2 to open NERDTree
map <F2> :NERDTreeToggle<CR>
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""" NERDTree config end

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" ale config 
" use quickfix
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

" 关闭实时检查
" let g:ale_lint_on_text_changed = 'never'
" You can disable this option too
" if you don't want linters to run on opening a file
" let g:ale_lint_on_enter = 0

" 快速定位错误的的快捷键
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" 重新定义标识符
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"<Leader>s触发/关闭语法检查
nmap <Leader>z :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>
"<Leader>s触发/关闭语法检查
" nnoremap <silent><F9>:ALEToggle<CR>
" 重新定义标识符
"<Leader>d查看错误或警告的详细信息
" nnoremap <silent><F10>:ALEDetail<CR>
""" ale config end
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" color
colorscheme badwolf

" 开启语法高亮
syntax enable

" 显示行号
set number

" 设置 tab 符为 4 个空格
set tabstop=4

" 写代码时，移到下一行时自动缩进
set autoindent

" 将 tab 符自动扩展成空格
set expandtab

" 使用 >> 和 << 命令时, 移动 4 个空格
set shiftwidth=4

" 在光标所在的当前行下显示一条行指示线
set cursorline

" 显示 [] {} 和 () 匹配的另一半符号
set showmatch

" 开启全部 Python 语法高亮特性
let python_highlight_all = 1

" html 补全
autocmd FileType css set omnifunc=csscomplete#CompleCSS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

""""""""""""""""""
""quick run 
""""""""""""""""""
"" map <F5>: call CompileRun()<CR>
"" func! CompileRun()
""     exec "w"
""     if &filetype == 'c'
""         exec "!gcc % -o %<"
""         exec "!time ./%<"
""    elseif &filetype == 'cpp'
""         exec "!g++ % -o %<"
""     elseif &filetype == 'java'
""         exec "!javac %"
""     elseif &filetype == 'sh'
""         :!time bash %
""     elseif &filetype == 'html'
""         exec "!firefox % &"
""     elseif &filetype == 'python'
""         :!time bash %
""     endif
"" endfunc
"" 

""""""""""""""""""""""""""""
"" my quick run
""""""""""""""""""""""""""""
" Bind F5 to save file if modified and execute python script in a buffer.
nnoremap <silent> <F5> :call SaveAndExecutePython()<CR>
" vnoremap <silent> <F5> :<C-u>call SaveAndExecutePython()<CR>


" let s:ft="100"
" echo filetype
autocmd BufRead *.py   let s:ft="0"
autocmd BufRead *.c    let s:ft="1"
autocmd BufRead *.cpp  let s:ft="2"
autocmd BufRead *.java let s:ft="3"
autocmd BufRead *.html let s:ft="4"
autocmd BufRead *.sh   let s:ft="5"

function! SaveAndExecutePython()
    " SOURCE [reusable window]: https://github.com/fatih/vim-go/blob/master/autoload/go/ui.vim

    " save and reload current file
    silent execute "update | edit"

    " get file path of current file
    let s:current_buffer_file_path = expand("%")
    " let s:current_buffer_file_path = %

    let s:output_buffer_name = "Python"
    let s:output_buffer_filetype = "output"

    " reuse existing buffer window if it exists otherwise create a new one
    if !exists("s:buf_nr") || !bufexists(s:buf_nr)
        silent execute 'botright new ' . s:output_buffer_name
        let s:buf_nr = bufnr('%')
    elseif bufwinnr(s:buf_nr) == -1
        silent execute 'botright new'
        silent execute s:buf_nr . 'buffer'
    elseif bufwinnr(s:buf_nr) != bufwinnr('%')
        silent execute bufwinnr(s:buf_nr) . 'wincmd w'
    endif

    silent execute "setlocal filetype=" . s:output_buffer_filetype
    setlocal bufhidden=delete
    setlocal buftype=nofile
    setlocal noswapfile
    setlocal nobuflisted
    setlocal winfixheight
    setlocal cursorline " make it easy to distinguish
    setlocal nonumber
    setlocal norelativenumber
    setlocal showbreak=""

    " clear the buffer
    setlocal noreadonly
    setlocal modifiable
    %delete _

    " add the console output
    
    if s:ft == '0'|| s:ft == '5'
        silent execute ".!chmod a+x ./" . shellescape(s:current_buffer_file_path, 1)
        silent execute ".!./" . shellescape(s:current_buffer_file_path, 1)
    elseif s:ft == '1'
        silent execute ".!gcc ./" . shellescape(s:current_buffer_file_path, 1)
        silent execute ".!./a.out"
    elseif s:ft == '2'
        silent execute ".!g++ ./" . shellescape(s:current_buffer_file_path, 1)
        silent execute ".!./a.out"
    endif

    " echo 
    " echo s:ft
    " echo

    " resize window to content length
    " Note: This is annoying because if you print a lot of lines then your code buffer is forced to a height of one line every time you run this function.
    "       However without this line the buffer starts off as a default size and if you resize the buffer then it keeps that custom size after repeated runs of this function.
    "       But if you close the output buffer then it returns to using the default size when its recreated
    "execute 'resize' . line('$')

    " make the buffer non modifiable
    setlocal readonly
    setlocal nomodifiable
endfunction

if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif




