{...}:

{
    # Fish Shell
  programs.fish = {
  enable = true;
  shellAliases = {
    
    # Nix Aliases
    sudo   = "doas";
    snrs   = "sudo nixos-rebuild switch";
    snrt   = "sudo nixos-rebuild test";
    
    # Shell Conveniences 
    cd     = "z";
    nano   = "micro";
   
    # Ollama
    model-list = "ollama list"; 
    pull-llm = "ollama pull";

    # Eza
    ls = "eza -al --color=always --group-directories-first --icons";


    #DistroBox Distros
    alpine = "echo Alpine | figlet -f slant && distrobox enter alpine"; # opens up alpine
    arch = "echo Arch | figlet -f slant && distrobox enter arch"; # start arch docker container
    almalinux = "echo AlmaLinux | figlet -f slant && distrobox enter almalinux"; # start almalinux docker container
    blackarch = "echo BlackArch | figlet -f slant && distrobox enter blackarch"; # start blackarch docker container
    debian-unstable = "echo Debian-unstable | figlet -f slant && distrobox enter debian-unstable"; # start debian-unstable docker container
    fedora-rawhide = "echo Fedora-Rawhide | figlet -f slant && distrobox enter fedora-rawhide"; # starts up fedora rawhide
    kali-rolling = "echo Kali-rolling | figlet -f slant && distrobox enter kali-rolling"; # starts up kali container
    rocky = "echo Rocky | figlet -f slant && distrobox enter rocky"; #opens up Rocky (until it looks for fish and then fucks off)
    ubuntu = "echo Ubuntu Dev | figlet -f slant && distrobox enter ubuntu"; # starts ubuntu docker container
    voidlinux = "echo VoidLinux | figlet -f slant && distrobox enter voidlinux"; # starts voidlinux docker container

    #Distrobox Utilities
    stop = "distrobox-stop -a"; #kills all containers images,
    dist-list = "distrobox list"; # shows all distro containers
    dist-rm = "distrobox-rm"; # removes the container specified
    dist-upgrade = "echo beginning upgrades to all containers; distrobox-upgrade -a";

    # Ricing shit
    weather = "curl -4 wttr.in/toronto"; # fetches weather (toronto only)
    music = "cd /home/admin/Music && cmus";
    };
  };
}
