# Claude Code MCP Configuration

This directory contains MCP (Model Context Protocol) server configuration for Claude Code, managed as dotfiles for reuse across projects and computers.

## Files

- `mcp-servers.json` - MCP server configuration with environment variable references
- `.envrc.template` - Template for environment variables (safe to commit)
- `.envrc` - Actual secrets (gitignored, do not commit)
- `.gitignore` - Ensures .envrc is never committed
- `SETUP.md` - Detailed setup instructions

## Quick Setup on New Computer

```bash
# 1. Install direnv
sudo apt install direnv

# 2. Symlink zsh config (if not already done)
ln -s ~/dev/dotfiles/zsh ~/.config/zsh

# 3. Reload shell to activate direnv hook
source ~/.zshrc

# 4. Copy the environment template and fill in your secrets
cd ~/dev/dotfiles/claude
cp .envrc.template .envrc
# Edit .envrc with your actual API keys and database URIs
nano .envrc

# 5. Allow direnv to load the environment
direnv allow

# 6. Update your Claude Code global configuration
# Edit ~/.claude.json and replace the "mcpServers" section with the content from mcp-servers.json
# Or use jq to do it programmatically:
jq --slurpfile mcp mcp-servers.json '.mcpServers = $mcp[0].mcpServers' ~/.claude.json > ~/.claude.json.tmp && mv ~/.claude.json.tmp ~/.claude.json
```

## Directory Structure

Your dotfiles should be organized as:
```
~/dev/dotfiles/
├── zsh/
│   └── config.d/
│       ├── direnv.zsh      # Hooks direnv into shell
│       ├── docker.zsh
│       ├── gh.zsh
│       ├── k8s.zsh
│       └── local.zsh
└── claude/
    ├── mcp-servers.json    # MCP config (safe to commit)
    ├── .envrc.template     # Template (safe to commit)
    ├── .envrc              # Actual secrets (gitignored)
    ├── .gitignore          # Protects secrets
    ├── README.md           # This file
    └── SETUP.md            # Detailed instructions
```

## How direnv Works with This Setup

1. When you `cd ~/dev/dotfiles/claude`, direnv automatically loads `.envrc`
2. All environment variables become available to any process started from that directory
3. When you start Claude Code from this directory (or a parent), it inherits the environment
4. The MCP servers then have access to all the credentials they need

## Alternative: Global Environment Setup

If you want environment variables available everywhere (not just in the claude directory):

```bash
# Option 1: Use direnv in home directory
cp ~/dev/dotfiles/claude/.envrc ~/
cd ~
direnv allow

# Option 2: Source in shell startup (less secure, always loaded)
# Add to ~/.zshrc:
# source ~/dev/dotfiles/claude/.envrc
```

## Security Notes

- `.envrc` contains sensitive credentials and is gitignored
- Always verify `.gitignore` is working before committing
- Never commit API keys or database passwords
- Consider using different credentials for different environments

## Troubleshooting

Check if direnv is working:
```bash
cd ~/dev/dotfiles/claude
direnv status
echo $BRAVE_API_KEY  # Should show your API key
```

See full troubleshooting steps in `SETUP.md`.
