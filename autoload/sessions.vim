function! sessions#load()
   " Rudimentary session management
   if version >= 700
      set sessionoptions=blank,buffers,sesdir,tabpages,winpos,folds,options,unix
   endif

   if !exists("s:sessionautoloaded")
      let s:sessionautoloaded = 0
   endif

   if filereadable('./.session.vim')
      if s:sessionautoloaded == 0
         source ./.session.vim
         let s:sessionautoloaded = 1
         echo "Session loaded."
      endif
   endif
endfunction

function! sessions#save()
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

function! sessions#create()
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


