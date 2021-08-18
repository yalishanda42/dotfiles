# If you come from bash you might have to change your $PATH.

# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.

export ZSH="/home/yalishanda/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	zsh-syntax-highlighting
	osx
	colorize
	pod
	themes
	zsh_reload
	web-search
	zsh-autosuggestions
	xcode
	thefuck
	swiftpm
	pod
	gitignore
	django
	battery
)

if (( $(id -u) == 0 ))
then
	# root run fix
	ZSH_DISABLE_COMPFIX="true"
fi

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
export LC_ALL="en_US.UTF-8"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
export VISUAL="vim"
export EDITOR="vim"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias gs="git status"
alias gl="git log "
alias go="git checkout "
alias q="exit"
alias py="python3"
alias py2="python"
alias gri="git rebase --interactive"
alias gg="gloga" # git log --all --graph --oneline --color
alias gpl="git pull"
alias currbr="git branch | grep '*' | cut -f2 -d ' '"
alias v="vim"
alias dalivali='printf '\''\e[8;50;140t'\'' && curl -4 http://wttr.in/sofia'
alias lunataspi="curl http://wttr.in/Moon"
alias kostanasbitkoina='printf '\''\e[8;50;95t'\'' && curl rate.sx'
alias myip="curl icanhazip.com"
alias hahaa="clear && src"
alias pls="sudo"
alias letshack="sudo su"
alias hack="sudo su"

if which xdg-open 2>&1 > /dev/null
then
    # Manjaro
    alias open="xdg-open"
fi

# cd + ls
cl() {
	local dir="$1"
	local dir="${dir:=$HOME}"
	if [[ -d "$dir" ]]; then
		cd "$dir" >/dev/null; ls
	else
		echo "bash: cl: $dir: Directory not found"
	fi
}

# mkdir + cl
mkcl() {
    mkdir $1
    cl $1
}

# extract <file1> <file2> ...
extract() {
    local c e i

    (($#)) || return

    for i; do
        c=''
        e=1

        if [[ ! -r $i ]]; then
            echo "$0: file is unreadable: \`$i'" >&2
            continue
        fi

        case $i in
            *.t@(gz|lz|xz|b@(2|z?(2))|a@(z|r?(.@(Z|bz?(2)|gz|lzma|xz)))))
                   c=(bsdtar xvf);;
            *.7z)  c=(7z x);;
            *.Z)   c=(uncompress);;
            *.bz2) c=(bunzip2);;
            *.exe) c=(cabextract);;
            *.gz)  c=(gunzip);;
            *.rar) c=(unrar x);;
            *.xz)  c=(unxz);;
            *.zip) c=(unzip);;
            *)     echo "$0: unrecognized file extension: \`$i'" >&2
                   continue;;
        esac

        command "${c[@]}" "$i"
        ((e = e || $?))
    done
    return "$e"
}

# swiftenv and xcenv setup
if which swiftenv 2>&1 > /dev/null
then
	eval "$(swiftenv init -)"
fi

if which xcenv 2>&1 > /dev/null
then
	eval "$(xcenv init -)"
fi

# ASCII art startup
# =================
#
# First, determine whether we have `lolcat` installed
if which lolcat 2>&1 > /dev/null
then
    __startup_print_command="lolcat"
else
    __startup_print_command="cat"
fi

