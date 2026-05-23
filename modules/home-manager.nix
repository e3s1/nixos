{ inputs, config, pkgs, ... }:

{
  home-manager.users.eric = { pkgs, ... }: {
    nixpkgs.config.allowUnfree = true;
  
  	home.packages = with pkgs; [
 	  micro
	];

	home.pointerCursor = {
	  gtk.enable = true;
	  x11.enable = true;

	  package = pkgs.bibata-cursors;
	  name = "Bibata-Modern-Classic";
	  size = 24;
	};
	
	# programs.bash.enable = true;
	
	# programs.git = {
	#   enable = true;
	#   settings = {
	#     user.name = "e3s1";
	#     user.email = "126372694@users.noreply.github.com";
	#     init.defaultBranch = "main";
 #      };
	# };

	programs.fish = {
	  enable = true;
	  interactiveShellInit = ''
		set fish_greeting # disable greeting
	  '';
	  plugins = [
	  	
	  ];
	};

	programs.ssh = {
	  enable = true;
	  enableDefaultConfig = false;
	  matchBlocks = {
	  	"github.com" = {
	  	  user = "git";
	  	  identityFile = "~/.ssh/id_github_ed25519";
	  	  identitiesOnly = true;
	  	};
	  };
	};

	home.stateVersion = "25.11";
  };
}
