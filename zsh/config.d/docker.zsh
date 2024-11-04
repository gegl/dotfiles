# Docker aliases
alias dkp='docker ps'
alias dku='docker compose up -d'
alias dkr='docker compose run --service-ports --no-deps --rm app'
alias dkc='docker container stop $(docker container ls -a -q) && docker system prune -a -f --volumes'
alias dks='docker container stop $(docker ps -q)'
alias dke='docker compose exec'
alias dkl='docker compose logs -f'
alias dklr="docker compose build $1 && docker-compose up -d --no-deps $1"
