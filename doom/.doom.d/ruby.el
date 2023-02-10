;;; ruby.el Ruby-specific configuration -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2023 James Vanderburg
;;
;; Author: James Vanderburg <james@vanderburg.org>
;; Maintainer: James Vanderburg <james@vanderburg.org>
;; Created: February 10, 2023
;; Modified: February 10, 2023
;; Version: 0.0.1
;; Keywords: abbrev bib c calendar comm convenience data docs emulations extensions faces files frames games hardware help hypermedia i18n internal languages lisp local maint mail matching mouse multimedia news outlines processes terminals tex tools unix vc wp
;; Homepage: https://github.com/jameslvdb/ruby
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;
;;
;;; Code:

(defun format-ruby-on-save ()
  "Format Ruby files with standardrb on save."
  (when (eq major-mode 'ruby-mode)
    (message (format "Formatting %s" buffer-file-name))
    (shell-command (format "standardrb --fix %s" buffer-file-name))))

(add-hook 'after-save-hook #'format-ruby-on-save)

(provide 'ruby)
;;; ruby.el ends here
