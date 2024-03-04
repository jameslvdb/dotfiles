;;; user-interface.el --- UI tweaks                  -*- lexical-binding: t; -*-

;; Copyright (C) 2023  James Vanderburg

;; Author: James Vanderburg <james@vanderburg.org>

;; (add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-hook 'window-setup-hook 'toggle-frame-maximized t)
(setq scroll-margin 4)
(setq display-line-numbers-type 'relative)
