# direnv - automatic environment variable loading
# https://direnv.net/

# Hook direnv into zsh
if command -v direnv &> /dev/null; then
  eval "$(direnv hook zsh)"
fi
