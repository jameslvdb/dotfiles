;;; capture-templates.el Capture templates for org-mode -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2023 James Vanderburg
;;
;; Author: James Vanderburg <james@vanderburg.org>

;; Capture templates
;; Use after! org since doom loads its own templates
(after! org
  (setq org-capture-templates
        `(
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
          ("i" "Idea inbox" entry
           (file "~/org/inbox.org")
           "* %?")
          ("m" "Meeting notes" entry
           (file+olp+datetree "~/org/meetings.org")
           "* %?\n[%(glv/meeting-time (glv/current-time-rounding-minutes))]\n\n\n\n** Attendees\n"
           :tree-type week :empty-lines 1)
          ("o" "One on One" entry
           (file+olp+datetree "~/org/one-on-ones.org")
           "* %?\n\n"
           :empty-lines 1)
          ("t" "A TODO entry")
          ("tb" "Backend" entry
           (file "~/org/todo-backend.org")
           "* TODO %?"
           :empty-lines 1)
          ("tc" "Frisco Coaching Center" entry
           (file "~/org/todo-frisco-coaching-center.org")
           "* TODO %?"
           :empty-lines 1)
          ("tf" "Frontend" entry
           (file "~/org/todo-frontend.org")
           "* TODO %?"
           :empty-lines 1)
          ("th" "PGA Hope" entry
           (file "~/org/todo-pga-hope.org")
           "* TODO %?"
           :empty-lines 1)
          ("tm" "Mobile app" entry
           (file "~/org/todo-mobile-app.org")
           "* TODO %?"
           :empty-lines 1)
          ("tp" "Personal" entry
           (file "~/org/todo-personal.org")
           "* TODO %?"
           :empty-lines 1)
          ("tt" "General" entry
           (file "~/org/todo.org")
           "* TODO %?"
           :empty-lines 1)
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
