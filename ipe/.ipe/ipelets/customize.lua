----------------------------------------------------------------------
-- My customization ipelet: customize.lua
----------------------------------------------------------------------
-- Default preferences can be found in '/usr/share/ipe/7.2.13/lua/prefs.lua'
-- Default shortcuts can be found in '/usr/share/ipe/7.2.13/lua/shortcuts.lua'

-- External editor for editing text objects
-- must contain '%s' for the temporary filename
-- set this to nil to hide the "Editor" button on text dialogs
prefs.external_editor = "vim --servername ipe --remote-wait %s"

-- Should the external editor be called automatically?
prefs.auto_external_editor = nil
-- Should closing the external editor immediately close the editing dialog?
prefs.editor_closes_dialog = nil

-- Minimum size of dialog window for creating/editing text objects
prefs.editor_size = { 600, 400 }

-- Zoom with mouse wheel (instead of pan)
prefs.scroll.pan = false