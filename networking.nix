{pkgs, nix, ...}:
{
    environment.systemPackages = [pkgs.impala];
    programs.firejail.enable = true;
    services.resolved.enable = true;
    networking = {
    hostName = "nixtitude"; # Define your hostname.
    wireless.iwd = {
      enable = true;
    };
    networkmanager.enable = false;
    firewall = {
      enable = true;
      allowedTCPPortRanges = [
        {
          from = 1714;
          to = 1764;
        } # KDE Connect
      ];
      allowedUDPPortRanges = [
        {
          from = 1714;
          to = 1764;
        } # KDE Connect
      ];
      interfaces."wt0".allowedTCPPorts = [ 22 ];
      trustedInterfaces = [ "wt0" ];
    };
  };
}
