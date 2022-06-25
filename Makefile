DIR=$(HOME)/dotfiles
NVM_DIR=$(HOME)/.nvm

all: symlinks brew osx

symlinks:
	sh $(DIR)/scripts/symlinks

ensure_brew:
	sh $(DIR)/scripts/ensure_homebrew.sh

brew: ensure_brew
	brew tap Homebrew/bundle
	brew bundle

nvm:
	curl https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | NVM_DIR=$(NVM_DIR) PROFILE=$(HOME)/.zsh_profile sh
	source $(NVM_DIR)/nvm.sh && nvm install 0.12
	source $(NVM_DIR)/nvm.sh && nvm install 4
	source $(NVM_DIR)/nvm.sh && nvm install 6
	source $(NVM_DIR)/nvm.sh && nvm install 7
	source $(NVM_DIR)/nvm.sh && nvm install 8
	source $(NVM_DIR)/nvm.sh && nvm alias default 8

node: nvm
	ruby $(DIR)/scripts/npm_bundles.rb

ruby:
	[ -d ~/.rbenv/versions/$(LATEST_RUBY) ] || rbenv install $(LATEST_RUBY)
	rbenv global $(LATEST_RUBY)

osx:
	sh $(DIR)/scripts/.osx
