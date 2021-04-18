;; Initialize package sources
(require 'package)  ; use "package" manager
(setq package-archives '(("melpa" . "https://melpa.org/packages/")       ; extented packages
			 ("org" . "https://orgmode.org/elpa/")           ; orgmode packages
			 ("elpa" . "https://elpa.gnu.org/packages/")))   ; standard packages
(package-initialize)                     ; initialize package manager
(unless package-archive-contents         ; do we have the package archives?
  (package-refresh-contents))            ; no? Then refresh package archives

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)     ; is use-package installed?
  (package-install 'use-package))              ; no - install it
(require 'use-package)                         ; load use-package
(setq use-package-always-ensure t)             ; fail if a use-package fails (a package cannot be downloaded and installed)

;; Update the packages regularly
(use-package auto-package-update
  :custom
  (auto-package-update-interval 7)
  (auto-package-update-prompt-before-update t)
  (auto-package-update-hide-results t)
  :config
  (auto-package-update-maybe)
  (auto-package-update-at-time "08:00"))

;; Try to keep package files together. This should be as early in the script as possible
(use-package no-littering)

;; no-littering doesn't set this by default so we must place
;; auto save files in the same path as it uses for sessions
(setq auto-save-file-name-transforms
      `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))




;; Cleanup UI
(setq inhibit-startup-message t) ; start in scratch buffer instead of the start screen
(scroll-bar-mode -1) ; disable the scrollbar
(tool-bar-mode -1) ; disable the toolbar
(menu-bar-mode -1) ; disable the menu bar
(tooltip-mode -1) ; disable tooltips
(set-fringe-mode 8) ; give some breathing room at edge of window
(setq visible-bell t) ; turn off beeping and enable visible errors

;; Icons
;; NOTE: The first time you load your configuration on a new machine, you'll
;; need to run the following command interactively so that mode line icons
;; display correctly:
;;
;; M-x all-the-icons-install-fonts
(use-package all-the-icons)

;; Fonts
;(set-default-font "Terminus-9")
;(set-face-attribute 'default nil :font "Terminus")

;; Line numbers
(column-number-mode) ; add column to mode line
(global-display-line-numbers-mode t) ; add line numbers to all buffers
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0)))) ; disable line numbers for some buffers


;; Theme
(use-package doom-themes
  ;:init (load-theme 'doom-gruvbox t))
  ;:init (load-theme 'doom-palenight t))
  :init (load-theme 'doom-dark+ t))
  ;:init (load-theme 'doom-horizon t))

;; Configure the mode line
;; TODO make the line stand out more for unfocused windows
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 20)))

;; Alternate paren colors to make matching easier
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))


;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Display key help
(use-package which-key
  :defer 0
  :diminish which-key-mode
  :config
  (which-key-mode)
  (setq which-key-idle-delay 1))


;; Setup command log mode for videos
;(use-package command-log-mode)

(use-package counsel
  :bind (("C-M-j" . 'counsel-switch-buffer)
	 :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history))
  :custom
  (counsel-linux-app-format #'counsel-linux-app-format-function-name-only)
  :config
  (counsel-mode 1))

;; Setup fuzzy find using ivy and counsel (ido and helm are alternatives)
(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)
	 ("C-l" . ivy-alt-done)
	 ("C-j" . ivy-next-line)
	 ("C-k" . ivy-previous-line)
	 :map ivy-switch-buffer-map
	 ("C-k" . ivy-previous-line)
	 ("C-l" . ivy-done)
	 ("C-d" . ivy-switch-buffer-kill)
	 :map ivy-reverse-i-search-map
	 ("C-k" . ivy-previous-line)
	 ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package ivy-rich
  :after ivy
  :init
  (ivy-rich-mode 1))

(use-package helpful
  :commands (helpful-callable helpful-variable helpful-command helpful-key)
  :custom
  (counsel-describe-function-function #'helpful-callable)  ; better function and variable search
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)  ; better help buffers
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))








;; Project management
(use-package projectile    ; package that allows switching and searching projects
  :diminish projectile-mode
  :config (projectile-mode) ; setup projectile mode
  ;; :custom ((projectile-completion-system 'auto) ; detect completion system installed in emacs (ivy in this case)
  :bind-keymap
  ("C-c p" . projectile-command-map) ; Use C-c p to bring up a menu of projectile functions
  :init
  (when (file-directory-p "~/src")                                ; if ~/src exists
    (setq projectile-project-search-path '("~/src")))             ; then use it as the root directory of the projects
  (setq projectile-switch-project-action #'projectile-dired))     ; bring up dired when switching projects
;; TODO Move emacs repo to ~/src so it is available in C-c p p (projectile project list)  

(use-package counsel-projectile    ; extend projectile with additional ivy functionality
  :config (counsel-projectile-mode)) ; enable the counsel-projectile-mode


;; Git management
(use-package magit    ; git porcelain inside emacs
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1)) ; use same window for diffs

;; (use-package evil-magit  ; TODO evil-magit does not exist?
;;  :after magit)

;; (use-package forge) ; TODO Integrate with github, gitlab, etc. only partial support for Gitea and Bitbucket

(setq vc-follow-symlinks t)





;; Configure org-mode
(defun tew/org-mode-setup () ; define the hook used when switching to org-mode
  (org-indent-mode)          ; smart indent for org-mode
  (variable-pitch-mode 1)    ; 1 - don't use fixed point font (note using variable pitch mode affects everything in an org file including code and tables)
			     ; 0 - use fixed point font (makes tables look nice, but now everything is fixed point)
  (auto-fill-mode 0)         ; don't break lines automatically
  (visual-line-mode 1)       ; word wrap
  (setq evil-auto-indent nil)) ; don't auto indent using evil mode; use org-mode indent

(use-package org ; use the latest orgmode - requires entry in package-archives
  :ensure org-plus-contrib ; required to pull the latest version instead of using the built-in package
  :hook (org-mode . tew/org-mode-setup)
  :config
  ;; TODO Use custom instead of config and setq?
  (setq org-ellipsis " ▾"   ; use down-arrow instead of ...
	org-hide-emphasis-markers nil) ; show the emphasis markers (e.g. *bold*)
  (setq org-agenda-files    ; list of files to be included in org-agenda
	'("~/slip-box/todo.org" ; todo list
	  "~/slip-box/birthdays.org" ; friends and family b-days
	  "~/slip-box/Work Tasks.org"
	  )
	; TODO Decide whether to include all files in the slip-box so I can put TODO anywhere
	)
  ;; Setup TODO states. Everything before "|" is active and everything after it is done.
  ;; The () contains configuration for the state
  (setq org-todo-keywords
	'((sequence "TODO(t)" "NEXT(n)" "PROJ(p)" "WAIT(w@/!)" "SOMEDAYMAYBE(m)" "|" "DONE(d!)") ; GTD-ish
	  ; (sequence "BACKLOG(b)" "PLAN(p)" "READY(r)" "ACTIVE(a)" "REVIEW(v)" "WAIT(w@/!)" "HOLD(h)" "|" "COMPLETED(c)" "CANCELLED(k)") ; Scrum-ish
	  ))

  ;; Setup commands to go to specific agenda views
  ;; TODO org-ql package can make this easier
  ;; See org manual for details on this script: https://orgmode.org/manual/Custom-Agenda-Views.html
  (setq org-agenda-custom-commands
	;; The dashboard gives us the agenda, next actions, and a list of active projects
	'(("d" "Dashboard"
	   ((agenda "" ((org-deadline-warning-days 7)))
	    (todo "NEXT"
		  ((org-agenda-overriding-header "Next Tasks")))
	    (tags-todo "agenda/ACTIVE" ((org-agenda-overriding-header "Active Projects")))
	    (todo "WAIT"
		  ((org-agenda-overriding-header "Waiting For")))))

	  ;; Just give me a list of next actions
	  ("n" "Next Tasks"
	   ((todo "NEXT"
		  ((org-agenda-overriding-header "Next Tasks")))))

	  ;; Give me a list of work tasks
	  ("W" "Work Tasks" tags-todo "+TODO=\"NEXT\"+work")
	  ;; ("W" "Work Tasks"
	   ;; ((todo "NEXT" tags-todo "+work"
		  ;; ((org-agenda-overriding-header "Next Work Tasks")))
	    ;; (todo "WAIT"
		  ;; ((org-agenda-overriding-header "Waiting For")))))

	  ;; Low-effort next actions
	  ("e" tags-todo "+TODO=\"NEXT\"+Effort<15&+Effort>0" ; effort is set and less than 15 min
	   ((org-agenda-overriding-header "Low Effort Tasks")
	    (org-agenda-max-todos 20)
	    (org-agenda-files org-agenda-files)))

	  ;; Give me a list of tasks waiting for someone else
	  ("w" "Workflow Status"
	   ((todo "WAIT"
		  ((org-agenda-overriding-header "Waiting for")))))

	  ;; TODO - Do I want to merge the 2 sequenses?
	  ;; TODO - Do I want filters for the Scrum-ish sequence?
	  ;; TODO - Do I want a list of SOMEDAYMAYBE tasks/projects? - Actually I think I want to set up a review workflow for this one.
	  ;; TODO - Should I use a tag (like above) for work tasks or use a different file? I think a tag because then I can have project specific files and use the tag there
	  ))

	  
  (setq org-deadline-warning-days 14) ; Display tasks due in next X days
  (setq org-agenda-start-with-log-mode t) ; Display what you have been working on today
  (setq org-log-done 'note) ; How to annotate a task when marking it complete
					; nil - don't add anything; just mark complete
					; time - Add a timestamp to the task
					; note - prompt for a note and add it with template org-log-note-headings
  (setq org-log-into-drawer t) ; Don't show the log, but make it available
  )

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  ;; Use a special character for top level headings then alternate open and closed circles for nested
  ;; levels. Note that we cycle back to the top level icon. This is useful as such deeply nested sections
  ;; probably indicates we need to break the note up
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●" )))

;; Replace list hyphen with dot
(font-lock-add-keywords 'org-mode
			'(("^ *\\([-]\\) "
			    (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

;; scale the headings based on level
(with-eval-after-load 'org-faces             ; Prevent errors if org-faces hasn't loaded yet
    (dolist (face '((org-level-1 . 1.2)
		    (org-level-2 . 1.1)
		    (org-level-3 . 1.05)
		    (org-level-4 . 1.0)
		    (org-level-5 . 0.9)
		    (org-level-6 . 0.8)
		    (org-level-7 . 0.75)))
    (set-face-attribute (car face) nil :weight 'regular :height (cdr face))) ; apply the face without changing font

  ;; Ensure that anything that should be fixed-pitch in Org files appears that way
  (set-face-attribute 'org-block nil    :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-table nil    :inherit 'fixed-pitch)
  (set-face-attribute 'org-formula nil  :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil     :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil  :inherit 'fixed-pitch)
  (set-face-attribute 'line-number nil :inherit 'fixed-pitch)
  (set-face-attribute 'line-number-current-line nil :inherit 'fixed-pitch))

;; Configure org-mode window appearence
(defun efs/org-mode-visual-fill ()
  (setq visual-fill-column-width 100       ; limit the document width
        visual-fill-column-center-text t)  ; center the document in the window
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . efs/org-mode-visual-fill)) ; configure for org-mode only



;; Key bindings
(use-package evil       ; vi mode for emacs
  :init
  (setq evil-want-integration t) ; load evil-integration.el to setup vi key bindings
  (setq evil-want-keybinding nil) ; don't override map for dired and ibuffer
  (setq evil-want-C-u-scroll t) ; use vi's C-u to scroll up instead of augmenting emacs commands
  (setq evil-want-C-i-jump t) ; jump to next item in list
  
  ;; :hook (evil-mode . tew/evil-hook) ; TODO This can be used to start buffers of certain modes in emacs mode instead of normal mode

  :config
  (evil-mode 1) ; enable evil mode
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)  ; treat C-g like ESC
  ;; (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join) ; use C-h to use vi's delete backward 

  ;; Use visual line motions even outside of visual-line-mode buffers
  ;; This allows j and k to work as expected when lines are wrapped.
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)
  
  ;; use normal mode for message buffer and dashboard
  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package general
  :config
  (general-create-definer tew/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC"))

(defun tew/find-file-in-home ()
  "open a file in the home directory"
  (interactive)
  (ido-find-file-in-dir "~"))

(defun tew/find-file-in-slip-box ()
  "open a file in the slip-box"
  (interactive)
  (ido-find-file-in-dir "~/slip-box"))

(with-eval-after-load 'counsel
  (tew/leader-keys
    "RET" 'counsel-switch-buffer ; use SPC RET to switch buffers
    "e" 'counsel-find-file ; use SPC e to open a new file
    "E" 'tew/find-file-in-slip-box
    "." 'tew/find-file-in-home
    "o a" 'org-agenda ; bring up the agenda menu
    ))

;; (use-package hydra) ; menu-ish TODO do I want to use this for anything? https://github.com/abo-abo/hydra

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(visual-fill-column org-bullets org-plus-contrib evil-magit magit counsel-projectile projectile evil-collection evil general helpful ivy-rich doom-themes no-littering auto-package-update which-key doom-modeline counsel ivy command-log-mode use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
