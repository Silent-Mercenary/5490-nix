{pkgs, ...}:

{
  services.xserver.videoDrivers = [ "modesetting" ];

  hardware = {
    graphics = {
      enable = true;

      extraPackages = with pkgs; [
        mesa
        libglvnd
        intel-media-driver
        intel-vaapi-driver
        vaapiIntel
        vaapiVdpau
        libvdpau-va-gl
        vulkan-loader
        vulkan-tools
      ];
    };
  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  environment.systemPackages = with pkgs; [
    glxinfo
    vulkan-tools
    mesa-demos
  ];
}
