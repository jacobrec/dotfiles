;; buffer management
(defun my-change-buffer (change-buffer)
  "Switch to the next buffer, while ignoring * buffers.
-  Use CHANGE-BUFFER to determine the direction."
  (let ((bread-crumb (buffer-name)))
    (funcall change-buffer)
    (while
        (and
         (string-match-p "^\*" (buffer-name))
          ;; to add more regexs to ignore, copy the line above
         (not ( equal bread-crumb (buffer-name))))
      (funcall change-buffer))))

(defun my-next-buffer ()
  "Next buffer."
  (interactive)
  (my-change-buffer 'next-buffer))

(defun my-previous-buffer ()
  "Prevoius buffer."
  (interactive)
  (my-change-buffer 'previous-buffer))

;; loading dir
(defun load-all-in-directory (dir)
  "`load' all elisp libraries in directory DIR which are not already loaded."
  (interactive "D")
  (let ((libraries-loaded (mapcar #'file-name-sans-extension
                                  (delq nil (mapcar #'car load-history)))))
    (dolist (file (directory-files dir t ".+\\.elc?$"))
      (let ((library (file-name-sans-extension file)))
        (unless (member library libraries-loaded)
          (load library nil t)
          (push library libraries-loaded))))))


(provide 'j-funcs)
