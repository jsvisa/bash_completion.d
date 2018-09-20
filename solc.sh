_solc()
{
  # local first="help version optimize optimize-runs pretty-json libraies overwrite gas standard-json assemble julia stric-assembly"
  local first="--optimize --asm --bin --abi"
  local cur=${COMP_WORDS[COMP_CWORD]}
  local prev=${COMP_WORDS[COMP_CWORD-1]} # previous argument
  case "$COMP_CWORD" in
    1) COMPREPLY=( $(compgen -W "$first" -- $cur) ) ;;
    *) COMPREPLY=( $(compgen -W "$(ls)"  -- $cur) ) ;;
  esac
}

complete -o default -F _solc  solc
