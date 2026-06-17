{ ... }:

{
  # Fish Shell
  programs.fish = {
    enable = true;
    shellAliases = {

      # Nix Aliases
      sudo = "doas";
      snrs = "snrsf";
      snrt = "sudo nixos-rebuild test";
      nfu = "cd /etc/nixos && nix flake update";
      snrsf = "sudo nixos-rebuild switch --upgrade-all --flake /etc/nixos";

      # Shell Conveniences
      cd = "z";
      fuck = "commandline -i \"doas $history[1]\";history delete --exact --case-sensitive fuck";

      # Eza
      ls = "eza -al --color=always --group-directories-first --icons";

      # Ricing shit
      weather = "curl -4 wttr.in/toronto"; # fetches weather (toronto only)
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
