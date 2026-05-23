{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  	# spotify-qt
  ];

  home-manager.users.eric = {
  	programs.spotify-player = {
  	  enable = true;
  	  # themes = ...
  	  settings = {
  	  	# client_id = config.sops.placeholder."spotify_client_id";
  	  	notify_transient = true;
  	  };
  	};

  	xdg.desktopEntries.spotify-player = {
  	  name = "Spotify";
  	  genericName = "Spotify";
  	  exec = "alacritty spotify_player";
	  terminal = false;
  	  
      categories = [ "Audio" "Music" ];
  	  
  	  icon = ./icon.png;
  	};
  };

}
