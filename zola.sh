#!/usr/bin/env bash

# checks if zola is already installed, if it is, use it.

# before that though...
# i just stole this from original serve.sh, so let's just keep it here for now.
# i mean it looks cool af-

cat << 'EOF'
          _                  _
 _______ | | __ _   ___  ___| |_ _   _ _ __
|_  / _ \| |/ _` | / __|/ _ \ __| | | | '_ \ 
 / / (_) | | (_| | \__ \  __/ |_| |_| | |_) |
/___\___/|_|\__,_| |___/\___|\__|\__,_| .__/ 
                                      |_|

EOF

get_zola() {  
  # get latest version number
  local version
  version=$(curl -s https://api.github.com/repos/getzola/zola/releases/latest | jq -r .tag_name)
  curl -fsSL "https://github.com/getzola/zola/releases/download/$version/zola-$version-x86_64-unknown-linux-gnu.tar.gz" -o zola.tar.gz
  tar -vxzf zola.tar.gz -C . "zola"
}


is_available() {
  if command -v zola > /dev/null 2>&1; then
    return 0

    elif [ -f ./zola ]; then
      return 1

    else
      return 2
  fi
}

main() {
  is_available
  local status=$?

  case "$status" in
    0)
      echo "Zola is installed properly, no need to get it"
      zola "$@"
      ;;
    1)
      echo "Zola is installed locally at \"$(pwd)/zola\", using it. \n"
      ./zola "$@"
      ;;
    2)
      echo "Zola not found, downloading... \n"

      for i in {1..5}; do
        echo "Attempt $i: getting Zola..."

        if get_zola; then
          echo "Download successful, using $(pwd)/zola \n"
          break
        fi

        if [ "$i" -eq 5 ]; then
          echo "Failed to get Zola after 5 attempts, exiting."
          exit 1
        fi
      done

      # run after install
      "$(pwd)/zola" "$@"
      ;;
  esac
}

main "$@"