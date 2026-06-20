# Security Policy

## Supported Versions

| Version | Supported          |
| ------- | ------------------ |
| Latest (main) | :white_check_mark: |
| v3.x    | :white_check_mark: |

This is a maintained fork of [ComfyUI-Manager](https://github.com/Comfy-Org/ComfyUI-Manager) by Pretty Kitty Entertainment / PKEMEDIA. We track upstream security patches closely.

## Reporting a Vulnerability

We take security seriously, especially for a tool that installs custom nodes and runs AI workflows (including adult media production pipelines).

**Please report vulnerabilities responsibly:**

- **Preferred**: Open a private security advisory on this repository (GitHub Security > Report a vulnerability).
- **Email**: coviceaperry@gmail.com (Pretty Kitty Media owner)
- **Alternative**: security@prettykittyentertainment.com (if set up)

Include:
- Description of the issue
- Steps to reproduce
- Potential impact (especially on node installs, config, or user data paths)
- Suggested fix if known

We aim to respond within 48 hours and will coordinate disclosure.

## Studio / Production Notes (Pretty Kitty Media)

- **Node vetting**: Only nodes from trusted sources or your curated `pkemedia-channel.json` should be installed in production environments.
- **Config hardening**: Use the provided `pkemedia-studio-config.ini` (strong security_level, uv, controlled git/pip installs).
- **Private channels**: For sensitive or internal nodes, host your own `custom-node-list.json` or private channel and keep it out of public repos.
- **Data paths**: Manager data lives in protected `<USER_DIRECTORY>/__manager__` (v3.38+). Never expose these.
- **Dependencies**: We monitor upstream for pip/git risks. Run with `use_uv=true` for speed and isolation where possible.
- **Adult content workflows**: Be extra cautious with nodes that process images/videos of real people or generate explicit content — validate licenses and consent.

## Scope

This policy covers:
- The Manager extension itself
- Installation scripts and config templates we provide
- Our curated channel and recommended nodes

It does **not** cover third-party custom nodes you install (report those to their maintainers).

Thank you for helping keep the Pretty Kitty production environment and the broader ComfyUI community safe.