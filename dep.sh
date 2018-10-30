# dep for go dependence manager

_dep()
{
  local opts="init status ensure version check"
  local cur=${COMP_WORDS[COMP_CWORD]}
  local prev=${COMP_WORDS[COMP_CWORD-1]} # previous argument

  case "$prev" in
    *)
      COMPREPLY=( $(compgen -W "$opts" -- $cur) )
      ;;
  esac
}

complete -o default -F _dep dep
