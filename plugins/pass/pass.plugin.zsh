gnrpass_secure () {
clear
apg -n 30 -m 12 -x 12 -M SNCL -E "\{\}\(\)\\[\]\^\Ç\'\¡\"\!\?\¿\~\=\:\|\`\ç\:\,\;\*\ñ" -t
}

gnrpass_simple () {
clear
apg -n 20 -m 15 -x 15 -M NC -E O0Ññ -t
}

pp () {
    if [ ! $# -eq 2 ];then
        echo "Usage: p <user> <host>"
    else
        pass private/MasterPassword | mpw -u $1 $2 - | xclip -selection c
    fi
}
pw () {
    if [ ! $# -eq 2 ];then
        echo "Usage: p <user> <host>"
    else
        pass work/MasterPassword | mpw -u $1 $2 - | xclip -selection c
    fi
}

s () {
    if [ ! $# -eq 3 ];then
        echo "Usage s <port> <user> <host>"
        return 1
    fi
    pw $2 $3
    if [ ! $? -eq 0 ];then
        echo "Error at s function"
        return 1
    fi
    tsocks ssh -p $1 $2@$3
}

alias amazon="pp colaire@hotmail.es amazon.es"
alias twitter="pp jscolaire twitter.com"
alias reddit="pp jscolaire reddit.com"
alias github="pp jscolaire github.com"
alias gitlakes="pp ac lakes.strangled.net"
<<<<<<< HEAD
alias vcenter="pw administrator vcsa.cibergroup.gc"
alias vcsa="pw root vcsa.cibergroup.gc"
=======
alias dropb="pp jacaro37@gmail.com dropbox.com"
>>>>>>> 18fe57d498cf86e9bfba44cf3765febed9c87db7
