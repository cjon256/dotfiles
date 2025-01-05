{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
    let
      configuration = { pkgs, ... }: {
        # List packages installed in system profile. To search by name, run:
        # $ nix-env -qaP | grep wget
        environment.systemPackages = [ pkgs.coreutils pkgs.nixfmt ];

        fonts.packages = with pkgs; [
          recursive
          (nerdfonts.override { fonts = [ "InconsolataLGC" ]; })
        ];

        homebrew = {
          enable = true;
          onActivation = {
            autoUpdate = true;
            upgrade = true;
            cleanup = "zap";
          };

          taps = [
            "nikitabobko/tap"
            "koekeishiya/formulae"
            "FelixKratz/formulae"
            "espanso/espanso"
          ];

          brews = [
            "luarocks"
            "mas"
            "ykman"
            "zplug"
            "zsh-completions"
            "zsh-syntax-highlighting"
            "zoxide"
            # this is for github:Logicer16/pam-watchid.git
            "pam-reattach"
            "koekeishiya/formulae/skhd"
            "tfenv"
            "pandoc"
            "felixkratz/formulae/borders"
            "hugo"
            "gh"
            "neovim"
            "wget"
            "chezmoi"
            "ripgrep"
            "nodejs"
            "cheat"
            "luarocks"
            "tmux"
            "starship"
            "gnu-sed"
            "selene"
            "fzf"
            "lsd"
            "diff-so-fancy"
            "awscli"
            "fd"
            "markdownlint-cli2"
            "markdown-toc"
            "codecrafters-io/tap/codecrafters"
            "bruno-cli"
            "exercism"
            "yadm"
            "git-secrets"
          ];
          casks = [
            "1password"
            "1password-cli"
            "alfred"
            "kitty"
            "slack"
            "nikitabobko/tap/aerospace"
            "firefox"
            "homerow"
            "wezterm"
            "rectangle-pro"
            "hammerspoon"
            "vivaldi"
            "alt-tab"
            "karabiner-elements"
            "espanso"
            "google-chrome"
            "brave-browser"
            "anki"
            "bruno"
            "bbedit"
            "ghostty"
          ];

          masApps = {
            "1Password for Safari" = 1569813296;
            "Agenda" = 1287445660;
            "AmorphousDiskMark" = 1168254295;
            "Amphetamine" = 937984704;
            "Drafts" = 1435957248;
            "GarageBand" = 682658836;
            "Keynote" = 409183694;
            "Numbers" = 409203825;
            "Pages" = 409201541;
            "Pixelmator Pro" = 1289583905;
            "Things" = 904280696;
            "Vimari" = 1480933944;
            "iMovie" = 408981434;
          };
        };

        system = {
          defaults = {
            NSGlobalDomain = {
              AppleKeyboardUIMode = 3;
              AppleInterfaceStyle = "Dark";
              AppleShowAllExtensions = true;
              ApplePressAndHoldEnabled = true;

              AppleShowAllFiles = true;
              "com.apple.swipescrolldirection" = false;
              "com.apple.keyboard.fnState" = true;

              # this will not immediately take effect
              _HIHideMenuBar = true;
            };
            hitoolbox.AppleFnUsageType = "Do Nothing";
            WindowManager = { EnableStandardClickToShowDesktop = false; };
            dock = {
              autohide = true;
              autohide-delay = 1000.0;
              show-recents = false;
              launchanim = false;
              mouse-over-hilite-stack = true;
              orientation = "left";
              tilesize = 48;
            };
            CustomUserPreferences = {
              "com.apple.finder" = {
                ShowExternalHardDrivesOnDesktop = false;
                ShowHardDrivesOnDesktop = false;
              };
              "com.apple.spaces" = {
                "spans-displays" = 1; # Display share spaces
              };
            };
          };
        };

        # Necessary for using flakes on this system.
        nix.settings.experimental-features = "nix-command flakes";

        # Enable alternative shell support in nix-darwin.
        # programs.fish.enable = true;

        # Set Git commit hash for darwin-version.
        system.configurationRevision = self.rev or self.dirtyRev or null;

        # Used for backwards compatibility, please read the changelog before changing.
        # $ darwin-rebuild changelog
        system.stateVersion = 5;

        # Required config for nixpkgs
        nixpkgs = {
          # The platform the configuration will be used on.
          hostPlatform = "aarch64-darwin";
          config = { allowUnfree = true; };
        };
      };
    in {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#Arda
      darwinConfigurations."Arda" =
        nix-darwin.lib.darwinSystem { modules = [ configuration ]; };

      # Expose the package set, including overlays, for convenience.
      darwinPackages = self.darwinConfigurations."Arda".pkgs;
    };
}
# vim:nu:ai:sw=2:ts=2:is:et:rnu
