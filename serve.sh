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

cat << EOF
   _             _       _          
  /_\  _ __  ___| |_ _ _(_)_ _  ___ 
 / _ \| '  \/ -_)  _| '_| | ' \/ -_)
/_/ \_\_|_|_\___|\__|_| |_|_||_\___|
                                    
EOF


# Check for gum and run the check for zola. Should source .env before running zola serve if gum is not installed.
if [[ $(whereis gum) = "gum:"  ]]; then
  echo "gum is not installed on your system. Check your package manager or https://github.com/charmbracelet/gum to get it on your system."
  echo "Without gum, you won't be able to get a user interface to help to you for other tasks."
  echo "Falling back to running zola serve..."
fi

# Checks for zola being installed or not. We want to do this before sourcing .env
if [[ $(whereis zola) = "zola:"  ]]; then
  echo "Zola is not installed on your system. Check your package manager or https://www.getzola.org/documentation/getting-started/installation/ to get it on your system."
  echo "This theme is targeted for latest versions of Zola but 0.23.x versions introduced breaking changes that requires theme developers to migrate some stuff to a newer syntax. For this reason, MAKE SURE TO GET VERSION 0.22.1"
  echo "Exiting..."
  exit 1
elif [[ $(zola --version) != "zola 0.22.1" ]]; then
  echo "Zola is installed but is not in v0.22.1. Update/downgrade Zola in this environment to continue."
  exit 2
else
  if [ -f .env ]; then
    echo "Found .env file. Sourcing it"
    set -a && source .env && set +a
  fi

  zola serve
fi

