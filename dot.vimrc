" Configurations for VIM

" 定义快捷键的前缀，即<Leader>
let mapleader=";"

" 开启文件类型侦测
" 自适应不同语言的智能缩进
" 根据侦测到的不同类型加载对应的插件
filetype indent plugin on

" 颜色方案
colorscheme github

" 让配置变更立即生效
"autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>

" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p

"依次遍历子窗口
nnoremap nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap <C-L> <C-W>l
" 跳转至左方的窗口
nnoremap <C-H> <C-W>h
" 跳转至上方的子窗口
nnoremap <C-K> <C-W>k
" 跳转至下方的子窗口
nnoremap <C-J> <C-W>j

"开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 关闭兼容模式
set nocompatible
" 设置backspace
"set backspace=indent,eol,start
set backspace=2
" vim 自身命令行模式智能补全
set wildmenu

" 将 pathogen 自身也置于独立目录中，需指定其路径 
"runtime bundle/pathogen/autoload/pathogen.vim
" 运行 pathogen
"execute pathogen#infect()

" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
"set cursorline
" 高亮显示搜索结果
set hlsearch

" 禁止折行
set nowrap


" 设置状态栏主题风格
"let g:Powerline_colorscheme='solarized256'

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
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

" 操作：za，打开或关闭当前折叠；zM，关闭所有折叠；zR，打开所有折叠
" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

" *.cpp 和 *.h 间切换
nmap <Leader>ch :FSHere<CR>
" 子窗口中显示 *.cpp 或 *.h
"nmap <Leader>sch :AS<CR>

" goto next tag place
nmap <Leader>tn :tnext<CR>

" UltiSnips 的 tab 键与 YCM 冲突，重新设定
"let g:UltiSnipsSnippetDirectories=["mysnips"]
"let g:UltiSnipsExpandTrigger="<leader><tab>"
"let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
"let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"


""""""""""""Using ycm instead""""""""""""""""""""""""""
nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
" 只能是 #include 或已打开的文件
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
" YCM 补全菜单配色
" 菜单
highlight Pmenu term=standout ctermfg=2 ctermbg=255 
" 选中项
highlight PmenuSel term=bold ctermfg=22 ctermbg=194 guifg=#003300 guibg=#DDFFDD
" 关键字
highlight Statement cterm=bold ctermfg=90 gui=bold guifg=#445588 
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" change the default configure file path
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 引入 C++ 标准库tags
set tags+=.tags
set tags+=~/.sys.tags
set tags+=~/.stdcpp.tags
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全         
let g:ycm_seed_identifiers_with_syntax=1
" 关闭自动Diagnostic
let g:ycm_show_diagnostics_ui=0
""""""""""""OminiCppComplete configuration"""""""""""""
"set tags+=tags
"set tags+=/usr/include/sys.tags
"set tags+=/usr/include/c++/4.2.1/stdcpp.tags
"map <F12> :!ctags -R --c++-kinds=+p+x+c+d+e+f+g+m+n+s+t+u+v --fields=+liaS --extra=+q --language-force=c++<CR>
"let OmniCpp_NamespaceSearch = 1
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表
"let OmniCpp_MayCompleteDot = 1   " 输入 .  后自动补全
"let OmniCpp_MayCompleteArrow = 1 " 输入 -> 后自动补全
"let OmniCpp_MayCompleteScope = 1 " 输入 :: 后自动补全
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
"自动关闭补全窗口
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"set completeopt=menuone,menu,longest

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

""""""""""""MiniBufExplorer configuration"""""""""""""
" 显示/隐藏 MiniBufExplorer 窗口
map <Leader>bf :MBEToggle<cr>
let g:miniBufExplMapWindowNavArrows = 1  
let g:miniBufExplMapWindowNavVim = 1  
let g:miniBufExplMapCTabSwitchWindows = 1  
"let g:miniBufExplMapCTabSwitchBufs = 1   
let g:miniBufExplModSelTarget = 1  
  
"解决FileExplorer窗口变小问题  
let g:miniBufExplForceSyntaxEnable = 1  
let g:miniBufExplorerMoreThanOne=2

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

" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
nnoremap <Leader>sp :CtrlSF<CR>

set sessionoptions="blank,buffers,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"
" 保存折叠状态
"au BufWinLeave * silent mkview
" 恢复折叠状态
"au BufRead * silent loadview
" 保存 undo 历史
set undodir=~/.undo_history/
set undofile
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
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'

"see references and rename/refactor. [sp][ctrl+n][c][Esc]
Plugin 'dyng/ctrlsf.vim'
Plugin 'terryma/vim-multiple-cursors'

Plugin 'scrooloose/nerdcommenter'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'thasmin/minibufexpl.vim'
Plugin 'suan/vim-instant-markdown'

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
filetype indent plugin on
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
