#i3 Settings
Settings for i3 window manager and i3bar with conky.

##Requirements
- i3bar 
- conky configuration text uses Unicode glyphs that are part of 
  [FontAwesome](https://fortawesome.github.io/Font-Awesome/). 

##Configuration
The file `.conkyrc_bar` contains the configuration for Conky. It is text-only
and formatted as JSON in order for it to be fed to i3bar.  `conky-i3bar.sh`
contains a helper script that initializes the JSON array, runs `conky` with the
custom config file and `config` contains i3 settings (take a look at the `bar{}` 
part). 

###Steps:
1. Put `.conkyrc_bar` in your `$HOME`, `config` under your `.i3/` folder and
   `conky-i3bar.sh` in `$HOME/.conky/` (create it if it doesn't exist). Make
   sure `conky-i3bar.sh` has +x permission. 
2. Make sure you have installed all relevant packages (fontfaces, etc.).
3. Refresh / restart i3.

