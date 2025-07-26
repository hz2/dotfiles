{ config, pkgs, ... }:

{
  home.username = "jos";
  home.homeDirectory = "/home/jos";

  programs.home-manager.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraConfig = ''
      set number
      set relativenumber
    '';
  };

  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 0.95;
      font.size = 12;
    };
  };

  programs.tmux = {
    enable = true;
    terminal = "screen-256color";
    extraConfig = ''
      set -g mouse on
    '';
  };

  programs.fish = {
    enable = true;
    shellAliases = {
      ll = "ls -alF";
      gs = "git status";
    };
  };

  home.stateVersion = "24.05";
}

