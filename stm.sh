_stm()
{
  local opts="start stop status show restart"
  local cur=${COMP_WORDS[COMP_CWORD]}
  local prev=${COMP_WORDS[COMP_CWORD-1]} # previous argument

  case "$prev" in
    start|stop|status|restart)
      local tunnels=$(stm status | awk '{print $4}' | awk -F "'" '{print $2}')
      COMPREPLY=( $(compgen -W "$tunnels" -- $cur) )
      ;;
    *)
      COMPREPLY=( $(compgen -W "$opts" -- $cur) )
      ;;
  esac
}

complete -o default -F _stm  stm
