# Eldritch Tmux Theme Plugin

A dark, mystical theme for tmux inspired by the Eldritch colorscheme.

## Installation

### Using TPM (Tmux Plugin Manager)

1. Add plugin to your `~/.tmux.conf`:
   ```
   set -g @plugin 'yourusername/tmux-eldritch'
   ```

2. Press `prefix + I` (capital i, as in Install) to fetch the plugin.

### Manual Installation

1. Clone this repo:
   ```bash
   git clone https://github.com/yourusername/tmux-eldritch ~/.tmux/plugins/tmux-eldritch
   ```

2. Add this line to your `~/.tmux.conf`:
   ```
   run-shell ~/.tmux/plugins/tmux-eldritch/eldritch.tmux
   ```

3. Reload tmux config:
   ```bash
   tmux source-file ~/.tmux.conf
   ```

## Features

- Dark background with vibrant accent colors
- Color-coded active/inactive windows
- Styled status bar with session, date, and time
- Customized pane borders using theme colors
- Copy mode and message styling
- Activity and bell notifications

## Color Palette

The theme uses the following colors from the Eldritch palette:

- **Background**: `#212337`
- **Foreground**: `#ebfafa` 
- **Accent Colors**: Purple (`#9071f4`), Pink (`#f265b5`), Cyan (`#04d1f9`), Green (`#37f499`)
- **Selection**: `#bf4f8e`

## Customization

You can customize colors by modifying the variables at the top of `eldritch.tmux`. After making changes, reload your tmux config with:

```bash
tmux source-file ~/.tmux.conf
```