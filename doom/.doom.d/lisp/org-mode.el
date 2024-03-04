;;; org-mode.el --- Configuration for org-mode       -*- lexical-binding: t; -*-

;; Copyright (C) 2023  James Vanderburg

;; Author: James Vanderburg <james@vanderburg.org>

;; Set auto-wrap at 80 characters
(add-hook 'org-mode-hook #'(lambda () (setq fill-column 80)))
(add-hook 'org-mode-hook 'turn-on-auto-fill)

;; Add pgahq/pga-site-redesign issue link-type
(defun make-pga-site-redesign-link (issue-number)
  (browse-url (concat "https://github.com/pgahq/pga-site-redesign/issues/" issue-number)))

(after! org
  (org-link-set-parameters "pga-backend"
                           :follow #'(jlv/pgahq-follow "backend")
                           :export #'(jlv/pgahq-export "backend"))
  (org-link-set-parameters "coaching-programs-frontend"
                           :follow #'(jlv/pgahq-follow "frontend")
                           :export #'(jlv/pgahq-export "frontend"))
  (org-link-set-parameters "pga-site-redesign"
                           :follow
                           #'make-pga-site-redesign-link))

(defun jlv/pgahq-follow (repo)
  (pcase repo
    (`backend #'jlv/follow-coach-tools-backend)
    (`frontend #'jlv/follow-coaching-programs-frontend)))

(defun jlv/pgahq-export (repo)
  (pcase repo
    (`backend #'jlv/coach-tools-backend-export)
    (`frontend #'jlv/coaching-programs-frontend-export)))


(defun jlv/follow-coach-tools-backend (issue-number)
  (browse-url (jlv/coach-tools-backend-issue-link issue-number)))
(defun jlv/coach-tools-backend-issue-link (issue-number)
  (concat "https://github.com/pgahq/coach-tools-backend/issues/" issue-number))
(defun jlv/coach-tools-backend-export (link description format _)
  "Export a link to a coach-tools-backend issue."
  (let ((path (jlv/coach-tools-backend-issue-link link))
        (desc (or description link)))
    (pcase format
      (`html (format "<a target=\"_blank\" href=\"%s\">%s</a>" path desc))
      (`md (format "[%s](%s)" desc path))
      (`latex (format "\\href{%s}{%s}" path desc))
      (`ascii (format "%s (%s)" desc path))
      (_ path))))

(defun jlv/follow-coaching-programs-frontend (issue-number)
  (browse-url (jlv/coaching-programs-frontend-link issue-number)))
(defun jlv/coaching-programs-frontend-link (issue-number)
  (concat "https://github.com/pgahq/coaching-programs-frontend/issues/" issue-number))
(defun jlv/coaching-programs-frontend-export (link description format _)
  "Export a link to a coaching-programs-frontend issue."
  (let ((path (jlv/coaching-programs-frontend-link link))
        (desc (or description link)))
    (pcase format
      (`html (format "<a target=\"_blank\" href=\"%s\">%s</a>" path desc))
      (`md (format "[%s](%s)" desc path))
      (`latex (format "\\href{%s}{%s}" path desc))
      (`ascii (format "%s (%s)" desc path))
      (_ path))))

;; Sets tags to be flush-ish to the right edge
;; (after! org
;;   (setq org-tags-column -90))

(defun jlv/align-org-tags-on-save ()
  "Align org tags on save."
  (interactive
   (when (eq major-mode 'org-mode)
     (message (format "Formatting %s" buffer-file-name))
     (org-align-tags)))
   )

(defun jlv/org-align-all-tags ()
  "Align all org tags."
  (interactive)
  (org-align-tags t))

;; org-todo-keywords
(after! org
  (setq org-todo-keywords
        (add-to-list 'org-todo-keywords
                     '(sequence "QUES(q)" "|" "ASWR(a)"))))

;; org-contacts
(after! org
  (setq org-contacts-files '("~/org/contacts.org")))

(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

(use-package! org-journal
  :config
  (setq org-journal-dir "~/org/journal/")
  (setq org-journal-file-format "%Y-%m-%d"))
