-- Adjust the default theme's font and size.
if not CURSES then
  view:set_theme('dark', {font = 'JetBrains Mono', size = 12})
end

-- Always strip trailing spaces on save
textadept.editing.strip_trailing_space = true
