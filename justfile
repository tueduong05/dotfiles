fmt:
  nix fmt ~/dotfiles

rebuild: fmt
  sudo nixos-rebuild switch --flake ~/dotfiles

update:
  sudo nix flake update

upgrade: update rebuild
