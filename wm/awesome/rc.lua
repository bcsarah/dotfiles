pcall(require, "luarocks.loader")

local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local naughty = require("naughty")
require("awful.autofocus")

-- Tema Gruvbox
beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
beautiful.font = "JetBrainsMono Nerd Font 10"
beautiful.bg_normal = "#282828"
beautiful.bg_focus = "#3c3836"
beautiful.fg_normal = "#ebdbb2"
beautiful.fg_focus = "#ebdbb2"
beautiful.border_width = 2
beautiful.border_normal = "#3c3836"
beautiful.border_focus = "#458588"
beautiful.useless_gap = 5

local mod = "Mod4"
local terminal = "kitty"
local dwindle = awful.layout.suit.spiral.dwindle

awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.floating,
}

-- Workspaces
awful.screen.connect_for_each_screen(function(s)
    awful.tag({ "1", "2", "3", "4" }, s, dwindle)
end)

local function spawn(cmd)
    awful.spawn.with_shell(cmd)
end

local function focus(dir)
    awful.client.focus.bydirection(dir)
end

local function move(dir)
    awful.client.swap.bydirection(dir)
end

-- Atalhos
local keys = gears.table.join(
    -- Aplicativos
    awful.key({mod}, "q", function() spawn(terminal) end),
    awful.key({mod}, "e", function() spawn("thunar") end),
    awful.key({mod}, "r", function() spawn("rofi -show drun") end),
    awful.key({mod, "Shift"}, "r", function() spawn("rofi -show run") end),
    awful.key({mod}, "Tab", function() spawn("rofi -show window") end),
    awful.key({mod, "Shift"}, "v", function()
        spawn('rofi -modi "clipboard:greenclip print" -show clipboard')
    end),
    awful.key({mod}, "b", function() spawn("firefox") end),
    awful.key({mod}, "o", function() spawn("obsidian") end),
    awful.key({mod}, "z", function() spawn("pavucontrol") end),

    -- Foco e movimentação (HJKL)
    awful.key({mod}, "h", function() focus("left") end),
    awful.key({mod}, "j", function() focus("down") end),
    awful.key({mod}, "k", function() focus("up") end),
    awful.key({mod}, "l", function() focus("right") end),
    awful.key({mod, "Shift"}, "h", function() move("left") end),
    awful.key({mod, "Shift"}, "j", function() move("down") end),
    awful.key({mod, "Shift"}, "k", function() move("up") end),
    awful.key({mod, "Shift"}, "l", function() move("right") end),

    -- Layout e janelas
    awful.key({mod}, "w", function()
        if client.focus then client.focus:kill() end
    end),
    awful.key({mod}, "v", function()
        if client.focus then awful.client.floating.toggle(client.focus) end
    end),
    awful.key({mod}, "f", function()
        if client.focus then
            client.focus.fullscreen = not client.focus.fullscreen
            client.focus:raise()
        end
    end),

    -- Capturas de tela
    awful.key({}, "Print", function()
        spawn("maim --select | xclip -selection clipboard -t image/png") end),
    awful.key({"Control"}, "Print", function()
        spawn("maim | xclip -selection clipboard -t image/png") end),

    -- Mídia e brilho
    awful.key({}, "XF86AudioPlay", function() spawn("playerctl play-pause") end),
    awful.key({}, "XF86AudioNext", function() spawn("playerctl next") end),
    awful.key({}, "XF86AudioPrev", function() spawn("playerctl previous") end),
    awful.key({}, "XF86AudioRaiseVolume", function() spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%") end),
    awful.key({}, "XF86AudioLowerVolume", function() spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%") end),
    awful.key({}, "XF86AudioMute", function() spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle") end),
    awful.key({}, "XF86MonBrightnessUp", function() spawn("brightnessctl set +10%") end),
    awful.key({}, "XF86MonBrightnessDown", function() spawn("brightnessctl set 10%-") end),

    -- Sistema
    awful.key({mod, "Shift"}, "c", awesome.restart),
    awful.key({mod}, "Escape", function() spawn('i3lock -c 2d2d2d') end)
)

-- Super+1..5 troca workspace; Super+Shift+1..5 move a janela.
for i = 1, 4 do
    keys = gears.table.join(keys,
        awful.key({mod}, "#" .. (i + 9), function()
            local tag = awful.screen.focused().tags[i]
            if tag then tag:view_only() end
        end),
        awful.key({mod, "Shift"}, "#" .. (i + 9), function()
            if client.focus then
                local tag = client.focus.screen.tags[i]
                if tag then
                    client.focus:move_to_tag(tag)
                    tag:view_only()
                end
            end
        end)
    )
end

root.keys(keys)

-- Regras de janelas: sem titlebar, borda fina e diálogos flutuantes.
awful.rules.rules = {
    {
        rule_any = {
            class = { "Polybar", "polybar" },
            type = { "dock" },
        },
        properties = {
            floating = true,
            focusable = false,
            focus = false,
            ontop = true,
            sticky = true,
            skip_taskbar = true,
            skip_pager = true,
            buttons = gears.table.join(),
            keys = gears.table.join(),
        },
        rule = {},
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = gears.table.join(
                awful.key({mod}, "w", function(c) c:kill() end),
                awful.key({mod}, "f", function(c)
                    c.fullscreen = not c.fullscreen
                    c:raise()
                end),
                awful.key({mod}, "v", awful.client.floating.toggle)
            ),
            buttons = gears.table.join(
                awful.button({}, 1, function(c)
                    c:emit_signal("request::activate", "mouse_click", {raise = true})
                end),
                awful.button({mod}, 1, function(c)
                    c:emit_signal("request::activate", "mouse_click", {raise = true})
                    awful.mouse.client.move(c)
                end),
                awful.button({mod}, 3, function(c)
                    c:emit_signal("request::activate", "mouse_click", {raise = true})
                    awful.mouse.client.resize(c)
                end)
            ),
            titlebars_enabled = false,
            placement = awful.placement.no_overlap + awful.placement.no_offscreen,
        },
    },
    {
        rule_any = { type = { "dialog" } },
        properties = { floating = true },
    },
}

-- Foco segue o mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)

client.connect_signal("focus", function(c)
    c.border_color = beautiful.border_focus
    mouse.coords({x = c.x + c.width / 2, y = c.y + c.height / 2})
end)

client.connect_signal("unfocus", function(c)
    c.border_color = beautiful.border_normal
end)

-- Programas de inicialização (não reinicia a cada reload).
if awesome.startup then
    spawn("picom")
    spawn("pkill polybar; polybar")
    spawn('xautolock -time 10 -locker "i3lock -c 2d2d2d" -detectsleep')
    spawn("feh --bg-fill ~/dotfiles/wallpaper.png")
    spawn("redshift -O 4500 -P")
    spawn("greenclip daemon")
    spawn("syncthing --no-browser")
end

-- Avisos de erro da configuração.
if awesome.startup_errors then
    naughty.notify({
        preset = naughty.config.presets.critical,
        title = "Erro ao iniciar o Awesome",
        text = awesome.startup_errors,
    })
end

awesome.connect_signal("debug::error", function(err)
    naughty.notify({
        preset = naughty.config.presets.critical,
        title = "Erro no Awesome",
        text = tostring(err),
    })
end)
