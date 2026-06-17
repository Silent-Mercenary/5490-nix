{
  pkgs,
  ...
}:

{
  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
      xfce.enable = true;
    };
  };
  environment.xfce.excludePackages = with pkgs; [
    mousepad
    parole
    ristretto
    xfce4-appfinder
    # xfce4-notifyd
    xfce4-screenshooter
    xfce4-session
    xfce4-settings
    xfce4-taskmanager
    xfce4-terminal
  ];
}
