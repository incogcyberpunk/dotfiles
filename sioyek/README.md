# sioyek setup

A [sioyek](https://github.com/ahrm/sioyek) config that borrows pdf.js's highlighting
workflow, keeps every binding off Hyprland's global keys, and uses no function keys.

Files: `.config/sioyek/prefs_user.config` (settings, colors, macros) and
`.config/sioyek/keys_user.config` (keybindings). Both layer on top of
`/etc/sioyek/{prefs,keys}.config`. Restart sioyek to apply changes.

## Color palette on selection

pdf.js shows a row of swatches when you select text. Sioyek's equivalent is a
right-click menu, off by default — `right_click_context_menu 1` turns it on.

- **Select text, right-click** → Yellow / Green / Blue / Pink / Red / Orange / Purple / copy
- **Right-click an existing highlight** → recolor it, edit it, or delete it

Each swatch is a `new_macro` that runs two commands:

```
new_macro _Yellow set_select_highlight_type(y);add_highlight(y)
```

`set_select_highlight_type` **pins** the color as current, then `add_highlight`
applies it. That's what reproduces pdf.js remembering your last swatch — after
picking once, `<C-H>` reuses it and `ah` auto-highlights everything you select.

The seven colors match pdf.js's five built-in swatches (`highlightEditorColors`)
plus orange and purple. They live in `highlight_color_{y,g,b,p,r,o,u}` and are
shared with the freehand pen, so `dcr` gives a red pen.

## Keyboard highlighting

Faster than the menu once you know the letters. Select text, then:

| | | | |
|---|---|---|---|
| `hy` yellow | `hg` green | `hb` blue | `hp` pink |
| `hr` red | `ho` orange | `hu` purple | `dh` delete |

| | |
|---|---|
| `<C-H>` | highlight with the pinned color |
| `<C-h>` + letter | pin a color without highlighting |
| `ah` | auto-highlight every mouse selection |
| `gnh` / `gNh` | next / previous highlight |
| `<A-e>` | bake highlights into a real PDF any reader can open |

## Color modes

| | |
|---|---|
| `<A-d>` | dark mode — **inverts** the page, keeps hues, photos look like negatives |
| `<A-r>` | custom color — **repaints** into two chosen colors, photos get tinted |

Dark mode is on at startup (`startup_commands toggle_dark_mode`), softened by
`dark_mode_contrast 0.85` so white text isn't glaring.

Both modes are currently dark, because `custom_background_color` /
`custom_text_color` are still sioyek's stock slate-blue defaults. For a real
light/warm second mode — better for daytime reading, and it doesn't negate
figures — set background `0.92 0.86 0.70` and text `0.24 0.18 0.11`.

## Other bindings

Only the non-default ones. Everything else is stock sioyek; `<C-K>` opens a
fuzzy-searchable list of every command and its current key.

| | |
|---|---|
| `<C-=>` / `<C-->` | zoom in / out |
| `<C-d>` / `<C-u>` | next / previous page |
| `gt` | go to page number |
| `gx` | open selected text as a URL |
| `gr` | jump to a random page |
| `<C-F>` | regex search (needs `super_fast_search 1`) |
| `<A-n>` / `<A-N>` | preview next / previous search hit in an overview window |
| `<A-t>` / `<A-w>` | two-page spread / fit to height |
| `<C-S>` | toggle smooth scrolling |
| `ws` | toggle statusbar |
| `wu` | toggle PDF link highlighting (default `<f1>`, rebound) |
| `<C-r>` / `<C-R>` | start-pause / stop text-to-speech |

Drawing (pdf.js's pencil tool): `D` draw with mouse, `<C-D>` with a stylus,
`dc`+letter color, `dt` thickness, `da` opacity, `<C-z>` undo, `ds` select,
`dx` delete, `dC` / `dA` clear page / document, `d0` / `d1` hide / show all,
`<C-P>` scratchpad, `dy` copy from scratchpad.

## Three gotchas that cost real debugging time

**1. Prefix rule.** If one key sequence is a strict prefix of another, sioyek
silently unmaps the shorter one. `hd` killed `h`, `dcp` killed `dc`, `dh0`
killed `dh`, and `d*` killed a bare `d`. Siblings are fine (`dc` / `dC`),
parent/child is not.

**2. Shift syntax.** `<C-S-x>` is no longer valid. Ctrl+Shift+X is `<C-X>` —
capitalise the letter. The old form fails silently.

**3. `new_command` / `new_macro` are prefs, not keys.** They must go in
`prefs_user.config`. The keybinding parser doesn't understand them and ignores
them without complaint.

Check all three at once — a clean run prints no warnings:

```sh
sioyek --verbose --new-instance /usr/share/sioyek/tutorial.pdf
```

## Hyprland

Hyprland grabs `ALT+H`, `ALT+L`, `ALT+M`, `ALT+S`, `ALT+SPACE`, `ALT+TAB`,
`ALT+V`, every `ALT+<digit>` (workspaces 11–20, generated in a loop) and
`CTRL+ALT+*` globally, so they never reach sioyek. `ALT+S` is suspend and
`ALT+L` is the lockscreen — do not bind those here.

Config changes need a **full restart**. Sioyek is single-instance, so opening a
PDF attaches to the already-running process and its old config; quit every
window first. There is no file watcher, and the `reload_config` command only
restyles the status bar — it does not re-read the files.

Free sequence namespaces: `a` (highlight extras) and `w` (toggles) are in use;
`e i u x y` are still unclaimed.

## Optional

`_add_text` and `_add_red_text` stamp text annotations onto a page. They need
the python helper, which isn't installed by default:

```sh
pip install --user sioyek
```
