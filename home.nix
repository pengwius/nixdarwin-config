{ config, pkgs, lib, ... }:

{
	
  home.homeDirectory = lib.mkForce "/Users/pengwius";

  home.file = {
    ".config/nvim" = {
      source = ./dotfiles/nvim;
      recursive = true;
    };
    ".config/neofetch" = {
      source = ./dotfiles/neofetch;
      recursive = true;
    };
    ".config/hyfetch.json" = {
      source = ./dotfiles/hyfetch.json;
      recursive = true;
    };
    ".config/spicetify" = {
      source = ./dotfiles/spicetify;
      recursive = true;
    };
  };

  programs.git.enable = true;
  home.packages = with pkgs; [ neovim neofetch starship ];
  home.stateVersion = "24.11";
}

