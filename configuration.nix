{pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.

    ];


  hardware.enableRedistributableFirmware = lib.mkDefault true;
  
  services.fstrim.enable = lib.mkDefault true;

  hardware.bluetooth = { 
  	enable = true; # enables support for Bluetooth
  	powerOnBoot = true;  # powers up the default Bluetooth controller on boot
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.admin = {
    isNormalUser = true;
    description = "chris";
    extraGroups = [ "networkmanager" "wheel" "audio" "docker" "libvirtd"];
    shell = pkgs.fish;
  };



security.sudo.enable = false;
security.doas.enable = true;
security.doas.extraRules = [{
  groups = ["wheel"];
  keepEnv = true; 
  persist = true;
  noLog = true;  
  }];
  
  #Networking + Firewall + Hostname
  networking = {
    hostName = "nixtitude"; # Define your hostname.
    networkmanager.enable = true;
    firewall = { 
  	  enable = true;
 	   allowedTCPPortRanges = [ 
      { from = 1714; to = 1764; } # KDE Connect
    ];  
  	  allowedUDPPortRanges = [ 
      { from = 1714; to = 1764; } # KDE Connect
    ];
  	  interfaces."tailscale0".allowedTCPPorts = [ 22 ]; 
      trustedInterfaces = [ "tailscale0" ]; 
    };    
  };
  # Firewall Settings per interface
  #networking.firewall.interfaces."wlp2s0".allowedTCPPorts = [ 80 443 ];
  #networking.firewall.interfaces."wlp2s0".allowedUDPPorts = [ ... ];
  # networking.firewall.allowedTCPPorts = [ 22 ];
  # networking.firewall.allowedUDPPorts = [ 22 ];
   
  environment.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";      # for Firefox
  };

  system.stateVersion = "25.05"; # Did you read the comment?
}