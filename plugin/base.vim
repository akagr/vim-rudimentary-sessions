" Rudimentary-sessions autoload plugin file
" Author: Akash Agrawal <akagr@outlook.com>
" URL:    https://github.com/akagr/vim-rudimentary-sessions

" Load only if not loaded already
if exists('b:loaded_rudimentary_sessions_ftplugin')
   finish
endif
let b:loaded_rudimentary_sessions_ftplugin = 1

" Session is saved with <leader>ss (<leader> is \ by default)
nmap <silent> <leader>ss :call sessions#save()<CR>
nmap <silent> <leader>sc :call sessions#create()<CR>
nmap <silent> <leader>sl :call sessions#load()<CR>

augroup RudimentarySession
  autocmd!
  autocmd VimEnter * call sessions#load()
  "setlocal cursorline
  autocmd VimLeave * call sessions#save()
augroup END

