(defun yh-doit-if-not-yet-today (func filename)
  "Call FUNC if it is not executed today.
The last executing date is recorded in the FILENAME in `user-emacs-directory.'"
  (let* ((path (expand-file-name filename user-emacs-directory))
         (today (format-time-string "%Y-%m-%d"))
         (last-date (when (file-exists-p path)
                      (with-temp-buffer
                        (insert-file-contents path)
                        (buffer-substring 1 11))))
         (should-update (or (not last-date)
                            (string< last-date today))))
    (when should-update
      (funcall func)
      (with-temp-buffer
        (insert today)
        (write-region (point-min) (point-max) path)))))

(require 'package)
(setq package-archives '(("org" . "http://orgmode.org/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))

(package-initialize)

(let ((package-check-signature nil))
  (yh-doit-if-not-yet-today 'package-refresh-contents
                            ".date-of-last-package-refresh-contents")
  (package-install 'gnu-elpa-keyring-update))
