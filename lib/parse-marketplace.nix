_: marketplacePath:
# Parse a Claude Code marketplace manifest at
# `<marketplacePath>/.claude-plugin/marketplace.json`.
#
# Anthropic spec (https://anthropic.com/claude-code/marketplace.schema.json):
#   $schema, name, owner{name,email}, plugins[], metadata{description,version,...}
#
# Top-level `description` is permitted by older manifests; newer ones nest it
# under `metadata.description` (anthropic publishes in this shape).
# The fallback chain surfaces whichever is present.
#
# Returns an attrset with normalized fields plus `raw` for callers that need
# to access spec extensions we don't yet model.
let
  manifestPath = marketplacePath + "/.claude-plugin/marketplace.json";
  hasManifest = builtins.pathExists manifestPath;
  manifest = if hasManifest then builtins.fromJSON (builtins.readFile manifestPath) else { };
  metadata = manifest.metadata or { };
in
{
  name = manifest.name or "unknown";
  description = manifest.description or metadata.description or "";
  owner = manifest.owner or { };
  inherit metadata;
  plugins = manifest.plugins or [ ];
  raw = manifest;
}
