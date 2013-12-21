function! sessions#load()
   " Rudimentary session management
   if version >= 700
      set sessionoptions=blank,buffers,sesdir,tabpages,winpos,folds,options,unix,slash
   endif

   if !exists("s:sessionloaded")
      let s:sessionloaded = 0
   endif

   if filereadable('./.session.vim')
      if s:sessionloaded == 0
         source ./.session.vim
         let s:sessionloaded = 1
         echom "Session loaded."
      endif
   endif
endfunction

function! sessions#save()
   if s:sessionloaded == 1
      mksession! ./.session.vim
      echom "Session saved."
      "source ./.session.vim
   else
      echom "No session to save. Please create session with ':mksession .session.vim' first! "
   endif
endfunction

function! sessions#create()
   let path = getcwd()
   if !filewritable('./.session.vim')
      if tolower(input("No session file in " . path . ". Create one? [Y]es/[N]o ")) =~ "y"
         mksession! ./.session.vim
         let s:sessionloaded = 1
      endif
   else
      if tolower(input("Session file " . path . "/.seesion.vim already exists. Overwrite? [Y]es/[N]o? ")) =~ "y"
         let s:sessionloaded = 1
         call sessions#save()
      endif
   endif
endfunction


