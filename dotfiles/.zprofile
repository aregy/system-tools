eval "$(/opt/homebrew/bin/brew shellenv)" 
export XDG_CONFIG_HOME=~/.config
setopt globdots
alias ls="ls -A --color=auto"
alias ll="ls -lh"

if [[ $(uname) == 'Darwin' ]]; then
  # https://github.com/dotnet/maui/blob/main/.github/DEVELOPMENT.md#net-maui-workload
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/microsoft-11.jdk/Contents/Home
  export ANDROID_HOME=~/Library/Android/sdk
  export ANDROID_SDK_ROOT=~/Library/Android/sdk
  export PATH="$PATH:~/.dotnet/tools"
  export PATH="$PATH:$ANDROID_HOME/platform-tools"
  export PATH="$PATH:$ANDROID_HOME/tools"
  export PATH="$PATH:$ANDROID_HOME/tools/bin"
  export PATH="$PATH:$ANDROID_HOME/tools/emulator" 
  export PATH="/opt/homebrew/bin:$PATH"
  export DYLD_LIBRARY_PATH=/opt/homebrew/lib
  
  source $HOME/.cargo/env
  
  ##
  # Your previous /Users/ay/.zprofile file was backed up as /Users/ay/.zprofile.macports-saved_2024-07-09_at_22:45:06
  ##
  
  # MacPorts Installer addition on 2024-07-09_at_22:45:06: adding an appropriate PATH variable for use with MacPorts.
  export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
  # Finished adapting your PATH environment variable for use with MacPorts.
  
  
  # MacPorts Installer addition on 2024-07-09_at_22:45:06: adding an appropriate MANPATH variable for use with MacPorts.
  export MANPATH="/opt/local/share/man:$MANPATH"
  # Finished adapting your MANPATH environment variable for use with MacPorts.
fi
