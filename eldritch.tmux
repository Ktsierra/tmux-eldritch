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

# Status right - Configurable components
# Control each component individually in your .tmux.conf:
# set -g @eldritch-cpu-status 'on'
# set -g @eldritch-mem-status 'on'
# set -g @eldritch-git-status 'on'
# set -g @eldritch-host-status 'on'
# set -g @eldritch-path-status 'on'

# --- Component Definitions (Tmux format strings) ---
# Each component is a direct tmux format string, including shell commands.
# They are only included in the final status-right string if enabled.

# CPU Usage (macOS specific)
cpu_component="#(top -l 1 | grep 'CPU usage' | awk '{printf \"CPU: %.0f%%\", $3 + $5}')"

# Memory Usage (macOS specific)
mem_component="#(used=$(top -l 1 | grep PhysMem | awk '{print $2}'); total=$(sysctl -n hw.memsize | awk '{printf \"%.0fG\", $1/1024/1024/1024}'); printf \"Mem: %s/%s\" \"$used\" \"$total\")"

# Git Branch
git_component=" #(branch=$(git -C #{pane_current_path} rev-parse --abbrev-ref HEAD 2>/dev/null); if [ -n \"$branch\" ]; then echo \"Git: $branch\"; fi)"

# User@Hostname
host_component=" #(whoami)@#h"

# Current Path
path_component=" #{b:pane_current_path}"

# --- Build the final status-right string ---
# This script runs ONCE when eldritch.tmux is sourced.
# It checks each component's option and builds the final status-right string.

final_status_right=""
separator=" | "

# Function to append component if enabled
append_component() {
    local option_name="$1"
    local component_string="$2"
    if [ "$(tmux show-options -gqv "$option_name")" = "on" ]; then
        if [ -n "$final_status_right" ]; then
            final_status_right="$final_status_right$separator"
        fi
        final_status_right="$final_status_right$component_string"
    fi
}

# Append components based on user settings
append_component @eldritch-cpu-status "$cpu_component"
append_component @eldritch-mem-status "$mem_component"
append_component @eldritch-git-status "$git_component"
append_component @eldritch-host-status "$host_component"
append_component @eldritch-path-status "$path_component"

# --- Apply Settings ---
tmux set -g status-right-length 120 # Increased length for more components
tmux set -g status-right-style "bg=$eldritch_green,fg=$eldritch_bg,bold"

# Set the final, constructed string to the status-right option
# Add padding spaces around the final string
if [ -n "$final_status_right" ]; then
    tmux set -g status-right " $final_status_right "
else
    tmux set -g status-right ""
fi


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