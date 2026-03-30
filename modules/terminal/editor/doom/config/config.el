;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `with-eval-after-load' block, otherwise Doom's defaults may override your
;; settings. E.g.
;;
;;   (with-eval-after-load 'PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look them up).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Dashboard
(setq +dashboard-ascii-banner-fn nil)
(defun +dashboard-widget-footer ())

;; Font
(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 16.0 :weight 'normal))
(set-fontset-font t 'unicode (font-spec :family "Symbola") nil 'append)

;; Theme
(setq doom-theme 'doom-gruvbox)

;; Line Numbers
(setq display-line-numbers-type 'relative)

;; Which Key
(with-eval-after-load 'which-key
  (setq which-key-idle-delay 0.05))

;; Org
(setq org-directory "~/org/")

;; Buffers
(with-eval-after-load 'centaur-tabs
  (centaur-tabs-mode t)
  (setq centaur-tabs-style "bar"
        centaur-tabs-height 32
        centaur-tabs-set-icons t
        centaur-tabs-set-modified-marker t
        centaur-tabs-show-navigation-buttons nil
        centaur-tabs-set-bar 'under
        x-underline-at-descent-line t)
  ; M-1 through M-9 to switch buffers
  (dotimes (i 9)
    (let ((n (+ i 1)))
      (map! :n (kbd (format "M-%d" n))
            (lambda () (interactive) (centaur-tabs-select-visible-nth-tab n))))))
