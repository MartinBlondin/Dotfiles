;;; Package --- Summary
;;; Commentary:
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
  (package-initialize)
;;; Code:
(custom-set-variables
 '(Tool-bar-mode nil)
 '(cua-mode t nil (cua-base))
 '(custom-safe-themes
   (quote
    ("f0bc2876cbcf7cd1536d196ef270b4c4d4712232d6219d08dbf48c2bba524c9a" "bd81bac3569ee67f8b4397432dfcbadc09396996d13ca483d0d8440c7bf87170" "18e60b3301bb6c95a7af129ad7dac1ec0b318403c154c4ce10cf5e789a7f0670" "3eb93cd9a0da0f3e86b5d932ac0e3b5f0f50de7a0b805d4eb1f67782e9eb67a4" "962dacd99e5a99801ca7257f25be7be0cebc333ad07be97efd6ff59755e6148f" default)))
 '(menu-bar-mode nil)
 '(org-agenda-files (quote ("~/Sync/org-mode/life.org")))
 '(org-export-backends (quote (ascii beamer html icalendar latex odt)))
 '(package-selected-packages
   (quote
    (yasnippet org-bullets ox-pandoc org-beautify-theme helm-gtags markdown-mode helm-projectile evil-magit magit diminish smooth-scrolling smooth-scroll relative-line-numbers all-the-icons dirtree js2-mode flycheck popup-complete auto-complete paredit autopair airline-themes linum-relative evil-leader evil-surround projectile atom-one-dark-theme evil)))
 '(scroll-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
 )

