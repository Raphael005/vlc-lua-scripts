# VLC Lua Scripts

Custom Lua scripts for VLC media player.

## Directory Structure

```
lua/
├── playlist/      # Playlist parsers (URL/file handlers)
├── extensions/    # UI extensions (Tools → Plugins menu)
├── intf/          # Interface scripts
├── meta/
│   ├── art/       # Album art fetchers
│   └── reader/    # Metadata readers
└── sd/            # Service discovery scripts
```

## Playlist Scripts

Playlist scripts parse URLs or files and return playable items.

### Template

```lua
function probe()
    -- Return true if this script handles the URL/file
    return vlc.access == "http" and string.match(vlc.path, "example%.com")
end

function parse()
    -- Return playlist items
    return {
        {
            path = "https://example.com/video.mp4",
            name = "Video Title",
            description = "Optional description",
            duration = 3600  -- Optional, in seconds
        }
    }
end
```

### Available Variables in `probe()`

- `vlc.access` — Protocol (http, https, file, etc.)
- `vlc.path` — URL path without protocol
- `vlc.peek(n)` — Read first n bytes of the stream

## Usage

1. Place `.lua` files in the appropriate subdirectory
2. Restart VLC
3. Scripts load automatically

## Testing

Run the test suite to verify playlist parser logic:

```bash
cd ~/Library/Application\ Support/org.videolan.vlc/lua
lua test_playlist.lua
```

Requires Lua installed (`brew install lua` if needed).

## Debugging

Enable Lua debug output:
1. Open VLC preferences (⌘,)
2. Show All → Interface → Main interfaces → Lua
3. Check "Lua debug output"

View logs: **Window → Messages** (⌘M)

## Resources

- [VLC Lua README](https://github.com/videolan/vlc/blob/master/share/lua/README.txt)
- [Lua Playlist Scripts](https://wiki.videolan.org/Documentation:Building_Lua_Playlist_Scripts/)
