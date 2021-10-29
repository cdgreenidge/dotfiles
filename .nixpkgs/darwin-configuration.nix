{ config, pkgs, ... }:

# Software that would be nice to manage with Nix but doesn't work
# - Anki - blocked due to libxml error, should be fixed soonish
# - Marta - advanced finder replacement, not available in repo
# - Obsidian - Zettelkasten note taking, no package for MacOS
# - iTerm2 - compile error for some reason
{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages =
    [ 
      pkgs.fd
      pkgs.fzf
      pkgs.neovim
      pkgs.pandoc
      pkgs.ripgrep
      pkgs.tldr
      pkgs.tmux
      pkgs.tree
      pkgs.yadm
      pkgs.zoxide
    ];

  fonts = {
    enableFontDir = true;
    fonts = [ 
      pkgs.source-code-pro 
      pkgs.ibm-plex
    ];
  };

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package
  nix.package = pkgs.nix;
  nixpkgs.config.allowUnfree = true;

  # Load zsh - we do our configuration manually
  programs.zsh.enable = true;
  programs.zsh.enableCompletion = false;
  programs.zsh.enableSyntaxHighlighting = false;
  programs.zsh.enableFzfCompletion = false;
  programs.zsh.enableFzfHistory = false;
  programs.zsh.enableFzfGit = false;
  programs.zsh.promptInit = "";

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
