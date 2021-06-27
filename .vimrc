
"文字コードをUFT-8に設定
 set fenc=utf-8
 set encoding=utf-8
 scriptencoding utf-8
 set fileencoding=utf-8
" バックアップファイルを作らない
 set nobackup
" スワップファイルを作らない
 set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
 set autoread
" バッファが編集中でもその他のファイルを開けるように
 set hidden
" 入力中のコマンドをステータスに表示する
 set showcmd
"
"
" 見た目系
" 行番号を表示
 set number
" 現在の行を強調表示
 set cursorline
" 現在の行を強調表示（縦）
" set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
 set virtualedit=onemore
" インデントはスマートインデント
 set autoindent
" %拡張
 source $VIMRUNTIME/macros/matchit.vim
" ビープ音を可視化
 set visualbell
" 括弧入力時の対応する括弧を表示
 set showmatch
" ステータスラインを常に表示
 set laststatus=2
" コマンドラインの補完
 set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
 nnoremap j gj
 nnoremap k gk
" シンタックスハイライトの有効化
 syntax enable
" カーソル左右移動で行末から次の行頭へ
 set whichwrap=b,s,h,l,<,>,[,],~
" Tab系
" Tab文字を半角スペースにする
" set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
 set tabstop=2
" 行頭でのTab文字の表示幅
 set shiftwidth=2
"
"
" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
 set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
 set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
 set incsearch
" 検索時に最後まで行ったら最初に戻る
 set wrapscan
" 検索語をハイライト表示
 set hlsearch
" ESC連打でハイライト解除
 nmap <Esc><Esc> :nohlsearch<CR><Esc>

" マウス 有効化
if has('mouse')
  set mouse=a
  if has('mouse_sgr')
    set ttymouse=sgr
  elseif v:version > 703 || v:version is 703 && has('patch632')
    set ttymouse=sgr
  else
    set ttymouse=xterm2
  endif
endif

" paste
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif
"inoremap { {}<Left>
"inoremap ( ()<Left>
"inoremap [ []<Left>
"inoremap ' ''<Left>
"inoremap " ""<Left>
"inoremap < <><Left>
nnoremap <A-Up> "zdd<Up>"zP
nnoremap <A-Down> "zdd"zp
vnoremap <A-Up> "zx<Up>"zP`[V`]
vnoremap <A-Down> "zx"zp`[V`]

nnoremap s "_s
nnoremap x "_x

" https://qiita.com/ahiruman5/items/4f3c845500c172a02935
if has('vim_starting')
    " 初回起動時のみruntimepathにNeoBundleのパスを指定する
    set runtimepath+=~/.vim/bundle/neobundle.vim/

    " NeoBundleが未インストールであればgit cloneする
    if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
        echo "install NeoBundle..."
        :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
    endif
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" インストールするVimプラグインを以下に記述
" NeoBundle自身を管理
NeoBundleFetch 'Shougo/neobundle.vim'
"----------------------------------------------------------
" ここに追加したいVimプラグインを記述する


NeoBundle 'itchyny/lightline.vim'


"----------------------------------------------------------
call neobundle#end()

" ファイルタイプ別のVimプラグイン/インデントを有効にする
filetype plugin indent on

" 未インストールのVimプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
NeoBundleCheck
