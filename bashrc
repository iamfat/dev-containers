export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
export ANDROID_HOME="$HOME/Library/Android/sdk"

export PATH="/usr/local/opt/node@12/bin:$PATH"
export PATH="/usr/local/opt/openjdk/bin:$PATH"

export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"

alias adb="$ANDROID_SDK_ROOT/platform-tools/adb"
alias adbrr="adb shell input text rr"
alias adbd="adb shell input keyevent 82"
alias ls="ls -G"

eval "$(fasd --init auto)"

function __docker_exec_cmd() {
  local params=($@)
  local service=${params[0]}
  local container_id=$(docker container ps -f 'name='$service -q)
  if [ -z "$container_id" ]; then
    echo "Container \"*$service*\" was not found!"
    return 127
  else
    shift
    docker exec -it $container_id "$@"
  fi
}

alias de='__docker_exec_cmd'
