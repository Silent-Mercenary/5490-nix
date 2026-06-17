{ pkgs, ... }:

{
  programs.gamemode.enable = true; # cpu governor for games

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Does what if fucking says on the tin
  };

  environment.systemPackages = with pkgs; [
    heroic
    steam
    winetricks
    wineWow64Packages.full
    umu-launcher
    protonplus
    lutris # install bottles as a flatpak!!!
  ];
}
