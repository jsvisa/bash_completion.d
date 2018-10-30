_pipenv()
{
  local opts="check clean graph install lock open run shell sync uninstall update"
  local cur=${COMP_WORDS[COMP_CWORD]}
  local prev=${COMP_WORDS[COMP_CWORD-1]} # previous argument

  case "$prev" in
    *)
      COMPREPLY=( $(compgen -W "$opts" -- $cur) )
      ;;
    esac
}

complete -o default -F _pipenv  pipenv
