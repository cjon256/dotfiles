# has to be done here because Macos fucks up the PATH
path=(
  $HOME/{,s}bin(N)
  /usr/local/{,s}bin(N)
  /run/current-system/sw/{,s}bin(N)
  $path
  $HOME/.rustup/toolchains/stable-aarch64-apple-darwin/bin
  $HOME/go/bin
)
