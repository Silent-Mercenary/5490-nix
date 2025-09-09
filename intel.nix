{pkgs, ...}:

{
  services.xserver.videoDrivers = [ "modesetting" ];

  hardware = {
    intelgpu.vaapiDriver = "intel-media-driver";  # Driver Used for Decode
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

/*
intel IGPU config, should have all necessary drivers to allow all functions
well except openCL (its not installed here)
*/