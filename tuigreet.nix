{ ... }:
{
    # Enable the X11/Wayland Sessions
  services = {
  gnome = {
    gcr-ssh-agent.enable = true;
    gnome-keyring.enable = true;
    };
  };
  
  services.greetd = {
      enable = true;
      useTextGreeter = true;
  };

  
  programs.dconf.enable = true;
  services.dbus.enable = true;

  security.pam.services.greetd.enableGnomeKeyring = true;
  security.pam.services.login.enableGnomeKeyring = true;
  security.polkit.enable = true;
}
