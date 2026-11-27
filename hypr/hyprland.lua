------------------
---- MONITORS ----
------------------
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})


-------------------
---- AUTOSTART ----
-------------------
hl.on("hyprland.start", function () 
    hl.exec_cmd("swaybg -i ~/.wpp")
    hl.exec_cmd("wlsunset -T 4001 -t 4000")
    hl.exec_cmd("syncthing --no-browser")
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------
--hl.env("XCURSOR_SIZE", "24")
--hl.env("HYPRCURSOR_SIZE", "24")


-----------------------
---- LOOK AND FEEL ----
-----------------------
hl.config({
    general = {
        gaps_in  = 2,
        gaps_out = 4,

        border_size = 0,

        col = {
            active_border   = "#B14242",
            inactive_border = "#949494",
        },

        resize_on_border = false,
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 4,
        rounding_power = 2,

        active_opacity   = 0.95,
        inactive_opacity = 0.85,

        blur = {
            enabled   = true,
            size      = 3,
            passes    = 1,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

hl.curve("easy",           { type = "spring", mass = 1, stiffness = 238.1191, damping = 24.21279333 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })

-- Dwindle
hl.config({
    dwindle = {
        force_split = 2,
        preserve_split = true,
    },
})

-- Scrolling
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
        wrap_swapcol = false,
    },
})

----------------
----  MISC  ----
----------------
hl.config({
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo   = true,
    },
})


----------------
---- LAYERS ----
----------------
hl.config({
    layers = {
        allow_new_top_layers_over_existing_fullscreen = true,
    },
})


---------------
---- INPUT ----
---------------
hl.config({
    input = {
        kb_layout  = "br",
        kb_variant = "abnt2",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0,

        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "vertical",
    action = "workspace"
})


---------------------
---- KEYBINDINGS ----
---------------------
local mainMod = "SUPER"

hl.bind(mainMod .. " + Q",         hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + W",         hl.dsp.window.close())
hl.bind(mainMod .. " + E",         hl.dsp.exec_cmd("thunar"))
hl.bind(mainMod .. " + R",         hl.dsp.exec_cmd("rofi -show drun"))
hl.bind(mainMod .. " + Shift + R", hl.dsp.exec_cmd("rofi -show run"))

hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("firefox"))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("kitty -e cmus"))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("rofimoji"))
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd("pavucontrol"))

hl.bind(mainMod .. " + Escape",    hl.dsp.exec_cmd("~/dotfiles/scripts/power-menu"))
hl.bind(mainMod .. " + Shift + W", hl.dsp.exec_cmd("~/dotfiles/scripts/wpp"))
hl.bind(mainMod .. " + N",         hl.dsp.exec_cmd("~/dotfiles/scripts/dev"))
hl.bind(mainMod .. " + O",         hl.dsp.exec_cmd("~/dotfiles/scripts/notes"))

hl.bind(mainMod .. " + F",         hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(mainMod .. " + Shift + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + V",         hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + U",         hl.dsp.layout("togglesplit"))

hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + Shift + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + Shift + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + Shift + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + Shift + J", hl.dsp.window.move({ direction = "down" }))

-- Workspaces
for i = 1, 4 do
    hl.bind(mainMod .. " + " .. i,          hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. i,  hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + Tab", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + Shift + Tab",   hl.dsp.focus({ workspace = "e-1" }))

-- Mouse
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse:272",  hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273",  hl.dsp.window.resize(), { mouse = true })

-- Media
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })
hl.bind("XF86AudioNext",        hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause",       hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",        hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",        hl.dsp.exec_cmd("playerctl previous"),   { locked = true })


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------
hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

-- firefox
hl.window_rule({
    match = { class = "firefox" },
    workspace = "2",
    --maximize = true,
})

hl.window_rule({
    match = { title = "Picture-in-Picture" },
    float = true,
    --maximize = false,
})

-- gamez
hl.window_rule({
    match = { class = "^(steam|sh.ppy.osu|org.vinegarhq.Sober|Fightcade)" },
    workspace = "3",
    --maximize = true,
})

-- pavucontrol
hl.window_rule({
    match = { class = "org.pulseaudio.pavucontrol" },
    float = true,
})

-- thunar
hl.window_rule({
    match = { title = "File Operation Progress" },
    float = true,
})
