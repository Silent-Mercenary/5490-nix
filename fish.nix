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

    # Ricing shit
    weather = "curl -4 wttr.in/toronto"; # fetches weather (toronto only)
    music = "cd /home/admin/Music && cmus";
    };
  };
}
