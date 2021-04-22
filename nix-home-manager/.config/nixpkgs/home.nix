{ config, pkgs, libs, ... }:
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;





  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "twelch";
  home.homeDirectory = "/home/twelch";



  # CLI
  xdg.enable = true;

  home.packages = with pkgs; [
    bat
    bitwarden-cli
    coreutils
    curl
    emacs
    exa
    fd
    fzf
    gawk
    gnumake
    gnupg
    gnused
    gnutls
    keychain
    nix-zsh-completions
    neovim
    ripgrep
    rsync
    stow
    tmux
    tree
    universal-ctags
    unzip
    vim
    watch
    watchman
    wget

    ledger
    editorconfig-core-c
    glslang
    xclip
    python38Full
    python38Packages.pytest
    python38Packages.nose
    python38Packages.isort
    python38Packages.pyflakes
    python38Packages.setuptools
    python38Packages.markdown
    pipenv
    maim
    shellcheck
    rtags
    jq
    gnuplot
    nixfmt
    black # python formatter
    xdotool # X11 keyboard and mouse simulation
    nodejs

    font-awesome
    terminus_font
    hack-font
    emacs-all-the-icons-fonts
    sqlite # Used by org-roam
  ];

  programs.fzf.enable = true;






  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";
}
