{ lib, pkgs, ... }:

{
  # Enable the X11/Wayland Sessions
  services.xserver.enable = true;
  services.gnome.gcr-ssh-agent.enable = true;
  # Security
  services.gnome.gnome-keyring.enable = true;
  security.polkit.enable = true;
  services.logind.settings.Login = {
    HandlePowerKey="ignore";
  };

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

  services.blueman = {
    enable = true;
  };

  services.upower = {
    enable = true;
  };

  services.libinput = {
    enable = true;
  };

  services.btrfs.autoScrub = {
    enable = true;
    interval = "monthly";
  };

  environment.systemPackages = with pkgs; [
    btrfs-progs
    btrfs-assistant
  ];

  services.fstrim = {
    enable = true;
  };

  services.smartd.enable = true;

  services.tumbler = {
    enable = true; # Thumbnail support for images
  };

  services.flatpak = {
    enable = true;
  };

  services.gvfs = {
    enable = true;
    package = lib.mkForce pkgs.gnome.gvfs;
  };

  services.power-profiles-daemon = {
    enable = true;
  };

  services.netbird.enable = true;

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
      PermitRootLogin = "no"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
    };
  };
}
