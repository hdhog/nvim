"---------------------------=== Set plugins Path ===----------------------------
"
let vim_plug_url = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
if has("unix")
    if has("nvim")
	    let vim_plug_root="~/.local/share/nvim"
    	let vim_plug_plugged= vim_plug_root ."/plugged"
	    let vim_plug=vim_plug_root . "/site/autoload/plug.vim"
    elseif has("vim")
    endif
elseif has("win32")
	let vim_plug_root="~\\AppData\\Local\\nvim"
    let vim_plug_plugged= vim_plug_root ."\\plugged"
	let vim_plug=vim_plug_root . "\\autoload\\plug.vim"
endif
"---------------------------=== Install vim-plug ===----------------------------
"
if empty(glob(vim_plug))
    if has("unix")
        silent execute "!curl --create-dirs " . vim_plug_url . " -fLo " . vim_plug
    elseif has("win32")
		let setup_script = vim_plug_root . "\\install-vimplug.ps1"
        silent execute "!powershell.exe " . setup_script
    endif

    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"--------------------------=== Plugins difinitions ===--------------------------
"
call plug#begin(vim_plug_plugged)
"------------------------------=== Appearance ===-------------------------------
"
Plug 'w0ng/vim-hybrid'
Plug 'vim-airline/vim-airline'   	    	" Lean & mean status/tabline for vim
Plug 'vim-airline/vim-airline-themes'
"------------------------=== Code/project navigation ===------------------------
"
Plug 'scrooloose/nerdtree' 	    	        " Project and file navigation
Plug 'majutsushi/tagbar'          	        " Class/module browser
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'		        " Nerd comment
Plug 'fisadev/FixedTaskList.vim'  	        " Pending tasks list
Plug 'tpope/vim-surround'	   	            " Parentheses, brackets, quotes, XML tags, and more
Plug 'Valloric/MatchTagAlways'
Plug 'terryma/vim-multiple-cursors'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'junegunn/vim-easy-align'
Plug 'vim-syntastic/syntastic'
"---------------------------=== Snippets support ===----------------------------
"
Plug 'SirVer/ultisnips'
Plug 'garbas/vim-snipmate'		    " Snippets manager
Plug 'MarcWeber/vim-addon-mw-utils'	" dependencies #1
Plug 'tomtom/tlib_vim'			    " dependencies #2
Plug 'honza/vim-snippets'		    " snippets repo
"--------------------=== Language and complation plugins ===--------------------
"
"---------------------------------=== Other ===---------------------------------
"
Plug 'Shougo/neocomplete.vim'
Plug 'ervandew/supertab'
"----------------------------------=== Go ===-----------------------------------
"
Plug 'fatih/vim-go', { 'for': 'go' , 'do': ':GoInstallBinaries' }
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.local/share/nvim/gocode/vim/symlink.sh' }

"---------------------------------=== Other ===---------------------------------
"
Plug 'tpope/vim-fugitive'

