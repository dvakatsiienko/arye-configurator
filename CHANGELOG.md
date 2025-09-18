# Changelog

All notable changes to ARYE Configurator are documented here.

## [Unreleased]

- [1b94912](https://github.com/dvakatsiienko/arye-configurator/commit/1b94912): ⚙️ release-system: enhance commit filtering and SHA format
- [64c4eed](https://github.com/dvakatsiienko/arye-configurator/commit/64c4eed): ⚙️ changelog: add auto-commit and exclude self-references
- [577140a](https://github.com/dvakatsiienko/arye-configurator/commit/577140a): 📜 repo-urls: update GitHub repository references to arye-configurator
- [91ba6a5](https://github.com/dvakatsiienko/arye-configurator/commit/91ba6a5): ⚙️ rebrand: transform repo to Arye Configurator app distribution
- [9177a07](https://github.com/dvakatsiienko/arye-configurator/commit/9177a07): ⚙️ release-system: transform from git-tag to driver-file based releases
- [5ba9b6c](https://github.com/dvakatsiienko/arye-configurator/commit/5ba9b6c): 🧹 release-system: simplify changelog generation and remove redundant scripts

## [v1.1.0] - 2025-09-18

- [6c264c1](https://github.com/dvakatsiienko/arye-configurator/commit/6c264c1): ⚙️ release-notes: use actual versioned driver filename in instructions

## [v1.0.30] - 2025-09-18

- [e78773a](https://github.com/dvakatsiienko/arye-configurator/commit/e78773a): ⚙️ release-notes: improve installation instructions formatting
- [05f056c](https://github.com/dvakatsiienko/arye-configurator/commit/05f056c): ⚙️ release-notes: make commit messages clickable links
- [975a373](https://github.com/dvakatsiienko/arye-configurator/commit/975a373): ⚙️ mock-driver: reduce file size from 50MB to 2KB

## [v1.0.29] - 2025-09-18

- [1e9e6ef](https://github.com/dvakatsiienko/arye-configurator/commit/1e9e6ef): 🐞 build-system: fix remaining video file references and version
- [36f8328](https://github.com/dvakatsiienko/arye-configurator/commit/36f8328): ⚙️ build-system: rename video file and fix GitHub Actions versioning

## [v1.0.27] - 2025-09-18

- [e6a0b81](https://github.com/dvakatsiienko/arye-configurator/commit/e6a0b81): ⚙️ build-system: implement mock driver artifact generation

## [v1.0.26] - 2025-09-18

- [c041665](https://github.com/dvakatsiienko/arye-configurator/commit/c041665): ⚙️ release-notes: add permanent download links

## [v1.0.25] - 2025-09-18

- [23603e6](https://github.com/dvakatsiienko/arye-configurator/commit/23603e6): 🔧 versioning: sync package.json with latest git tag v1.0.24
- [de9c2dc](https://github.com/dvakatsiienko/arye-configurator/commit/de9c2dc): ⚙️ release-notes: add full changelog link to releases
- [b356224](https://github.com/dvakatsiienko/arye-configurator/commit/b356224): 🧹 chore: delete unused scripts
- [be69057](https://github.com/dvakatsiienko/arye-configurator/commit/be69057): ⚙️ scripts: add push flow
- [422e20a](https://github.com/dvakatsiienko/arye-configurator/commit/422e20a): ⚙️  releases: tweak relase notes body

## [v1.0.24] - 2025-09-18

- [192c8cc](https://github.com/dvakatsiienko/arye-configurator/commit/192c8cc): ✨ feat: add actual commit list to release notes

## [v1.0.23] - 2025-09-18

- [622f01d](https://github.com/dvakatsiienko/arye-configurator/commit/622f01d): 🔧 fix: stash changes before checkout to avoid conflicts

## [v1.0.22] - 2025-09-18

- [2ef1e8b](https://github.com/dvakatsiienko/arye-configurator/commit/2ef1e8b): 🔧 fix: resolve changelog diff check conflict on branch switch

## [v1.0.21] - 2025-09-18

- [00d2aa8](https://github.com/dvakatsiienko/arye-configurator/commit/00d2aa8): 🔧 fix: resolve detached HEAD issue in changelog commit step

## [v1.0.20] - 2025-09-18

- [bed58b1](https://github.com/dvakatsiienko/arye-configurator/commit/bed58b1): 🔧 fix: resolve YAML syntax errors in release workflow
- [df9976f](https://github.com/dvakatsiienko/arye-configurator/commit/df9976f): 🐞 workflow: add manual trigger and fix quotes
- [6a1d325](https://github.com/dvakatsiienko/arye-configurator/commit/6a1d325): 🐞 workflow: fix tag pattern to trigger on any v* tag
- [4a4d86c](https://github.com/dvakatsiienko/arye-configurator/commit/4a4d86c): ⚙️ git: add auto-pull retry logic for GitHub Actions commits

## [v1.0.15] - 2025-09-18

- [5f9618b](https://github.com/dvakatsiienko/arye-configurator/commit/5f9618b): ⚙️ build: replace build.bat with bash-compatible build.sh

## [v1.0.14] - 2025-09-18

- [6e05d6d](https://github.com/dvakatsiienko/arye-configurator/commit/6e05d6d): 🐞 release-workflow: fix batch file execution in bash

## [v1.0.13] - 2025-09-18

- [c3952d5](https://github.com/dvakatsiienko/arye-configurator/commit/c3952d5): ⚙️ workflows: switch from PowerShell to bash and add release tooling

## [v1.0.12] - 2025-09-18

- [1555c0b](https://github.com/dvakatsiienko/arye-configurator/commit/1555c0b): 🐞 release-workflow: fix UTF-8 encoding with BOM for Windows

## [v1.0.11] - 2025-09-18

- [4363663](https://github.com/dvakatsiienko/arye-configurator/commit/4363663): 🐞 changelog: fix author filtering with perl-regexp
- [66312e3](https://github.com/dvakatsiienko/arye-configurator/commit/66312e3): ⚙️ workflows: filter auto-commits by author instead of message
- [fa7f327](https://github.com/dvakatsiienko/arye-configurator/commit/fa7f327): ⚙️ workflows: rename auto-generated commit messages
- [2ba8fcf](https://github.com/dvakatsiienko/arye-configurator/commit/2ba8fcf): ⚙️ changelog-workflow: filter out auto-generated commits
- [c008074](https://github.com/dvakatsiienko/arye-configurator/commit/c008074): ⚙️ changelog: exclude auto-generated commits from release notes

## [v1.0.10] - 2025-09-18

- [8e0838a](https://github.com/dvakatsiienko/arye-configurator/commit/8e0838a): 🐞 release-workflow: fix PowerShell syntax in changelog commit step
- [65c864d](https://github.com/dvakatsiienko/arye-configurator/commit/65c864d): 🐞 release-workflow: fix UTF-8 encoding in changelog generation
- [aa0bce3](https://github.com/dvakatsiienko/arye-configurator/commit/aa0bce3): ⚙️ release-notes: add direct driver download link

## [v1.0.9] - 2025-09-18

- [04396ba](https://github.com/dvakatsiienko/arye-configurator/commit/04396ba): 🧹 config: remove unused release-config.json
- [31e11f0](https://github.com/dvakatsiienko/arye-configurator/commit/31e11f0): 🐞 workflows: fix UTF-8 encoding issues and move changelog to root
- [b0bd00f](https://github.com/dvakatsiienko/arye-configurator/commit/b0bd00f): ⚙️ workflows: use official GitHub Actions bot identity
- [889f747](https://github.com/dvakatsiienko/arye-configurator/commit/889f747): 📜 changelog: auto-update unreleased section

## [v1.0.8] - 2025-09-18

- [fc5f0d9](https://github.com/dvakatsiienko/arye-configurator/commit/fc5f0d9): ⚙️ changelog: add automatic unreleased section tracking
- [9999bc7](https://github.com/dvakatsiienko/arye-configurator/commit/9999bc7): 📜 release-title: simplify to RCC-1 only

## [v1.0.7] - 2025-09-18

- [f97b248](https://github.com/dvakatsiienko/arye-configurator/commit/f97b248): 📜 readme: fix download link formatting
- [e0c0c3b](https://github.com/dvakatsiienko/arye-configurator/commit/e0c0c3b): 🐞 workflow: fix PowerShell changelog generation
- [d947313](https://github.com/dvakatsiienko/arye-configurator/commit/d947313): 📜 readme: simplify download and documentation links

## [v1.0.6] - 2025-09-18

- [f38af8b](https://github.com/dvakatsiienko/arye-configurator/commit/f38af8b): ⚙️ changelog: add automatic changelog generation

## [v1.0.5] - 2025-09-18

- [42897de](https://github.com/dvakatsiienko/arye-configurator/commit/42897de): 📜 branding: simplify release title and README

## [v1.0.4] - 2025-09-18

- [95a50fb](https://github.com/dvakatsiienko/arye-configurator/commit/95a50fb): ⚙️ naming: rename driver packages to arye-rcc-1-windows format
- [136f014](https://github.com/dvakatsiienko/arye-configurator/commit/136f014): 📜 branding: update to Arye Equipment capitalization

## [v1.0.3] - 2025-09-18

- [4036deb](https://github.com/dvakatsiienko/arye-configurator/commit/4036deb): ⚙️ release-system: add permanent download link and fix permissions

## [v1.0.2] - 2025-09-18


## [v1.0.1.3] - 2025-09-18

- [64c4eed](https://github.com/dvakatsiienko/arye-configurator/commit/64c4eed): ⚙️ changelog: add auto-commit and exclude self-references
- [577140a](https://github.com/dvakatsiienko/arye-configurator/commit/577140a): 📜 repo-urls: update GitHub repository references to arye-configurator
- [91ba6a5](https://github.com/dvakatsiienko/arye-configurator/commit/91ba6a5): ⚙️ rebrand: transform repo to Arye Configurator app distribution
- [9177a07](https://github.com/dvakatsiienko/arye-configurator/commit/9177a07): ⚙️ release-system: transform from git-tag to driver-file based releases
- [5ba9b6c](https://github.com/dvakatsiienko/arye-configurator/commit/5ba9b6c): 🧹 release-system: simplify changelog generation and remove redundant scripts
- [6c264c1](https://github.com/dvakatsiienko/arye-configurator/commit/6c264c1): ⚙️ release-notes: use actual versioned driver filename in instructions
- [e78773a](https://github.com/dvakatsiienko/arye-configurator/commit/e78773a): ⚙️ release-notes: improve installation instructions formatting
- [05f056c](https://github.com/dvakatsiienko/arye-configurator/commit/05f056c): ⚙️ release-notes: make commit messages clickable links
- [975a373](https://github.com/dvakatsiienko/arye-configurator/commit/975a373): ⚙️ mock-driver: reduce file size from 50MB to 2KB
- [1e9e6ef](https://github.com/dvakatsiienko/arye-configurator/commit/1e9e6ef): 🐞 build-system: fix remaining video file references and version
- [36f8328](https://github.com/dvakatsiienko/arye-configurator/commit/36f8328): ⚙️ build-system: rename video file and fix GitHub Actions versioning
- [e6a0b81](https://github.com/dvakatsiienko/arye-configurator/commit/e6a0b81): ⚙️ build-system: implement mock driver artifact generation
- [c041665](https://github.com/dvakatsiienko/arye-configurator/commit/c041665): ⚙️ release-notes: add permanent download links
- [23603e6](https://github.com/dvakatsiienko/arye-configurator/commit/23603e6): 🔧 versioning: sync package.json with latest git tag v1.0.24
- [de9c2dc](https://github.com/dvakatsiienko/arye-configurator/commit/de9c2dc): ⚙️ release-notes: add full changelog link to releases
- [b356224](https://github.com/dvakatsiienko/arye-configurator/commit/b356224): 🧹 chore: delete unused scripts
- [be69057](https://github.com/dvakatsiienko/arye-configurator/commit/be69057): ⚙️ scripts: add push flow
- [422e20a](https://github.com/dvakatsiienko/arye-configurator/commit/422e20a): ⚙️  releases: tweak relase notes body
- [192c8cc](https://github.com/dvakatsiienko/arye-configurator/commit/192c8cc): ✨ feat: add actual commit list to release notes
- [622f01d](https://github.com/dvakatsiienko/arye-configurator/commit/622f01d): 🔧 fix: stash changes before checkout to avoid conflicts
- [2ef1e8b](https://github.com/dvakatsiienko/arye-configurator/commit/2ef1e8b): 🔧 fix: resolve changelog diff check conflict on branch switch
- [00d2aa8](https://github.com/dvakatsiienko/arye-configurator/commit/00d2aa8): 🔧 fix: resolve detached HEAD issue in changelog commit step
- [bed58b1](https://github.com/dvakatsiienko/arye-configurator/commit/bed58b1): 🔧 fix: resolve YAML syntax errors in release workflow
- [df9976f](https://github.com/dvakatsiienko/arye-configurator/commit/df9976f): 🐞 workflow: add manual trigger and fix quotes
- [6a1d325](https://github.com/dvakatsiienko/arye-configurator/commit/6a1d325): 🐞 workflow: fix tag pattern to trigger on any v* tag
- [4a4d86c](https://github.com/dvakatsiienko/arye-configurator/commit/4a4d86c): ⚙️ git: add auto-pull retry logic for GitHub Actions commits
- [5f9618b](https://github.com/dvakatsiienko/arye-configurator/commit/5f9618b): ⚙️ build: replace build.bat with bash-compatible build.sh
- [6e05d6d](https://github.com/dvakatsiienko/arye-configurator/commit/6e05d6d): 🐞 release-workflow: fix batch file execution in bash
- [c3952d5](https://github.com/dvakatsiienko/arye-configurator/commit/c3952d5): ⚙️ workflows: switch from PowerShell to bash and add release tooling
- [1555c0b](https://github.com/dvakatsiienko/arye-configurator/commit/1555c0b): 🐞 release-workflow: fix UTF-8 encoding with BOM for Windows
- [4363663](https://github.com/dvakatsiienko/arye-configurator/commit/4363663): 🐞 changelog: fix author filtering with perl-regexp
- [66312e3](https://github.com/dvakatsiienko/arye-configurator/commit/66312e3): ⚙️ workflows: filter auto-commits by author instead of message
- [fa7f327](https://github.com/dvakatsiienko/arye-configurator/commit/fa7f327): ⚙️ workflows: rename auto-generated commit messages
- [2ba8fcf](https://github.com/dvakatsiienko/arye-configurator/commit/2ba8fcf): ⚙️ changelog-workflow: filter out auto-generated commits
- [c008074](https://github.com/dvakatsiienko/arye-configurator/commit/c008074): ⚙️ changelog: exclude auto-generated commits from release notes
- [8e0838a](https://github.com/dvakatsiienko/arye-configurator/commit/8e0838a): 🐞 release-workflow: fix PowerShell syntax in changelog commit step
- [65c864d](https://github.com/dvakatsiienko/arye-configurator/commit/65c864d): 🐞 release-workflow: fix UTF-8 encoding in changelog generation
- [aa0bce3](https://github.com/dvakatsiienko/arye-configurator/commit/aa0bce3): ⚙️ release-notes: add direct driver download link
- [04396ba](https://github.com/dvakatsiienko/arye-configurator/commit/04396ba): 🧹 config: remove unused release-config.json
- [31e11f0](https://github.com/dvakatsiienko/arye-configurator/commit/31e11f0): 🐞 workflows: fix UTF-8 encoding issues and move changelog to root
- [b0bd00f](https://github.com/dvakatsiienko/arye-configurator/commit/b0bd00f): ⚙️ workflows: use official GitHub Actions bot identity
- [889f747](https://github.com/dvakatsiienko/arye-configurator/commit/889f747): 📜 changelog: auto-update unreleased section
- [fc5f0d9](https://github.com/dvakatsiienko/arye-configurator/commit/fc5f0d9): ⚙️ changelog: add automatic unreleased section tracking
- [9999bc7](https://github.com/dvakatsiienko/arye-configurator/commit/9999bc7): 📜 release-title: simplify to RCC-1 only
- [f97b248](https://github.com/dvakatsiienko/arye-configurator/commit/f97b248): 📜 readme: fix download link formatting
- [e0c0c3b](https://github.com/dvakatsiienko/arye-configurator/commit/e0c0c3b): 🐞 workflow: fix PowerShell changelog generation
- [d947313](https://github.com/dvakatsiienko/arye-configurator/commit/d947313): 📜 readme: simplify download and documentation links
- [f38af8b](https://github.com/dvakatsiienko/arye-configurator/commit/f38af8b): ⚙️ changelog: add automatic changelog generation
- [42897de](https://github.com/dvakatsiienko/arye-configurator/commit/42897de): 📜 branding: simplify release title and README
- [95a50fb](https://github.com/dvakatsiienko/arye-configurator/commit/95a50fb): ⚙️ naming: rename driver packages to arye-rcc-1-windows format
- [136f014](https://github.com/dvakatsiienko/arye-configurator/commit/136f014): 📜 branding: update to Arye Equipment capitalization
- [4036deb](https://github.com/dvakatsiienko/arye-configurator/commit/4036deb): ⚙️ release-system: add permanent download link and fix permissions
- [f53620e](https://github.com/dvakatsiienko/arye-configurator/commit/f53620e): 📜 release-policy: add critical instructions for GitHub Actions releases

## [v1.0.1] - 2025-09-18

- [553b9fa](https://github.com/dvakatsiienko/arye-configurator/commit/553b9fa): 📜 product-info: update to ARYE RCC-1 gaming mouse

## [v1.0.0] - 2025-09-18

- [73a1d63](https://github.com/dvakatsiienko/arye-configurator/commit/73a1d63): 🐞 workflow: fix release creation using GitHub CLI
- [b28d7e9](https://github.com/dvakatsiienko/arye-configurator/commit/b28d7e9): ⚙️ build: add fallback for missing driver.webm in CI
- [fae6ed6](https://github.com/dvakatsiienko/arye-configurator/commit/fae6ed6): 📜 release-setup: simplify README and configure mock driver system
- [b09e8c0](https://github.com/dvakatsiienko/arye-configurator/commit/b09e8c0): initial commit

