{ config, pkgs, ... }:

{
  nix.package = pkgs.lixPackageSets.stable.lix;

  security.pam.services.sudo_local.touchIdAuth = true;

  networking = {
    computerName = "eugemachine";
    hostName = "eugemachine";
    localHostName = "eugemachine";
  };

  environment.systemPackages = with pkgs; [
    vim
    neovim
    sl
    git
    neofetch
    hyfetch
    mactop
    yarn
    android-tools
    htop
    btop
    ffmpeg
    cloudflared
    nix-prefetch-git
    nixpkgs-fmt
    nixpkgs-review
  ];

  programs.zsh.enable = true;
  system.stateVersion = 6;
}

