{ config, pkgs, ... }

{
  programs.steam = {
    enable = true;
  };

  services.flatpak = {
    enable = true;
    packages = [
      "org.vinegarhq.Sober"
      "io.mrarm.mcpelauncher"
      "com.mojang.Minecraft"
      "sh.ppy.osu"
    ];
  };
}
