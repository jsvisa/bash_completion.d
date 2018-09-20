_truffle()
{
  local opts="help version init compile migrate deploy build test console install publish networks watch serve exec unbox"
  local cur=${COMP_WORDS[COMP_CWORD]}
  local prev=${COMP_WORDS[COMP_CWORD-1]} # previous argument

  case "$prev" in
    console)
      COMPREPLY=( $(compgen -W "--network" -- $cur) )
      ;;
    migrate)
      COMPREPLY=( $(compgen -W "--network --reset" -- $cur) )
      ;;
    --network)
      # COMPREPLY=( $(compgen -W "development poc live" -- $cur) )
      local networks=`node -p "Object.keys(require('./truffle.js').networks)" | sed -re "s/[]\[,']+//g"`
      COMPREPLY=( $(compgen -W "$networks" -- $cur) )
      ;;
    *)
      COMPREPLY=( $(compgen -W "$opts" -- $cur) )
      ;;
  esac
}

complete -o default -F _truffle  truffle
