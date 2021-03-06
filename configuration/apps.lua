local filesystem = require('gears.filesystem')

-- Thanks to jo148 on github for making rofi dpi aware!
local with_dpi = require('beautiful').xresources.apply_dpi
local get_dpi = require('beautiful').xresources.get_dpi
local rofi_command = 'env /usr/bin/rofi -dpi ' .. get_dpi() .. ' -width ' .. with_dpi(400) .. ' -show drun -theme ' .. filesystem.get_configuration_dir() .. '/configuration/rofi.rasi -run-command "/bin/bash -c -i \'shopt -s expand_aliases; {cmd}\'"'

return {
  -- List of apps to start by default on some actions
  default = {
    terminal = 'gnome-terminal',
    rofi = rofi_command,
    lock = 'i3lock-fancy',
    quake = 'gnome-terminal',
    screenshot = '~/.config/awesome/configuration/utils/screenshot -m',
    region_screenshot = '~/.config/awesome/configuration/utils/screenshot -r',
    delayed_screenshot = '~/.config/awesome/configuration/utils/screenshot --delayed -r',
    
    -- Editing these also edits the default program
    -- associated with each tag/workspace
    browser = 'env chromium',
    editor = 'code', -- gui text editor
    social = 'flatpak run org.telegram.desktop',
    game = 'virt-manager',
    files = 'nautilus',
    music = rofi_command
  },
  -- List of apps to start once on start-up
  run_on_start_up = {
    'nm-applet --indicator', -- wifi
    --'xfce4-power-manager', -- Power manager
    'ibus-daemon --xim --daemonize', -- Ibus daemon for keyboard
    'blueman-tray', -- bluetooth tray
    '~/.config/awesome/configuration/awspawn' -- Spawn "dirty" apps that can linger between sessions
  }
}
