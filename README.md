# Rudimentary Sessions Support for Vim #

This Vim bundle only slightly enchances the Vim's built-in session support.
Reasoning for writing this can be read at [my blog](http://krivokuca.net/2012/08/tip-very-rudimentary-session-management-in-vim/).


## Installation ##

If you're using [vim-pathogen](https://github.com/tpope/vim-pathogen), simply clone this repository into your
`~/.vim/bundles` directory (or equivalent on your OS).


## Usage ##

Again, the intended way this should work is described at [my blog](http://krivokuca.net/2012/08/tip-very-rudimentary-session-management-in-vim/).

If you find it useful, basic commands for manipulating rudimentary sessions
are:

* `<leader>sc` - creates new rudimentary session in the current directory
* `<leader>ss` - saves current session as rudimentary session in the current directory

## Tips ##

If you want rudimentary sessions to save your session every time you exit
vim, add the following line to your `.vimrc` or equvialent:

   autocmd VimLeave * call SaveSession()


