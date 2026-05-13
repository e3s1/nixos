{ lib, inputs, config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  	mako
  	alacritty
  	fuzzel
  	libsecret
  	xwayland-satellite
  ];
  
  programs.niri = {
    enable = true;
  };

  services.greetd = {
  	enable = true;
  	settings = {
  	  default_session = {
  	  	command = "${config.programs.niri.package}/bin/niri-session";
  	  	user = "eric";
  	  };
  	};
  };
  systemd.user.services.niri.enableDefaultPath = false;
  
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  security.pam.services = {
    greetd.enableGnomeKeyring = true;
    greetd-password.enableGnomeKeyring = true;
    login.enableGnomeKeyring = true;
  };
  services.dbus.packages = with pkgs; [ gnome-keyring gcr ];
  programs.seahorse.enable = true;

  environment.variables.NIXOS_OZONE_WL = "1";

  home-manager.users.eric = {
  	imports = [
      inputs.niri-flake.homeModules.config	
  	];

  	programs.niri.settings = {
	  clipboard.disable-primary = true; # m-click paste
	  prefer-no-csd = true;
	  spawn-at-startup = [
#	    { argv = ["gnome-keyring-daemon" "--start" "--components=secrets"]; }
	    { argv = ["noctalia-shell"]; }
	    { argv = ["wl-clip-persist" "--clipboard" "regular"]; }	
	  ];
	  window-rules = [
            {
              matches = [ { app-id = "firefox$"; title = "^Picture-in-Picture$"; } ];
              open-floating = true;
            }
          ];
          binds = {
            "Mod+Shift+Slash".action.show-hotkey-overlay = [];
            "Mod+T" = {
              action.spawn = "alacritty";
              hotkey-overlay.title = "Open Terminal";
            };
            "Mod+D" = {
              action.spawn = "fuzzel";
              hotkey-overlay.title = "Open Fuzzel";
            };
            "Super+Alt+L" = {
              action.spawn = "swaylock";
              hotkey-overlay.title = "Lock";
            };
            
            "XF86AudioRaiseVolume" = {
              allow-when-locked = true;
              action.spawn = [ "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+" "-1" "1.0" ];
            };
            "XF86AudioLowerVolume" = {
              allow-when-locked = true;
              action.spawn = [ "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-" ];
            };
            "XF86AudioMute" = {
              allow-when-locked = true;
              action.spawn = [ "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle" ];
            };
            "XF86AudioMicMute" = {
              allow-when-locked = true;
              action.spawn = [ "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle" ];
            };

            "XF86AudioPlay" = {
              allow-when-locked = true;
              action.spawn = [ "playerctl" "play-pause" ];
            };
            "XF86AudioStop" = {
              allow-when-locked = true;
              action.spawn = [ "playerctl" "stop" ];
            };
            "XF86AudioPrev" = {
              allow-when-locked = true;
              action.spawn = [ "playerctl" "previous" ];
            };        
            "XF86AudioNext" = {
              allow-when-locked = true;
              action.spawn = [ "playerctl" "next" ];
            };            

            "XF86MonBrightnessUp" = {
              allow-when-locked = true;
              action.spawn = [ "brightnessctl" "--class=backlight" "set" "+10%" ];	
            };
            "XF86MonBrightnessDown" = {
              allow-when-locked = true;
              action.spawn = [ "brightnessctl" "--class=backlight" "set" "10%-" ];	
            };     

            "Mod+O" = {
              repeat = false;
              action.toggle-overview = [];
            };

            "Mod+Q" = {
              repeat = false;
              action.close-window = [];
            };

            "Mod+Left".action.focus-column-left = [];
            "Mod+Down".action.focus-window-down = [];
            "Mod+Up".action.focus-window-up = [];
            "Mod+Right".action.focus-column-right = [];

          };
      xwayland-satellite.path = "${lib.getExe pkgs.xwayland-satellite}";	
  	};

  };
}
