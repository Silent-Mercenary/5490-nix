{ pkgs, ... }:

{
    virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
      ovmf.enable = true;
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
