;;; ruby.el Ruby-specific configuration -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2023 James Vanderburg
;;
;; Author: James Vanderburg <james@vanderburg.org>

(defun format-ruby-on-save ()
  "Format Ruby files with standardrb on save."
  (when (eq major-mode 'ruby-mode)
    (message (format "Formatting %s" buffer-file-name))
    (shell-command (format "standardrb --fix %s" buffer-file-name))))

(add-hook 'after-save-hook #'format-ruby-on-save)

;; Brace management
(sp-local-pair 'ruby-mode "{" nil :post-handlers '((my-create-newline-and-enter-sexp "RET")))

(defun my-create-newline-and-enter-sexp (&rest _ignored)
  "Open a new brace or bracket expression, with relevant newlines and indent. "
  (newline)
  (indent-according-to-mode)
  (forward-line -1)
  (indent-according-to-mode))