call plug#end()
"-------------------------=== Global Configuration ===--------------------------
"
set numberwidth=1                   " Keep line numbers small if it's shown
syntax on 		                    " Подсветка синтаксиса
filetype on 		                " Настройки для типов файлов
filetype plugin on 	                " Типы файлов
filetype indent on 	                " отпусты по типу файлов
set fo+=cr 		                    " Что то с Enter при вызове меню
set wrap 		                    " (no)wrap - динамический (не)перенос длинных строк
set linebreak 		                " переносить целые слова
set cin			                    " Отступы в стиле С
set lz			                    " Ленивая перерисовка экрана
set autoindent 		                " автоматический отступ
set autoread 		                " перечитывать изменённые файлы автоматически
set backspace=indent,eol,start whichwrap+=<,>,[,] "Удобное поведение backspace
set ch=1                            " Сделать строку команд высотой в одну строку
set completeopt=menu 	            " только доступные варианты автодополнени 		" не использовать свап файл для сброса буферовя
" set foldcolumn=3 	                " Колоночка, чтобы показывать плюсики для скрытия блоков кода:
set foldenable 		                " Включить сворачивание блоков кода
set foldlevelstart=100              " Первые 100 блоков будет развернуты остальные свернуты
set foldmethod=indent 	            " Тип сворачивания. по отступам
set hlsearch   		                " Включаем подсветку выражения, которое ищется в тексте
set ignorecase 		                " Игнорировать регистр букв при поиске
set incsearch                       " Поиск по набору текста (очень полезная функция)
set incsearch  		                " При поиске перескакивать на найденный текст в процессе набора строки
set laststatus=2                    " Всегда отображать статусную строку для каждого окна
set linebreak 		                " Перенос целых сло Перенос целых словв
set mouse=a 		                " Поодержка мыши при работе в терминале
set nobackup 		                " Вырубаем .swp и ~ (резервные) файлы
set nocompatible                    " Включаем несовместимость настроек с Vi (ибо Vi нам и не понадобится).
set noswapfile 		                " не использовать свап файл для сброса буферов
set hidden 		                    " не выгружать буфер когда переключаешься на другой
set novisualbell                    " Выключаем надоедливый "звонок" (моргает, а не бибикает при ошибках)
set nowrapscan 		                " Останавливать поиск при достижении конца файла
set nu 			                    " Нумерация строк
set ruler             	            " Показывать положение курсора всё время.
set sessionoptions=curdir,buffers,tabpages                      " Опции сессий
set shiftwidth=8 	                " размер отступов (нажатие на << или >>)
set showcmd 		                " Показывать незавершенные команды в статус баре
set showmatch 		                " показывать первую парную скобку после ввода второй
set showtabline=1
set smartindent 	                " Умные отступы
set smarttab
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set splitbelow
set title 		                    " показывать имя буфера в заголовке терминала
set whichwrap=b,<,>,[,],l,h         " перемещать курсор на следующую строку при нажатии на клавиши вправо-влево и пр.
set t_Co=256 		                " использовать больше цветов в терминале
set matchpairs+=<:> 	            " показывать совпадающие скобки для HTML-тегов
set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %b\ 0x%B\ %l,%c%V\ %P
set undolevels=2048                 " хранить историю изменений числом N
set wildmode=longest,list,full
set wildmenu
"Проблема красного на красном при spellchecking-е решается такой строкой в .vimrc
highlight SpellBad ctermfg=Black ctermbg=Red
"set completeopt-=preview
"set completeopt+=longest
set pumheight=10                    " Completion window max size
set hidden                          " Buffer should still exist if window is closed
set completeopt=menu,menuone        " Show popup menu, even if there is one entry
set mps-=[:]
set ttyfast
silent! colorscheme hybrid                  " Цветовая тема
set background=dark

if has('unnamedplus')
  set clipboard^=unnamed
  set clipboard^=unnamedplus
endif
"-------------------------=== PLUGINS CONFIGURATION ===-------------------------
"
"----------------------------=== Nerd commenter ===-----------------------------
"
let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1 " Use compact syntax for prettified multi-line comments
let g:NERDTrimTrailingWhitespace = 1 " Enable trimming of trailing whitespace when uncommenting
" ----------------------------=== MatchTagAlways ===-----------------------------
"
let g:mta_use_matchparen_group = 1
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \}
"-------------------------------=== Supertab ===--------------------------------
"
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
"-------------------------------=== Ultisnip ===--------------------------------
"
let g:UltiSnipsExpandTrigger       = "<c-j>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-p>"
let g:UltiSnipsListSnippets        = "<c-k>" "List possible snippets based on current file

"------------------------------=== Neocomplate ===------------------------------
"
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
"-------------------------------=== vim-plug ===--------------------------------
"
let g:plug_shallow = 1
let g:plug_window = "topleft new"
"--------------------------------=== Airline ===--------------------------------
"
let g:enable_bold_font = 1
let g:airline_theme = 'hybrid'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#syntastic#enabled = 1
let airline#extensions#syntastic#error_symbol = 'E:'
let airline#extensions#syntastic#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#syntastic#warning_symbol = 'W:'
let airline#extensions#syntastic#stl_format_err = '%W{[%w(#%fw)]}'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

