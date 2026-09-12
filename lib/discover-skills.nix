{ lib }:
pluginRoot:
# Walk `<pluginRoot>/skills/<name>/SKILL.md` per Anthropic's plugin spec.
# Each subdirectory containing a `SKILL.md` is a skill; subdirectories
# without one are ignored. The frontmatter is returned as a raw string so
# callers can parse YAML with their preferred tool (Nix has no built-in
# YAML parser).
let
  skillsDir = pluginRoot + "/skills";
  hasSkillsDir = builtins.pathExists skillsDir;

  entries = if hasSkillsDir then builtins.readDir skillsDir else { };
  skillDirs = lib.filterAttrs (_: type: type == "directory") entries;

  mkSkill =
    name: _:
    let
      skillFile = skillsDir + "/${name}/SKILL.md";
    in
    if builtins.pathExists skillFile then
      {
        inherit name pluginRoot;
        path = skillFile;
      }
    else
      null;
in
builtins.filter (x: x != null) (lib.mapAttrsToList mkSkill skillDirs)
