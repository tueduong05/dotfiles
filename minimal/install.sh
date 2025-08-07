sudo nix run 'github:nix-community/disko/latest#disko-install' --extra-experimental-features 'nix-command flakes' -- --flake '.#Sodium' --disk main /dev/nvme0n1
