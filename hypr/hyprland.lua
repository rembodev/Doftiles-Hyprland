-- #######################################################################################
-- CONFIGURACIÓN DE HYPRLAND TRADUCIDA A LUA (v0.55+)
-- #######################################################################################

local hyprland = require("hyprland")

-----------------------------------------------------------------------------------------
-- VARIABLES DE USUARIO (PROGRAMAS)
-----------------------------------------------------------------------------------------
local terminal = "ghostty"
local fileManager = "thunar"
local menu = "rofi -show drun"
local browser = "firefox"
local mainMod = "SUPER"

-----------------------------------------------------------------------------------------
-- MONITORES
-----------------------------------------------------------------------------------------
hyprland.monitor({ "VGA-1,1600x900@60,0x0,1" })

-----------------------------------------------------------------------------------------
-- AUTOSTART (EXEC-ONCE)
-----------------------------------------------------------------------------------------
hyprland.exec_once({
    "awww-daemon &",
    "waybar",
    "swaync",
    "~/.config/hypr/scripts/cambia-fondo.sh &",
    "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP",
    "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
})

-----------------------------------------------------------------------------------------
-- VARIABLES DE ENTORNO (ENV)
-----------------------------------------------------------------------------------------
hyprland.env({
    "XCURSOR_SIZE,24",
    "HYPRCURSOR_THEME,rose-pine-hyprcursor",
    "HYPRCURSOR_SIZE,24",
    "XDG_SESSION_TYPE,wayland",
    "WLR_NO_HARDWARE_CURSORS,1"
})

-----------------------------------------------------------------------------------------
-- CONFIGURACIÓN GENERAL Y ESTILO (LOOK AND FEEL)
-----------------------------------------------------------------------------------------
hyprland.setup({
    general = {
        gaps_in = 5,
        gaps_out = 15,
        border_size = 2,
        ["col.active_border"] = "rgba(33ccffee) rgba(00ff99ee) 45deg",
        ["col.inactive_border"] = "rgba(595959aa)",
        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle"
    },

    decoration = {
        rounding = 10,
        rounding_power = 5,
        active_opacity = 1.0,
        inactive_opacity = 0.9,
        
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            ignore_window = true,
            color = "rgba(1a1a1aee)"
        },

        blur = {
            enabled = true,
            size = 5,
            passes = 1,
            vibrancy = 0.1696
        }
    },

    animations = {
        enabled = true,
        
        bezier = {
            "easeOutQuint, 0.23, 1, 0.32, 1",
            "easeInOutCubic, 0.65, 0.05, 0.36, 1",
            "linear, 0, 0, 1, 1",
            "almostLinear, 0.5, 0.5, 0.75, 1",
            "quick, 0.15, 0, 0.1, 1"
        },

        animation = {
            "global, 1, 10, default",
            "border, 1, 5.39, easeOutQuint",
            "windows, 1, 4.79, easeOutQuint",
            "windowsIn, 1, 4.1, easeOutQuint, popin 87%",
            "windowsOut, 1, 1.49, linear, popin 87%",
            "fadeIn, 1, 1.73, almostLinear",
            "fadeOut, 1, 1.46, almostLinear",
            "fade, 1, 3.03, quick",
            "layers, 1, 3.81, easeOutQuint",
            "layersIn, 1, 4, easeOutQuint, fade",
            "layersOut, 1, 1.5, linear, fade",
            "fadeLayersIn, 1, 1.79, almostLinear",
            "fadeLayersOut, 1, 1.39, almostLinear",
            "workspaces, 1, 1.94, almostLinear, fade",
            "workspacesIn, 1, 1.21, almostLinear, fade",
            "workspacesOut, 1, 1.94, almostLinear, fade",
            "zoomFactor, 1, 7, quick"
        }
    },

    dwindle = {
        pseudotile = true,
        preserve_split = true
    },

    master = {
        new_status = "master"
    },

    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = false
    },

    input = {
        kb_layout = "us",
        kb_variant = "altgr-intl",
        kb_model = "",
        kb_options = "",
        kb_rules = "",
        follow_mouse = 1,
        sensitivity = 0,
        
        touchpad = {
            natural_scroll = false
        }
    },

    cursor = {
        no_hardware_cursors = true
    }
})

-----------------------------------------------------------------------------------------
-- DISPOSITIVOS (PER-DEVICE CONFIG)
-----------------------------------------------------------------------------------------
hyprland.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5
})

-----------------------------------------------------------------------------------------
-- ATALJOS DE TECLADO (KEYBINDINGS)
-----------------------------------------------------------------------------------------

-- Gestos de Hyprland
hyprland.bind({ "3, horizontal, workspace", mode = "gesture" })

