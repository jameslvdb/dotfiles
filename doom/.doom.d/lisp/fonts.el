;;; fonts.el Fonts for my Doom configuration -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2023 James Vanderburg
;;
;; Author: James Vanderburg <james@vanderburg.org>

(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 14 :weight 'regular))
(setq doom-font-increment 1)

(custom-set-faces!
  `(aw-leading-char-face :foreground ,(doom-color 'violet) :height 4.5)
  )
