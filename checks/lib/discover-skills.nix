{ lib }:
let
  discoverSkills = import ../../lib/discover-skills.nix { inherit lib; };
  pluginFixture = ./fixtures/plugin-with-components;
in
{
  # Missing skills/ directory: the marketplace fixture has no `skills/`
  # subdirectory, so discoverSkills should return an empty list rather
  # than throwing.

  "test (skills): returns empty list when skills/ directory is absent" = {
    expr = discoverSkills ./fixtures/marketplace-valid;
    expected = [ ];
  };

  # Populated fixture: two valid skills (alpha, beta) plus a no-skill-md
  # directory that must be filtered out.

  "test (skills): discovers all skills with valid SKILL.md" = {
    expr = builtins.length (discoverSkills pluginFixture);
    expected = 2;
  };

  "test (skills): ignores subdirectories without SKILL.md" = {
    expr = builtins.any (s: s.name == "no-skill-md") (discoverSkills pluginFixture);
    expected = false;
  };

  "test (skills): returns skill names matching directory names" = {
    expr = builtins.sort builtins.lessThan (map (s: s.name) (discoverSkills pluginFixture));
    expected = [
      "alpha"
      "beta"
    ];
  };

  "test (skills): each entry includes path to SKILL.md" = {
    expr = lib.hasSuffix "/SKILL.md" (toString (builtins.head (discoverSkills pluginFixture)).path);
    expected = true;
  };

  "test (skills): each entry includes pluginRoot" = {
    expr = (builtins.head (discoverSkills pluginFixture)).pluginRoot;
    expected = pluginFixture;
  };
}
