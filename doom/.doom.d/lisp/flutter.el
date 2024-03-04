;;; flutter.el --- Flutter configs                   -*- lexical-binding: t; -*-

;; Copyright (C) 2023  James Vanderburg

;; Author: James Vanderburg <james@vanderburg.org>

(defun format-dart-on-save ()
  "Format dart files with dart format on save."
  (when (eq major-mode 'dart-mode)
    (message (format "Formatting %s" buffer-file-name))
    (shell-command (format "dart format %s" buffer-file-name))))

(add-hook 'after-save-hook #'format-dart-on-save)

(setq lsp-dart-sdk-dir "/Users/jamesvanderburg/.asdf/installs/flutter/3.7.0-stable/bin/cache/dart-sdk/")
