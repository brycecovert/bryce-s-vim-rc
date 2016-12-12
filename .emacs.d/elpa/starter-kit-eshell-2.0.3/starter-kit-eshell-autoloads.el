;;; starter-kit-eshell-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "starter-kit-eshell" "../../../../../.emacs.d/elpa/starter-kit-eshell-2.0.3/starter-kit-eshell.el"
;;;;;;  "d704960d2b547836c8522afee98a5467")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/starter-kit-eshell-2.0.3/starter-kit-eshell.el

(eval-after-load 'esh-opt '(progn (require 'em-prompt) (require 'em-term) (require 'em-cmpl) (setenv "PAGER" "cat") (set-face-attribute 'eshell-prompt nil :foreground "turquoise1") (add-hook 'eshell-mode-hook '(lambda nil (define-key eshell-mode-map "" 'eshell-bol))) (setq eshell-cmpl-cycle-completions nil) (add-to-list 'eshell-visual-commands "ssh") (add-to-list 'eshell-visual-commands "tail") (add-to-list 'eshell-command-completions-alist '("gunzip" "gz\\'")) (add-to-list 'eshell-command-completions-alist '("tar" "\\(\\.tar|\\.tgz\\|\\.tar\\.gz\\)\\'"))))

(autoload 'eshell/cds "starter-kit-eshell" "\
Change directory to the project's root.

\(fn)" nil nil)

(autoload 'eshell/cds "starter-kit-eshell" "\
Change directory to the project's root.

\(fn)" nil nil)

(autoload 'eshell/cdl "starter-kit-eshell" "\
Change directory to the project's root.

\(fn)" nil nil)

(autoload 'eshell/cdg "starter-kit-eshell" "\
Change directory to the project's root.

\(fn)" nil nil)

(when (not (functionp 'eshell/find)) (defun eshell/find (dir &rest opts) (find-dired dir (mapconcat (lambda (arg) (if (get-text-property 0 'escaped arg) (concat "\"" arg "\"") arg)) opts " "))))

(when (not (functionp 'eshell/rgrep)) (defun eshell/rgrep (&rest args) "Use Emacs grep facility instead of calling external grep." (eshell-grep "rgrep" args t)))

(autoload 'eshell/extract "starter-kit-eshell" "\


\(fn FILE)" nil nil)

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/starter-kit-eshell-2.0.3/starter-kit-eshell-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/starter-kit-eshell-2.0.3/starter-kit-eshell.el")
;;;;;;  (22509 26381 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; starter-kit-eshell-autoloads.el ends here
