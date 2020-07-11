std = {
  globals = {
    -- these globals can only be accessed.
    -- Standard Lua library
    "math",
    "pairs",
    "ipairs",
    "string",
    "require",
    "table",
    "assert",
    "tostring",
    "print",
    "setfenv",
    "type",
    "loadstring",
    "match",
    "package",
    "tonumber",
    -- Third party libraries
    "love",
    "resources",
    "Vector",
    "Behavior",
    "Timer",
    "Concord",
    "Entity",
    "Component",
    "System",
    "Instance",
    "Camera",
    "GamestateManager",
    "_util",
    -- Our globals
    "_constants",
    "_fonts",
    "_components",
    "_systems",
    "_assemblages",
    "_config",
    "_DEBUG",
    "loading",
    "game"
  },
  read_globals = {"T"}
}

max_line_length = 140

codes = true

exclude_files = {"libs/**/*.lua"}
