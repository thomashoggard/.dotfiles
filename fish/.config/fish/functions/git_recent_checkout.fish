function git_recent_checkout
  set branch (git reflog | grep -Eio "moving from ([^[:space:]]+)" | awk '{ print $3 }' | awk ' !x[$0]++' | grep -Ev '^[a-f0-9]{40}$' | fzf | xargs) 

  if test -z "$branch" 
    echo "Aborting, no branch selected"
  else
    echo "git switch \"$branch\""
    git switch "$branch"
  end
end

