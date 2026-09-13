{ lib }:
pluginRoot:
# Walk `<pluginRoot>/commands/<name>.md` per Anthropic's plugin spec.
# Anthropic encourages skills over commands going forward, but the
# directory remains widely populated in published plugins so the
# discovery API stays.
let
  commandsDir = pluginRoot + "/commands";
  hasCommandsDir = builtins.pathExists commandsDir;

  entries = if hasCommandsDir then builtins.readDir commandsDir else { };
  mdFiles = lib.filterAttrs (n: type: type == "regular" && lib.hasSuffix ".md" n) entries;

  mkCommand = filename: _: {
    name = lib.removeSuffix ".md" filename;
    path = commandsDir + "/${filename}";
    inherit pluginRoot;
  };
in
lib.mapAttrsToList mkCommand mdFiles
