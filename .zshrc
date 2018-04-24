source ~/.zplug/init.zsh

# syntax
zplug "chrissicool/zsh-256color"
zplug "Tarrasch/zsh-colors"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "ascii-soup/zsh-url-highlighter"

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

# prompt
RPROMPT="%{${fg[blue]}%}[%~]%{${reset_color}%}"
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'
#PROMPT='%m:%c %n$ '

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
alias chrome='open -a "Google Chrome"'
alias slack='open /Applications/Slack.app'
