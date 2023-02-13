;;; org-mode.el --- Configuration for org-mode       -*- lexical-binding: t; -*-

;; Copyright (C) 2023  James Vanderburg

;; Author: James Vanderburg <james@vanderburg.org>

;; Set auto-wrap at 80 characters
(add-hook 'org-mode-hook '(lambda () (setq fill-column 80)))
(add-hook 'org-mode-hook 'turn-on-auto-fill)
