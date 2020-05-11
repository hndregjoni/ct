#! /bin/bash

TERM=urxvt

show_help () {
  cat <<EOF
Contextual terminal.

Scripts that launchers the terminal, tries to
get cwd from active window.

Options:
  -h Help
  -f Floating terminal
EOF
}

WD=`activewinpwd.sh -t`

while getopts "h?f?" opt; do
  case "$opt" in
    h)
      show_help
      ;;
    f)
      TRANSPARENCY_ARG=fl:
      ;;
  esac
done

# echo $WD

[ -d $WD ] && cd $WD

# pwd

# This is my adhoc solution for floating, based on i3 rules.
exec $TERM -name $TRANSPARENCY_ARG$TERM
# Instead , -f should be ignored
# exec $TERM
