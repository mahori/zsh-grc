if [[ "${TERM}" != dumb ]] && (( $+commands[grc] )) && [[ -d '/usr/local/share/grc' ]]
then
    cmds=($(cd /usr/local/share/grc && ls conf.* | sed -E s/conf\.//g))

    for cmd in ${cmds}
    do
        if (( $+commands[$cmd] ))
        then
            cmd_options_name="grc_options_$cmd"
            cmd_options=${(P)cmd_options_name}

            alias $cmd="grc -e -s --colour=auto $cmd${cmd_options:+ }$cmd_options"

            unset cmd_options cmd_options_name
        fi
    done

    unset cmds cmd
fi
