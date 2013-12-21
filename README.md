# Rudimentary Sessions Support for Vim #

Ever wish vim being able to save its current state with all the buffers, windows etc. and open them right back when you fire up vim again?
Well vim already has sessions. But most find them a little too much of an effort compared to what other editors are offering. So lets get down to business.

This is a fork from casastorta's plugin of the same name. Thanks for this buddy. I plan to modify and add a bit more polish to it.

## Installation ##

Use your favorite bundle manager to install. If you don't use one, look at [Vundle](https://github.com/gmarik/vundle).

## Usage ##

After installing this plugin, just use `<leader>sc` to create a session file in the current directory. From this point, vim will automatically save session each time you exit vim.  When you fire up vim from same directory again, it will load your session automatically.

**Note:** You will to create a session first by the given command give above. The session will not be saved automatically if the session file does not exists.

You also have the following commands to save the session manually should you like to.

* `<leader>sl` - load session if file found in current directory. Don't know
  why you will need this but it is there if you want it.
* `<leader>ss` - saves current session in the current directory. maybe I'll
  automate this command to save everytime the state of vim changes. The
  condition given in note applies here too.

