{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  home-manager.users.eric.xdg.configFile."noctalia/settings.json".source = ./settings.json;
  home-manager.users.eric.home.file."Pictures/Wallpapers/wallpaper-2880x1800.png".source = ../../resources/wallpaper-2880x1800.png;
}
