{ pkgs, ... }:

{
  services.xserver.videoDrivers = [ "modesetting" ];

  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        mesa
        libglvnd
        intel-compute-runtime
        intel-media-driver
        intel-vaapi-driver
        libva-vdpau-driver
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
    vulkan-tools
    mesa-demos
  ];
}

/*
  intel IGPU config, should have all necessary drivers to allow all functions
  well except openCL (its not installed here)
*/
