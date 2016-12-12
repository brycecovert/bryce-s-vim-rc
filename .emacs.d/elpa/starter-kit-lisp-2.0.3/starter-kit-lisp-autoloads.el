;;; starter-kit-lisp-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "starter-kit-lisp" "../../../../../.emacs.d/elpa/starter-kit-lisp-2.0.3/starter-kit-lisp.el"
;;;;;;  "36a6a0544e78f91d1fe2c04bd8277930")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/starter-kit-lisp-2.0.3/starter-kit-lisp.el

(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)

(add-hook 'emacs-lisp-mode-hook 'esk-remove-elc-on-save)

(add-hook 'emacs-lisp-mode-hook 'esk-prog-mode-hook)

(add-hook 'emacs-lisp-mode-hook 'elisp-slime-nav-mode)

(defun esk-remove-elc-on-save nil "\
If you're saving an elisp file, likely the .elc is no longer valid." (make-local-variable (quote after-save-hook)) (add-hook (quote after-save-hook) (lambda nil (if (file-exists-p (concat buffer-file-name "c")) (delete-file (concat buffer-file-name "c"))))))

(define-key emacs-lisp-mode-map (kbd "C-c v") 'eval-buffer)

(define-key read-expression-map (kbd "TAB") 'lisp-complete-symbol)

(define-key lisp-mode-shared-map (kbd "RET") 'reindent-then-newline-and-indent)

(defface esk-paren-face '((((class color) (background dark)) (:foreground "grey50")) (((class color) (background light)) (:foreground "grey55"))) "\
Face used to dim parentheses." :group (quote starter-kit-faces))

(eval-after-load 'paredit '(define-key paredit-mode-map (kbd "M-)") 'paredit-forward-slurp-sexp))

(dolist (mode '(scheme emacs-lisp lisp clojure)) (when (> (display-color-cells) 8) (font-lock-add-keywords (intern (concat (symbol-name mode) "-mode")) '(("(\\|)" quote esk-paren-face)))) (add-hook (intern (concat (symbol-name mode) "-mode-hook")) 'esk-turn-on-paredit) (add-hook (intern (concat (symbol-name mode) "-mode-hook")) 'esk-turn-on-paredit))

(defun esk-pretty-fn nil (font-lock-add-keywords nil `(("(\\(fn\\>\\)" (0 (progn (compose-region (match-beginning 1) (match-end 1) "ƒ") nil))))))

(add-hook 'clojure-mode-hook 'esk-pretty-fn)

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/starter-kit-lisp-2.0.3/starter-kit-lisp-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/starter-kit-lisp-2.0.3/starter-kit-lisp.el")
;;;;;;  (22509 26379 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; starter-kit-lisp-autoloads.el ends here
