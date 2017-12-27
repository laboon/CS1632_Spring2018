
Ensure you are running/installing Ruby version 2.4.  Note that OS X and Linux installations often come with older versions of Ruby, so even if Ruby is installed on your system, it may not be the correct version. You can check from the terminal (or Command Prompt or PowerShell prompt in Windows) by typing _ruby -v_.  It should state that the current version is 2.4.*something*.

_Note: The latest version of Ruby is 2.5.  PLEASE DO NOT USE IT!  It was just released this Christmas and there may be some issues with having the libraries _


## OS X

1. Install homebrew.  This is a package manager (similar to yum or apt in Linux) which will be very useful in installing applications and libraries.
2. From the terminal, run _brew install rbenv_
3. Run _rbenv init_
4. Run _rbenv install 2.4.2_
5. Run _rbenv global 2.4.2_

## Linux (Ubuntu)

1. From the terminal, run _ sudo apt-get install ruby2.4 ruby2.4-dev_

## Windows

1. Download Ruby **AND** the Ruby Development Kit from https://rubyinstaller.org/downloads/



