# Rudimentary Sessions Support for Vim #

Ever wish vim being able to save its current state with all the buffers, windows etc. and open them right back when you fire up vim again?
Well vim already has sessions. But most find them a little too much of an effort compared to what other editors are offering. So lets get down to business.

This is a fork from casastorta's plugin of the same name. Thanks for this buddy. I plan to modify and add a bit more polish to it.

## Installation ##

Use your favorite bundle manager to install. If you don't use one, look at [Vundle](https://github.com/gmarik/vundle).

## Usage ##

After installing this plugin, vim will try to save its current state in a file called `.sessions.vim` inside the current directory. When you fire up vim from same directory again, it will load your session automatically.

You also have the following commands to save the session manually should you like to.

* `<leader>sc` - creates new rudimentary session in the current directory
* `<leader>ss` - saves current session as rudimentary session in the current directory

