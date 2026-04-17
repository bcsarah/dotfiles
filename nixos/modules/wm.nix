{ pkgs, inputs, ... }

{
  # Hyprland
  programs.hyprland.enable = true;

  # Niri
  programs.niri = {
    enable = true;

    settings = {
      binds = {};
    };
  };

  enviroment.systemPackages = [
    pkgs.xwayland-satllite
  ];

  home-manager.users.bcsarah = {
    imports = [ inputs.noctalia.homeModules.default ];
    programs.noctalia-shell = {
      enable = true;
    };
  };
}
