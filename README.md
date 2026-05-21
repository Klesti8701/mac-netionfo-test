# netinfo

A shell script CLI tool for macOS (and Linux) that shows:

- 🌐 **Public IP** via `curl ifconfig.me` + geo lookup
- 🔌 **Local network** — interfaces, gateway, DNS, ping test
- 💾 **Filesystem** — disk usage, largest files in current dir
- 🖥  **System info** — OS, CPU, RAM, uptime

---

## Install via Homebrew (custom tap)

### Step 1 — Host your tap on GitHub

1. Create a GitHub repo named **`homebrew-netinfo`** under your username
2. Put `netinfo.rb` (the formula) in the root of that repo
3. Create a release `v1.0.0` and upload a tarball of the `netinfo` script:

```bash
# From the project folder:
tar -czf netinfo-1.0.0.tar.gz netinfo
shasum -a 256 netinfo-1.0.0.tar.gz   # copy this hash
```

4. Paste the SHA256 hash into `netinfo.rb` where it says `REPLACE_WITH_SHA256_OF_YOUR_TARBALL`
5. Update the `url` in `netinfo.rb` to point to your GitHub release tarball

### Step 2 — Add the tap and install

```bash
brew tap YOUR_USERNAME/netinfo
brew install netinfo
```

---

## Quick local install (no GitHub needed)

```bash
# Just copy the script directly:
chmod +x netinfo
sudo cp netinfo /usr/local/bin/netinfo
```

---

## Usage

```
netinfo           # show everything
netinfo ip        # public IP via ifconfig.me + geo info
netinfo net       # local interfaces, gateway, DNS, ping
netinfo fs        # disk usage + largest files in current dir
netinfo sys       # OS, CPU, RAM, uptime
netinfo version   # print version
netinfo help      # show help
```

---

## Permissions / Access

| Capability        | How it's used                              |
|-------------------|--------------------------------------------|
| **Network**       | `curl ifconfig.me` for public IP, `curl ipinfo.io` for geo, `ping 8.8.8.8` |
| **Filesystem**    | `df -h` for disk, `du -sh` for dir sizes   |
| **System**        | `sysctl`, `uname`, `uptime`                |

No root required. No data is stored or sent anywhere beyond the above read-only calls.

---

## Requirements

- macOS 11+ or Linux
- `bash` 3.2+
- `curl` (ships with macOS)
