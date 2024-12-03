if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi

# Aliases
alias k='kubectl'

# Easily access psql on Kubernetes cluster. Usage: kpsql <database name>
kpsql-run() { kubectl run -it --rm psql --image=postgres --restart=Never -- /bin/bash -c "psql postgres://$1:$1@pg:25060/$1"; }
kpsql-exec() { kubectl exec -it psql  -- /bin/bash -c "psql postgres://$1:$1@pg:25060/$1"; }

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
