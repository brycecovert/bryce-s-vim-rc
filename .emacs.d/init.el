(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(defvar my-packages '(starter-kit
                      starter-kit-lisp
                      starter-kit-bindings
                      starter-kit-eshell
                      clojure-mode
                      clojure-test-mode
                      paredit
                      cider))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(require 'evil)
    (evil-mode 1)

(defun cider-eval-expression-at-point-in-repl ()
  (interactive)
  (let ((form (cider-defun-at-point)))
    ;; Strip excess whitespace
    (while (string-match "\\`\s+\\|\n+\\'" form)
      (setq form (replace-match "" t t form)))
    (set-buffer (cider-find-or-create-repl-buffer))
    (goto-char (point-max))
    (insert form)
    (cider-repl-return)))

(defun clj-scratch ()
  "Create/retrieve a Clojure scratch buffer and switch to it.."
  (interactive)
  (let ((buf (get-buffer-create "*clj-scratch*")))
    (switch-to-buffer buf)
        (clojure-mode)))

(require 'linum)
()
(mapcar #'(lambda (mode-hook)
             (add-hook mode-hook 'flyspell-mode))
         '(latex-mode-hook
           magit-log-edit-mode-hook
           org-mode-hook))

(mapcar #'(lambda (mode-hook)
             (add-hook mode-hook 'linum-mode))
         '(clojure-mode-hook
           ))

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
            (define-key evil-normal-state-local-map (kbd "M-.") 'cider-jump)
                (define-key evil-normal-state-local-map (kbd "M-,") 'cider-jump-back)))