# Then, print the correct thing, according to the screen width and user (root or normal)
${__startup_print_command} < <(
if [ $(id -u) = 0 ]
then
    if [[ $(tput cols) -lt 123 ]]
	then
        echo "                                                                 ";
		echo "______    ________            ______              ______         ";
		echo "___  /______  /_( )_______    ___  /_______ _________  /__       ";
		echo "__  /_  _ \  __/|/__  ___/    __  __ \  __ \`/  ___/_  //_/       ";
		echo "_  / /  __/ /_    _(__  )     _  / / / /_/ // /__ _  ,<_________ ";
		echo "/_/  \___/\__/    /____/      /_/ /_/\__,_/ \___/ /_/|_|(_)(_)(_)";
		echo "                                                                 ";
	else
		clear;
        echo "                                                                                                                           ";
		echo " █     █░▓█████     ██░ ██  ▄▄▄    ██▒   █▓▓█████    ▄▄▄█████▓ ▒█████      ██░ ██  ▄▄▄       ▄████▄   ██ ▄█▀               ";
		echo "▓█░ █ ░█░▓█   ▀    ▓██░ ██▒▒████▄ ▓██░   █▒▓█   ▀    ▓  ██▒ ▓▒▒██▒  ██▒   ▓██░ ██▒▒████▄    ▒██▀ ▀█   ██▄█▒                ";
		echo "▒█░ █ ░█ ▒███      ▒██▀▀██░▒██  ▀█▄▓██  █▒░▒███      ▒ ▓██░ ▒░▒██░  ██▒   ▒██▀▀██░▒██  ▀█▄  ▒▓█    ▄ ▓███▄░                ";
		echo "░█░ █ ░█ ▒▓█  ▄    ░▓█ ░██ ░██▄▄▄▄██▒██ █░░▒▓█  ▄    ░ ▓██▓ ░ ▒██   ██░   ░▓█ ░██ ░██▄▄▄▄██ ▒▓▓▄ ▄██▒▓██ █▄                ";
		echo "░░██▒██▓ ░▒████▒   ░▓█▒░██▓ ▓█   ▓██▒▒▀█░  ░▒████▒     ▒██▒ ░ ░ ████▓▒░   ░▓█▒░██▓ ▓█   ▓██▒▒ ▓███▀ ░▒██▒ █▄ ██▓  ██▓  ██▓ ";
		echo "░ ▓░▒ ▒  ░░ ▒░ ░    ▒ ░░▒░▒ ▒▒   ▓▒█░░ ▐░  ░░ ▒░ ░     ▒ ░░   ░ ▒░▒░▒░     ▒ ░░▒░▒ ▒▒   ▓▒█░░ ░▒ ▒  ░▒ ▒▒ ▓▒ ▒▓▒  ▒▓▒  ▒▓▒ ";
		echo "  ▒ ░ ░   ░ ░  ░    ▒ ░▒░ ░  ▒   ▒▒ ░░ ░░   ░ ░  ░       ░      ░ ▒ ▒░     ▒ ░▒░ ░  ▒   ▒▒ ░  ░  ▒   ░ ░▒ ▒░ ░▒   ░▒   ░▒  ";
		echo "  ░   ░     ░       ░  ░░ ░  ░   ▒     ░░     ░        ░      ░ ░ ░ ▒      ░  ░░ ░  ░   ▒   ░        ░ ░░ ░  ░    ░    ░   ";
		echo "    ░       ░  ░    ░  ░  ░      ░  ░   ░     ░  ░                ░ ░      ░  ░  ░      ░  ░░ ░      ░  ░     ░    ░    ░  ";
		echo "                                       ░                                                    ░                 ░    ░    ░  ";
		echo "                                                                                                                           ";
	fi
else
    if [[ $(tput cols) -lt 107 ]]
	then
		echo "              __ __       __                   __       ";
		echo " .--.--.---.-|  |__.-----|  |--.---.-.-----.--|  .---.-.";
		echo " |  |  |  _  |  |  |__ --|     |  _  |     |  _  |  _  |";
		echo " |___  |___._|__|__|_____|__|__|___._|__|__|_____|___._|";
		echo " |_____|                                                ";
		echo "                                                        ";
		echo "                                                        ";
        echo "                                                        ";
	else
		echo "                                                                                                           ";
		echo "                        ,dPYb,                 ,dPYb,                                       8I             ";
		echo "                        IP'\`Yb                 IP'\`Yb                                       8I             ";
		echo "                        I8  8I  gg             I8  8I                                       8I             ";
		echo "                        I8  8'  \"\"             I8  8'                                       8I             ";
		echo " gg     gg    ,gggg,gg  I8 dP   gg     ,g,     I8 dPgg,     ,gggg,gg   ,ggg,,ggg,     ,gggg,8I    ,gggg,gg ";
		echo " I8     8I   dP\"  \"Y8I  I8dP    88    ,8'8,    I8dP\" \"8I   dP\"  \"Y8I  ,8\" \"8P\" \"8,   dP\"  \"Y8I   dP\"  \"Y8I ";
		echo " I8,   ,8I  i8'    ,8I  I8P     88   ,8'  Yb   I8P    I8  i8'    ,8I  I8   8I   8I  i8'    ,8I  i8'    ,8I ";
		echo ",d8b, ,d8I ,d8,   ,d8b,,d8b,_ _,88,_,8'_   8) ,d8     I8,,d8,   ,d8b,,dP   8I   Yb,,d8,   ,d8b,,d8,   ,d8b,";
		echo "P\"\"Y88P\"888P\"Y8888P\"\`Y88P'\"Y888P\"\"Y8P' \"YY8P8P88P     \`Y8P\"Y8888P\"\`Y88P'   8I   \`Y8P\"Y8888P\"\`Y8P\"Y8888P\"\`Y8";
		echo "      ,d8I'                                                                                                ";
		echo "    ,dP'8I                                                                                                 ";
		echo "   ,8\"  8I                                                                                                 ";
		echo "   I8   8I                                                                                                 ";
		echo "   \`8, ,8I                                                                                                 ";
		echo "    \`Y8P\"                                                                                                  ";
        echo "                                                                                                           ";
	fi
fi
)

unset __startup_print_command
