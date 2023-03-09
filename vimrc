" ----------------------------------------------------------------------------
"                           vundle, 插件管理
" ----------------------------------------------------------------------------
"let g:ycm_python_binary_path='/usr/local/Cellar/python/3.6.5/bin/python3'
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'


" github 库
Bundle 'dterei/VimBookmarking'

" markdown支持
Bundle 'tpope/vim-markdown'
Bundle 'suan/vim-instant-markdown'

""Bundle 'nsf/gocode'

" 主要提供 xolox#shell#execute() 后台执行外部命令的接口
Bundle 'vim-scripts/shell.vim--Odding'

" vim-scripts 库
"
Bundle 'taglist.vim'
Bundle 'OmniCppComplete'
Bundle 'The-NERD-tree'
Bundle 'SuperTab'
" Bundle 'a.vim'
Bundle 'c.vim'
Bundle 'genutils'
Bundle 'grep.vim'
Bundle 'SudoEdit.vim'
" NOTE: 自己修改了plugin/lookupfile.vim中的快捷键为F4, 默认F5.
Bundle 'lookupfile'

Bundle 'desertEx'
Bundle 'CSApprox'
Bundle 'fatih/vim-go'
Bundle 'Valloric/YouCompleteMe'
Bundle 'vimwiki/vimwiki'
Bundle 'michalbachowski/vim-wombat256mod'
Bundle 'twerth/ir_black'
Bundle 'altercation/vim-colors-solarized'
Bundle 'jiazhoulvke/MarkdownView'
filetype plugin indent on


"------------------------------------------------------------------------------
"                                   快捷键设置
"------------------------------------------------------------------------------
" c/c++头源之间的切换
nnoremap <silent> <F12> :A<CR>

" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y

" 上下左右切换到左窗口
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Buffers操作快捷方式
nnoremap <C-RETURN> :bnext<CR>
nnoremap <C-S-RETURN> :bprevious<CR>

" 更新项目tags
nnoremap <silent> <F11> :UpdateMyProject<CR>

" 搜索光标处的字符串
nnoremap <silent> <F3> :Rgrep<CR>

" 打开shell窗口
nnoremap <F10> :VimShellPop<CR>

" 复制内容到剪切板
vmap "+y :w !pbcopy<CR><CR>
nmap "+p :r !pbpaste<CR><CR>


" -----------------------------------------------------------------------------
"                               基本配置
" -----------------------------------------------------------------------------
set nu!                     " 显示行号
set ruler                   " 打开状态栏标尺
set sm!
set cin!
set nobackup                " 覆盖文件时不备份
set noswapfile              " 禁止生产临时文件
set hlsearch                " 搜索时高亮显示被找到的文本
set incsearch               " 输入搜索串逐字符高亮
set tabstop=4               " tab长度为4
set shiftwidth=4            " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4           " 使得按退格键时可以一次删掉 4 个空格
set backspace=2
" set autochdir             " 自动切换当前目录为当前文件所在的目录
set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍
                            " 保持对大小写敏感
set cc=80

set nowrapscan              " 禁止在搜索到文件两端时重新搜索
set noerrorbells            " 关闭错误警告声
set novisualbell            " 关闭使用可视响铃代替呼叫
set magic                   " 魔法
set hidden                  " 允许在有未保存的修改时切换缓冲区，此时的修改由
                            " vim 负责保存

set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
set smartindent             " 开启新行时使用智能自动缩进
set backspace=indent,eol,start
                            " 不设定在插入状态无法用退格键和 Delete 键删除回车符

set cmdheight=1             " 设定命令行的行数为 1
set laststatus=2            " 显示状态栏 (默认值为 1, 无法显示状态栏)
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\
                            " 设置在状态行显示的信息

set go-=r                   " 去掉滚动条
filetype plugin indent on   " 开启插件
syntax enable
syntax on                   " 自动语法高亮
set t_Co=256                " 支持256色
colorscheme desert	        " 颜色方案

set guifont=Droid\ Sans\ Mono:h13
                            " 设置Droid sans mono字体

set scrolloff=3             " 光标保持buffer顶和底部3行的距离

set fileencodings=ucs-bom,utf-8,chinese,cp936
                            " 设置编码为utf-8
