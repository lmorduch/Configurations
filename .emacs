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

;; Packages                                                                                                                                                                                                                                   
(add-to-list 'load-path "~/.emacs.d/")

;;tabs                                                                                                                                                                                                                                        
(setq-default indent-tabs-mode nil)

;; CUA mode                                                                                                                                                                                                                                   
(cua-mode 1)

;; Column number                                                                                                                                                                                                                              
(column-number-mode 1)

;; Key settings                                                                                                                                                                                                                               
(global-set-key [(f2)] 'make-frame-command)

(global-set-key [(f3)] 'other-frame)

(global-set-key [(f4)] 'delete-frame)

(global-set-key [(f5)] 'undo)

(global-set-key [(f6)] 'goto-line)

(global-set-key [(f8)] 'scroll-down)

(global-set-key [(f9)] 'scroll-up)

(global-set-key (kbd "C-g") 'forward-word)

(global-set-key (kbd "C-f") 'backward-word)

(global-set-key [(f7)] 'indent-region)

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


;; WHITESPACE                                                                                                                                                                                                                                 
(load "highlight-chars.el")
(require 'highlight-chars)
(add-hook 'font-lock-mode-hook 'hc-highlight-tabs)
(add-hook 'font-lock-mode-hook 'hc-highlight-trailing-whitespace)
