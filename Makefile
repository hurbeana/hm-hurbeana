.PHONY: update clean

update:
	#sudo -i nix-channel --update
	home-manager switch --flake .#hurbeana

clean:
	nix-collect-garbage -d
