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

# Status right - Configurable and combinable components
# Set the desired components in your .tmux.conf file, separated by spaces.
# e.g., set -g @eldritch-status-right "cpu mem git"

# Available components: cpu, mem, git, host, path

# Set a generous length to accommodate combined components
tmux set -g status-right-length 100
tmux set -g status-right-style "bg=$eldritch_green,fg=$eldritch_bg,bold"

# The entire script is placed inside the status-right option to ensure
# functions are defined in the same shell context where they are called.
tmux set -g status-right "#( \
    _get_cpu() { \
        top -l 1 | grep \"CPU usage\" | awk '{printf \"CPU: %.0f%%\", $3 + $5}'; \
    }; \
    _get_mem() { \
        total_mem_bytes=$(sysctl -n hw.memsize); \
        total_mem_gb=$(echo \"$total_mem_bytes\" | awk '{printf \"%.1f\", $1/1024/1024/1024}'); \
        used_mem_mb=$(top -l 1 | grep PhysMem | awk '{print $2}' | sed 's/M//'); \
        used_mem_gb=$(echo \"$used_mem_mb\" | awk '{printf \"%.1f\", $1/1024}'); \
        printf \"Mem: %sG/%sG\" \"$used_mem_gb\" \"$total_mem_gb\"; \
    }; \
    _get_git() { \
        branch=$(cd #{pane_current_path} && git branch --show-current 2>/dev/null); \
        if [ -n \"$branch\" ]; then echo \"Git: $branch\"; fi; \
    }; \
    _get_hostname() { \
        echo \"#(whoami)@#h\"; \
    }; \
    _get_path() { \
        echo \"#{b:pane_current_path}\"; \
    }; \
    components_to_show=$(tmux show-options -gqv @eldritch-status-right); \
    final_status=\"\"; \
    separator=\" | \"; \
    for component in $components_to_show; do \
        output=\"\"; \
        case \"$component\" in \
            cpu) output=$(_get_cpu) ;; \
            mem) output=$(_get_mem) ;; \
            git) output=$(_get_git) ;; \
            host) output=$(_get_hostname) ;; \
            path) output=$(_get_path) ;; \
        esac; \
        if [ -n \"$output\" ]; then \
            if [ -n \"$final_status\" ]; then \
                final_status=\""$final_status"$separator\"; \
            fi; \
            final_status=\""$final_status"$output\"; \
        fi; \
    done; \
    echo \" $final_status \"; \
)


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