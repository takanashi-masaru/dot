# dot
## git completion
## @see https://dev.macha795.com/zsh-prompt-customize/
```
mkdir -p ~/.zsh/completion/
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh -o ~/.zsh/completion/git-completion.zsh
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.zsh/completion/git-prompt.sh

chmod a+x ~/.zsh/completion/git-prompt.sh
chmod a+x ~/.zsh/completion/git-completion.zsh

mv ~/.zsh/completion/git-completion.zsh ~/.zsh/completion/_git

rm -f ~/.zcompdump

# .zprofileの編集
# dot/.zprofileを参照
vim ~/.zprofile
source ~/.zprofile

# フォントのインストール
cd ~/
git clone https://github.com/powerline/fonts
cd fonts
./install.sh

fc-cache -vf

ターミナルで `DejaVu Sans Mono Powerline` に変更する
```

## brew
```
> brew list
==> Formulae
aom				golangci-lint			libtiff				p11-kit
apr				graphite2			libtool				pango
apr-util			guile				libuninameslist			pcre
argon2				harfbuzz			libunistring			pcre2
aspell				highway				libvmaf				php@7.4
autoconf			hub				libx11				php@8.0
awscli				icu4c				libxau				pixman
bdw-gc				imath				libxcb				pkg-config
brotli				isl				libxdmcp			powerlevel9k
c-ares				jpeg				libxext				pycparser
ca-certificates			jpeg-turbo			libxrender			python@3.10
cairo				jpeg-xl				libyaml				python@3.11
cffi				jq				libzip				python@3.9
cscope				krb5				little-cms2			readline
ctags				kubernetes-cli			lua				reattach-to-user-namespace
curl				kubeseal			lua@5.3				ricty
direnv				libavif				lz4				rtmpdump
docutils			libevent			lzo				ruby
fontconfig			libffi				m4				six
fontforge			libgcrypt			macvim				sqlite
freetds				libgpg-error			mercurial			the_silver_searcher
freetype			libidn2				mockery				tidy-html5
fribidi				liblinear			mpdecimal			tmux
gcc				libmaxminddb			mpfr				unbound
gd				libmpc				ncurses				unixodbc
gdbm				libnghttp2			nettle				utf8proc
gettext				libpng				nmap				webp
ghi				libpq				node-build			woff2
giflib				libpthread-stubs		nodebrew			xorgproto
git				libsmi				nodenv				xz
glib				libsodium			oniguruma			zed
gmp				libspiro			openexr				zq
gnutls				libssh				openldap			zsh
go				libssh2				openssl@1.1			zstd
gobject-introspection		libtasn1			openssl@3

==> Casks
atom			gas-mask		hyper			karabiner-elements
clipy			google-cloud-sdk	iterm2			wireshark
```

## sdkman
## @see https://sdkman.io/install
```
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
```

## gvm(go lang バージョン管理)
## @see https://github.com/moovweb/gvm
```
xcode-select --install
brew update
# Check whether formula is installed in your machine
brew list | grep mercurial
# If not, please install
brew install mercurial

# Install Go version manager
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
```

