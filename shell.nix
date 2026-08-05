{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = with pkgs; [ zola ];

  # LC_ALL=en_US.UTF-8
  shellHook = ''
    cat << EOF
       _             _       _          
      /_\  _ __  ___| |_ _ _(_)_ _  ___ 
     / _ \| '  \/ -_)  _| '_| | ' \/ -_)
    /_/ \_\_|_|_\___|\__|_| |_|_||_\___|
                                        
    EOF

    if [ -f .env ]; then
      echo -e "Found .env\nsourcing it..."
      set -a && source .env && set +a
    fi

    # Zola + pipe in all args
    # zola "$@"

    zola serve
  '';
}
