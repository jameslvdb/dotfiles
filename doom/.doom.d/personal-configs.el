;;; personal-configs.el --- Personal Configuration -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2023 James Vanderburg
;;
;; Author: James Vanderburg <james@vanderburg.org>
;; Maintainer: James Vanderburg <james@vanderburg.org>
;; Created: February 10, 2023
;; Modified: February 10, 2023
;;
;;; Code:

;; Font faces
(load! "lisp/fonts.el")
;; Capture Templates for org-mode
(load! "lisp/capture-templates.el")
;; General keybinding remaps
(load! "lisp/remaps.el")
;; Ruby configs
(load! "lisp/ruby.el")
;; Magit configs
(load! "lisp/magit.el")

;;; personal-configs.el ends here
