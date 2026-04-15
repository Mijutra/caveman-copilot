SHELL := /bin/sh

USER_PROMPTS_DIR ?= $(HOME)/.config/Code/User/prompts
REPO_PATH ?= .
REPO_PROMPTS_DIR ?= $(REPO_PATH)/.github/prompts
SOURCE_PROMPTS_DIR := .github/prompts

.PHONY: help install-global install-global-always-on install-repo install-repo-always-on remove-global remove-repo

help:
	@printf '%s\n' \
	  '' \
	  'Available targets:' \
	  '' \
	  '  make install-global           			Install /caveman prompt into VS Code user prompts' \
	  '  make install-global-always-on  			Install prompt + always-on instructions into VS Code user prompts' \
	  '  make install-repo REPO_PATH=/path/to/repo           	Copy /caveman prompt into REPO_PATH/.github/prompts' \
	  '  make install-repo-always-on REPO_PATH=/path/to/repo 	Copy prompt + always-on instructions into REPO_PATH/.github/prompts' \
	  '  make remove-global           				Remove installed files from VS Code user prompts' \
	  '  make remove-repo REPO_PATH=/path/to/repo           	Remove installed files from REPO_PATH/.github/prompts' \
	  ''

install-global:
	@mkdir -p "$(USER_PROMPTS_DIR)"
	@cp "$(SOURCE_PROMPTS_DIR)/caveman.prompt.md" "$(USER_PROMPTS_DIR)/caveman.prompt.md"
	@printf 'Installed prompt: %s\n' "$(USER_PROMPTS_DIR)/caveman.prompt.md"

install-global-always-on: install-global
	@cp "$(SOURCE_PROMPTS_DIR)/caveman.instructions.md" "$(USER_PROMPTS_DIR)/caveman.instructions.md"
	@printf 'Installed instructions: %s\n' "$(USER_PROMPTS_DIR)/caveman.instructions.md"

install-repo:
	@mkdir -p "$(REPO_PROMPTS_DIR)"
	@cp "$(SOURCE_PROMPTS_DIR)/caveman.prompt.md" "$(REPO_PROMPTS_DIR)/caveman.prompt.md"
	@printf 'Installed prompt: %s\n' "$(REPO_PROMPTS_DIR)/caveman.prompt.md"

install-repo-always-on: install-repo
	@cp "$(SOURCE_PROMPTS_DIR)/caveman.instructions.md" "$(REPO_PROMPTS_DIR)/caveman.instructions.md"
	@printf 'Installed instructions: %s\n' "$(REPO_PROMPTS_DIR)/caveman.instructions.md"

remove-global:
	@rm -f "$(USER_PROMPTS_DIR)/caveman.prompt.md" "$(USER_PROMPTS_DIR)/caveman.instructions.md"
	@printf 'Removed caveman files from: %s\n' "$(USER_PROMPTS_DIR)"

remove-repo:
	@rm -f "$(REPO_PROMPTS_DIR)/caveman.prompt.md" "$(REPO_PROMPTS_DIR)/caveman.instructions.md"
	@printf 'Removed caveman files from: %s\n' "$(REPO_PROMPTS_DIR)"
