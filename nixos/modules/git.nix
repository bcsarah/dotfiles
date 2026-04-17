{ config, pkgs, ... }

{
  programs.git = {
    enable = true;
    settings.user = {
      name = "Better Call Sarah";
      email = "sarahalencar6409@gmail.com";
    };
  };
  programs.lazygit.enable = true;
}
