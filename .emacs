;; Custom colors
(custom-set-faces
 '(default ((t (:stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 80 :width normal :family "xos4-terminus")))))

(global-set-key [(f2)] 'make-frame-command)

(global-set-key [(f3)] 'delete-frame)

(global-set-key [(f4)] 'other-frame)

(global-set-key [(f5)] 'undo)

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

;;packages
(add-to-list 'load-path "~/emacsplugs")
