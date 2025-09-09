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
   
    # Eza
    ls = "eza -al --color=always --group-directories-first --icons";

    # Ricing shit
    weather = "curl -4 wttr.in/toronto"; # fetches weather (toronto only)
    music = "cd /home/admin/Music && cmus";
    };
  };
}


/* 
looking for me? 
# Fisher PM
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
# Tide - Sexier looking Fish Shell
fisher install IlanCosman/tide@v6
# Sponge - Doesn't save typos to History
fisher install meaningful-ooo/sponge
# Done - Notifications for when a long operation is done on fish
fisher install franciscolourenco/done
*/