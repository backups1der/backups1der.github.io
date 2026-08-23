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
zola "$@"
zola serve
