;;; ob-awk-cmd.el --- `:cmd' header argument to dynamically select an AWK variant for `ob-awk'  -*- lexical-binding:t -*-

;; Copyright (C) 2024-present CHEN Xian'an (a.k.a `realazy').

;; Maintainer: xianan.chen@gmail.com

;; This file is not part of GNU Emacs.

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; Example:
;; #+begin_src awk :cmd gawk
;; BEGIN {
;;     print gensub(/Hello/, "Hey", "g", "Hello world")
;; }
;; #+end_src

;;; Code:

(provide 'ob-awk-cmd)

(with-eval-after-load 'ob-awk
  (defun org-babel-execute:awk/around (orig-fn body params)
    (let ((cmd (cdr (assq :cmd params))))
      (cond
       (cmd (let ((org-babel-awk-command cmd))
              (funcall orig-fn body params)))
       (t (funcall orig-fn body params)))))

  (advice-add 'org-babel-execute:awk :around
              #'org-babel-execute:awk/around))

;;; ob-awk-cmd.el ends here
