" vim:tabstop=3:shiftwidth=3:expandtab:foldmethod=marker:textwidth=79
" Rudimentary-sessions autoload plugin file
" Author: Vedran Krivokuca <vedran+github@krivokuca.net>
" URL:    https://github.com/casastorta/vim-rudimentary-sessions

" Load only if not loaded already
if exists('b:loaded_rudimentary_sessions_ftplugin')
   finish
endif
let b:loaded_rudimentary_sessions_ftplugin = 1

" Rudimentary session management
if version >= 700
   set sessionoptions=blank,buffers,curdir,tabpages,winpos,folds
endif

if !exists("s:sessionautoloaded")
   let s:sessionautoloaded = 0
endif

if filereadable('./.session.vim')
   if s:sessionautoloaded == 0
      source ./.session.vim
      let s:sessionautoloaded = 1
   endif
endif

function! SaveSession()
   if s:sessionautoloaded == 1
      mksession! ./.session.vim
      echo "Session saved."
      "source ./.session.vim
   else
      echo "No session to save. Please create session with ':mksession .session.vim' first! "
      if tolower(input("Autocreate session for you? [Y]es/[N]o ")) =~ "y"
         call CreateSession()
      endif
   endif
endfunction

function! CreateSession()
   let path = getcwd()
   if !filewritable('./.session.vim')
      if tolower(input("No session file in " . path . ". Create one? [Y]es/[N]o ")) =~ "y"
         mksession! ./.session.vim
      endif
   else
      if tolower(input("Session file " . path . "/.seesion.vim already exists. Overwrite? [Y]es/[N]o? ")) =~ "y"
         let s:sessionautoloaded = 1
         call SaveSession()
      endif
   endif
endfunction

" Session is saved with <leader>ss (<leader> is \ by default)
nmap <silent> <leader>ss :call SaveSession()<CR>
nmap <silent> <leader>sc :call CreateSession()<CR>

