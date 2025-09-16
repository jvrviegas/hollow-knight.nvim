-- Hollow Knight theme auto-initialization
-- This ensures the theme is available after installation

if vim.g.colors_name == 'hollow-knight' then
  require('hollow-knight').setup()
end