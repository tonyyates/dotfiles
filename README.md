# Tony's Dotfiles

My dotfiles and config files for Mac OSX and Linux. These have been simplified due to the excellent job of lazyvim, lazygit and opencode

Directories are itterated and files with .symlink are symlinked into the proper location, and have the `.` added. For example:

    ~/dotfiles/zsh/zsh_profile.symlink => ~/.zsh_profile
    ~/dotfiles/git/gitconfig.symlink => ~/.gitconfig
    ...and so on

## Installing
- Clone repository (I recommend `~/dotfiles`). If you don't use `~/dotfiles`, you'll have to update a couple of the scripts to point them to the right place.
- `cd ~/dotfiles`
- `make`

### homebrew
- Add line to `Brewfile`
- Run `make brew`

### applications
- Apps are installed using [brew cask](https://github.com/caskroom/homebrew-cask)
- To add an application add it to the `Brewfile`

Applications installed via App Store:
- 1Password
- Transmit
- TweetDeck

### node & npm
- Node is installed and managed using [nvm](https://github.com/creationix/nvm)
- Packages are managed in `scripts/npm_bundles.rb`.
- Add a new package, and run `make node`.

### osx defaults
- Amend defaults as required in `scipts/.osx`
- Run `make osx`

## Updating
You can run `make` at any time to keep things nice and tidy.

