language=''

detect_language() {
    if [[ "$LANGUAGE" =~ '.*tr.*' ]]; then
        language='turkish'
        return
    fi
    if [[ "$LC_ALL" =~ '.*tr.*' ]]; then
        language='turkish'
        return
    fi
    if [[ "$LANG" =~ '.*tr.*' ]]; then
        language='turkish'
        return
    fi

    if [[ "$LANGUAGE" =~ '.*en.*' ]]; then
        language='english'
        return
    fi
    if [[ "$LC_ALL" =~ '.*en.*' ]]; then
        language='english'
        return
    fi
    if [[ "$LANG" =~ '.*en.*' ]]; then
        language='english'
        return
    fi
}

_yes() {
    local string

    detect_language

    if [[ "$language" == 'turkish' ]]; then
        string='e'
    elif [[ "$language" == 'english' ]]; then
        string='y'
    else
        echo "Language $language is not supported"
        return 1
    fi

    while true; do
        echo "$string"
        sleep 0.5
    done
}
alias yes='_yes'

_no() {
    local string

    detect_language

    if [[ "$language" == 'turkish' ]]; then
        string='h'
    elif [[ "$language" == 'english' ]]; then
        string='n'
    else
        echo "Language $language is not supported"
        return 1
    fi

    while true; do
        echo "$string"
        sleep 0.5
    done
}
alias no='_no'
