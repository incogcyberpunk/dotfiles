-- Arch's qt6-declarative puts `qmlls6` on PATH; plain `qmlls` lives in /usr/lib/qt6/bin.
-- Quickshell writes a `.qmlls.ini` (import paths for `qs.*` and its modules) into each
-- shell root, so prefer it as the root marker: every worktree's shell gets its own root.
return {
  cmd = { 'qmlls6' },
  filetypes = { 'qml', 'qmljs' },
  root_markers = { '.qmlls.ini', '.git' },
}