"--------------------------------=== TagBar ===---------------------------------
"
let g:tagbar_left = 0
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0 "tagbar shows tags in order of they created in file
let g:tagbar_foldlevel = 1 "close tagbar folds by default
let g:tagbar_width = 30
let g:tagbar_compact = 1
let g:tagbar_iconchars = ['▸', '▾']

"-------------------------------=== NerdTree ===--------------------------------
"
let g:NERDTreeDirArrows = 0

"----------------------------------=== vim-go ===-----------------------------------
"
let g:go_disable_autoinstall = 0
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_addtags_transform = "camelcase"
let g:go_fmt_command = "goimports"
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck', 'varcheck']
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

"-------------------------------=== Syntastic ===-------------------------------
"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs=1
"-------------------------------=== Key maps ===--------------------------------
"
"----------------------------------=== vim ===----------------------------------
"
" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv
" Jump to next error with Ctrl-n and previous error with Ctrl-m. Close the
" quickfix window with <leader>a
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

"---------------------------------=== Save ===----------------------------------
"
nmap <F4> :w!<CR>
imap <F4> <Esc>:w!<CR>
vmap <F4> <Esc>:w!<CR>
"-------------------------------=== Exit VIM ===--------------------------------
"
nmap <F5> :qa!<CR>
imap <F5> <Esc>:qa!<CR>
vmap <F5> <Esc>:qa!<CR>
"--------------------------------=== TagBar ===---------------------------------
"
map <F3> :TagbarToggle<CR>
imap <F3> <Esc>:TagbarToggle<CR>
vmap <F3> <Esc>:TagbarToggle<CR>
"-------------------------------=== Syntastic ===-------------------------------
"
map <F6> :SyntasticCheck<CR>
imap <F6> <Esc>:SyntasticCheck<CR>
vmap <F6> <Esc>:SyntasticCheck<CR>

map <F6><F6> :lnext<CR>
nnoremap <F6><Esc> :SyntasticReset<CR>
"-------------------------------=== NerdTree ===--------------------------------
"
map <F2> :NERDTreeToggle<CR>
imap <F2> :NERDTreeToggle<CR>
vmap <F2> :NERDTreeToggle<CR>
"-----------------------------=== Nerdcommenter ===-----------------------------
"
if has('macunix')
	nmap <D-/> \c<space>
	imap <D-/> \c<space>
	vmap <D-/> \c<space>
else
	nmap <C-_> \c<space>
	imap <C-_> \c<space>
	vmap <C-_> \c<space>
endif

"-------------------------------=== FileType ===--------------------------------
"
"----------------------------------=== Go ===-----------------------------------
"
augroup go
    autocmd!
    au FileType go set sw=4
    au FileType go set ts=4
    au FileType go set sts=4
    au FileType go nmap <leader>r <Plug>(go-run)
    au FileType go nmap <leader>b <Plug>(go-build)
    au FileType go nmap <leader>t <Plug>(go-test)
    au FileType go nmap <leader>c <Plug>(go-coverage-toggle)
    au FileType go nmap <Leader>ds <Plug>(go-def-split)
    au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
    au FileType go nmap <Leader>dt <Plug>(go-def-tab)
    au FileType go nmap <Leader>i <Plug>(go-info)
augroup END

"--------------------------------=== Python ===---------------------------------
"
augroup python
    autocmd!
    au FileType python set sw=4
    au FileType python set ts=4
    au FileType python set sts=4
augroup END

"---------------------------------=== Other ===---------------------------------
"
au FileType crontab,fstab,make set noexpandtab tabstop=8 shiftwidth=8

"-------------------------------=== Functions ===-------------------------------
" FancySmancyComment(text, fill_char, width)
function! FancySmancyComment(...)
  let text = "=== " . get(a:000, 0, '') . " ==="
  let fill = get(a:000, 1, '-')[0]
  let width = get(a:000, 2, 80) - len(printf(&commentstring, '')) - len(text)
  let left = width / 2
  let right = width - left
  put=printf(&commentstring, repeat(fill, left) . text . repeat(fill, right))
endfunction

command! -nargs=* FComment call FancySmancyComment( '<args>' )

