;;; Package --- Summary
;;; Commentary:
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "https://melpa.milkbox.net/packages/"))
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
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "f0bc2876cbcf7cd1536d196ef270b4c4d4712232d6219d08dbf48c2bba524c9a" "bd81bac3569ee67f8b4397432dfcbadc09396996d13ca483d0d8440c7bf87170" "18e60b3301bb6c95a7af129ad7dac1ec0b318403c154c4ce10cf5e789a7f0670" "3eb93cd9a0da0f3e86b5d932ac0e3b5f0f50de7a0b805d4eb1f67782e9eb67a4" "962dacd99e5a99801ca7257f25be7be0cebc333ad07be97efd6ff59755e6148f" default)))
 '(menu-bar-mode nil)
 '(org-agenda-files (quote ("~/Sync/org-mode/life.org")))
 '(org-export-backends (quote (ascii beamer html icalendar latex odt)))
 '(package-selected-packages
   (quote
    (shackle ivy sass-mode highlight-parentheses ranger nim-mode kivy-mode company-tern tern nov jedi-direx direx company-jedi evil-goggles helm-make flycheck-irony company-irony irony company auto-complete-clang golden-ratio csharp-mode evil-nerd-commenter yasnippet org-bullets org-beautify-theme helm-gtags markdown-mode helm-projectile evil-magit magit diminish smooth-scrolling smooth-scroll relative-line-numbers all-the-icons dirtree flycheck popup-complete autopair airline-themes linum-relative evil-leader evil-surround projectile evil)))
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

