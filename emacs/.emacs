;;; Package --- Summary
;;; Commentary:
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
  (package-initialize)
;;; Code:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
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
    (nov jedi-direx rjsx-mode direx company-jedi evil-goggles helm-make flycheck-irony company-irony irony company auto-complete-clang golden-ratio cdlatex auctex csharp-mode evil-nerd-commenter yasnippet org-bullets ox-pandoc org-beautify-theme helm-gtags markdown-mode helm-projectile evil-magit magit diminish smooth-scrolling smooth-scroll relative-line-numbers all-the-icons dirtree js2-mode flycheck popup-complete paredit autopair airline-themes linum-relative evil-leader evil-surround projectile atom-one-dark-theme evil)))
 '(scroll-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; evil-mode
(require 'evil-surround)
(global-evil-surround-mode 1)

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key "f" 'package-install)
(evil-leader/set-key "F" 'package-refresh-contents)
(evil-leader/set-key "RET" 'eshell)

(require 'evil)
(evil-mode 1)

;; font
(add-to-list 'default-frame-alist '( font . "roboto mono medium 13" ))

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
(evil-leader/set-key "c" 'helm-imenu)
(evil-leader/set-key "b" 'helm-projectile-ack)

(evil-leader/set-key "s" 'save-buffer)

;; powerline
(require 'powerline)
(powerline-default-theme)
(require 'airline-themes)
(load-theme 'airline-dark t)

;; auto close brackets
(electric-pair-mode 1)

;; silent bell
(setq ring-bell-function 'ignore)

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
(setq-default c-basic-offset 4 c-default-style "linux")
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

(evil-leader/set-key "z" 'indent-region)

(evilnc-default-hotkeys t)
(evil-leader/set-key ";" 'evilnc-comment-or-uncomment-lines)

(add-hook 'latex-mode-hook 'preview-buffer)

(setq jedi:complete-on-dot t)

(evil-leader/set-key "z" 'indent-region)

(evil-leader/set-key "v" 'helm-gtags-find-pattern)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(require 'irony)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(defun my/python-mode-hook ()
  "Company-jedi."
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)
(add-hook 'python-mode-hook 'jedi:setup)

(require 'evil-goggles)
(evil-goggles-mode)
(setq evil-goggles-duration 0.150)
;; list of all on/off variables, their default value is `t`:
;;
;; evil-goggles-enable-delete
;; evil-goggles-enable-indent
;; evil-goggles-enable-yank
;; evil-goggles-enable-join
;; evil-goggles-enable-fill-and-move
;; evil-goggles-enable-paste
;; evil-goggles-enable-shift
;; evil-goggles-enable-surround
;; evil-goggles-enable-commentary
;; evil-goggles-enable-replace-with-register
;; evil-goggles-enable-set-marker

(evil-leader/set-key "t" 'helm-top)

(add-to-list 'auto-mode-alist '("*[\\S]rc" . conf-unix-mode))

(add-to-list 'load-path "~/.emacs.d/gdscript-mode")
(require 'gdscript-mode)

(defun revert-buffer-no-confirm ()
    "Revert buffer without confirmation."
    (interactive)
    (revert-buffer :ignore-auto :noconfirm))
(evil-leader/set-key "r" 'revert-buffer-no-confirm)

(require 'ein)

(evil-leader/set-key "W" 'ein:notebooklist-login)
(evil-leader/set-key "w" 'ein:notebooklist-open))

(server-start)

(provide '.emacs)
;;; .emacs ends here
