{pkgs, ...}:

{
  environment.systemPackages = with pkgs; [   
  aquamarine hyprlang
  hyprshot hyprpanel  
  hyprland hyprpolkitagent
  hyprkeys hyprutils 
  hyprgraphics fuzzel 
  hyprcursor hyprshell
  hyprland-qtutils
  hyprland-protocols
  hyprsunset
  hypridle
  hyprwayland-scanner
  hyprland-qt-support
  notify-desktop
  wlogout wl-clipboard
  imagemagick clipse uwsm
  kanata brightnessctl
  kdePackages.gwenview
  waybar eza

    # XDG portal
  xdg-desktop-portal
  xdg-desktop-portal-hyprland
  xdg-desktop-portal-gtk 
  ];

    # Hyprland Fuckery
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };
  
    programs.hyprlock.enable = true;

    environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";          # for Electron apps
    XCURSOR_THEME = "Bibata-Modern-Ice";  # or any installed theme
    XCURSOR_SIZE = "24";
  };

  
  xdg.portal = {
     enable = true;
  # Only include extra GTK portal for file pickers:
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
    xdgOpenUsePortal = true;  # enables xdg-open via portal
  };
}
