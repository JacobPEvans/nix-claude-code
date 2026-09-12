{ lib }:
pluginRoot:
# Walk `<pluginRoot>/agents/<name>.md` per Anthropic's plugin spec.
# Returns the same shape as `discoverSkills`/`discoverCommands` so
# callers can iterate uniformly when building settings.json entries.
let
  agentsDir = pluginRoot + "/agents";
  hasAgentsDir = builtins.pathExists agentsDir;

  entries = if hasAgentsDir then builtins.readDir agentsDir else { };
  mdFiles = lib.filterAttrs (n: type: type == "regular" && lib.hasSuffix ".md" n) entries;

  mkAgent = filename: _: {
    name = lib.removeSuffix ".md" filename;
    path = agentsDir + "/${filename}";
    inherit pluginRoot;
  };
in
lib.mapAttrsToList mkAgent mdFiles
