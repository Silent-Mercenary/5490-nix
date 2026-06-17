
{ pkgs, ... }:

{

  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs"; # or "btrfs" if your root is btrfs
    daemon.settings = {
      userland-proxy = false;
      experimental = true;
      default-runtime = "runc"; # keep runc as default
    };
  };

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true; # TPM EMU
    };
  };

  systemd.services.libvirt-default-network = {
    description = "Activate libvirt default NAT network";
    after = [ "libvirtd.service" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = "${pkgs.libvirt}/bin/virsh net-start default";
      ExecStop = "${pkgs.libvirt}/bin/virsh net-destroy default";
      User = "root";
    };
  };

  networking.firewall.trustedInterfaces = [ "virbr0" ];

}

/*
  This config Assumes you already have a defined default.xml Otherwise have fun
  figuring out why systemd keeps bitching about "systemd.services.libvirt-default-
  network" failed to start error 69 or some shit,
*/
