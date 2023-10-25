############################
#                          #
#  ADD NASSY SETTINGS      #
#                          #
############################
#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='nano'
export VISUAL='nano'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG=ja_JP.UTF-8
  export KCODE=u  # KCODEにUTF-8を設定
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $path
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

#
# Temporary Files
#

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"

autoload -Uz colors
colors

autoload -Uz compinit
compinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

setopt print_eight_bit

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

#########################################################
#                                                       #
#  ADD NASSY GIT SETTINGS                               #
#  @see https://dev.macha795.com/zsh-prompt-customize/  #
#                                                       #
#########################################################
fpath=(~/.zsh/completion $fpath)

autoload -Uz compinit
compinit -u

export CLICOLOR=1


function left-prompt {
  name_t='179m%}'      # user name text clolr
  name_b='000m%}'    # user name background color
  path_t='255m%}'     # path text clolr
  path_b='031m%}'   # path background color
  arrow='087m%}'   # arrow color
  text_color='%{\e[38;5;'    # set text color
  back_color='%{\e[30;48;5;' # set background color
  reset='%{\e[0m%}'   # reset
  sharp="\uE0B0"      # triangle

  user="${back_color}${name_b}${text_color}${name_t}"
  dir="${back_color}${path_b}${text_color}${path_t}"
  echo "${user}%n%#@%m${back_color}${path_b}${text_color}${name_b}${sharp} ${dir}%~${reset}${text_color}${path_b}${sharp}${reset}\n${text_color}${arrow}> ${reset}"
}

PROMPT=`left-prompt`

# コマンドの実行ごとに改行
function precmd() {
  # Print a newline before the prompt, unless it's the
  # first prompt in the process.
  if [ -z "$NEW_LINE_BEFORE_PROMPT" ]; then
      NEW_LINE_BEFORE_PROMPT=1
  elif [ "$NEW_LINE_BEFORE_PROMPT" -eq 1 ]; then
      echo ""
  fi
}


# git ブランチ名を色付きで表示させるメソッド
function rprompt-git-current-branch {
  local branch_name st branch_status

  branch='\ue0a0'
  color='%{\e[38;5;' #  文字色を設定
  green='114m%}'
  red='001m%}'
  yellow='227m%}'
  blue='033m%}'
  reset='%{\e[0m%}'   # reset

  color='%{\e[38;5;' #  文字色を設定
  green='114m%}'

  # ブランチマーク
  if [ ! -e  ".git" ]; then
    # git 管理されていないディレクトリは何も返さない
    return
  fi
    branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
    st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    # 全て commit されてクリーンな状態
    branch_status="${color}${green}${branch}"
  elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
    # git 管理されていないファイルがある状態
    branch_status="${color}${red}${branch}?"
  elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
    # git add されていないファイルがある状態
    branch_status="${color}${red}${branch}+"
  elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
    # git commit されていないファイルがある状態
    branch_status="${color}${yellow}${branch}!"
  elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
    # コンフリクトが起こった状態
    echo "${color}${red}${branch}!(no branch)${reset}"
    return
  else
    # 上記以外の状態の場合
    branch_status="${color}${blue}${branch}"
  fi

  # ブランチ名を色付きで表示する
  echo "${branch_status}$branch_name${reset}"
}

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

# プロンプトの右側にメソッドの結果を表示させる
RPROMPT='`rprompt-git-current-branch`'
################################
#                              #
#  ADD NASSY DEVELOP SETTINGS  #
#                              #
################################
ssh-add -K ~/.ssh/id_rsa_shark-bastion
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
[[ -s "/Users/takanashi-masaru/.gvm/scripts/gvm" ]] && source "/Users/takanashi-masaru/.gvm/scripts/gvm"
[[ -s "/Users/takanashi-masaru/local-sonarqube/sonar-scanner-4.6.2.2472-macosx/bin" ]] && export PATH="$PATH:/Users/takanashi-masaru/local-sonarqube/sonar-scanner-4.6.2.2472-macosx/bin"
export PATH=$HOME/.nodebrew/current/bin:$PATH
eval "$(nodenv init -)"
export NPM_AUTH_TOKEN="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"
eval "$(direnv hook zsh)"
export PATH="/usr/local/opt/php@7.4/bin:$PATH"
export PATH="/usr/local/opt/php@7.4/sbin:$PATH"


###############
# go settings #
###############
echo "setup go settings... .load by ~/.zprofile"
gvm use go1.21.3
export GOPATH=`go env GOPATH`
export PATH=$PATH:$GOPATH/bin
export GO111MODULE=on
export GOROOT=`go env GOROOT`
export GOPATH=`go env GOPATH`
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
