# Changelog

All notable changes to the Datadog Unix Agent are documented here.

This project follows [Semantic Versioning](https://semver.org/). The format is loosely based on [Keep a Changelog](https://keepachangelog.com/).

---

## [1.2.1] - 2026-05-08

### Bug Fixes

- Fix AIX postinstall script: use `set +e`/`set -e` guards around `odmdelete` and `startsrc` calls; create log directory on install
- Fix AIX unconfig/prerm script: ksh88 `set -e` compatibility, fix syntax error, add explicit directory cleanup
- Fix unconfig symlink check: use `if` statement instead of `set +e`/`set -e` pattern for reliability
- Apply `|| true` cleanup in postinstall and set `disable_console_logging` default to `true` to avoid inittab stdout noise

### Dependency Upgrades

- Upgrade Jinja2 to 3.1.4 to resolve MarkupSafe 2.1.x incompatibility on Python 3.8/AIX
- Dep upgrades for Python 3.8 / AIX compatibility: psutil 5.9.8 (with AIX patch), updated tornado upper-bound constraint, and several transitive packages

### Omnibus / Build

- Fix AIX 7.2 omnibus build for 1.2.1: update `config.guess` for POWER10 recognition, pin psutil to AIX-compatible version, fix tornado constraint

---

## [1.2.0] - 2026-05-01

### Bug Fixes

- Fix process check crashes caused by uncaught `psutil.AccessDenied` exceptions ([#181](https://github.com/DataDog/datadog-unix-agent/pull/181))
- Fix `min_collection_interval` being ignored in integration config ([#153](https://github.com/DataDog/datadog-unix-agent/pull/153))
- Fix flare upload when an existing case ID is provided ([#152](https://github.com/DataDog/datadog-unix-agent/pull/152))
- Fix agent status: group check instances by check name in display ([#180](https://github.com/DataDog/datadog-unix-agent/pull/180))
- Fix agent status stats: track check instances individually with per-instance execution stats ([#159](https://github.com/DataDog/datadog-unix-agent/pull/159))
- Fix integration and config error display in agent status ([#191](https://github.com/DataDog/datadog-unix-agent/pull/191))
- Skip invalid config directories instead of crashing the agent ([#158](https://github.com/DataDog/datadog-unix-agent/pull/158))
- Fix AIX inittab wtmp bloat; add max-restart-attempt guard ([#156](https://github.com/DataDog/datadog-unix-agent/pull/156))
- Honor `NO_PROXY` for outbound HTTP; align proxy stack with main Datadog Agent ([#215](https://github.com/DataDog/datadog-unix-agent/pull/215))
- Address security vulnerability in HMC check ([#146](https://github.com/DataDog/datadog-unix-agent/pull/146))
- Fix incomplete URL substring sanitization in HTTP client (code scanning alert)
- Centralize `api_key` masking across log output and status display

### New Features

- Add gohai-like host metadata with AIX-focused collectors (CPU, memory, network, OS); payload sent every 10 minutes ([#155](https://github.com/DataDog/datadog-unix-agent/pull/155))
- Add NTP check as a core check ([#150](https://github.com/DataDog/datadog-unix-agent/pull/150))
- Add HTTP payload compression support; per-caller compression options in `RequestsWrapper` ([#154](https://github.com/DataDog/datadog-unix-agent/pull/154))
- Add `disable_console_logging` configuration option to suppress stdout log output ([#147](https://github.com/DataDog/datadog-unix-agent/pull/147))
- Update `datadog.yaml` reference config to match current main Datadog Agent defaults ([#151](https://github.com/DataDog/datadog-unix-agent/pull/151))

### Refactoring

- Introduce `RequestsWrapper` — unified HTTP session handling for Flare, Forwarder, and API key validation with consistent retry, timeout, proxy, and SSL configuration ([#149](https://github.com/DataDog/datadog-unix-agent/pull/149))
- Refactor core checks: create `CoreChecksLoader`; checks only load when their config file is present and can be disabled by removing configs ([#157](https://github.com/DataDog/datadog-unix-agent/pull/157))
- Migrate `network` and `ntp` checks from bundled checks to the core checks framework ([#157](https://github.com/DataDog/datadog-unix-agent/pull/157))
- Expose `CoreCheckLoader` errors in `agent status` output

### Security / Dependency Upgrades

- **VULN UPGRADE**: tornado major version bump → 6.5.4 ([#195](https://github.com/DataDog/datadog-unix-agent/pull/195))
- **VULN UPGRADE**: minor/patch upgrades — 20 packages (13 minor, 7 patch) ([#192](https://github.com/DataDog/datadog-unix-agent/pull/192))

### Maintenance

- Remove `.circleci` CI configuration ([#216](https://github.com/DataDog/datadog-unix-agent/pull/216))
- Pin GitHub Actions to commit SHAs for supply-chain security ([#148](https://github.com/DataDog/datadog-unix-agent/pull/148))
- Import omnibus software definitions directly into repo; remove external `omnibus-software` dependency ([#143](https://github.com/DataDog/datadog-unix-agent/pull/143))
- Update supported AIX version list in documentation

---

## [1.1.6] - 2022-06-15

Last upstream release before this fork. See [GitHub releases](https://github.com/DataDog/datadog-unix-agent/releases/tag/1.1.6) for earlier history.
