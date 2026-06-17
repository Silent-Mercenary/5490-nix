{
  description = "NixOS with Lanzaboote and Mango";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.3";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mango = {
      url = "github:mangowm/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, lanzaboote, mango, ... }: {
    nixosConfigurations.nixtitude =
      nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./configuration.nix

          lanzaboote.nixosModules.lanzaboote

          mango.nixosModules.mango

          ({ pkgs, lib, ... }: {
            boot.loader.systemd-boot.enable = lib.mkForce false;

            boot.lanzaboote = {
              enable = true;
              pkiBundle = "/var/lib/sbctl";
            };

            environment.systemPackages = [
              pkgs.sbctl
            ];

            # Adjust according to Mango's current module options
            programs.mango.enable = true;
          })
        ];
      };
  };
}
