;;; javascript.el --- Personal JS configs            -*- lexical-binding: t; -*-

;; Copyright (C) 2023  James Vanderburg

;; Author: James Vanderburg <james@vanderburg.org>

(defun jlv/format-react-files ()
  "Format js files on save"
  (when (eq major-mode 'rjsx-mode)
    (message (format "Formatting %s" buffer-file-name))
    (shell-command (format "yarn run prettier-standard %s" buffer-file-name))))

(add-hook 'after-save-hook #'jlv/format-react-files)

;; === CSS ===
(add-hook 'rjsx-mode #'rainbow-mode)
