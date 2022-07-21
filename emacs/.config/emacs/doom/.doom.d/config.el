;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "James Vanderburg"
      user-mail-address "james@vanderburg.org")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; Enable local variables
(setq-default enable-local-variables t)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; When using an external keyboard and switching modifier keys (e.g., Win -> opt,
;; or alt -> cmd) in System Preferences, macOS seems to replace the left alt key
;; with the right alt key, which Emacs does not recognize as the meta key.
(cond (IS-MAC
       (setq mac-right-option-modifier 'meta)))


;; Use JetBrains Mono.
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 14 :weight 'regular))

;; Make s-+ and s-- change font size by 1 instead of 2 (default).
(setq doom-font-increment 1)

;; Always start Emacs maximized.
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(setq doom-themes-treemacs-theme "doom-colors")

;; Use tree-sitter for syntax highlighting.
(use-package! tree-sitter
  :config
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

;; Set up avy char jumping with SPC j
(map! :leader
      :desc "Jump to char" "j" #'avy-goto-char-timer)
(setq avy-timeout-seconds 0.3)

;; Use M-g to goto definitions
(map! "M-g" #'evil-goto-definition)

;; Disable rubocop flychecker globally.
(setq flycheck-disabled-checkers '(ruby-rubocop))

;; Disable all ruby flycheckers in org-src blocks.
(defun disable-flycheck-in-org-src-block ()
  (setq-local flycheck-disabled-checkers '(ruby-rubocop ruby-standard)))
(add-hook 'org-src-mode-hook 'disable-flycheck-in-org-src-block)

(beacon-mode 1)
(setq beacon-blink-when-point-moves-vertically 5)
(setq beacon-blink-when-point-moves-horizontally 10)
(setq beacon-blink-when-focused t)

(setq vterm-shell 'fish)

;; === Org-mode ===

;; Show completion datetime when marking an org-todo item as done.
(setq org-log-done 'time)

;; Set auto-wrap at 80 chars
(add-hook 'org-mode-hook '(lambda () (setq fill-column 80)))
(add-hook 'org-mode-hook 'turn-on-auto-fill)

;; Flip ` and ~ for easier code fence typing (Markdown-style)
(map! :map org-mode-map
      :i "`" #'jlv/insert-tilde
      :i "~" #'jlv/insert-backtick)

(defun jlv/insert-tilde ()
  "Insert a tilde at the current point"
  (interactive)
  (insert "~"))
(defun jlv/insert-backtick ()
  "Insert a backtick at the current point"
  (interactive)
  (insert "`"))

;; Add LaTeX class for ACM article exporting
(with-eval-after-load 'ox-latex
  (add-to-list 'org-latex-classes
             '("acm"
               "\\documentclass[manuscript, review=false, screen, nonacm]{acmart}"
               ("\\section{%s}" . "\\section*{%s}"))))

;; Set tags to be flush with right edge
(after! org
  (setq org-tags-column -90))

;; (defun jlv/align-org-tags-on-save ()
;;   "Align org tags on save."
;;   (interactive
;;    (when (eq major-mode 'org-mode)
;;      (message (format "Formatting %s" buffer-file-name))
;;      (org-align-tags)))
;;    )

;; (add-hook 'after-save-hook #'jlv/align-org-tags-on-save)

;; Capture templates
;; Use after! org since doom loads its own templates
(after! org
  (setq org-capture-templates
        '(
          ("a" "A scheduled task" entry
           (file "~/org/todo.org")
           "* TODO %?\nSCHEDULED: %t")
          ("b" "Book finished" entry
           (file+olp "~/org/books.org" "Books Read" ,(format-time-string "%Y"))
           "*** /%?/\n:PROPERTIES:\n:AUTHOR: %^{AUTHOR}p\n:PUBLISHED: %^{PUBLISHED}\n:GENRE: %^{GENRE}p\n:SERIES: %^{SERIES}p\n:COMPLETED: %^u\n:COUNT: 1\n:END:\n\n"
           :empty-lines 1)
          ("B" "Bible Study" entry
           (file+olp "~/org/bible-study.org" "Bible Study Notes", (format-time-string "%Y"))
           "*** /%?")
          ("d" "Daily notes" entry
           (file+olp+datetree "~/org/logs.org")
           "* %?\n\n"
           :tree-type week :empty-lines 1)
          ("e" "An Emacs tweak" entry
           (file "~/org/emacs.org")
           "* TODO %?")
          ("m" "Meeting notes" entry
           (file+olp+datetree "~/org/meetings.org")
           "* %?\n[%(glv/meeting-time (glv/current-time-rounding-minutes))]\n\n\n\n** Attendees\n"
           :tree-type week :empty-lines 1)
          ("o" "One on One" entry
           (file+olp+datetree "~/org/one-on-ones.org")
           "* %?\n\n"
           :empty-lines 1)
          ("q" "Question to ask" entry
           (file+olp "~/org/pga.org" "Questions")
           "** TODO %? %^g")
          ("t" "A TODO entry" entry
           (file "~/org/todo.org")
           "* TODO %?")
          )))

;; I could do the timestamp thing with org-timestamp-from-time and lose
;; glv/meeting-time. I tried it and got a "must return a string" error, but
;; it's documented to do that, so I don't know what I was doing wrong.
;;
;; I could *almost* do away with all of the custom code by setting
;; org-datetree-add-timestamp to inactive (although I don't know where it puts
;; it, and apparently it doesn't include the time) and setting
;; org-timestamp-rounding-minutes to 15. Emacs, man.

(defun glv/meeting-time (time)
  "Formats TIME as an 'org-mode' timestamp (sans brackets)."
  (format-time-string "%Y-%m-%d %a %H:%M" time))

(defun glv/current-time-rounding-minutes ()
  "Rounds (current-time) to the nearest fifteen minutes."
  (let* ((decoded-time (decode-time (current-time)))
         (minutes (decoded-time-minute decoded-time))
         (rounded-minutes (* (round (/ (float minutes) 15)) 15))
         (delta (- rounded-minutes minutes))
         (rounded-time (decoded-time-add decoded-time
                                         (make-decoded-time :minute delta))))
    (encode-time rounded-time)))

;; === Org-roam

(setq org-roam-directory (file-truename "~/org-roam"))
(org-roam-db-autosync-mode)

(use-package! websocket
  :after org-roam)

(use-package! org-roam-ui
  :after org-roam
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))

;; Org Faces

(custom-set-faces!
  '(org-document-title :height 1.4)
  '(org-heading-1 :height 1.3)
  '(org-heading-2 :height 1.2))

;; === Markdown ===

;; Faces
(custom-set-faces!
  '(markdown-header-face-1 :inherit org-document-title :height 1.4)
  '(markdown-header-face-2 :inherit outline-1 :height 1.3)
  '(markdown-header-face-3 :inherit outline-2 :height 1.2)
  '(markdown-header-face-4 :inherit outline-3 :height 1.2)
  '(markdown-header-face-5 :inherit outline-4)
  '(markdown-header-face-6 :inherit outline-5)
  `(markdown-list-face :foreground ,(doom-color 'blue))
  `(markdown-header-delimiter-face :foreground ,(doom-color 'fg)))

;; Text wrapping
(add-hook 'markdown-mode-hook '(lambda () (setq fill-column 80)))
(add-hook 'markdown-mode-hook 'turn-on-auto-fill)

;; === Ruby ===

(defun format-ruby-on-save ()
  "Format ruby files with standardrb on save."
  (when (eq major-mode 'ruby-mode)
    (message (format "Formatting %s" buffer-file-name))
    (shell-command (format "standardrb --fix %s" buffer-file-name))))

(add-hook 'after-save-hook #'format-ruby-on-save)

;; (defun insert-let-var ()
;;   "Inserts 'let(:model-name) { create :model-name }' at point"
;;   (interactive)
;;   (let ((model-name (read-string "factory name: ")))
;;     (insert "let(:" model-name ") { create :" model-name " }"))
;;   )

;; (map! :leader
;;       :desc "Insert basic factory" "m t f" #'insert-let-var)

;; === Magit ===

;; Set a keybind for git-commit-co-authored
(map! :after git-commit
      :map git-commit-mode-map
      :localleader
      "c" #'git-commit-co-authored)
