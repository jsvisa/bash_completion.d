_pgcli()
{
  local opts="-h -p -U -W -w -v -d -D --list-dsn"
  local cur=${COMP_WORDS[COMP_CWORD]}
  local prev=${COMP_WORDS[COMP_CWORD-1]} # previous argument

  case "$prev" in
    -D)
      local tunnels=$(pgcli --list-dsn | awk '{print $1}')
      COMPREPLY=( $(compgen -W "$tunnels" -- $cur) )
      ;;
    *)
      COMPREPLY=( $(compgen -W "$opts" -- $cur) )
      ;;
    esac
}

complete -o default -F _pgcli  pgcli
