# Changelog

All notable changes to the Datadog Unix Agent are documented here.

---

## [1.2.1] - 2026-05-08

### Bug Fixes

- Fix AIX package scripts: use `|| true` for best-effort SRC/inittab cleanup; prevents install failure when subsystem already registered ([#218](https://github.com/DataDog/datadog-unix-agent/pull/218))
- Fix AIX postinstall: create agent log directory on fresh install

### Changes

- Default `disable_console_logging` to `true`; on AIX the agent runs under SRC where console output goes to inittab/wtmp ([#217](https://github.com/DataDog/datadog-unix-agent/pull/217))

### Dependency Upgrades

| Package | 1.2.0 | 1.2.1 |
|---------|-------|-------|
| certifi | 2018.4.16 | 2025.4.26 |
| cffi | 1.14.4 | 1.17.1 |
| chardet | 3.0.4 | 5.2.0 |
| charset-normalizer | 2.1.1 | 3.3.2 |
| idna | 2.10 | 3.10 |
| Jinja2 | 2.11.3 | 3.1.4 |
| paramiko | 2.12.0 | 3.4.0 |
| psutil | 5.6.7 | 5.9.8 |
| pyasn1 | 0.4.8 | 0.6.3 |
| PyNaCl | 1.2.1 | 1.6.2 |
| PyYAML | 5.4.1 | 6.0.2 |
| requests | 2.26.0 | 2.32.4 |
| urllib3 | 1.26.6 | 2.2.3 |
| zstandard | 0.20.0 | 0.22.0 |

> **Note:** `cryptography` (3.3.2) and `tornado` (6.4.2) are intentionally held — versions 43+ and 6.5+ respectively require Python 3.9, while the AIX embedded Python is 3.8.

### Omnibus / Build

- Fix AIX 7.2 omnibus build: update `config.guess` for POWER10 recognition, pin psutil to AIX-compatible version, fix tornado constraint

---

## [1.2.0] - 2026-05-01

### Bug Fixes

- Fix process check crashes due to uncaught `psutil.AccessDenied` exceptions ([#181](https://github.com/DataDog/datadog-unix-agent/pull/181))
- Fix `min_collection_interval` being ignored in integration config ([#153](https://github.com/DataDog/datadog-unix-agent/pull/153))
- Fix flare upload when an existing case ID is provided ([#152](https://github.com/DataDog/datadog-unix-agent/pull/152))
- Fix agent status: group check instances by check name in display ([#180](https://github.com/DataDog/datadog-unix-agent/pull/180))
- Fix agent status stats: track check instances individually with per-instance execution stats ([#159](https://github.com/DataDog/datadog-unix-agent/pull/159))
- Fix integration and config error display in agent status ([#191](https://github.com/DataDog/datadog-unix-agent/pull/191))
- Skip invalid config directories instead of crashing the agent ([#158](https://github.com/DataDog/datadog-unix-agent/pull/158))
- Fix AIX inittab wtmp bloat; add max-restart-attempt guard ([#156](https://github.com/DataDog/datadog-unix-agent/pull/156))
- Honor `NO_PROXY` for outbound HTTP; align proxy stack with main Datadog Agent ([#215](https://github.com/DataDog/datadog-unix-agent/pull/215))
- Address security vulnerability in HMC check ([#146](https://github.com/DataDog/datadog-unix-agent/pull/146))
- Centralize `api_key` masking across log output and status display

### New Features

- Send fleet host metadata payload every 10 minutes, aligning with the main Agent; prevents hosts from disappearing in Fleet Automation due to 1-hour TTL ([#145](https://github.com/DataDog/datadog-unix-agent/pull/145))
- Add gohai-like host metadata with AIX-focused collectors (CPU, memory, network, OS) ([#155](https://github.com/DataDog/datadog-unix-agent/pull/155))
- Add NTP check as a core check ([#150](https://github.com/DataDog/datadog-unix-agent/pull/150))
- Add HTTP payload compression; per-caller compression options in `RequestsWrapper` ([#154](https://github.com/DataDog/datadog-unix-agent/pull/154))
- Add `disable_console_logging` configuration option to suppress stdout log output ([#147](https://github.com/DataDog/datadog-unix-agent/pull/147))
- Update `datadog.yaml` reference config to match current main Datadog Agent defaults ([#151](https://github.com/DataDog/datadog-unix-agent/pull/151))

### Refactoring

- Introduce `RequestsWrapper` — unified HTTP session handling for Flare, Forwarder, and API key validation ([#149](https://github.com/DataDog/datadog-unix-agent/pull/149))
- Refactor core checks: checks only load when config file is present; can be disabled by removing configs ([#157](https://github.com/DataDog/datadog-unix-agent/pull/157))
- Migrate `network` and `ntp` from bundled checks to core checks framework ([#157](https://github.com/DataDog/datadog-unix-agent/pull/157))

### Security / Dependency Upgrades

- VULN UPGRADE: tornado → 6.5.4 ([#195](https://github.com/DataDog/datadog-unix-agent/pull/195))
- VULN UPGRADE: 20 minor/patch package upgrades ([#192](https://github.com/DataDog/datadog-unix-agent/pull/192))

### Maintenance

- Import omnibus software definitions directly into repo; remove external `omnibus-software` dependency ([#143](https://github.com/DataDog/datadog-unix-agent/pull/143))
- Fix bootstrap scripts: bundler DNS handling and machine setup ([#127](https://github.com/DataDog/datadog-unix-agent/pull/127), [#128](https://github.com/DataDog/datadog-unix-agent/pull/128))
- Update supported AIX version list ([#142](https://github.com/DataDog/datadog-unix-agent/pull/142))
- Pin GitHub Actions to commit SHAs for supply-chain security ([#148](https://github.com/DataDog/datadog-unix-agent/pull/148))
- Add `custom_queries` example for Japanese IBM WAS XML issue ([#130](https://github.com/DataDog/datadog-unix-agent/pull/130))

---

## [1.1.6] - 2022-06-15

Last upstream release before this fork. See [GitHub releases](https://github.com/DataDog/datadog-unix-agent/releases/tag/1.1.6) for earlier history.
