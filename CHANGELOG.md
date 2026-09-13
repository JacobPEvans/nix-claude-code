# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html)
with a permanent pre-1.0 cadence — see `release-please-config.json`.

## [1.13.0](https://github.com/dryvist/nix-claude-code/compare/v1.12.0...v1.13.0) (2026-09-13)


### Features

* **latest:** opt-in Claude Code install during home-manager activation ([#253](https://github.com/dryvist/nix-claude-code/issues/253)) ([b9592b0](https://github.com/dryvist/nix-claude-code/commit/b9592b0486e46dbfcdadf33a2cb719db58763b64))


### Bug Fixes

* **lib:** keep plugin roots as path values in discovery ([#251](https://github.com/dryvist/nix-claude-code/issues/251)) ([9bbc832](https://github.com/dryvist/nix-claude-code/commit/9bbc83253f5ecfe4ed77971243bab6375d72e35c))

## [1.12.0](https://github.com/dryvist/nix-claude-code/compare/v1.11.0...v1.12.0) (2026-09-12)


### Features

* **permissions:** deny security dump-keychain and export ([fbae0d1](https://github.com/dryvist/nix-claude-code/commit/fbae0d1e460b8608a1c7db20c7969bb520e05ca0))
* **permissions:** deny security dump-keychain and export ([097117b](https://github.com/dryvist/nix-claude-code/commit/097117b38c983df6430115a48da2cbb7b9395cb9))

## [1.11.0](https://github.com/dryvist/nix-claude-code/compare/v1.10.1...v1.11.0) (2026-09-12)


### Features

* **hooks:** worktreesUnderRepo places worktrees at &lt;repo&gt;/.worktrees/&lt;name&gt; ([#242](https://github.com/dryvist/nix-claude-code/issues/242)) ([8fffa9b](https://github.com/dryvist/nix-claude-code/commit/8fffa9babeffb26ea2d0669946c0f7d7bce9f201))

## [1.10.1](https://github.com/dryvist/nix-claude-code/compare/v1.10.0...v1.10.1) (2026-09-05)


### Bug Fixes

* **cache:** stop purging the plugin cache on a marketplace move ([#232](https://github.com/dryvist/nix-claude-code/issues/232)) ([226055e](https://github.com/dryvist/nix-claude-code/commit/226055e6b7bfc73bca48c8ed4ea32fc0e679cdc9))
* **refresh:** run the marketplace repair regardless of session count ([#235](https://github.com/dryvist/nix-claude-code/issues/235)) ([9f61d6e](https://github.com/dryvist/nix-claude-code/commit/9f61d6e8aa58d7edfc695ec45cf4f7a39e7b641f))

## [1.10.0](https://github.com/dryvist/nix-claude-code/compare/v1.9.1...v1.10.0) (2026-09-04)


### Features

* **config:** support CLAUDE_CONFIG_DIR via programs.claude.configDir ([#177](https://github.com/dryvist/nix-claude-code/issues/177)) ([509fb43](https://github.com/dryvist/nix-claude-code/commit/509fb43b77ee2d0996a48563fe8b166c63bb87a5)) — thanks [@obvionaoe](https://github.com/obvionaoe)! 🎉


### Bug Fixes

* **config:** close the remaining configDir gaps and cover the assertions ([#223](https://github.com/dryvist/nix-claude-code/issues/223)) ([9abe612](https://github.com/dryvist/nix-claude-code/commit/9abe6123b6fb62f3f634f708ad5c4cd999e5195c))


### Contributors

A big thank you to [@obvionaoe](https://github.com/obvionaoe) for
`programs.claude.configDir`, which lets the Claude Code config tree live
outside `~/.claude` for XDG compliance. At the default location the output is
byte-for-byte unchanged — guaranteed by a permanent regression check rather
than a one-time diff.


## [1.9.1](https://github.com/dryvist/nix-claude-code/compare/v1.9.0...v1.9.1) (2026-09-02)


### Bug Fixes

* **permissions:** never auto-approve keychain secret reads ([8e8d219](https://github.com/dryvist/nix-claude-code/commit/8e8d21994932fa8b36b19ab1d712f5217c0a09dd))
* **permissions:** never auto-approve keychain secret reads ([e6bc98e](https://github.com/dryvist/nix-claude-code/commit/e6bc98ecd96c1c93f5bf1ae74bba2d8e553391fb))

## [1.9.0](https://github.com/dryvist/nix-claude-code/compare/v1.8.1...v1.9.0) (2026-09-02)


### Features

* **plugins:** link marketplaces at their own store paths ([#216](https://github.com/dryvist/nix-claude-code/issues/216)) ([3052e92](https://github.com/dryvist/nix-claude-code/commit/3052e92178761fc774ed7ef11a6aff482bd70c9c))

## [1.8.1](https://github.com/dryvist/nix-claude-code/compare/v1.8.0...v1.8.1) (2026-09-01)


### Bug Fixes

* **statusline:** wrap ccstatusline onto two lines, pin ccstatusline version ([#209](https://github.com/dryvist/nix-claude-code/issues/209)) ([ca665aa](https://github.com/dryvist/nix-claude-code/commit/ca665aaf7f4fc2efe33df33437f78e63a965cdc7))

## [1.8.0](https://github.com/dryvist/nix-claude-code/compare/v1.7.3...v1.8.0) (2026-09-01)


### Features

* **claude:** add optional Claude Swap integration ([bfccf70](https://github.com/dryvist/nix-claude-code/commit/bfccf70469bf293852104f33cf3e31fd2fa21875))
* **claude:** add optional Claude Swap integration ([9e6b5b9](https://github.com/dryvist/nix-claude-code/commit/9e6b5b90387967f4ffb60f42f1b9d6e9579a7cd2))

## [1.7.3](https://github.com/dryvist/nix-claude-code/compare/v1.7.2...v1.7.3) (2026-08-31)


### Bug Fixes

* **marketplace:** copy browser-use and cribl entries instead of symlinking ([#201](https://github.com/dryvist/nix-claude-code/issues/201)) ([29a04c9](https://github.com/dryvist/nix-claude-code/commit/29a04c90ddc39b1f0f7539ae298ba7c2d8992b3d))

## [1.7.2](https://github.com/dryvist/nix-claude-code/compare/v1.7.1...v1.7.2) (2026-08-31)


### Reverts

* **statusline:** restore the built-in plan-usage widgets ([#197](https://github.com/dryvist/nix-claude-code/issues/197)) ([7d31b54](https://github.com/dryvist/nix-claude-code/commit/7d31b549ea08a6e31f750d47084c2e4fcc231fd4))

## [1.7.1](https://github.com/dryvist/nix-claude-code/compare/v1.7.0...v1.7.1) (2026-08-31)


### Bug Fixes

* **settings:** emit every sandbox sub-key, and type the policy surface ([#192](https://github.com/dryvist/nix-claude-code/issues/192)) ([512e5a2](https://github.com/dryvist/nix-claude-code/commit/512e5a2352e0467ccfe41506757f883383abddd1))

## [1.7.0](https://github.com/dryvist/nix-claude-code/compare/v1.6.1...v1.7.0) (2026-08-31)


### Features

* **statusline:** read plan usage from the payload instead of the usage API ([#188](https://github.com/dryvist/nix-claude-code/issues/188)) ([3865f21](https://github.com/dryvist/nix-claude-code/commit/3865f2171eedf83ae824096d208bbc9070860594))

## [1.6.1](https://github.com/dryvist/nix-claude-code/compare/v1.6.0...v1.6.1) (2026-08-31)


### Bug Fixes

* **marketplaces:** copy the jacobpevans marketplace instead of symlinking it ([#183](https://github.com/dryvist/nix-claude-code/issues/183)) ([a73dbee](https://github.com/dryvist/nix-claude-code/commit/a73dbee1288fd7c11f1cf644b67747c54a9ad945))
* **settings:** strip stale hook events on activation ([#184](https://github.com/dryvist/nix-claude-code/issues/184)) ([944c1aa](https://github.com/dryvist/nix-claude-code/commit/944c1aae81071c47b9b70a7ca487b910812bb1fa))

## [1.6.0](https://github.com/dryvist/nix-claude-code/compare/v1.5.1...v1.6.0) (2026-08-30)


### Features

* **statusline:** render prompt-cache warmth, TTL countdown and hit ratio ([#178](https://github.com/dryvist/nix-claude-code/issues/178)) ([0556013](https://github.com/dryvist/nix-claude-code/commit/05560135faf934e529daabef55bcc8f375c17769))


### Bug Fixes

* **cleanup:** keep still-resolving component links the new generation does not carry ([#179](https://github.com/dryvist/nix-claude-code/issues/179)) ([19711f6](https://github.com/dryvist/nix-claude-code/commit/19711f6fb0ce4b1b4009aa57cca721c8ff66f8af))

## [1.5.1](https://github.com/dryvist/nix-claude-code/compare/v1.5.0...v1.5.1) (2026-08-28)


### Bug Fixes

* **hooks:** defer marketplace refresh while peer sessions are live ([#173](https://github.com/dryvist/nix-claude-code/issues/173)) ([e51da55](https://github.com/dryvist/nix-claude-code/commit/e51da55015aca5525f8c6c814882842c7e60afbf))

## [1.5.0](https://github.com/dryvist/nix-claude-code/compare/v1.4.4...v1.5.0) (2026-08-27)


### Features

* **settings:** add outputStyle top-level option and serializer support ([#167](https://github.com/dryvist/nix-claude-code/issues/167)) ([17271a5](https://github.com/dryvist/nix-claude-code/commit/17271a5af9a5563689aeb97b4574b9b35e53a9ca))

## [1.4.4](https://github.com/dryvist/nix-claude-code/compare/v1.4.3...v1.4.4) (2026-08-25)


### Bug Fixes

* **settings:** strip .env before the activation merge ([#162](https://github.com/dryvist/nix-claude-code/issues/162)) ([7935090](https://github.com/dryvist/nix-claude-code/commit/793509033afec23ef1b8dc04b112a44b26226258))

## [1.4.3](https://github.com/dryvist/nix-claude-code/compare/v1.4.2...v1.4.3) (2026-08-24)


### Bug Fixes

* **api-key-helper:** stop pulling the secrets CLI from a source build ([bd66034](https://github.com/dryvist/nix-claude-code/commit/bd66034269e6966c83c8c4df41891ad96c73f20c))
* **api-key-helper:** stop pulling the secrets CLI from a source build ([3c1af36](https://github.com/dryvist/nix-claude-code/commit/3c1af3634f50893e54940f657ec8e077e48bece8))

## [1.4.2](https://github.com/dryvist/nix-claude-code/compare/v1.4.1...v1.4.2) (2026-08-24)


### Bug Fixes

* **hooks:** declare the self-hosted domains instead of inferring them ([5e7b273](https://github.com/dryvist/nix-claude-code/commit/5e7b2733fabe51c6f3786c8c036594a92d4c369d))
* **hooks:** declare the self-hosted domains instead of inferring them ([47e535f](https://github.com/dryvist/nix-claude-code/commit/47e535fdc8d28a267d62b8d1a46c8e49db70d2f3))

## [1.4.1](https://github.com/dryvist/nix-claude-code/compare/v1.4.0...v1.4.1) (2026-08-24)


### Bug Fixes

* **hooks:** treat a backend in the router's own domain as internal ([ebccb33](https://github.com/dryvist/nix-claude-code/commit/ebccb334c6eec26ba524d6ad802339e58936874e))
* **hooks:** treat a backend in the router's own domain as internal ([3d0f96b](https://github.com/dryvist/nix-claude-code/commit/3d0f96b7b41ad66d543513d0f7c5b71868a6cce2))

## [1.4.0](https://github.com/dryvist/nix-claude-code/compare/v1.3.1...v1.4.0) (2026-08-24)


### Features

* **hooks:** add private-workspace subagent guard ([0e2cc5e](https://github.com/dryvist/nix-claude-code/commit/0e2cc5e6aef34571b14698b0bbeb347a224882df))
* **hooks:** add private-workspace subagent guard ([9a8147c](https://github.com/dryvist/nix-claude-code/commit/9a8147ce8fcd998bcd7c370e6503c9dd022e0781))


### Bug Fixes

* **hooks:** probe the upstream router for the subagent role ([b1f493b](https://github.com/dryvist/nix-claude-code/commit/b1f493bcd4dac33b0683a4345dc5843c122931cb))
* **hooks:** read the upstream bearer from LLM_ROUTER_TOKEN_FILE ([cc101d2](https://github.com/dryvist/nix-claude-code/commit/cc101d22e84a2bf1e8fa6223383587604a318d49))

## [1.3.1](https://github.com/dryvist/nix-claude-code/compare/v1.3.0...v1.3.1) (2026-08-17)


### Bug Fixes

* **settings:** keep advisor disabled by default ([1af2785](https://github.com/dryvist/nix-claude-code/commit/1af2785edf6b6d768ce35e21618c3226e82227b7))
* **settings:** keep advisor disabled by default ([3a468d5](https://github.com/dryvist/nix-claude-code/commit/3a468d56829d5759a441f50443614cc10a534059))

## [1.3.0](https://github.com/dryvist/nix-claude-code/compare/v1.2.0...v1.3.0) (2026-08-05)


### Features

* **ci:** relock the whole flake into a single pull request ([#138](https://github.com/dryvist/nix-claude-code/issues/138)) ([d021b69](https://github.com/dryvist/nix-claude-code/commit/d021b6957234d0eb3b17a52cefaf0f3eb7ebf755))

## [1.2.0](https://github.com/dryvist/nix-claude-code/compare/v1.1.0...v1.2.0) (2026-08-02)


### Features

* **permissions:** auto-approve the deployment.json read, and only the read ([#133](https://github.com/dryvist/nix-claude-code/issues/133)) ([93481e9](https://github.com/dryvist/nix-claude-code/commit/93481e92da2b309482c47e08affacccfdd908142))

## [1.1.0](https://github.com/dryvist/nix-claude-code/compare/v1.0.0...v1.1.0) (2026-07-30)


### Features

* **checks:** enforce autonomous-config containment ([#127](https://github.com/dryvist/nix-claude-code/issues/127)) ([ed9ecfb](https://github.com/dryvist/nix-claude-code/commit/ed9ecfb845e8ac7eb2ab66109865e5e90c446e6c))

## [1.0.0](https://github.com/dryvist/nix-claude-code/compare/v0.8.0...v1.0.0) (2026-07-29)


### ⚠ BREAKING CHANGES

* **permissions:** `lib.permissions.ask.commands` is now always empty. Consumers rendering an ask tier will emit an empty list.

### Features

* **lib:** add renderAutonomous for autonomous container-image config ([#121](https://github.com/dryvist/nix-claude-code/issues/121)) ([2404416](https://github.com/dryvist/nix-claude-code/commit/240441695492048d193d7afc03109fe9fe4f4cd4))
* **permissions:** remove the ASK tier, narrow DENY to catastrophic only ([#123](https://github.com/dryvist/nix-claude-code/issues/123)) ([6dc8bd2](https://github.com/dryvist/nix-claude-code/commit/6dc8bd20ca9815af12c128acd2dc33bf1e28813e))

## [0.8.0](https://github.com/dryvist/nix-claude-code/compare/v0.7.4...v0.8.0) (2026-07-23)


### Features

* auto-approve terragrunt read subcommands ([53300c7](https://github.com/dryvist/nix-claude-code/commit/53300c7c5ab384bfbf94c7a6a7e2c6c43488d266))
* auto-approve terragrunt read subcommands ([476a4bb](https://github.com/dryvist/nix-claude-code/commit/476a4bb49113488bbde4ba0027e4a2c10c2f6949))

## [0.7.4](https://github.com/dryvist/nix-claude-code/compare/v0.7.3...v0.7.4) (2026-07-16)


### Bug Fixes

* **permissions:** relax diskutil deny to destructive verbs only ([#105](https://github.com/dryvist/nix-claude-code/issues/105)) ([6a4a356](https://github.com/dryvist/nix-claude-code/commit/6a4a356b0c6e7b2d52c7cef5a33241a06317847d))

## [0.7.3](https://github.com/dryvist/nix-claude-code/compare/v0.7.2...v0.7.3) (2026-07-12)


### Bug Fixes

* **merge-settings:** strip enabledPlugins before deep merge ([#103](https://github.com/dryvist/nix-claude-code/issues/103)) ([c3375d3](https://github.com/dryvist/nix-claude-code/commit/c3375d3d94e2785eb86a8d34d87e06a4b5064524))
* **merge-settings:** strip extraKnownMarketplaces before deep merge ([#101](https://github.com/dryvist/nix-claude-code/issues/101)) ([d63a213](https://github.com/dryvist/nix-claude-code/commit/d63a213af4f2c90ce3d576a2aab0c3a3ff2e4b12))

## [0.7.2](https://github.com/dryvist/nix-claude-code/compare/v0.7.1...v0.7.2) (2026-07-10)


### Bug Fixes

* **hooks:** retry marketplace refresh when a reinstall leaves plugins unresolved ([#99](https://github.com/dryvist/nix-claude-code/issues/99)) ([cc52344](https://github.com/dryvist/nix-claude-code/commit/cc523447193a24bc32c623d4ece8dc0118b8c64b))

## [0.7.1](https://github.com/dryvist/nix-claude-code/compare/v0.7.0...v0.7.1) (2026-07-10)


### Bug Fixes

* **marketplaces:** pin synthetic marketplaces to a local directory source ([#95](https://github.com/dryvist/nix-claude-code/issues/95)) ([89ae13e](https://github.com/dryvist/nix-claude-code/commit/89ae13e0ad4a9a6133fc69c8e6ec7e8e1db81d3a))

## [0.7.0](https://github.com/dryvist/nix-claude-code/compare/v0.6.1...v0.7.0) (2026-07-09)


### Features

* **settings:** add advisorModel configuration ([#92](https://github.com/dryvist/nix-claude-code/issues/92)) ([4a8ba63](https://github.com/dryvist/nix-claude-code/commit/4a8ba63a49ca76dc8c0c4cb1e085ee5811279450))

## [0.6.1](https://github.com/dryvist/nix-claude-code/compare/v0.6.0...v0.6.1) (2026-07-08)


### Bug Fixes

* **hooks:** register typed hooks in settings.json so Claude Code actually runs them ([cb44eef](https://github.com/dryvist/nix-claude-code/commit/cb44eefa1294b9494b7a2835ef3cb3819e088682))

## [0.6.0](https://github.com/dryvist/nix-claude-code/compare/v0.5.0...v0.6.0) (2026-07-08)


### Features

* **settings:** compact context at 60% by default, not upstream's ~90% ([#85](https://github.com/dryvist/nix-claude-code/issues/85)) ([c6ab0b4](https://github.com/dryvist/nix-claude-code/commit/c6ab0b434f7fe37248379d181b67aa72ddd856a4))

## [0.5.0](https://github.com/dryvist/nix-claude-code/compare/v0.4.3...v0.5.0) (2026-07-05)


### Features

* **settings:** curate typed settings.json options, upstream Claude-only defaults ([#77](https://github.com/dryvist/nix-claude-code/issues/77)) ([c63cb9f](https://github.com/dryvist/nix-claude-code/commit/c63cb9fe63dfde747541ff65f7175638fb4806f2))

## [0.4.3](https://github.com/dryvist/nix-claude-code/compare/v0.4.2...v0.4.3) (2026-07-04)


### Bug Fixes

* **ci:** pass GH_APP_PRIVATE_KEY via secrets: inherit in release dispatch ([#80](https://github.com/dryvist/nix-claude-code/issues/80)) ([a899132](https://github.com/dryvist/nix-claude-code/commit/a899132003254835b77242c383ad53c4174296d6))

## [0.4.2](https://github.com/dryvist/nix-claude-code/compare/v0.4.1...v0.4.2) (2026-07-04)


### Bug Fixes

* stop churning HM-managed marketplace symlinks on every activation ([#78](https://github.com/dryvist/nix-claude-code/issues/78)) ([91b2acf](https://github.com/dryvist/nix-claude-code/commit/91b2acf80a6373afa0614c8446890c22085a649d))

## [0.4.1](https://github.com/dryvist/nix-claude-code/compare/v0.4.0...v0.4.1) (2026-07-03)


### Bug Fixes

* **plugins:** reconcile installed_plugins.json after Nix rebuilds ([#71](https://github.com/dryvist/nix-claude-code/issues/71)) ([fe03c8e](https://github.com/dryvist/nix-claude-code/commit/fe03c8ed1daa9305d454caea739ec562dc6bffcc))

## [0.4.0](https://github.com/dryvist/nix-claude-code/compare/v0.3.2...v0.4.0) (2026-07-03)


### Features

* add AI PR care caller (dep review + release highlights) ([#68](https://github.com/dryvist/nix-claude-code/issues/68)) ([13bfbd9](https://github.com/dryvist/nix-claude-code/commit/13bfbd91314b3c34cb083f619556af053cb50eb5))

## [0.3.2](https://github.com/dryvist/nix-claude-code/compare/v0.3.1...v0.3.2) (2026-06-26)


### Bug Fixes

* **orphan-cleanup:** run verify-cache-integrity via pkgs.bash; narrow attribution type ([#66](https://github.com/dryvist/nix-claude-code/issues/66)) ([c0e9988](https://github.com/dryvist/nix-claude-code/commit/c0e99881f1e03e64ab77a5b185486204d06f3533))

## [0.3.1](https://github.com/dryvist/nix-claude-code/compare/v0.3.0...v0.3.1) (2026-06-24)


### Bug Fixes

* **permissions:** auto-allow read-only sqlite3, drop the broad sqlite3 ask-gate ([#64](https://github.com/dryvist/nix-claude-code/issues/64)) ([d10e37e](https://github.com/dryvist/nix-claude-code/commit/d10e37e252ec4dcaf8060d05198ac14909289860))

## [0.3.0](https://github.com/dryvist/nix-claude-code/compare/v0.2.0...v0.3.0) (2026-06-21)


### Features

* accept booleans in attribution settings ([3a03b83](https://github.com/dryvist/nix-claude-code/commit/3a03b83e54841241387a1ee48c38f508ac5881e0))

## [0.2.0](https://github.com/dryvist/nix-claude-code/compare/v0.1.15...v0.2.0) (2026-06-20)


### Features

* **release:** adopt config-free (non-manifest) release-please ([#55](https://github.com/dryvist/nix-claude-code/issues/55)) ([7cf73ad](https://github.com/dryvist/nix-claude-code/commit/7cf73ad9763e5f79832a884c73b7b4e4333bd984))

## [0.1.15](https://github.com/dryvist/nix-claude-code/compare/v0.1.14...v0.1.15) (2026-06-12)


### Features

* **permissions:** adopt source-of-truth role + add curated survivors ([#56](https://github.com/dryvist/nix-claude-code/issues/56)) ([5c514e7](https://github.com/dryvist/nix-claude-code/commit/5c514e703180b8326ec1c9b3489cbd6b4a3bbfe4))

## [0.1.14](https://github.com/dryvist/nix-claude-code/compare/v0.1.13...v0.1.14) (2026-06-12)


### Bug Fixes

* **ci:** repoint shared osv-scan workflow to dryvist hub ([#57](https://github.com/dryvist/nix-claude-code/issues/57)) ([c86e169](https://github.com/dryvist/nix-claude-code/commit/c86e1694d30d0cd7d181ceae5e026bb7c61ca703))

## [0.1.13](https://github.com/dryvist/nix-claude-code/compare/v0.1.12...v0.1.13) (2026-06-11)


### Bug Fixes

* **permissions:** auto-allow simple rm, ask for recursive/forced deletes ([#53](https://github.com/dryvist/nix-claude-code/issues/53)) ([217095d](https://github.com/dryvist/nix-claude-code/commit/217095d615537d12795461feccae67c058a2ab8b))

## [0.1.12](https://github.com/dryvist/nix-claude-code/compare/v0.1.11...v0.1.12) (2026-06-10)


### Features

* **permissions:** true-up vendored data to current ai-assistant-instructions JSON ([#50](https://github.com/dryvist/nix-claude-code/issues/50)) ([3441c86](https://github.com/dryvist/nix-claude-code/commit/3441c8651f124bef8b3328e1c8338475076310b1))


### Bug Fixes

* **cleanup:** remove stale-generation symlinks orphan-cleanup misses ([#49](https://github.com/dryvist/nix-claude-code/issues/49)) ([c68fe9c](https://github.com/dryvist/nix-claude-code/commit/c68fe9c14fe34d17c97005b03caf364ce1b30939))
* **renovate:** enable the opt-in nix manager so flake.lock is maintained ([#51](https://github.com/dryvist/nix-claude-code/issues/51)) ([77db0fb](https://github.com/dryvist/nix-claude-code/commit/77db0fbdcc8dffda0c52bfee39f14185be6b001d))

## [0.1.11](https://github.com/dryvist/nix-claude-code/compare/v0.1.10...v0.1.11) (2026-06-04)


### Bug Fixes

* **ci:** replace inlined release-please-action@v4 with org thin wrapper ([#47](https://github.com/dryvist/nix-claude-code/issues/47)) ([bea25c4](https://github.com/dryvist/nix-claude-code/commit/bea25c46b74954143290f8d775ffc4badb1eceaf))

## [0.1.10](https://github.com/dryvist/nix-claude-code/compare/v0.1.9...v0.1.10) (2026-06-02)


### Features

* add autoUpdates option for ~/.claude.json ([#45](https://github.com/dryvist/nix-claude-code/issues/45)) ([9d0a82c](https://github.com/dryvist/nix-claude-code/commit/9d0a82c6a0d045b42fa414a25baf9010c95501bb))
* **ci:** dispatch lock-update event to nix-ai on release ([#44](https://github.com/dryvist/nix-claude-code/issues/44)) ([8f12850](https://github.com/dryvist/nix-claude-code/commit/8f12850f51f44da2e43ed59378732c6650551044))

## [0.1.9](https://github.com/dryvist/nix-claude-code/compare/v0.1.8...v0.1.9) (2026-06-02)


### Bug Fixes

* **settings:** restore freeform settings passthrough for statusLine ([#42](https://github.com/dryvist/nix-claude-code/issues/42)) ([e88f6f0](https://github.com/dryvist/nix-claude-code/commit/e88f6f030d4738662bbbbe2af7cb3675fb0f20cb))

## [0.1.8](https://github.com/dryvist/nix-claude-code/compare/v0.1.7...v0.1.8) (2026-05-31)


### Bug Fixes

* **core:** drop home.file install of settings.json (activation-merge wins) ([#39](https://github.com/dryvist/nix-claude-code/issues/39)) ([9475266](https://github.com/dryvist/nix-claude-code/commit/947526673a8fb52ce400bb824f073f532f4fd2f4))
* **settings:** wrap merge-json-settings.sh in writeShellApplication ([#37](https://github.com/dryvist/nix-claude-code/issues/37)) ([628dd6f](https://github.com/dryvist/nix-claude-code/commit/628dd6fac218e65ce32b1adca7eb6605c1510e1a))

## [0.1.7](https://github.com/dryvist/nix-claude-code/compare/v0.1.6...v0.1.7) (2026-05-31)


### Bug Fixes

* **ci:** drop FlakeHub cache, adopt shared nix-validate template ([#33](https://github.com/dryvist/nix-claude-code/issues/33)) ([02af7e3](https://github.com/dryvist/nix-claude-code/commit/02af7e3640397532951e3121071af4ceef957975))

## [0.1.6](https://github.com/dryvist/nix-claude-code/compare/v0.1.5...v0.1.6) (2026-05-31)


### Features

* **catalog:** promote jacobpevans-cc-plugins + karpathy-skills upstream ([#29](https://github.com/dryvist/nix-claude-code/issues/29)) ([9fe7a2e](https://github.com/dryvist/nix-claude-code/commit/9fe7a2e86265a96d69f97e6514a5a3e012743b9c))


### Bug Fixes

* **devshell:** warn before pre-commit installer hits core.hooksPath block ([#31](https://github.com/dryvist/nix-claude-code/issues/31)) ([9fc82a2](https://github.com/dryvist/nix-claude-code/commit/9fc82a2c31f2244838eaf3d1fe3dbe43673fb7b2))
* **settings:** render autoMode in ~/.claude/settings.json ([#28](https://github.com/dryvist/nix-claude-code/issues/28)) ([60c0488](https://github.com/dryvist/nix-claude-code/commit/60c0488a90acd8c9183f681117ba5ea2cade8213))

## [0.1.5](https://github.com/dryvist/nix-claude-code/compare/v0.1.4...v0.1.5) (2026-05-30)

### Features

- **core:** defaultMode + autoMode options; adopt nix-devenv dev-hygiene ([#21](https://github.com/dryvist/nix-claude-code/issues/21)) ([6d2c1bc](https://github.com/dryvist/nix-claude-code/commit/6d2c1bc86797dff29a6db84090a99769a7a7ba5f))
- **modules:** port programs.claude.\* module from nix-ai ([#26](https://github.com/dryvist/nix-claude-code/issues/26)) ([5276fb5](https://github.com/dryvist/nix-claude-code/commit/5276fb566c8cf8078f808d8dbd5923bcd0e00c1a))

### Bug Fixes

- **ci:** retarget reusable-workflow uses: refs to current org homes ([#25](https://github.com/dryvist/nix-claude-code/issues/25)) ([8c42ead](https://github.com/dryvist/nix-claude-code/commit/8c42eadc4b5b7e2c3013db81a883f266816dcaba))

## [0.1.4](https://github.com/dryvist/nix-claude-code/compare/v0.1.3...v0.1.4) (2026-05-17)

### Features

- **core:** write settings.json from permissions + statusline + extras ([#16](https://github.com/dryvist/nix-claude-code/issues/16)) ([bcf2729](https://github.com/dryvist/nix-claude-code/commit/bcf272926e521e187923176c097ba14812909632))
- **statusline:** implement powerline, ccstatusline, daniel3303 themes ([#14](https://github.com/dryvist/nix-claude-code/issues/14)) ([cadb13b](https://github.com/dryvist/nix-claude-code/commit/cadb13be440c11ade7da4d9305f1ae2353b7bb19))

## [0.1.3](https://github.com/dryvist/nix-claude-code/compare/v0.1.2...v0.1.3) (2026-05-17)

### Features

- **lib:** implement discoverSkills/Commands/Agents/Hooks per Anthropic spec ([#11](https://github.com/dryvist/nix-claude-code/issues/11)) ([33d9538](https://github.com/dryvist/nix-claude-code/commit/33d9538bb5599013175961020dc2480992b9df5d))
- **lib:** implement toSettingsJson and wrapCommandsAsSkills ([#13](https://github.com/dryvist/nix-claude-code/issues/13)) ([3b18dd0](https://github.com/dryvist/nix-claude-code/commit/3b18dd0b9383d98e37e04df14879617bffa0f406))

## [0.1.2](https://github.com/dryvist/nix-claude-code/compare/v0.1.1...v0.1.2) (2026-05-17)

### Features

- **permissions:** port allow/ask/deny/domains data from ai-assistant-instructions ([#8](https://github.com/dryvist/nix-claude-code/issues/8)) ([1823366](https://github.com/dryvist/nix-claude-code/commit/1823366e979efede352432f230ee751f1a997040))

## [0.1.1](https://github.com/dryvist/nix-claude-code/compare/v0.1.0...v0.1.1) (2026-05-16)

### Features

- initial v0.1.0 scaffolding for nix-claude-code ([1dddab4](https://github.com/dryvist/nix-claude-code/commit/1dddab4e4769dadc5a3538fd46f08868aeda791a))

### Bug Fixes

- **ci:** use correct flake check attribute names ([#2](https://github.com/dryvist/nix-claude-code/issues/2)) ([0ee9c1b](https://github.com/dryvist/nix-claude-code/commit/0ee9c1b2e9d3492cea049200757311d5b02166ff))

## [0.1.0] - 2026-05-16

Initial scaffolding. Flake skeleton built on flake-parts with treefmt-nix,
git-hooks.nix, release-please, and home-manager. Module stubs for
`homeModules.{default,claude,core,plugins,statusline,hooks,mcp,latest}`,
empty `lib.*` exports, placeholder `data/permissions/` shape, adopter templates,
examples, and CI.

Content migration from `nix-ai` happens in subsequent v0.x.x releases.
