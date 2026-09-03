#!/bin/env bash

######################################
########## Ametrine toolkit ##########
######################################
# Powered by "gum", this tool aims to
# help both less experienced users to
# work easier, and make power users do
# tasks more easily compared to, I don't
# know, launch Zola, take a commit, or
# create a BBS entry without fiddling
# around as much.
# damn bruh i wrote too much for a wip

# TODO: Polish up BBS entry creator
# TODO: Make a blost creator too that actually drops you off to your $EDITOR

cat << EOF
   _             _       _          
  /_\  _ __  ___| |_ _ _(_)_ _  ___ 
 / _ \| '  \/ -_)  _| '_| | ' \/ -_)
/_/ \_\_|_|_\___|\__|_| |_|_||_\___|
                                    
EOF

# Checks for zola being installed or not. We want to do this before sourcing .env
if [[ $(whereis zola) = "zola:"  ]]; then
  echo "Zola is not installed on your system. Check your package manager or https://www.getzola.org/documentation/getting-started/installation/ to get it on your system."
  echo "This theme is targeted for latest versions of Zola but 0.23.x versions introduced breaking changes that requires theme developers to migrate some stuff to a newer syntax. For this reason, MAKE SURE TO GET VERSION 0.22.1"
  echo "Exiting..."
  exit 1
elif [[ $(zola --version) != "zola 0.22.1" ]]; then
  echo "Zola is installed but is not in v0.22.1. Update/downgrade Zola in this environment to continue."
  exit 2
fi

if [[ $(whereis gum) = "gum:"  ]]; then
  echo "gum is not installed on your system. Check your package manager or https://github.com/charmbracelet/gum to get it on your system."
  echo "Without gum, you won't be able to get a user interface to help to you for other tasks."
  exit  3
fi

if [ -f .env ]; then
  echo "Found .env file. Sourcing it"
  set -a && source .env && set +a
fi

# This should be written into an env. variable so that when, for example,
# you got to write the content in 12:00 and the clock hit 12:01; you won't
# get hit by a error message about the fie not existing, or better yet, create
# a new file that appears to be empty.
date=$(echo "$(date -I)")
time=$(echo "$(date '+%H:%M:%S')")
dateTime=$(echo "$date"T"$time"Z)

# Functions for various stuff
new_blost () {
  blostTitle=$(gum input --header "Blost's title" --placeholder "I did this: [this]")
  blostSlug=$(gum input --header "Blost's slug" --placeholder "/i-did-this, without the /")
  blostDescription=$(gum input --header "Blost's description" --placeholder "Appears under the blost's card, isn't sanitized from MarkdownHTML but some sites sanitize that.")
  blostTag=$(gum input --header "Blost's (hash)tags" --placeholder "Write a #tag without the hash")

  mkdir ./content/blog/$date-$blostSlug/

  echo -e "+++
title = '$blostTitle'
description = '$blostDescription'

taxonomies.tags = ['$blostTag']

[extra]
toc = true
+++
" >> ./content/blog/$date-$blostSlug/index.md
  gum confirm "Edit the entry with $EDITOR?" --affirmative "Yeag" --negative "Nope" && $EDITOR ./content/blog/$date-$blostSlug/index.md || gum log -flinfo "You left the entry as is."
  gum log -flwarn "If you want a banner, make sure to apply it in the blost's frontmatter!"
  gum log -flinfo "Successfully created the entry titled \"$blostTitle\" at ./content/blog/$date-$blostSlug/index.md"
}

new_bbs_entry () {
  bbsTitle=$(gum input --header "BBS entry's title" --placeholder "Absolute Nevada Experience")
  bbsContent=$(gum write --header "Entry's content" --placeholder "Somewhere in Nevada there was a grunt hungry for blood... I didn't met him u_u")

  # Don't ask me how I thought of this, or how did that even work 😭
  echo -e "+++
title = '$bbsTitle'
+++
$bbsContent" >> ./content/bbs/$dateTime.md
  gum confirm "Edit the entry with $EDITOR?" --affirmative "Yeag" --negative "Nope" && $EDITOR ./content/bbs/$dateTime.md || gum log -flinfo "You left the entry as is."
  gum log -flinfo "Successfully created the entry titled \"$bbsTitle\" at ./content/bbs/$dateTime.md"
}

case $(gum choose "Site actions" "Git actions") in
  "Site actions")
    case $(gum choose "New blost" "New BBS entry" "Serve site" "Build site" "Check site") in
      "New blost") gum confirm "Create new blost for $(date '+%d %B %Y (%A)')?" --affirmative "Yep, go on" --negative "Fuhh nah" && new_blost || gum log -flinfo "You cancelled creating a new blost" ;;
      "New BBS entry") gum confirm "Create new BBS entry for $(date '+%d %B %Y (%A)')?" --affirmative "Yep, go on" --negative "Nevermind" && new_bbs_entry || gum log -flinfo "You cancelled creating a new BBS entry";;
      "Serve site") zola serve ;;
      "Build site") zola build ;;
      "Check site") zola check ;;
    esac
  ;;

  "Git actions")
  case $(gum choose "Add all changes" "Commit changes" "Push all commits to a branch") in
    "Add all changes") gum confirm "Add all changes?" --affirmative "Yea, go on" --negative "Cancel" && git add . || gum log -flinfo "You cancelled adding changes." ;;
    "Commit changes") gum confirm "Commit changes?" --affirmative "Yea, lemme write a commit name" --negative "Naah" &&  git commit -am "$(gum input --header "Commit message" --placeholder "Just write what has changed")" || gum log -flinfo "You cancelled committing the changes." ;;
    "Push all commits to a branch") gum confirm "You sure about pushing all of the commits?" --affirmative "Yes, captain" --negative "No, captain" && git push origin $(git branch --format "%(refname:short)" | gum choose) || gum log -flinfo "You cancelled pushing the changes." ;;
   esac
  ;;
esac