-- Binds estándar
hyprland.bind({
    -- Atajos principales de aplicaciones
    { mainMod, "RETURN", "exec", terminal },
    { mainMod, "Q", "killactive", "" },
    { mainMod, "M", "exec", "command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit" },
    { mainMod, "E", "exec", fileManager },
    { mainMod, "V", "togglefloating", "" },
    { mainMod, "B", "exec", browser },
    { mainMod, "D", "exec", "~/.config/rofi/launchers/type-2/launcher.sh || pkill rofi" },
    { mainMod, "P", "pseudo", "" },
    { mainMod, "J", "togglesplit", "" },
    { "", "Print", "exec", "hyprshot -m output -m active" },
    { mainMod .. " SHIFT", "S", "exec", "hyprshot -m region" },

    -- Enfoque de ventanas (Flechas)
    { mainMod, "left", "movefocus", "l" },
    { mainMod, "right", "movefocus", "r" },
    { mainMod, "up", "movefocus", "u" },
    { mainMod, "down", "movefocus", "d" },

    -- Cambiar de espacio de trabajo
    { mainMod, "1", "workspace", "1" },
    { mainMod, "2", "workspace", "2" },
    { mainMod, "3", "workspace", "3" },
    { mainMod, "4", "workspace", "4" },
    { mainMod, "5", "workspace", "5" },
    { mainMod, "6", "workspace", "6" },
    { mainMod, "7", "workspace", "7" },
    { mainMod, "8", "workspace", "8" },
    { mainMod, "9", "workspace", "9" },
    { mainMod, "0", "workspace", "10" },

    -- Mover ventana al espacio de trabajo
    { mainMod .. " SHIFT", "1", "movetoworkspace", "1" },
    { mainMod .. " SHIFT", "2", "movetoworkspace", "2" },
    { mainMod .. " SHIFT", "3", "movetoworkspace", "3" },
    { mainMod .. " SHIFT", "4", "movetoworkspace", "4" },
    { mainMod .. " SHIFT", "5", "movetoworkspace", "5" },
    { mainMod .. " SHIFT", "6", "movetoworkspace", "6" },
    { mainMod .. " SHIFT", "7", "movetoworkspace", "7" },
    { mainMod .. " SHIFT", "8", "movetoworkspace", "8" },
    { mainMod .. " SHIFT", "9", "movetoworkspace", "9" },
    { mainMod .. " SHIFT", "0", "movetoworkspace", "10" },

    -- Navegación con la rueda del ratón
    { mainMod, "mouse_down", "workspace", "e+1" },
    { mainMod, "mouse_up", "workspace", "e-1" },

    -- Atajos de Zoom personalizado
    { mainMod .. " SHIFT", "equal", "exec", "hypr-zoom -target=2.0 -duration=200 -easing=OutExpo" },
    { mainMod .. " SHIFT", "minus", "exec", "hypr-zoom -target=1.0 -duration=300 -easing=InOutExpo" }
})

-- Binds del ratón (Mover / Redimensionar)
hyprland.bind({
    { mainMod, "mouse:272", "movewindow", "", mode = "mouse" },
    { mainMod, "mouse:273", "resizewindow", "", mode = "mouse" }
})

-- Binds con flags especiales (bindel - locked/repeat, bindl - locked)
hyprland.bind({
    -- Multimedia & Brillo (Locked + Repeat / "bindel")
    { "", "XF86AudioRaiseVolume", "exec", "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+", mode = "el" },
    { "", "XF86AudioLowerVolume", "exec", "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-", mode = "el" },
    { "", "XF86AudioMute", "exec", "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle", mode = "el" },
    { "", "XF86AudioMicMute", "exec", "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle", mode = "el" },
    { "", "XF86MonBrightnessUp", "exec", "brightnessctl -e4 -n2 set 5%+", mode = "el" },
    { "", "XF86MonBrightnessDown", "exec", "brightnessctl -e4 -n2 set 5%-", mode = "el" },

    -- Control del reproductor (Locked / "bindl")
    { "", "XF86AudioNext", "exec", "playerctl next", mode = "l" },
    { "", "XF86AudioPause", "exec", "playerctl play-pause", mode = "l" },
    { "", "XF86AudioPlay", "exec", "playerctl play-pause", mode = "l" },
    { "", "XF86AudioPrev", "exec", "playerctl previous", mode = "l" }
})

-----------------------------------------------------------------------------------------
-- REGLAS DE VENTANAS (WINDOW RULES)
-----------------------------------------------------------------------------------------

hyprland.windowrule({
    -- Suppress maximize events
    {
        match = { class = ".*" },
        suppress_event = "maximize"
    },
    -- Fix xwayland drags
    {
        match = {
            class = "^$",
            title = "^$",
            xwayland = true,
            float = true,
            fullscreen = false,
            pin = false
        },
        no_focus = true
    },
    -- Move hyprland-run
    {
        match = { class = "hyprland-run" },
        move = "20 monitor_h-120",
        float = true
    }
})