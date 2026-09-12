_:
# Hard-denied actions and file-path patterns.
#
# ADMISSION BAR — a command belongs here only if it is potentially
# catastrophic: it costs real money, or it permanently destroys something
# that cannot be rebuilt or restored. Everything that is merely destructive
# but reversible (undo, re-clone, re-run, restore from git) belongs in
# allow.nix, not here.
#
# Deny is the ONLY restrictive tier. There is no `ask` tier — see ask.nix
# for why a prompt is an outage in an unattended run. That means every
# entry added here silently becomes an unconditional block, so the bar
# above is a hard gate, not a guideline.
#
# Two categories are policy rather than physics, and are deliberate:
#
#   git            — hook-bypass and history-corruption. Denied because the
#                    guard rails themselves are the target; an agent that can
#                    disable pre-commit or rewrite core.hooksPath can then do
#                    anything unobserved. Not reversible in the sense that
#                    matters: the damage is the missing check.
#   package-install — language-level package managers. Every environment here
#                    is defined by Nix (or Homebrew, or bun/bunx); an ad-hoc
#                    `npm install` / `pip install` mutates state that Nix
#                    believes it owns and that no rebuild will restore.
#
# Originally vendored from ai-assistant-instructions deny/*.json (snapshot:
# 2026-06-09, source rev 3128b52); re-derived against the bar above in the
# 2026-07 ask-tier removal.
{
  commands = [
    # dangerous — permanent, unrecoverable destruction of storage or system
    "diskutil apfs deleteContainer"
    "diskutil apfs deleteVolume"
    "diskutil apfs eraseVolume"
    "diskutil eraseDisk"
    "diskutil eraseVolume"
    "diskutil partitionDisk"
    "diskutil reformat"
    "diskutil secureErase"
    "diskutil unmountDisk force"
    "diskutil zeroDisk"
    "fdisk"
    "mkfs"
    "rm --recursive --force /"
    "rm --recursive --force ~"
    "rm -fr /"
    "rm -fr ~"
    "rm -rf /"
    "rm -rf ~"
    "sudo -i"
    "sudo -s"
    "sudo bash"
    "sudo dd"
    "sudo rm"
    "sudo su"

    # cloud — billable resource creation, or irreversible deletion of a
    # resource holding state that no rebuild recovers.
    "aws cloudformation delete-stack"
    "aws ec2 run-instances"
    "aws ec2 terminate-instances"
    "aws lambda delete-function"
    "aws rds create-db-instance"
    "aws rds delete-db-instance"
    "aws s3 rb"
    "aws s3 rm"

    # credentials and publishing — actions an agent's own credentials can
    # perform that a filesystem boundary cannot undo.
    "gh auth"
    "gh repo archive"
    "gh repo delete"
    "gh secret"
    # `security dump-keychain` decrypts every item in a keychain (`dump` is
    # its alias; `export` writes keys/certs out). Each item fires an
    # authorization prompt to the operator, and a full dump is never the
    # right way to find one item: `security find-generic-password -s <name>`
    # answers directly, and `list-keychains` still enumerates keychains.
    "security dump"
    "security dump-keychain"
    "security export"
    "npm publish"
    "cargo publish"

    # git — hook-bypass and history-corruption. Disabling the check IS the
    # damage; never route around a blocker by removing the blocker.
    "chmod -x .git/hooks/"
    "git -c core.hooksPath"
    "git cherry-pick --no-verify"
    "git commit --no-verify"
    "git commit -n"
    "git config core.hooksPath"
    "git merge --no-verify"
    "git rebase --no-verify"
    "pre-commit uninstall"
    "rm -rf .git/hooks"
    "rm -rf .git/hooks/"
    "rm .git/hooks"
    "rm .git/hooks/"

    # package-install — environments are Nix-defined (or Homebrew, or
    # bun/bunx). Ad-hoc installs mutate state Nix believes it owns.
    # `npm run` / `npm test` are NOT installs and are allowed.
    "bundle install"
    "cargo install"
    "composer install"
    "composer require"
    "conda install"
    "gem install"
    "go install"
    "mamba install"
    "micromamba install"
    "npm ci"
    "npm i"
    "npm install"
    "npx"
    "pip install"
    "pip3 install"
    "pnpm add"
    "pnpm install"
    "pnpx"
    "poetry add"
    "poetry install"
    "python -m pip install"
    "python3 -m pip install"
    "yarn add"
    "yarn install"
  ];

  # File-path glob patterns denied across all `Read`/`Edit`/`Write` calls.
  # Scoped to files that hold live secret material — a leaked key cannot be
  # un-leaked. Deliberately NOT blanket-blocking `.env.*` or `secrets/**`:
  # those catch committed, non-secret documentation (`.env.example`,
  # `.env.sample`, a `secrets/` docs hierarchy) and blocking them costs real
  # work for no security gain. Only the conventionally-gitignored env
  # variants (`.env`, `.env.local`, `.env.<name>.local`) are denied.
  patterns = [
    "**/*_dsa"
    "**/*_ecdsa"
    "**/*_ed25519"
    "**/*_rsa"
    "**/.env"
    "**/.env.*.local"
    "**/.env.local"
    "**/credentials/**"
    ".env"
    "~/.aws/credentials"
    "~/.gnupg/**"
    "~/.ssh/id_*"
  ];
}
