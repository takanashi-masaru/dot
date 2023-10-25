# @see https://dev.macha795.com/zsh-prompt-customize/

########################
#                      #
#  ADD NASSY SETTINGS  #
#                      #
########################
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
