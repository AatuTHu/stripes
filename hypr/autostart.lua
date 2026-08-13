-------------------
---- AUTOSTART ----
-------------------
hl.on("hyprland.start", function()
  hl.exec_cmd("waybar & hyprpaper & swaync & hyprpolkitagent")
end)
