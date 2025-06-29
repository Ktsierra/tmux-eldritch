#!/usr/bin/env bash

# Color definitions
eldritch_bg="#212337"
eldritch_fg="#ebfafa"
eldritch_black="#21222c"
eldritch_red="#f9515d"
eldritch_green="#37f499"
eldritch_yellow="#e9f941"
eldritch_blue="#9071f4"       # purple
eldritch_magenta="#f265b5"
eldritch_cyan="#04d1f9"
eldritch_white="#ebfafa"
eldritch_bright_black="#7081d0"    # purple-gray
eldritch_bright_red="#f16c75"
eldritch_bright_green="#69F8B3"
eldritch_bright_yellow="#f1fc79"
eldritch_bright_blue="#a48cf2"     # light purple
eldritch_bright_magenta="#FD92CE"
eldritch_bright_cyan="#66e4fd"
eldritch_bright_white="#ffffff"
eldritch_selection_bg="#7081d0"    # Changed from magenta to purple-gray

# Apply theme
tmux set -g status-style "bg=$eldritch_bg,fg=$eldritch_fg"

# Status left (session name) - Changed to purple
tmux set -g status-left-style "bg=$eldritch_blue,fg=$eldritch_bg,bold"
tmux set -g status-left-length 40
tmux set -g status-left " #S "

# Status right - Working options to replace clock:

# Option 1: Just hostname with eldritch symbols
# tmux set -g status-right-style "bg=$eldritch_green,fg=$eldritch_bg,bold"
# tmux set -g status-right-length 30
# tmux set -g status-right " ∴ #(whoami)@#h ∴ "

# Option 2: Current directory name
# tmux set -g status-right-style "bg=$eldritch_green,fg=$eldritch_bg,bold"
# tmux set -g status-right-length 50
# tmux set -g status-right " #{b:pane_current_path} "

# Option 3: Git branch (shows current git branch or 'no repo')
# tmux set -g status-right-style "bg=$eldritch_green,fg=$eldritch_bg,bold"
# tmux set -g status-right-length 50
# tmux set -g status-right " #(cd #{pane_current_path}; git branch --show-current 2>/dev/null || echo 'no repo') "

# Option 4: Simple load average (works on most systems)
# tmux set -g status-right-style "bg=$eldritch_green,fg=$eldritch_bg,bold"
# tmux set -g status-right-length 40
# tmux set -g status-right " #(uptime | awk '{print $(NF-2)}' | sed 's/,//') "

# Option 5: User@hostname
# tmux set -g status-right-style "bg=$eldritch_green,fg=$eldritch_bg,bold"
# tmux set -g status-right-length 40
# tmux set -g status-right " #(whoami)@#h "

# Option 6: Session count (if you use multiple sessions)
# tmux set -g status-right-style "bg=$eldritch_green,fg=$eldritch_bg,bold"
# tmux set -g status-right-length 30
# tmux set -g status-right " sessions: #{session_many_attached} "

# Option 7: Just leave it minimal/empty
# tmux set -g status-right-style "bg=$eldritch_green,fg=$eldritch_bg,bold"
# tmux set -g status-right-length 10
# tmux set -g status-right " ∴ "
# 
# Option 8: Display nothing at all
tmux set -g status-right ""

# Window status
tmux set -g window-status-style "bg=$eldritch_bg,fg=$eldritch_bright_black"
tmux set -g window-status-format " #I:#W "

# Active window status - Changed to cyan
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

# Mode styling (copy mode, etc.) - Updated selection color
tmux set -g mode-style "bg=$eldritch_selection_bg,fg=$eldritch_fg"

# Clock mode (still using cyan for when you do use clock commands)
tmux set -g clock-mode-colour "$eldritch_cyan"

# Bell/activity styling
tmux set -g window-status-bell-style "bg=$eldritch_red,fg=$eldritch_bg,bold"
tmux set -g window-status-activity-style "bg=$eldritch_bright_magenta,fg=$eldritch_bg,bold"

# Copy mode highlighting - Updated selection color
tmux set -g copy-mode-match-style "bg=$eldritch_selection_bg,fg=$eldritch_fg"
tmux set -g copy-mode-current-match-style "bg=$eldritch_green,fg=$eldritch_bg"

# Status position
tmux set -g status-position top

# Refresh status more frequently
tmux set -g status-interval 5