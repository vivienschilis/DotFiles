all: sync

sync:
	mkdir -p ~/.config
	[ -f ~/.config/fish/config.fish ] || ln -s $(PWD)/fish ~/.config/fish
	[ -f ~/.config/git/config ] || ln -s $(PWD)/git ~/.config/git
	[ -f ~/.config/vim/vimrc ] || ln -s $(PWD)/vim ~/.config/vim
	[ -f ~/.config/tmux/tmux.conf ] || ln -s $(PWD)/tmux ~/.config/tmux
	[ -f ~/.ignore ] || ln -s $(PWD)/ignore ~/.ignore

clean:
	rm -f ~/.config/vim
	rm -f ~/.config/fish
	rm -f ~/.config/git
	rm -f ~/.config/tmux
	rm -f ~/.ignore

vagrant: apps
	NIXPKGS_ALLOW_UNFREE=1 nix-env -i ngrok
	nix-env -iA nixpkgs.protobuf3_6
	nix-env -i glibc-locales
	nix-env -i grpcurl
	nix-env -i cfssl

osx: apps
	nix-env -i terraform
	nix-env -i go

apps:
	nix-env -i aws-vault
	nix-env -i awscli
	nix-env -i curl
	nix-env -i direnv
	nix-env -i fish
	nix-env -i fzf
	nix-env -i git
	nix-env -i htop
	nix-env -i jq
	nix-env -i jump
	nix-env -i ripgrep
	nix-env -i silver-searcher
	nix-env -i tmux
	nix-env -i tree
	nix-env -i vim


.PHONY: all clean sync apps
