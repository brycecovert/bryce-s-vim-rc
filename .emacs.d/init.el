
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")))
(package-initialize)

(defvar my-packages '(starter-kit
                      starter-kit-lisp
                      starter-kit-bindings
                      starter-kit-eshell
                      clojure-mode
                      evil
                      paredit
                      cider))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(require 'evil)
    (evil-mode 1)

;; (defun cider-eval-expression-at-point-in-repl ()
;;   (interactive)
;;   (let ((form (cider-defun-at-point)))
;;     ;; Strip excess whitespace
;;     (while (string-match "\\`\s+\\|\n+\\'" form)
;;       (setq form (replace-match "" t t form)))
;;     (set-buffer (cider-find-or-create-repl-buffer))
;;     (goto-char (point-max))
;;     (insert form)
;;     (cider-repl-return)))

;; (defun clj-scratch ()
;;   "Create/retrieve a Clojure scratch buffer and switch to it.."
;;   (interactive)
;;   (let ((buf (get-buffer-create "*clj-scratch*")))
;;     (switch-to-buffer buf)
;;         (clojure-mode)))

(require 'linum)
;; (mapcar #'(lambda (mode-hook)
;;             (add-hook mode-hook 'flyspell-mode))
;;         '(latex-mode-hook
;;           magit-log-edit-mode-hook
;;           org-mode-hook))

;;(mapcar #'(lambda (mode-hook)
;;             (add-hook mode-hook 'linum-mode))
;;         '(clojure-mode-hook
;;           ))

; (eval-after-load 'paredit
;   ;; need a binding that works in the terminal
;    '(define-key paredit-mode-map (kbd "M-}") 'paredit-forward-barf-sexp))
; 
; (eval-after-load 'paredit
;   ;; need a binding that works in the terminal
;   '(define-key paredit-mode-map (kbd "M-{") paredit-backward-barf-sexp))

(global-auto-revert-mode 1)
(defvar ack-history nil
  "History for the `ack' command.")

(defun ack (command-args)
  (interactive
   (let ((ack-command "ack --nogroup --with-filename --follow "))
     (list (read-shell-command "Run ack (like this): "
                               ack-command
                               'ack-history))))
  (let ((compilation-disable-input t))
    (compilation-start (concat command-args " < " null-device)
                                              'grep-mode)))



(add-hook 'cider-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map (kbd "M-.") 'cider-jump)
            (define-key evil-normal-state-local-map (kbd "C-y") 'yank)
            (define-key evil-normal-state-local-map (kbd "M-,") 'cider-jump-back)))

(add-hook 'clojure-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map (kbd "C-c C-f") 'origami-toggle-node)
            (define-key evil-normal-state-local-map (kbd "M-.") 'cider-jump)
                (define-key evil-normal-state-local-map (kbd "M-,") 'cider-jump-back)))
(setq js-indent-level 2)
;; (custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;;  '(package-selected-packages
;;    (quote
;;     (cider-eval-sexp-fu web-mode starter-kit-lisp starter-kit-eshell starter-kit-bindings rainbow-mode rainbow-delimiters origami org jsx-mode js3-mode js2-mode groovy-mode evil clojure-test-mode))))
;; (custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;;  )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (evil starter-kit-lisp starter-kit-eshell starter-kit-bindings cider))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
