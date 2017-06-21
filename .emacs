(setq-default mode-line-buffer-identification
              (list 'buffer-file-name
                    (propertized-buffer-identification "%12f")
                    (propertized-buffer-identification "%12b")))

(add-hook 'dired-mode-hook
          (lambda ()
            ;; TODO: handle (DIRECTORY FILE ...) list value for dired-directory
            (setq mode-line-buffer-identification
                  ;; emulate "%17b" (see dired-mode):
                  '(:eval
                    (propertized-buffer-identification
                     (if (< (length default-directory) 17)
                         (concat default-directory
                                 (make-string (- 17 (length default-directory))
                                              ?\s))
                       default-directory))))))

;; packages
(add-to-list 'load-path "~/.emacs.d/packages")

;;tabs
(setq-default indent-tabs-mode nil)

;; CUA mode
(cua-mode 1)

;; Column number
(column-number-mode 1)

;; display full file path
(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
            '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

;; ------------------------------------------------ autosave and backup
;; Put autosave files (ie #foo#) in one place, *not* scattered all over the
;; file system! (The make-autosave-file-name function is invoked to determine
;; the filename of an autosave file.)
(defvar autosave-dir (concat "/tmp/emacs_" (user-login-name) "/"))
(make-directory autosave-dir t)

(defun auto-save-file-name-p (filename)
  (string-match "^#.*#$" (file-name-nondirectory filename)))

(defun make-auto-save-file-name ()
  (concat autosave-dir
          (if buffer-file-name
              (concat "#" (file-name-nondirectory buffer-file-name) "#")
            (expand-file-name
             (concat "#%" (buffer-name) "#")))))

;; Put backup files (ie foo~) in one place too. (The backup-directory-alist
;; list contains regexp=>directory mappings; filenames matching a regexp are
;; backed up in the corresponding directory. Emacs will mkdir it if necessary.)

(defvar backup-dir (concat "/tmp/emacs_backups/" (user-login-name) "/"))
(setq backup-directory-alist (list (cons "." backup-dir)))
(setq bkup-backup-directory-info (list (cons "." backup-dir)))
(setq make-backup-files nil)

;; package imports/other stuff with external packages
(require 'package)
;; MELPA
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

;; python ide stuff
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))

;; WHITESPACE
(load "highlight-chars.el")
(require 'highlight-chars)
(add-hook 'font-lock-mode-hook 'hc-highlight-tabs)
(add-hook 'font-lock-mode-hook 'hc-highlight-trailing-whitespace)

(package-initialize)

;; nose stuff
(require 'nose)
(add-hook 'python-mode-hook (lambda () (nose-mode t)))

;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; more python ide stuff
(elpy-enable)

(provide '.emacs)
;;; .emacs ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-flymake elpy-module-pyvenv elpy-module-yasnippet elpy-module-sane-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; jdee
(add-to-list 'load-path "~/.emacs.d/jdee-2.4.1/lisp")
(load "jde")

;; Key settings
(global-set-key [(f2)] 'make-frame-command)

(global-set-key [(f3)] 'other-frame)

(global-set-key [(f4)] 'delete-frame)

(global-set-key [(f5)] 'undo)

(global-set-key [(f6)] 'goto-line)

(global-set-key [(f7)] 'indent-region)

(global-set-key [(f8)] 'scroll-down)

(global-set-key [(f9)] 'scroll-up)

(global-set-key [(f12)] 'clipboard-yank)

(global-set-key (kbd "C-g") 'forward-word)

(global-set-key (kbd "C-f") 'backward-word)

(global-set-key (kbd "C-`") 'delete-frame)
(global-set-key (kbd "C-d") 'next-multiframe-window)
(global-set-key (kbd "C-c a") 'nosetests-module)
