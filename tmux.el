;;; ../../development/dotfiles/.config/doom/tmux.el -*- lexical-binding: t; -*-

(use-package! tmux-pane
  :config
  (tmux-pane-mode)
  (map! :leader
        (:prefix ("v" . "tmux")
         :desc "Open vertical" :nv "o" #'tmux-pane-open-vertical
         :desc "Open horizontal" :nv "h" #'tmux-pane-open-horizontal
         :desc "Open vertical" :nv "v" #'tmux-pane-open-vertical
         :desc "Open horizontal" :nv "s" #'tmux-pane-open-horizontal
         :desc "Close pane" :nv "c" #'tmux-pane-close
         :desc "Rerun command" :nv "r" #'tmux-pane-rerun))
  (map! :leader
        (:prefix "t"
         :desc "vertical tmux" :nv "v" #'tmux-pane-toggle-vertical
         :desc "horizontal tmux" :nv "h" #'tmux-pane-toggle-horizontal)))

;; override 'C-\\' defined in evil-motion-state-map
(after! (evil tmux-pane)
  (define-key evil-motion-state-map "\C-\\"
    (lambda () (interactive) (tmux-pane--windmove "last" "tmux select-pane -l"))))
