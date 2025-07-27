{ config, pkgs, ... }:

{
  home.username = "jos";
  home.homeDirectory = "/home/jos";

  programs.home-manager.enable = true;

  home.stateVersion = "24.05";

  imports = [
    ../../home/alacritty.nix
    ../../home/neovim.nix
    ../../home/fish.nix
  ];


  home.file = {
  ".config/alacritty" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/alacritty";
    recursive = true;
  };
  ".config/nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/nvim";
    recursive = true;
  };
  ".config/fish" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/fish";
    recursive = true;
  };
};

}

