;;; magit.el Magit config -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2023 James Vanderburg
;;
;; Author: James Vanderburg <james@vanderburg.org>
;; Maintainer: James Vanderburg <james@vanderburg.org>
;; Created: February 10, 2023
;; Modified: February 10, 2023
;;
;;; Code:

(require 'magit)

(map! :after git-commit
      :map git-commit-mode-map
      :localleader
      "c" #'git-commit-co-authored)
;;; magit.el ends here
