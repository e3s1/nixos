{ ... }: {
  sops = {
  	defaultSopsFile = ../secrets/secrets.yaml;
  	defaultSopsFormat = "yaml";
  	age.keyFile = "/var/lib/sops-nix/key.txt";

  	secrets = {
  	  "id_github_ed25519" = {
  	  	path = "/home/eric/.ssh/id_github_ed25519";
  	  	owner = "eric";
  	  	group = "users";
  	  	mode = "0600";
  	  };
  	  "id_github_ed25519_pub" = {
  	  	path = "/home/eric/.ssh/id_github_ed25519.pub";
  	  	owner = "eric";
  	  	group = "users";
  	  	mode = "0644";
  	  };
  	};
  };
}
