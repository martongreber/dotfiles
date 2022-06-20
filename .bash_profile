set -o vi
export TERM=xterm
if [[ $OSTYPE == 'darwin'* ]]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
	if [ -d "/opt/homebrew/opt/krb5" ]; then
		export PATH="/opt/homebrew/opt/krb5/bin:$PATH"
		export PATH="/opt/homebrew/opt/krb5/sbin:$PATH"
		export LDFLAGS="-L/opt/homebrew/opt/krb5/lib $LDFLAGS"
		export CPPFLAGS="-I/opt/homebrew/opt/krb5/include $CPPFLAGS"
		export PKG_CONFIG_PATH="/opt/homebrew/opt/krb5/lib/pkgconfig:$PKG_CONFIG_PATH"
	else
		echo "Please install krb5"
	fi

	if [ -d "/opt/homebrew/opt/openssl@1.1" ]; then
		export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"
		export LDFLAGS="-L/opt/homebrew/opt/openssl@1.1/lib $LDFLAGS"
		export CPPFLAGS="-I/opt/homebrew/opt/openssl@1.1/include $CPPFLAGS"
		export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@1.1/lib/pkgconfig:$PKG_CONFIG_PATH"

	else
		echo "Please install openssl@1.1"
	fi

	export LIBRARY_PATH="$LIBRARY_PATH:/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib"
	export SDKROOT="/Applications/Xcode_13_1.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk"
fi
source ~/.bashrc

#prompt config
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
