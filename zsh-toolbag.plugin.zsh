this_plugin=$(realpath $0)
toolbag_dir="$(dirname -- "${this_plugin}")"

for plugin in "$toolbag_dir"/*.plugin.zsh; do
    if [[ $(realpath $plugin) != $this_plugin ]]; then
        source "$plugin"
    fi
done
