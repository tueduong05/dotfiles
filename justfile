fmt:
  nix fmt ~/dotfiles

rebuild: fmt
  nh os switch ~/dotfiles

update:
  sudo nix flake update

upgrade: update rebuild
