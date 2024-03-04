language=''

detect_language() {
    if [ -n "$LANGUAGE" ] && [[ "$LANGUAGE" == *tr* ]]; then
        $language='turkish'
    fi
    if [ -n "$LC_ALL" ] && [[ "$LC_ALL" == *tr* ]]; then
        $language='turkish'
    fi
    if [ -n "$LANG" ] && [[ "$LANG" == *tr* ]]; then
        $language='turkish'
    fi

    if [ -n "$LANGUAGE" ] && [[ "$LANGUAGE" == *en* ]]; then
        $language='english'
    fi
    if [ -n "$LC_ALL" ] && [[ "$LC_ALL" == *en* ]]; then
        $language='english'
    fi
    if [ -n "$LANG" ] && [[ "$LANG" == *en* ]]; then
        $language='english'
    fi
}

_yes() {
    local string

    detect_language

    if [[ "$language" == 'turkish' ]]; then
        string='e'
    elif [ "$language" == 'english' ]; then
        string='y'
    else
        echo "Language $language is not supported"
        return 1
    fi

    while true; do
        echo "$string"
    done
}
alias yes='_yes'

_no() {
    local string

    detect_language

    if [[ "$language" == 'turkish' ]]; then
        string='h'
    elif [ "$language" == 'english' ]; then
        string='n'
    else
        echo "Language $language is not supported"
        return 1
    fi

    while true; do
        echo "$string"
    done
}
alias no='_no'
