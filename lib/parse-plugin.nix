_: pluginPath:
# Parse a Claude Code plugin manifest at
# `<pluginPath>/.claude-plugin/plugin.json`.
#
# Anthropic spec fields: name, description, version, author{name,email,url},
# homepage, repository, license, keywords, category, tags.
#
# `author` and `repository` are commonly objects in published manifests
# (`{ name, email, url }` and `{ type, url }`) but the spec permits bare
# strings. We pass them through unchanged in `raw` and surface a `null`
# default for the typed fields so consumers can branch on presence.
let
  manifestPath = pluginPath + "/.claude-plugin/plugin.json";
  hasManifest = builtins.pathExists manifestPath;
  manifest = if hasManifest then builtins.fromJSON (builtins.readFile manifestPath) else { };
in
{
  name = manifest.name or "unknown";
  description = manifest.description or "";
  version = manifest.version or null;
  author = manifest.author or { };
  homepage = manifest.homepage or null;
  repository = manifest.repository or null;
  license = manifest.license or null;
  keywords = manifest.keywords or [ ];
  category = manifest.category or null;
  tags = manifest.tags or [ ];
  raw = manifest;
}
