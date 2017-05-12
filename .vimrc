execute pathogen#infect()
let mapleader=","
syntax on
filetype plugin indent on
set shiftwidth=2
set softtabstop=2
set omnifunc=syntaxcomplete#Complete
set number
set dir=~/tmp
nmap <F8> :TagbarToggle<CR>
noremap <F3> :Autoformat<CR>
au BufWrite * :Autoformat
let g:autoformat_autoindent = 0
let g:tagbar_type_go = {
      \ 'ctagstype' : 'go',
      \ 'kinds'     : [
      \ 'p:package',
      \ 'i:imports:1',
      \ 'c:constants',
      \ 'v:variables',
      \ 't:types',
      \ 'n:interfaces',
      \ 'w:fields',
      \ 'e:embedded',
      \ 'm:methods',
      \ 'r:constructor',
      \ 'f:functions'
      \ ],
      \ 'sro' : '.',
      \ 'kind2scope' : {
      \ 't' : 'ctype',
      \ 'n' : 'ntype'
      \ },
      \ 'scope2kind' : {
      \ 'ctype' : 't',
      \ 'ntype' : 'n'
      \ },
      \ 'ctagsbin'  : 'gotags',
      \ 'ctagsargs' : '-sort -silent'
      \ }

" Go
let g:go_fmt_command = "goimports"
let g:formatdef_gofmt_1 = ''
let g:formatters_go = []
nmap <C-F8> :GoInstall<CR>
let g:go_metalinter_enabled = ['gotype','dupl','structcheck','aligncheck','gocyclo','vet','errcheck','ineffassign','vetshadow','varcheck','defercheck','deadcode']

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

noremap x "_x
vnoremap p "_dP

" Setup some default ignores
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site|node_modules)$',
      \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
      \}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

" Use a leader instead of the actual named binding
nmap <leader>p :CtrlP<cr>

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

if &term =~ '^xterm'
  " solid underscore
  let &t_SI .= "\<Esc>[5 q"
  " solid block
  let &t_EI .= "\<Esc>[2 q"
  " 1 or 0 -> blinking block
  " 3 -> blinking underscore
  " Recent versions of xterm (282 or above) also support
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar
endif
" Replace word under cursor
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" Javascript
let g:syntastic_javascript_checkers = ['eslint']


" Silver searcher ag
" dont't want to search within root of project
"let g:ag_working_path_mode="r"

" Vorax
let g:vorax_limit_rows=50

"Unite
let g:unite_source_history_yank_enable = 1
nnoremap <leader>y :<C-u>Unite history/yank<CR>

"Geeknote
autocmd FileType geeknote setlocal nonumber

" You can use other keymappings like <C-l> instead of <CR> if you want to
" use these mappings as default search and somtimes want to move cursor with
" EasyMotion.
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

"disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"closetag
let b:closetag_html_style=1
:imap <Leader><lt> <Esc><C-_>a
:nmap <Leader><lt> <C-_>


set synmaxcol=540

" Customize html-beautify
let g:formatdef_custom_htmlbeautify = '"html-beautify -f - -U script -U style -E /script -s ".shiftwidth()'
let g:formatters_html = ['custom_htmlbeautify']

nmap =x :%!xmllint --format -<CR>
nmap =j :%!python -m json.tool<CR>
nmap <Leader>f :GoInfo<CR>

" zeza me kod c++
"let g:AutoPairsMapCR = 0

runtime macros/matchit.vim

" let vim_markdown_preview_toggle=1

" nerdtree
map <C-l> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Proto
let g:formatdef_my_proto = '"clang-format -style=llvm"'
let g:formatters_proto = ['my_proto']
