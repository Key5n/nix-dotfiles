{
  pkgs,
  lib,
  ...
}: {

  xsession.windowManager.i3 = {
    enable = true;

    # ignores all home-manager's default i3 config
    config = lib.mkForce null;
    extraConfig = builtins.readFile ./config;
  };

  home.packages = with pkgs; [
    rofi
    dunst
    i3lock
    xautolock
    feh
    acpi
    arandr
    xbindkeys
    xorg.xbacklight
    xorg.xdpyinfo
    sysstat
  ];
}
