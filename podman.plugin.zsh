# poso stands for: podman short
alias poso='podman ps --format "table {{.Names}}\t{{.Status}}\t{{.Image}}"'
alias pops='podman ps'

popm() {
    for id in $(podman ps -a -q); do
        names=$(podman ps -a --filter "id=$id" --format "{{.Names}}")
        ports=$(podman port "$id")
        if [ -z "$ports" ]; then
            echo "$names"
        else
            echo "$names" '---' "$ports"
        fi
    done
}
