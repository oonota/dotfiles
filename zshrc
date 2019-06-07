#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
source ~/.zplug/init.zsh

# syntax
zplug "chrissicool/zsh-256color"
zplug "Tarrasch/zsh-colors"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "ascii-soup/zsh-url-highlighter"
zplug "b4b4r07/enhancd", use:init.sh


#enhancdの後にls
ENHANCD_HOOK_AFTER_CD=ls

# hokan
zplug "zsh-users/zsh-completions"

if ! zplug check --verbose; then
	printf "Install? [y/N]: "
	if read -q; then
		echo; zplug install
	fi
fi
zplug load

# 補完機能
autoload -U compinit
compinit


# コマンド履歴
HISTFILE=~/.zsh_history
HISTSIZE=6000000
SAVEHIST=6000000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

# General settings
setopt auto_pushd           #cd時に自動でディレクトリスタックに追加
setopt pushd_ignore_dups   #ディレクトリスタックと重複したディレクトリをスタックに追加しない
setopt auto_list						#補完候補を一覧で表示する
setopt auto_menu						#補完キー連打で候補順に自動で補完する

setopt hist_reduce_blanks   # コマンド中の余分なスペースは削除して履歴に記録する
setopt hist_save_no_dups    # 履歴と重複するコマンドを記録しない

setopt nonomatch            #アスタリスクなどを使えるように

# neovim
export XDG_CONFIG_HOME=~/.config

#pyenv path
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Japanese
export LANG=ja_JP.UTF-8


#terminal color
export TERM="xterm-256color"

# コマンド履歴検索
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# alias
alias diff="coloddiff"
alias ls='ls -G'
alias ll='ls -hl'
alias rm='rm -i'
alias mv='mv -i'
alias pd='popd'
alias gs='git status'
alias gp='git push origin master'
alias latexmk='latexmk -pvc'
alias diff='colordiff'
alias jn='jupyter notebook'




case ${OSTYPE} in
  darwin*)
		export PATH=$PATH:/Users/ohno/.local/bin
    # ここに Mac 向けの設定
    ;;
  linux*)
    # ここに Linux 向けの設定
		alias ls='ls --color'
    ;;
esac


function is_exists() { type "$1" >/dev/null 2>&1; return $?; }
function is_osx() { [[ $OSTYPE == darwin* ]]; }
function is_screen_running() { [ ! -z "$STY" ]; }
function is_tmux_runnning() { [ ! -z "$TMUX" ]; }
function is_screen_or_tmux_running() { is_screen_running || is_tmux_runnning; }
function shell_has_started_interactively() { [ ! -z "$PS1" ]; }
function is_ssh_running() { [ ! -z "$SSH_CONECTION" ]; }

function tmux_automatically_attach_session()
{
    if is_screen_or_tmux_running; then
        ! is_exists 'tmux' && return 1

        # if is_tmux_runnning; then
        #     echo "${fg_bold[red]} _____ __  __ _   ___  __ ${reset_color}"
        #     echo "${fg_bold[red]}|_   _|  \/  | | | \ \/ / ${reset_color}"
        #     echo "${fg_bold[red]}  | | | |\/| | | | |\  /  ${reset_color}"
        #     echo "${fg_bold[red]}  | | | |  | | |_| |/  \  ${reset_color}"
        #     echo "${fg_bold[red]}  |_| |_|  |_|\___//_/\_\ ${reset_color}"
        # elif is_screen_running; then
        if is_screen_running; then
            echo "This is on screen."
        fi
    else
        if shell_has_started_interactively && ! is_ssh_running; then
            if ! is_exists 'tmux'; then
                echo 'Error: tmux command not found' 2>&1
                return 1
            fi

            if tmux has-session >/dev/null 2>&1 && tmux list-sessions | grep -qE '.*]$'; then
                # detached session exists
                tmux list-sessions
                echo -n "Tmux: attach? (y/N/num) "
                read
                if [[ "$REPLY" =~ ^[Yy]$ ]] || [[ "$REPLY" == '' ]]; then
                    tmux attach-session
                    if [ $? -eq 0 ]; then
                        echo "$(tmux -V) attached session"
                        return 0
                    fi
                elif [[ "$REPLY" =~ ^[0-9]+$ ]]; then
                    tmux attach -t "$REPLY"
                    if [ $? -eq 0 ]; then
                        echo "$(tmux -V) attached session"
                        return 0
                    fi
                fi
            fi

            if is_osx && is_exists 'reattach-to-user-namespace'; then
                # on OS X force tmux's default command
                # to spawn a shell in the user's namespace
                tmux_config=$(cat $HOME/.tmux.conf <(echo 'set-option -g default-command "reattach-to-user-namespace -l $SHELL"'))
                tmux -f <(echo "$tmux_config") new-session && echo "$(tmux -V) created new session supported OS X"
            else
                tmux new-session && echo "tmux created new session"
            fi
        fi
    fi
}
tmux_automatically_attach_session

