;; package management
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
  (package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base))
 '(custom-safe-themes
   (quote
    ("f0bc2876cbcf7cd1536d196ef270b4c4d4712232d6219d08dbf48c2bba524c9a" "bd81bac3569ee67f8b4397432dfcbadc09396996d13ca483d0d8440c7bf87170" "18e60b3301bb6c95a7af129ad7dac1ec0b318403c154c4ce10cf5e789a7f0670" "3eb93cd9a0da0f3e86b5d932ac0e3b5f0f50de7a0b805d4eb1f67782e9eb67a4" "962dacd99e5a99801ca7257f25be7be0cebc333ad07be97efd6ff59755e6148f" default)))
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (diminish dtrt-indent smooth-scrolling smooth-scroll relative-line-numbers all-the-icons neotree dirtree web-mode js2-mode flycheck popup-complete auto-complete paredit autopair git-gutter airline-themes linum-relative evil-leader evil-surround projectile atom-one-dark-theme evil)))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; projectile
(require 'projectile)

;; evil-mode
(require 'evil-surround)
(global-evil-surround-mode 1)

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key "a" 'projectile-add-known-project)
(evil-leader/set-key "s" 'projectile-switch-project)
(evil-leader/set-key "d" 'helm-find)
(evil-leader/set-key "f" 'package-install)

(require 'evil)
(evil-mode 1)

;; font
(add-to-list 'default-frame-alist '(font . "roboto mono light-12" ))

;; colour scheme
(require 'atom-one-dark-theme)
(setq ns-auto-hide-menu-bar t)
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

;; async
(autoload 'dired-async-mode "dired-async.el" nil t)
(dired-async-mode 1)

;; linting
(require 'flycheck)
(global-flycheck-mode)

;; Javascript linting
(require 'js2-mode)
(require 'web-mode)

;; use web-mode for .jsx files
(add-to-list 'auto-mode-alist '("\\.js$" . web-mode))

;; http://www.flycheck.org/manual/latest/index.html
(require 'flycheck)

;; turn on flychecking globally
(add-hook 'after-init-hook #'global-flycheck-mode)

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; customize flycheck temp file prefix
(setq-default flycheck-temp-prefix ".flycheck")

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(json-jsonlist)))

;; navigation
(require 'neotree)
(evil-leader/set-key "w" 'neotree-toggle)
(require 'all-the-icons)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

(evil-leader/set-key "q" 'kill-buffer)

;; scrolling
(require 'smooth-scrolling)
(setq scroll-margin 5)
scroll-conservatively 9999

;; disable backup files
(setq make-backup-files nil)

;; exiting insert mode keeps your cursor in the same place
(setq evil-move-cursor-back nil)
