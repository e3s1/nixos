{ inputs, config, pkgs, ... }:

{
  home-manager.users.eric = { pkgs, ... }: {
  	home.packages = with pkgs; [
 	  micro
	];
	
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
