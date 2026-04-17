{ config, pkgs, ... }

{
  programs.fish = {
    enable = true;
    shellInit = ''
        function fish_greeting
        end

        function fish_prompt
            set_color yellow
            echo -n (prompt_pwd)

            if git rev-parse --is-inside-work-tree >/dev/null 2>&1
                set branch (git branch --show-current)
                if not git diff --quiet --ignore-submodules
                    set_color red
                    set git_icon "✗"
                else
                    set_color brpurple
                    set git_icon "✔"
                end
                echo -n " ("$branch" "$git_icon")"
            end

            set_color red
            echo -n " ❯ "

            set_color normal
        end
    '';
  shellAliases = {
    img = "kitty +kitten icat";
  };
}
