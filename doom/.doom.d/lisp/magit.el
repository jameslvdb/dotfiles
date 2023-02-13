;;; magit.el Magit config -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2023 James Vanderburg
;;
;; Author: James Vanderburg <james@vanderburg.org>

(require 'magit)

(map! :after git-commit
      :map git-commit-mode-map
      :localleader
      "c" #'git-commit-co-authored)
