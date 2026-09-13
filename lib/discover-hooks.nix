_: pluginRoot:
# Read `<pluginRoot>/hooks/hooks.json` per Anthropic's plugin spec. The
# manifest's top-level shape is `{ hooks = { <Event> = [...]; ... }; }`;
# we pass it through unchanged for callers to merge into settings.json.
#
# Returns `{ }` (empty attrset) when no `hooks/hooks.json` exists so
# callers can compose without conditional plumbing.
let
  hooksPath = pluginRoot + "/hooks/hooks.json";
in
if builtins.pathExists hooksPath then builtins.fromJSON (builtins.readFile hooksPath) else { }
