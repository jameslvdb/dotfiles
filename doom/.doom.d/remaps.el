;;; remaps.el Keybinding remaps -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2023 James Vanderburg
;;
;; Author: James Vanderburg <james@vanderburg.org>
;; Maintainer: James Vanderburg <james@vanderburg.org>
;; Created: February 10, 2023
;; Modified: February 10, 2023
;; Version: 0.0.1
;;
;; This file is not part of GNU Emacs.
;;
;;; Code:

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

(provide 'remaps)
;;; remaps.el ends here
