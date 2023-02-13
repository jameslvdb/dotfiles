;;; remaps.el Keybinding remaps -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2023 James Vanderburg
;;
;; Author: James Vanderburg <james@vanderburg.org>

;; Set left alt key to be recognized as meta
(cond (IS-MAC
      (setq mac-right-option-modifier 'meta)))

;; Flip ` and ~ for easier code fence typing (Markdown-style)
(map! :map org-mode-map
      :i "`" #'jlv/insert-tilde
      :i "~" #'jlv/insert-backtick)

(defun jlv/insert-tilde ()
  "Insert a tilde at the current point"
  (interactive)
  (insert "~"))
(defun jlv/insert-backtick ()
  "Insert a backtick at the current point"
  (interactive)
  (insert "`"))
