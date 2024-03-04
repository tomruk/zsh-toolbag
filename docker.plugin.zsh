# dos stands for: docker short
alias dos='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Image}}"'
alias dops='docker ps'

dopm() {
    for id in $(docker ps -a -q); do
        names=$(docker ps -a --filter "id=$id" --format "{{.Names}}")
        ports=$(docker port "$id")
        if [ -z "$ports" ]; then
            echo "$names"
        else
            echo "$names" '---' "$ports"
        fi
    done
}
