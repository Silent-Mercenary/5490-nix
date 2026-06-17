{ pkgs, ... }:

{
    #PATCH TEMPORARY --> aiden will forward a solution 

  nixpkgs.overlays = [
    (final: prev: {
      openldap = prev.openldap.overrideAttrs (_: {
        doCheck = false; # override build check to avoid bullshit
      });
    })
  ];    
    
    
  # This package is unsupported and insecure, I wouldnt be surprised if its some fucking IDE shit, probably              
  nixpkgs.config.permittedInsecurePackages = [
      "electron-39.8.10"
        ]; 
    
    
  services.ratbagd.enable = true;
  environment.systemPackages = with pkgs; [

    # Comms
    signal-desktop
    legcord
    libratbag
    piper

    # Terminal Emulators + extensions/Prefrences
    kitty # goto terminal
    ghostty
    fish
    television
    zoxide


    
    # Networking/Git
    curl wget
	git

	
    # Browsers
    chromium
    #vivaldi
    #vivaldi-ffmpeg-codecs
    
    #Personal tools
    rnote
    picard
    audacity

    # codecs
    ffmpeg-full
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    gst_all_1.gst-libav

    # System tools
    btop nmap
    fastfetch
    lm_sensors
    pciutils  usbutils
    powerstat
    sbctl
    bat fd
    fzf bluez
    file vlc
    acpi
    gparted
    dmidecode
    killall
    figlet
    mission-center
    android-tools
    gdu
    nfs-utils
    musikcube

    fusePackages.fuse_2
    fuse
    fuse3
    nfs-utils

    # Art Suite 
    gimp
    inkscape

    # IDEs
    vscodium
    fresh-editor micro
    neovim

    # DEV tools
    gcc
    gobject-introspection
    gnumake
    pkg-config
    cmake
    ninja
    autoconf
    automake
    libtool
    gettext
    glibc
    gdb
    strace
    lldb
    clang
    rustc
    cargo
    rust-analyzer
    llvm
    unzip
    unrar
    bind
    godot
    scanmem

    # Cargo pkgs
    bluetuith

    # Thunar + Plugins
    udiskie
    xarchiver
    gvfs

    # File Syncs
    nextcloud-client

    # Sudo replacement
    doas
    doas-sudo-shim

    # Virtualization
    virt-manager

    # Sound shit
    alsa-utils
    sof-firmware
    pavucontrol
    mpv
    vlc

    # Theming
    bibata-cursors
    sweet
    papirus-icon-theme
    afterglow-cursors-recolored
    
    #Nix Exclusive
    nixd
    nil
    nix-tree
    nix-output-monitor
    nix-init
    nixpkgs-fmt
    cachix
  ];

  # services.displayManager.sessionPackages = [pkgs.mangowc];
  fonts.fontDir.enable = true;
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      nerd-fonts.hack

    ];
    fontconfig.enable = true;
  };

  programs.command-not-found.enable = true;

  programs.xfconf.enable = true;
  programs.thunar = {
    enable = true;
    plugins = with pkgs; [
      thunar-archive-plugin
      thunar-volman
      thunar-media-tags-plugin
      thunar-vcs-plugin
    ];
  };
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

  # Firefox Browser (replace with Zen Browser when it fucking get ported)
  programs.firefox.enable = true;

  programs.kdeconnect = {
    enable = true;
  };
}
