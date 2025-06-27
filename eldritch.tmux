#!/usr/bin/env bash

# Color definitions
eldritch_bg="#212337"         # background
eldritch_fg="#ebfafa"         # foreground  
eldritch_black="#21222c"      # palette 0
eldritch_red="#f9515d"        # palette 1
eldritch_green="#37f499"      # palette 2 (also cursor)
eldritch_yellow="#e9f941"     # palette 3
eldritch_blue="#9071f4"       # palette 4 (purple)
eldritch_magenta="#f265b5"    # palette 5
eldritch_cyan="#04d1f9"       # palette 6
eldritch_white="#ebfafa"      # palette 7
eldritch_bright_black="#7081d0"    # palette 8 (purple-gray)
eldritch_bright_red="#f16c75"      # palette 9
eldritch_bright_green="#69F8B3"    # palette 10
eldritch_bright_yellow="#f1fc79"   # palette 11
eldritch_bright_blue="#a48cf2"     # palette 12 (light purple)
eldritch_bright_magenta="#FD92CE"  # palette 13
eldritch_bright_cyan="#66e4fd"     # palette 14
eldritch_bright_white="#ffffff"    # palette 15
eldritch_selection_bg="#7081d0"    # Changed from magenta to purple-gray

# Apply theme
tmux set -g status-style "bg=$eldritch_bg,fg=$eldritch_fg"

# Status left (session name) - NOW PURPLE
tmux set -g status-left-style "bg=$eldritch_blue,fg=$eldritch_bg,bold"
tmux set -g status-left-length 40
tmux set -g status-left " #S "

# Status right - ALTERNATIVES (choose one):
# Option 1: System load + hostname
tmux set -g status-right-style "bg=$eldritch_green,fg=$eldritch_bg,bold"
tmux set -g status-right-length 50
tmux set -g status-right " MEM: #{ram_percentage} | #h "

# Option 2: Memory usage
# tmux set -g status-right-style "bg=$eldritch_green,fg=$eldritch_bg,bold"
# tmux set -g status-right-length 40
# tmux set -g status-right " MEM: #{ram_percentage} "

# Option 3: Uptime
# tmux set -g status-right-style "bg=$eldritch_green,fg=$eldritch_bg,bold"
# tmux set -g status-right-length 40
# tmux set -g status-right " up: #{uptime} "

# Option 4: Just mystical hostname
# tmux set -g status-right-style "bg=$eldritch_green,fg=$eldritch_bg,bold"
# tmux set -g status-right-length 30
# tmux set -g status-right " ∴ #h ∴ "

# Option 5: Pane count + window count
# tmux set -g status-right-style "bg=$eldritch_green,fg=$eldritch_bg,bold"
# tmux set -g status-right-length 40
# tmux set -g status-right " P:#{pane_current_command} W:#{window_index} "

# Window status
tmux set -g window-status-style "bg=$eldritch_bg,fg=$eldritch_bright_black"
tmux set -g window-status-format " #I:#W "

# Active window status - NOW CYAN
tmux set -g window-status-current-style "bg=$eldritch_cyan,fg=$eldritch_bg,bold"
tmux set -g window-status-current-format " #I:#W "

# Window status separator
tmux set -g window-status-separator ""

# Pane borders
tmux set -g pane-border-style "fg=$eldritch_bright_black"
tmux set -g pane-active-border-style "fg=$eldritch_green"

# Message styling
tmux set -g message-style "bg=$eldritch_yellow,fg=$eldritch_bg,bold"
tmux set -g message-command-style "bg=$eldritch_yellow,fg=$eldritch_bg,bold"

# Mode styling (copy mode, etc.) - UPDATED SELECTION
tmux set -g mode-style "bg=$eldritch_selection_bg,fg=$eldritch_fg"

# Clock mode - keep cyan since it's pretty
tmux set -g clock-mode-colour "$eldritch_cyan"

# Bell/activity styling
tmux set -g window-status-bell-style "bg=$eldritch_red,fg=$eldritch_bg,bold"
tmux set -g window-status-activity-style "bg=$eldritch_bright_magenta,fg=$eldritch_bg,bold"

# Copy mode highlighting - UPDATED SELECTION
tmux set -g copy-mode-match-style "bg=$eldritch_selection_bg,fg=$eldritch_fg"
tmux set -g copy-mode-current-match-style "bg=$eldritch_green,fg=$eldritch_bg"

# Status position
tmux set -g status-position top

# Refresh status more frequently
tmux set -g status-interval 5