{ pkgs, ... }:
{
  #environment.systemPackages = with pkgs; [mangowc];
  #services.displayManager.sessionPackages = [pkgs.mangowc];
}
