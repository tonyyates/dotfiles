DIR=$(HOME)/dotfiles
NVM_DIR=$(HOME)/.nvm

OSFLAG 				:=
ifeq ($(OS),Windows_NT)
	OSFLAG += -D WIN32
else
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S),Linux)
		OSFLAG += linux 
	endif
	ifeq ($(UNAME_S),Darwin)
		OSFLAG += macos
	endif
endif

all: $(OSFLAG) symlinks

linux:
	@echo 'linux scripts to come'

symlinks: 
	$(DIR)/scripts/symlinks

macos: brew
	$(DIR)/macos/osx.sh
	
ensure_brew:
	$(DIR)/macos/ensure_homebrew.sh

brew: ensure_brew
	brew bundle --file $(DIR)/macos/Brewfile

nvm:
	curl https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | NVM_DIR=$(NVM_DIR) PROFILE=$(HOME)/.zsh_profile sh
	source $(NVM_DIR)/nvm.sh && nvm install 0.12
	source $(NVM_DIR)/nvm.sh && nvm install 4
	source $(NVM_DIR)/nvm.sh && nvm install 6
	source $(NVM_DIR)/nvm.sh && nvm install 7
	source $(NVM_DIR)/nvm.sh && nvm install 8
	source $(NVM_DIR)/nvm.sh && nvm alias default 8
