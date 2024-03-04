;;; personal-configs.el --- Personal Configuration -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2023 James Vanderburg
;;
;; Author: James Vanderburg <james@vanderburg.org>

;; accept completion from copilot and fallback to company
(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (:map copilot-completion-map
              ("<tab>" . 'copilot-accept-completion)
              ("TAB" . 'copilot-accept-completion)
              ("C-TAB" . 'copilot-accept-completion-by-word)
              ("C-<tab>" . 'copilot-accept-completion-by-word)))
