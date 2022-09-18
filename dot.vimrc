" Configurations for VIM

"" 定义快捷键的前缀，即<Leader>
let mapleader=";"

" 开启文件类型侦测
" 自适应不同语言的智能缩进
" 根据侦测到的不同类型加载对应的插件
filetype indent plugin on
" 颜色方案
"colorscheme github
colorscheme hybrid_material

" 关掉visualbell
set vb t_vb=

" 定义快捷键关闭当前分割窗口
nnoremap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nnoremap <Leader>w :w<CR>
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nnoremap <Leader>p "+p

" excluding mapleader in insert mode
augroup leader_exclude
    autocmd!
    autocmd InsertEnter <buffer> let mapleader='\'
    autocmd InsertLeave <buffer> let mapleader=';'
augroup END

" 高亮当前单词
nnoremap * *N
" 依次遍历子窗口
nnoremap nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap <C-L> <C-W>l
" 跳转至左方的窗口
nnoremap <C-H> <C-W>h
" 跳转至上方的子窗口
nnoremap <C-K> <C-W>k
" 跳转至下方的子窗口
nnoremap <C-J> <C-W>j

" 命令行模式下选择并过滤历史命令
cnoremap <C-p> <Up> 
cnoremap <C-n> <Down>

"开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 关闭兼容模式
set nocompatible
" 设置backspace
set backspace=indent,eol,start
" vim 自身命令行模式智能补全
set wildmenu
" 使用g$可以到达行尾
set selection=exclusive

" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示搜索结果
set hlsearch
" 禁止折行
set nowrap

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让vim把连续数量的空格视为一个制表符
set softtabstop=4

" 操作：za，打开或关闭当前折叠；zM，关闭所有折叠；zR，打开所有折叠
" 基于缩进或语法进行代码折叠, indent/syntax
set foldmethod=syntax
" 启动vim时关闭折叠代码
set nofoldenable
" 下一个tag位置, :ts打开列表
nnoremap <Leader>tn :tnext<CR>

" 设置光标的形状与颜色
if &term =~ "xterm"
    " INSERT mode
    let &t_SI = "\<Esc>[6 q" . "\<Esc>]12;black\x7"
    " REPLACE mode
    let &t_SR = "\<Esc>[3 q" . "\<Esc>]12;black\x7"
    " NORMAL mode
    let &t_EI = "\<Esc>[2 q" . "\<Esc>]12;green\x7"
endif
" 1 -> blinking block  闪烁的方块
" 2 -> solid block  不闪烁的方块
" 3 -> blinking underscore  闪烁的下划线
" 4 -> solid underscore  不闪烁的下划线
" 5 -> blinking vertical bar  闪烁的竖线
" 6 -> solid vertical bar  不闪烁的竖线

" 菜单
"highlight pmenu term=standout ctermfg=2 ctermbg=255 
" 选中项
highlight pmenusel term=bold ctermfg=22 ctermbg=194 guifg=#003300 guibg=#ddffdd
" 查找项
highlight Search ctermfg=16 ctermbg=250 guifg=#000000 guibg=#bcbcbc
" 关键字
"highlight Statement cterm=bold ctermfg=90 gui=bold guifg=#445588 

" 先输入ctrl+v，再输入alt+key，出现^[key，即设置<M+key>
" 弹出的补全列表，使用{C-n}来选择
inoremap w <C-x><C-o>

" 如果项目目录中有cscope的索引文件
if filereadable("cscope.out")
    cs add cscope.out
endif

" 如果项目目录中有私有的配置文件
if filereadable("vim.local")
    source vim.local
endif

""""""""""""OminiCppComplete configuration"""""""""""""
set tags+=/usr/include/sys.tags
nnoremap <F12> :!ctags -R --c++-kinds=+p+x+c+d+e+f+g+m+n+s+t+u+v --fields=+liaS --extra=+q --language-force=c++<CR>
au FileType c set omnifunc=omni#cpp#complete#Main

let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表
let OmniCpp_MayCompleteDot = 1   " 输入 .  后自动补全
let OmniCpp_MayCompleteArrow = 1 " 输入 -> 后自动补全
let OmniCpp_MayCompleteScope = 1 " 输入 :: 后自动补全
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

"自动关闭补全窗口
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,noinsert
set pumheight=15

""""""""""""NertTree configuration"""""""""""""
" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="right"
" 显示隐藏文件
let NERDTreeShowHidden=0
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
" 不要显示目标文件
let NERDTreeIgnore=['\.o$']

""""""""""""Tagbar configuration"""""""""""""
" you can press 's' to change the sorting
" 设置 tagbar 子窗口的位置出现在主编辑区的左边 
let tagbar_left=1 
" 设置显示／隐藏标签列表子窗口的快捷键。速记：tag list 
nnoremap <Leader>tl :TagbarToggle<CR> 
" 设置标签子窗口的宽度 
let tagbar_width=32 
" tagbar 子窗口中不显示冗余帮助信息 
let g:tagbar_compact=1
" tagbar 使用文件中出现位置来排序 
let g:tagbar_sort=0
" 设置 ctags 对哪些代码元素生成标签
let g:tagbar_type_cpp = {
    \ 'kinds' : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0', 
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }

" function signature color 
highlight TagbarSignature ctermfg=blue

" 保存 undo 历史
set undodir=~/.undo_history/
set undofile

set sessionoptions="blank,buffers,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"
" 保存快捷键
map <leader>ss :mksession!.my.vim<cr> :wviminfo! .my.viminfo<cr>
" 恢复快捷键
map <leader>rs :source .my.vim<cr> :rviminfo .my.viminfo<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vundle 环境设置
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'jiangmiao/auto-pairs'

"tagbar using ctags internally.
Plugin 'majutsushi/tagbar'

"generate tags files for goto definitions.
Plugin 'vim-scripts/OmniCppComplete'
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'

"see references and rename/refactor. [sp][ctrl+n][c][Esc]
Plugin 'dyng/ctrlsf.vim'
Plugin 'terryma/vim-multiple-cursors'

Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'jlanzarotta/bufexplorer'
"Plugin 'test/potion'

Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
"Plugin 'tenfyzhong/CompleteParameter.vim'
"Plugin 'othree/vim-autocomplpop'
"Plugin 'clones/vim-l9'
"Plugin 'SirVer/ultisnips'
"Plugin 'suan/vim-instant-markdown'
"Plugin 'thasmin/minibufexpl.vim'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'vim-scripts/DrawIt'
"Plugin 'derekwyatt/vim-protodef'
"Plugin 'gcmt/wildfire.vim'
"Plugin 'sjl/gundo.vim'
"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'tomasr/molokai'
"Plugin 'vim-scripts/phd'
"Plugin 'nathanaelkane/vim-indent-guides'
"Plugin 'kshenoy/vim-signature'
"Plugin 'vim-scripts/BOOKMARKS—Mark-and-Highlight-Full-Lines'
"Plugin 'lilydjwg/fcitx.vim'
" 插件列表结束
call vundle#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype indent plugin on
