{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "greg";
  home.homeDirectory = "/home/greg";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    alacritty
    gcc
    ripgrep
    fd
    bat
    tree
    git
    zellij
    nushell
    starship
    atuin
    zoxide
    neovim
    fnm
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    (pkgs.nerdfonts.override { fonts = [ "Inconsolata" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  programs = {
    jujutsu = {
      enable = true;
      settings = {
        user = {
          name = "Greg Cline";
          email = "gregcline@fastmail.com";
        };
      };
    };
    helix = {
      enable = true;
      settings = {
        theme = "catppuccin_macchiato";
        editor = {
          rulers = [80];
          cursor-shape.insert = "bar";
          indent-guides.render = true;
        };
        keys.normal = {
          C-h = "jump_view_left";
          C-l = "jump_view_right";
          C-j = "jump_view_down";
          C-k = "jump_view_up";
        };
      };
    };
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/zellij/config.kdl".source = ../../dev/set_up/zellij/config.kdl;
    ".local/share/atuin/init.nu".source = ../../dev/set_up/atuin/init.nu;
    "zoxide.nu".source = ../../dev/set_up/zoxide/zoxide.nu;
    ".config/nushell/env.nu".source = ../../dev/set_up/nushell/env.nu;
    ".config/nushell/config.nu".source = ../../dev/set_up/nushell/config.nu;
    # ".config/nvim/" = {
    #   source = ../../dev/dotfiles/stowed/.config/nvim;
    #   recursive = true;
    # };
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/greg/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "hx";
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
