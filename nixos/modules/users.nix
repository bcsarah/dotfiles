{ config, pkgs, ... }:

{
    # Users
    users.users.bcsarah = {	# i :3
        isNormalUser = true;
        description = "Better Call Sarah";
        extraGroups = [ "networkmanager" "wheel" ];
        shell = pkgs.zsh;
    };

    users.defaultUserShell = pkgs.zsh;
}
