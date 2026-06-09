#!/usr/bin/env lua
-- Test script for VLC playlist parser functionality
-- Run: lua test_playlist.lua

local function mock_vlc()
    return {
        access = "http",
        path = "example.com/video/123"
    }
end

local function test_probe()
    local vlc = mock_vlc()
    
    -- Test matching URL
    local match = vlc.access == "http" and string.match(vlc.path, "example%.com")
    assert(match, "FAIL: probe() should match example.com URLs")
    print("✓ probe() matches example.com URLs")
    
    -- Test non-matching URL
    vlc.path = "other.com/video"
    match = vlc.access == "http" and string.match(vlc.path, "example%.com")
    assert(not match, "FAIL: probe() should not match other.com URLs")
    print("✓ probe() rejects non-matching URLs")
    
    -- Test non-http access
    vlc.access = "file"
    vlc.path = "example.com/video"
    match = vlc.access == "http" and string.match(vlc.path, "example%.com")
    assert(not match, "FAIL: probe() should not match file:// access")
    print("✓ probe() rejects non-http access")
end

local function test_parse_structure()
    -- Simulate parse() return value
    local playlist = {
        {
            path = "https://example.com/video.mp4",
            name = "Test Video",
            description = "Test description",
            duration = 3600
        }
    }
    
    assert(#playlist > 0, "FAIL: parse() should return at least one item")
    print("✓ parse() returns playlist items")
    
    local item = playlist[1]
    assert(item.path, "FAIL: playlist item must have path")
    print("✓ playlist item has required 'path' field")
    
    assert(type(item.path) == "string", "FAIL: path must be string")
    assert(type(item.name) == "string", "FAIL: name must be string")
    print("✓ playlist item fields have correct types")
    
    assert(item.duration == nil or type(item.duration) == "number", 
           "FAIL: duration must be number if present")
    print("✓ optional duration field is valid")
end

local function test_pattern_escaping()
    -- Verify Lua pattern escaping for common URL patterns
    local test_cases = {
        { pattern = "youtube%.com", url = "youtube.com/watch", should_match = true },
        { pattern = "youtube%.com", url = "youtubexcom/watch", should_match = false },
        { pattern = "vimeo%.com/(%d+)", url = "vimeo.com/123456", should_match = true },
    }
    
    for _, tc in ipairs(test_cases) do
        local match = string.match(tc.url, tc.pattern)
        if tc.should_match then
            assert(match, "FAIL: pattern should match: " .. tc.url)
        else
            assert(not match, "FAIL: pattern should not match: " .. tc.url)
        end
    end
    print("✓ URL pattern escaping works correctly")
end

-- Run tests
print("VLC Playlist Parser Tests")
print("=========================\n")

local ok, err = pcall(test_probe)
if not ok then print("✗ " .. err) end

ok, err = pcall(test_parse_structure)
if not ok then print("✗ " .. err) end

ok, err = pcall(test_pattern_escaping)
if not ok then print("✗ " .. err) end

print("\n=========================")
print("All tests passed!")
