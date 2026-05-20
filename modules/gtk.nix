{
  dconf.settings = {
  	"org/gnome/desktop/interface" = {
  	  color-scheme = "prefer-dark";
  	};
  };

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };
}