(require 'evil)
(evil-mode 1)

;; keybinds
(evil-leader/set-leader ",")
(evil-leader/set-key "f" 'package-install)
(evil-leader/set-key "F" 'package-refresh-contents)
(evil-leader/set-key "RET" 'eshell)
(evil-leader/set-key "d" 'sr-open-file)
(evil-leader/set-key "e" 'helm-for-files)
(evil-leader/set-key "c" 'helm-imenu)
(evil-leader/set-key "b" 'helm-projectile-ack)
(evil-leader/set-key "s" 'save-buffer)
(evil-leader/set-key "q" 'kill-all-buffers) ;; exit to home directory
(evil-leader/set-key "n" 'xah-new-empty-buffer)
(evil-leader/set-key "k" 'kill-this-buffer)
(evil-leader/set-key "a" 'org-agenda)
(evil-leader/set-key "y" 'yas-new-snippet)
(evil-leader/set-key "u" 'yas-reload-all)
(evil-leader/set-key "m" 'magit-status)
(evil-leader/set-key "," 'delete-window)
(evil-leader/set-key "x" 'with-editor-finish)
(evil-leader/set-key "z" 'indent-region)
(evil-leader/set-key ";" 'evilnc-comment-or-uncomment-lines)
(evil-leader/set-key "l" 'flycheck-next-error)
(evil-leader/set-key "L" 'flycheck-previous-error)
(evil-leader/set-key "r" 'replace-string)
(evil-leader/set-key "R" 'revert-buffer-no-confirm)
(evil-leader/set-key "D" 'ranger)
(evil-leader/set-key "g" 'helm-projectile-ack)
(evil-leader/set-key "p" (kbd "C-x 3"))
(evil-leader/set-key "P" (kbd "C-x 2"))
(evil-leader/set-key "t" 'helm-top)
(define-key evil-normal-state-map "\M-f" 'evil-visual-block)
(define-key evil-normal-state-map "\M-l" 'windmove-right)
(define-key evil-normal-state-map "\M-h" 'windmove-left)
(define-key evil-normal-state-map "\M-j" 'windmove-down)
(define-key evil-normal-state-map "\M-k" 'windmove-up)
(define-key evil-visual-state-map "\"" (kbd "S\""))
(define-key evil-visual-state-map "(" (kbd "S)"))
(define-key evil-visual-state-map "[" (kbd "S]"))
(define-key evil-visual-state-map "{" (kbd "S}"))
(define-key evil-visual-state-map "'" (kbd "S'"))
(define-key evil-visual-state-map "\"" (kbd "S\""))

(evil-global-set-key 'normal (kbd "- r") (kbd ":load-file <return>"))
(evil-global-set-key 'normal (kbd "- z") 'zone)

(defun my/python-mode-hook ()
  "Binds."
  (evil-local-set-key 'normal (kbd "- d") 'jedi:goto-definition))
(add-hook 'python-mode-hook 'my/python-mode-hook)

(defun my/org-mode-hook ()
  "Binds."
  (evil-local-set-key 'normal (kbd "- c") 'org-toggle-checkbox)
  (evil-global-set-key 'normal (kbd "- e") 'org-edit-src-code))
(add-hook 'org-mode-hook 'my/org-mode-hook)

(defun my/tern-mode-hook ()
  "Binds."
  (evil-local-set-key 'normal (kbd "- d") 'tern-find-definition)
  (evil-local-set-key 'normal (kbd "- a") 'tern-rename-variable))
(add-hook 'tern-mode-hook 'my/tern-mode-hook)

;; font
(add-to-list 'default-frame-alist '( font . "roboto mono medium 12" ))

;; colour scheme

(add-to-list 'load-path "~/.emacs.d/oneDark")
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

(jedi:setup)

(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-jedi))

;; linting
(require 'flycheck)
(global-flycheck-mode)

;; turn on flychecking globally
(add-hook 'after-init-hook #'global-flycheck-mode)

;; use eslint with rsjx-mode for jsx files
;; (flycheck-add-mode 'javascript-eslint 'rjsx-mode)

;; customize flycheck temp file prefix
(setq-default flycheck-temp-prefix ".flycheck")

;; disable json-jsonlist checking for json files
;; (setq-default flycheck-disabled-checkers
;;   (append flycheck-disabled-checkers
;;     '(json-jsonlist)))


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


(require 'markdown-mode)

(require 'org-bullets)

(add-hook 'org-mode-hook
          (lambda()
            (org-bullets-mode t )))

(setq org-hide-leading-stars t)

(add-hook 'org-mode-hook
      '(lambda ()
         (delete '("\\.pdf\\'" . default) org-file-apps)
         (add-to-list 'org-file-apps '("\\.pdf\\'" . "evince %s"))
         (delete '("\\.html\\'" . default) org-file-apps)
         (add-to-list 'org-file-apps '("\\.html\\'" . "firefox %s"))))

(require 'yasnippet)
(yas-global-mode 1)

(setq yas-snippet-dirs '("~/vimconfig/emacs/yasnippets/"))

(require 'magit)
(require 'evil-magit)

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


(evilnc-default-hotkeys t)

(add-hook 'latex-mode-hook 'preview-buffer)

(setq jedi:complete-on-dot t)


(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(require 'irony)
(with-eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))
(with-eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(require 'evil-goggles)
(evil-goggles-mode)
(setq evil-goggles-duration 0.050)
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


(add-to-list 'auto-mode-alist '("*[\\S]rc" . conf-unix-mode))

;; (add-to-list 'load-path "~/.emacs.d/gdscriptMode")
;; (require 'gdscript-mode)

(defun revert-buffer-no-confirm ()
    "Revert buffer without confirmation."
    (interactive)
    (revert-buffer :ignore-auto :noconfirm))



(require 'tern)

(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(setq js-indent-level 2)

(add-hook 'html-mode-hook
 (lambda ()
   (setq-local electric-pair-inhibit-predicate
               `(lambda (c)
                  (if (char-equal c ?<) t (,electric-pair-inhibit-predicate c))))))

(add-hook 'gdscript-mode-hook (lambda () (evil-leader/set-key "z" 'gdscript-indent-line)))
(add-to-list 'auto-mode-alist '("\\.cshtml$" . web-mode))

(require 'kivy-mode)
(add-to-list 'auto-mode-alist '("\\.kv$" . kivy-mode))

(require 'nim-mode)

(require 'ranger)
(setq ranger-show-hidden t)
(setq ranger-cleanup-on-disable t)
(setq ranger-cleanup-eagerly t)
(setq ranger-modify-header nil)
(setq ranger-preview-file nil)
(setq ranger-footer-delay 0.01)

(setq helm-projectile-window-style 'same-window)
(setq helm-window-style 'same-window)

(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq initial-major-mode 'org-mode)

(show-paren-mode 1)
(setq show-paren-delay 0)
(require 'paren)
(set-face-background 'show-paren-match (face-background 'default))
(set-face-foreground 'show-paren-match "#f3f4f5")

(golden-ratio-mode 1)

;; (require 'popwin)
;; (push '("^\*helm.+\*$" :regexp t) popwin:special-display-config)
;; (push '(t :dedicated t) popwin:special-display-config)
;; (setq popwin:popup-window-height 1)
;; (add-hook 'helm-after-initialize-hook (lambda ()
;;                                           (popwin:display-buffer helm-buffer t)
;;                                           (popwin-mode -1)))

;; (add-hook 'helm-cleanup-hook (lambda () (popwin-mode 1)))
;; (add-hook 'ranger-mode-hook (lambda () (popwin-mode -1)))
;; (add-hook 'magit-mode-hook (lambda () (popwin-mode -1)))

(add-to-list 'load-path "~/.emacs.d/omnisharp-emacs")

(eval-after-load
  'company
  '(add-to-list 'company-backends #'company-omnisharp))

(defun my-csharp-mode-setup ()
  (omnisharp-mode)

  (setq indent-tabs-mode nil)
  (setq c-syntactic-indentation t)
  (c-set-style "ellemtel")
  (setq c-basic-offset 4)
  (setq truncate-lines t)
  (setq tab-width 4)
  (setq evil-shift-width 4)

  ;csharp-mode README.md recommends this too
  ;(electric-pair-mode 1)       ;; Emacs 24
  ;(electric-pair-local-mode 1) ;; Emacs 25

  (local-set-key (kbd "C-c r r") 'omnisharp-run-code-action-refactoring)
  (local-set-key (kbd "C-c C-c") 'recompile))

(add-hook 'csharp-mode-hook 'my-csharp-mode-setup t)


(server-start)

(provide '.emacs)
;;; .emacs ends here
