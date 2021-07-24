;;; init.el -- initial setting up process -*- lexical-binding: t -*-


;;; Commentary:


;;; Code:

;;; basics
(show-paren-mode t)


;;; package
(require 'package)

(setq package-archives '(("org" . "http://orgmode.org/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))

(package-initialize)

(let ((orig-value package-check-signature))
  (setq package-check-signature nil)

  (let* ((path (expand-file-name ".date-of-last-package-refresh-contents" user-emacs-directory))
	 (today (format-time-string "%Y-%m-%d"))
	 (last-date (when (file-exists-p path)
		      (with-temp-buffer
			(insert-file-contents path)
			(buffer-substring 1 11))))
	 (should-update (or (not last-date)
			    (string< last-date today))))
    (when should-update
      (package-refresh-contents)
      (with-temp-buffer
	(insert today)
	(write-region (point-min) (point-max) path))))

  (package-install 'gnu-elpa-keyring-update)

  (setq package-check-signature orig-value))


;;; use-package initialize
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t) ; automatically install missing packages




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (gnu-elpa-keyring-update))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;; init.el ends here
