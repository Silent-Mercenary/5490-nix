{lib, pkgs, ...}:

{
  # Enable the X11/Wayland Sessions
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.gnome.gcr-ssh-agent.enable = true;
  # Security
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.gdm.enableGnomeKeyring = true;
  security.polkit.enable = true;
  
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  
    # Enable sound with pipewire.
  services.pulseaudio.enable = false;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Services + Configs for Services 

  services.blueman ={
    enable = true;
  };

  services.upower ={
    enable = true; 
  };
  
  
  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput = {
    enable = true;
  };

  services.fstrim = { 
    enable = true;
  };


  services.tumbler = {
    enable = true; # Thumbnail support for images
  };

  services.flatpak = {
    enable = true;
  };

  services.fwupd = {
    enable = true;
  };
  
  services.gvfs = {
    enable = true;
    package = lib.mkForce pkgs.gnome.gvfs;
  };

  services.power-profiles-daemon = {
    enable = true;
  };

  services.tailscale = {
    enable = true;
  };

  services.thermald = {
  	enable = true;
  };

  services.openssh = {
    enable = true;
    ports = [ 22 ];
  settings = {
    PasswordAuthentication = true;
    AllowUsers = null; # Allows all users by default. Can be [ "user1" "user2" ]
    UseDns = true;
    X11Forwarding = false;
    PermitRootLogin = "prohibit-password"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
    };
  };  
}
