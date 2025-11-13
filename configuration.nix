# Nix Setup

# Imports
{ config, lib, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./home.nix
    ];
  
  # Customizations
  services.xserver = {
    enable = true;
    windowManager.i3 = {
      enable = true;
      configFile = ./i3-config;
    };
    # Pluggable dual monitors
    videoDrivers = [ "displaylink" "modesetting" ];
    displayManager.sessionCommands = '' ${lib.getBin pkgs.xorg.xrandr}/bin/xrandr --setprovideroutputsource 2 0 '';
  };
  programs.i3lock.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "nixos"; # Define your hostname.  
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  
  # Enable networking
  networking.networkmanager.enable = true;
  
  # Set your time zone.
  time.timeZone = "America/Chicago";
  
  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ts = {
    isNormalUser = true;
    description = "ts";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
  
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
 
  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    google-chrome
    vscodium
    arandr # Monitor setup
    git
    gh
    dbeaver-bin
    slack
    powershell
    nodejs_22
    pam_u2f # Yubikey setup
    neofetch # OS Snapshot
    scrot # Screenshots
    alacritty # Better Terminal
    gedit # text editor
    feh # Image-Viewer
    displaylink # Pluggable DisplayLink (Synaptics) Dock driver
    linuxKernel.packages.linux_xanmod_stable.evdi # Dock driver
    obs-studio
    pkgs.go
    pkgs.delve # go debugger
  ];
  
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}