;; evil-mode
(require 'evil-surround)
(global-evil-surround-mode 1)

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key "f" 'package-install)
(evil-leader/set-key "RET" 'eshell)

(require 'evil)
(evil-mode 1)

;; font
(add-to-list 'default-frame-alist '( font . "roboto mono light 12" ))

;; colour scheme
(require 'atom-one-dark-theme)
;;(setq ns-auto-hide-menu-bar t)
(set-frame-position nil 0 -24)
(tool-bar-mode 0)
(set-frame-size nil 150 80)

;; line numbers
(require 'linum-relative)

(defun linum-relative-right-set-margin ()
  "Make width of right margin the same as left margin"
  (let* ((win (get-buffer-window))
     (width (car (window-margins win))))
    (set-window-margins win width width)))

(defadvice linum-update-current (after linum-left-right-update activate)
  "Advice to run right margin update"
  (linum-relative-right-set-margin)
  (linum-relative-right-update (line-number-at-pos)))

(defadvice linum-delete-overlays (after linum-relative-right-delete activate)
  "Set margins width to 0"
  (set-window-margins (get-buffer-window) 0 0))

(defun linum-relative-right-update (line)
  "Put relative numbers to the right margin"
  (dolist (ov (overlays-in (window-start) (window-end)))
    (let ((str (overlay-get ov 'linum-str)))
      (if str
      (let ((nstr (number-to-string
               (abs (- (string-to-number str) line)))))
        ;; copy string properties
        (set-text-properties 0 (length nstr) (text-properties-at 0 str) nstr)
        (overlay-put ov 'after-string
             (propertize " " 'display `((margin right-margin) ,nstr))))))))

(linum-relative-global-mode 1)


;; helm
(require 'helm-config)

;; projectile
(require 'projectile)
(require 'helm-projectile)

(defun sr-open-file ()
  "Open files."
  (interactive)
  (if (projectile-project-p)
      (helm-projectile)
  (helm-for-files)))
(evil-leader/set-key "d" 'sr-open-file)
(evil-leader/set-key "e" 'helm-for-files)
(evil-leader/set-key "s" 'helm-imenu)

;;(setq helm-follow-mode-persistent t)
;;(add-hook 'helm-after-initialize-hook
;;          #'(lambda () (helm-attrset 'follow 1 helm-source-buffers-list)))

;; powerline
(require 'powerline)
(powerline-default-theme)
(require 'airline-themes)
(load-theme 'airline-dark)

;; auto close brackets
(electric-pair-mode 1)

;; silent bell
(setq ring-bell-function 'ignore)

;; auto-completion
(require 'auto-complete)
(global-auto-complete-mode)

(defun auto-complete-mode-maybe ()
  "Turn up the AC everywhere."
  (auto-complete-mode 1))

;; async
(autoload 'dired-async-mode "dired-async.el" nil t)
(dired-async-mode 1)

;; Javascript linting
(require 'rjsx-mode)

(with-eval-after-load 'rjsx-mode
  (define-key rjsx-mode-map "<" nil)
  (define-key rjsx-mode-map (kbd "C-d") nil))

(add-to-list 'auto-mode-alist '("\\.js$" . rjsx-mode))

(setq js2-basic-offset 2)

;; linting
(require 'flycheck)
(global-flycheck-mode)

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))

;; turn on flychecking globally
(add-hook 'after-init-hook #'global-flycheck-mode)

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))

(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jscs)))

;; use eslint with rsjx-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'rjsx-mode)

;; customize flycheck temp file prefix
(setq-default flycheck-temp-prefix ".flycheck")

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(json-jsonlist)))

;; exit to home directory with leader + q
(evil-leader/set-key "q" 'kill-buffer)

;; scrolling
(require 'smooth-scrolling)
(setq scroll-margin 5)
scroll-conservatively 9999

;; disable backup files
(setq make-backup-files nil)

(setq vc-follow-symlinks t)


(defun kill-other-buffers ()
    "Kill all other buffers."
    (interactive)
    (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(defun kill-all-buffers ()
    "Kill all other buffers."
    (interactive)
    (mapc 'kill-buffer (delq (current-buffer) (buffer-list)))
    (kill-buffer)
    (setq default-directory "~/")
    (kill-other-buffers))

(evil-leader/set-key "q" 'kill-all-buffers)

(windmove-default-keybindings)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

(defun xah-new-empty-buffer ()
  "Create a new empty buffer.
new buffer will be named “untitled” or “untitled<2>”, “untitled<3>”, etc."
  (interactive)
  (let ((-buf (generate-new-buffer "untitled")))
    (switch-to-buffer -buf)
    (funcall initial-major-mode)
    (setq default-directory "~/")
    (setq buffer-offer-save t)))

(evil-leader/set-key "n" 'xah-new-empty-buffer)
(evil-leader/set-key "k" 'kill-buffer)

(require 'markdown-mode)

(require 'org-bullets)

(add-hook 'org-mode-hook
          (lambda()
            (org-bullets-mode t )))

(setq org-hide-leading-stars t)

(evil-leader/set-key "r" 'org-capture)
(evil-leader/set-key "a" 'org-agenda)
(evil-leader/set-key "p" 'artist-mode)

(add-hook 'org-mode-hook
      '(lambda ()
         (delete '("\\.pdf\\'" . default) org-file-apps)
         (add-to-list 'org-file-apps '("\\.pdf\\'" . "evince %s"))
         (delete '("\\.html\\'" . default) org-file-apps)
         (add-to-list 'org-file-apps '("\\.html\\'" . "firefox %s"))))

(require 'yasnippet)
(yas-global-mode 1)
(evil-leader/set-key "y" 'yas-new-snippet)
(evil-leader/set-key "u" 'yas-reload-all)

(setq yas-snippet-dirs '("~/vimconfig/emacs/yasnippets/"))

(require 'magit)
(require 'evil-magit)
(evil-leader/set-key "m" 'magit-status)
(evil-leader/set-key "," 'delete-window)

(evil-leader/set-key "x" 'with-editor-finish)

(evil-leader/set-key "g" 'org-archive-subtree-default)

(require 'ox-pandoc)

(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(provide '.emacs)
;;; .emacs ends here
