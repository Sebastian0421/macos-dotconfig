set -g -x RANGER_LOAD_DEFAULT_RC FALSE
set -g -x PATH /usr/local/matlab/R2020a/bin/ $PATH
#set -g -x DISPLAY  10.192.130.199:0
#set -g -x DISPLAY (ifconfig | grep inet | awk '{print $2}' | head -n 1 | awk '{print $0":0"}')
set -g fish_greeting


