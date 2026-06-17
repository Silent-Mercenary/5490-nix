# Nix package manager, settings
{ pkgs, lib, ... }:

{
  nix = {
    package = pkgs.nixVersions.latest;
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [
        "root"
        "chris"
      ];
      auto-optimise-store = true;
      log-lines = 50;
      http-connections = 25;
      max-jobs = "auto";
      cores = 8;
      build-cores = 8;
      "download-buffer-size" = "67108864";
      warn-dirty = false;
      keep-outputs = true;
      keep-derivations = true;
     # Where the genuine fuck do you get yoru cached binaries from?
      substituters = [
        "https://cache.nixos.org/"
        "https://hyprland.cachix.org"
        "https://nix-community.cachix.org"
	"https://noctalia.cachix.org"
      ];
      # Public Repo Keys to make sure you dont get shit from weird places
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
	 ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
  };

  # Let Nix install unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable firmware blob fetching
  hardware.enableAllFirmware = true;
  hardware.enableRedistributableFirmware = lib.mkDefault true;
}
