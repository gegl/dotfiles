# MCP Servers Configuration Setup

This directory contains MCP server configuration for Claude Code with environment variable support using `direnv`.

## Files

- `mcp-servers.json` - MCP configuration (safe to check into git)
- `.envrc.template` - Template with placeholder values (safe to check into git)
- `.envrc` - Actual secrets (**DO NOT check into git**)

## Setup Instructions

### 1. Install direnv

```bash
sudo apt install direnv
```

### 2. Configure your shell

Add to `~/.bashrc` (or `~/.zshrc` for zsh):

```bash
eval "$(direnv hook bash)"
```

Then reload your shell:

```bash
source ~/.bashrc
```

### 3. Copy files to appropriate locations

```bash
# Copy MCP config to Claude Code config directory
# (Update the global config in ~/.claude.json by replacing the mcpServers section)

# Or if using project-specific config:
cp mcp-servers.json ~/your-project/.claude/mcp-servers.json

# Copy .envrc to your home directory (or project directory)
cp .envrc ~/
cd ~
direnv allow
```

### 4. For project-specific setup

If you want environment variables to load automatically when entering a project:

```bash
cd ~/your-project
cp .envrc ~/your-project/
direnv allow
```

### 5. Verify it works

```bash
cd ~  # or your project directory
echo $BRAVE_API_KEY  # Should print your API key
```

## Usage

When you `cd` into a directory with a `.envrc` file, direnv will:
1. Automatically load the environment variables
2. Unload them when you leave the directory

You'll see a message like:
```
direnv: loading ~/your-project/.envrc
direnv: export +BRAVE_API_KEY +FIGMA_API_KEY ...
```

## Security Notes

**Important:**
- Always add `.envrc` to your `.gitignore`
- Only commit `.envrc.template` and `mcp-servers.json`
- The `.envrc` file contains sensitive credentials
- Run `direnv allow` after creating or modifying `.envrc`

## For New Computers/Projects

1. Clone your repo with `mcp-servers.json` and `.envrc.template`
2. Copy `.envrc.template` to `.envrc`
3. Fill in your actual secrets
4. Run `direnv allow`
5. Start Claude Code

## Troubleshooting

If environment variables aren't loading:
- Make sure direnv is installed: `direnv --version`
- Check shell hook is configured: `type direnv` should show a function
- Verify you've run: `direnv allow` in the directory
- Check direnv status: `direnv status`
