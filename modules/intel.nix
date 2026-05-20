{ pkgs, ... }:

{
  hardware.graphics = {
  	enable = true;
  	extraPackages = with pkgs; [
	  intel-media-driver
	];
  };

  environment.systemPackages = with pkgs; [
	libva-utils
	ffmpeg
  ];

  hardware.enableRedistributableFirmware = true;
  hardware.firmware = [ pkgs.linux-firmware ];
}