au BufRead,BufNewFile *.c,*.cpp,*.py,*.go 2match Underlined /.\%81v/
                            " 80列提醒

let g:instant_markdown_autostart = 0
let g:instant_markdown_slow = 1

"------------------------------------------------------------------------------
"                            自定义函数
"------------------------------------------------------------------------------
"" 执行ctags程序的函数
function! Do_CsTag()
    if(executable('ctags'))
        silent! execute "!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ ."
    endif
endfunction


"------------------------------------------------------------------------------
"               plugin - taglist.vim  查看函数列表，需要ctags程序
"------------------------------------------------------------------------------
let Tlist_Ctags_Cmd = 'ctags'
                                        " NOTE: 配置正确路径

nnoremap <silent><F8> :TlistToggle<CR>
                                        " F8打开函数列表窗口

let Tlist_Show_One_File = 1             " 不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1           " 如果taglist窗口是最后一个窗口，则退出vim
let Tlist_File_Fold_Auto_Close=1        " 自动折叠当前非编辑文件的方法列表
let Tlist_Auto_Open = 0
let Tlist_Auto_Update = 1
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Process_File_Always = 1
let Tlist_Display_Prototype = 0
let Tlist_Compact_Format = 1


"------------------------------------------------------------------------------
"               plugin - NERD_tree.vim
"------------------------------------------------------------------------------
let NERDTreeWinPos = "left"                " 目录列表窗口居右

map <F9> :NERDTreeToggle<CR>
imap <F9> <ESC>:NERDTreeToggle<CR>
                                            " f9开关窗口

"------------------------------------------------------------------------------
"                      plugin - OmniCppComplete
"------------------------------------------------------------------------------
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1     " 显示函数参数列表
let OmniCpp_MayCompleteDot = 1          " 输入 .  后自动补全
let OmniCpp_MayCompleteArrow = 1        " 输入 -> 后自动补全
let OmniCpp_MayCompleteScope = 1        " 输入 :: 后自动补全
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

" 自动关闭补全窗口
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest

"
" html
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
let g:html_indent_inctags = "html,body,head,tbody"

augroup filetype
    autocmd! BufRead,BufNewFile BUILD set filetype=blade
augroup end

autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab

let g:omni_sql_default_compl_type = 'syntax'
let g:omni_sql_no_default_maps = 1

"------------------------------------------------------------------------------
"                       plugin - godef
"------------------------------------------------------------------------------
" let g:godef_split = 2
" let g:godef_same_file_in_same_window = 1

" markdown支持
 autocmd BufNewFile,BufReadPost *.md set filetype=markdown
" autocmd BufNewFile,BufReadPost *.slide set filetype=markdown

" vim-go
"au FileType go nmap <Leader>s <Plug>(go-implements)
"au FileType go nmap <Leader>i <Plug>(go-info)
"au FileType go nmap <Leader>gd <Plug>(go-doc)
"au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
"au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
"au FileType go nmap <leader>run <Plug>(go-run)
"au FileType go nmap <leader>build  <Plug>(go-build)
"au FileType go nmap <leader>test <Plug>(go-test)
"au FileType go nmap <leader>cva <Plug>(go-coverage)
"au FileType go nmap gd <Plug>(go-def)
"au FileType go nmap <Leader>ds <Plug>(go-def-split)
"au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
"au FileType go nmap <Leader>dt <Plug>(go-def-tab)
"let g:go_fmt_command = "goimports"
"let g:go_fmt_autosave = 1
""let g:go_autodetect_gopath = 1
let g:go_def_mode="gopls"
let g:vimwiki_list = [{'path': '~/.wiki/', 'path_html': '~/.wiki/html', 'auto_export': 1}]
let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_dir_link='index'


inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<return> {}<left><RETURN><up><end><RETURN>
inoremap " ""<left>
inoremap \" \"\"<left><left>
inoremap ' ''<left>
inoremap <F10> //<space>XXXX<space>godoc<space><return>//<space>@summary<space>XXXX<return>//<space>@param<space>name<space/param_type:query,path,header<space>type<space>is_required<space>comment<return>//<space>@success<space>code<space>param_type:object,array<space>data_type<space>comment<return>//<space>@failure<space>code<space>param_type:object,array<space>data_type<space>comment<return>//<space>@router<space>path<space>[httpmethod]
