<p align="center">
  <img src="https://em-content.zobj.net/source/apple/391/rock_1faa8.png" width="120" />
</p>

<h1 align="center">Caveman Prompt File<br>for GitHub Copilot</h1>

<p align="center">
  <strong>why install when copy do trick</strong>
</p>

<p align="center">
  <a href="https://github.com/Mijutra/caveman-copilot/stargazers"><img src="https://img.shields.io/github/stars/Mijutra/caveman-copilot?style=flat&color=yellow" alt="Stars"></a>
  <a href="https://github.com/Mijutra/caveman-copilot/commits/main"><img src="https://img.shields.io/github/last-commit/Mijutra/caveman-copilot?style=flat" alt="Last Commit"></a>
  <a href="LICENSE"><img src="https://img.shields.io/github/license/Mijutra/caveman-copilot?style=flat" alt="License"></a>
</p>

 I did not want to install the original [caveman repository](https://github.com/JuliusBrussee/caveman) through NPM when I only needed a simple Markdown prompt file.

This repo keeps it simple: grab [`.github/prompts/caveman.prompt.md`](./.github/prompts/caveman.prompt.md), drop it where your editor expects it, and use it.

----

Caveman's original description:
> A [Claude Code](https://docs.anthropic.com/en/docs/claude-code) skill/plugin and Codex plugin that makes agent talk like caveman — cutting **~75% of output tokens** while keeping full technical accuracy. Now with 文言文 mode( wenyan-mode), [...] that cuts **~46% of input tokens** every session.

> Based on the viral observation that caveman-speak dramatically reduces LLM token usage without losing technical substance. [...]

Credit goes to [Julius Brussee](https://github.com/JuliusBrussee) and all contributors to the original project. This repo is only a lightweight guide and packaging of the prompt-file workflow. 🙌

## ⁉️ What is in repo

- [`.github/prompts/caveman.prompt.md`](./.github/prompts/caveman.prompt.md) 
    - slash-command prompt for VS Code
- [`.github/prompts/caveman.instructions.md`](./.github/prompts/caveman.instructions.md)
    - always-on caveman mode
- [`README.md`](./README.md)
    - setup guide

## 🧠 Quick answer

- **VS Code**: supports prompt files directly
- **JetBrains and most other IDEs**: copy prompt text into Copilot custom instructions instead

## 🔧 Make shortcuts

From this repo root:

```bash
make help
make install-global
make install-global-always-on
make install-repo REPO_PATH=/path/to/your-repo
make install-repo-always-on REPO_PATH=/path/to/your-repo
```

These commands copy the checked-in prompt files from [`.github/prompts`](./.github/prompts/) instead of downloading them again.

## ⏩ Fast start

### 1️⃣ Option 1: Use caveman globally in VS Code

#### Automatic
Use this if you want `/caveman` in every workspace. It will download the required files to VS Code's global config directory at ` ~/.config/Code/User/prompts/`.

If you cloned this repo already, shortest path is:

```bash
$ make install-global
```

Always-on mode:

```bash
$ make install-global-always-on
```

#### Manual
Run from anywhere. Adjust the paths, if needed.

1. Download caveman prompt file:
```bash
$ curl -fsSL https://raw.githubusercontent.com/Mijutra/caveman-copilot/refs/heads/main/.github/prompts/caveman.prompt.md -o ~/.config/Code/User/prompts/caveman.prompt.md
```
Now `/caveman` works in every repository.  


2. **Optional:** Download caveman instructions file for always-on mode:
```bash
$ curl -fsSL https://raw.githubusercontent.com/Mijutra/caveman-copilot/refs/heads/main/.github/prompts/caveman.instructions.md -o ~/.config/Code/User/prompts/caveman.instructions.md
```
On every new chat, `caveman` is automatically used in full mode.


### 2️⃣ Option 2: Download `.github/` files into repo

> See option 1 to use caveman globally.

Use this if you want direct copy without cloning repo.  It will download the required files to your local repository's GitHub directory at ` ~/.github/prompts/`.

#### Automatic 
If you are already inside this repo and want to copy files into another repo root, shortest path is:

```bash
$ make install-repo REPO_PATH=/path/to/your-repo
```

Always-on mode:

```bash
$ make install-repo-always-on REPO_PATH=/path/to/your-repo
```

#### Manual
1. Change directory to your repository root.

2. Create prompts directory:
```bash
$ mkdir -p .github/prompts
```

3. Download caveman prompt file:
```bash
$ curl -fsSL https://raw.githubusercontent.com/Mijutra/caveman-copilot/refs/heads/main/.github/prompts/caveman.prompt.md -o .github/prompts/caveman.prompt.md
```
Now `/caveman` works in every repository.  

4. **Optional:** Download Copilot instructions for always-on mode:
```bash
$ curl -fsSL https://raw.githubusercontent.com/Mijutra/caveman-copilot/refs/heads/main/.github/prompts/caveman.instructions.md -o .github/prompts/caveman.instructions.md
```
On every new chat, `caveman` is automatically used in full mode.

### 3️⃣ Option 3: Clone repo

> See option 1 to use caveman globally.

Use this if you want workspace prompt plus optional always-on mode.

#### Automatic
After clone, shortest path is:

```bash
$ make install-repo REPO_PATH=/path/to/your-repo
```

Always-on mode:

```bash
$ make install-repo-always-on REPO_PATH=/path/to/your-repo
```

#### Automatic
1. Clone this repo:

```bash
git clone git@github.com:Mijutra/caveman-copilot.git
```

2. Copy `.github/` dir into your repo root:

```bash
cp -r caveman-copilot/.github /path/to/your-repo/
```
Now `/caveman` works in every repository and on every new chat.


## ⁉️ How to use

> ℹ️ Use `/caveman` only **once** at the begin of a new chat. No need to use it on every prompt!

> Manual prompt is not needed, if you use the [`.github/prompts/caveman.instructions.md`](./.github/prompts/caveman.instructions.md) for always on mode, because it is used automatically on every new chat.

**Manual prompt on every new chat:**
```text
/caveman
```

**Adjust caveman levels of response:**

```text
/caveman lite
/caveman full
/caveman ultra
```

**Turn off caveman:**

```text
normal mode
```

**Prompt behavior:**

- default level is `full`
- supports `lite`, `full`, `ultra`
- keeps technical meaning, cuts filler
- stops for current chat when you say `stop caveman` or `normal mode`

## 🔛 Always-on mode

Use [`.github/prompts/caveman.instructions.md`](./.github/prompts/caveman.instructions.md) for caveman on every new chat.

⚠️ **Important:**
- repo-wide, not global
- better than running `/caveman` every new chat

⛔ **If always-on mode not needed:**
- remove `caveman.instructions.md`
  - **Local:** `.github/prompts/caveman.instructions.md`
  - **User Data:** `~/.config/Code/User/prompts/caveman.instructions.md`
- keep using `/caveman` manually

## 💻 IDE notes

### VS Code

- prompt files belong in `.github/prompts` for workspace scope **or** in `~/.config/Code/User/prompts` for global scope
- user prompts also work through Chat Customizations
- if you open only subfolder, parent customization discovery may matter

### JetBrains

JetBrains supports Copilot custom instructions better than VS Code-style prompt files.

Best path:

1. Open [`.github/prompts/caveman.prompt.md`](./.github/prompts/caveman.prompt.md).
2. Copy prompt body.
3. Paste into GitHub Copilot custom instructions.
4. Save.

If you want repo-level reuse, keep adapted text in [`.github/prompts/caveman.instructions.md`](./.github/prompts/caveman.instructions.md).

### Other tools

Works directly as prompt file:

- **VS Code**

Usually needs custom instructions:

- **JetBrains IDEs**
- **Visual Studio**
- **Eclipse**
- **Xcode**
- **Copilot CLI**
- **GitHub.com / web Copilot**

Safe cross-IDE pattern:

1. Keep [`.github/prompts/caveman.prompt.md`](./.github/prompts/caveman.prompt.md) as source of truth.
2. Mirror behavior into [`.github/prompts/caveman.instructions.md`](./.github/prompts/caveman.instructions.md) when tool supports repo instructions.
3. Use personal Copilot instructions when repo-level instructions do not fit.

## ⚙️ Why repo exists

Upstream project good. For GitHub Copilot prompt-file workflow, many people only need one Markdown file, not full package install.

This repo keeps path small:

- no package install
- no runtime setup
- prompt file ready
- repo instructions optional

## 🎥 Credits

Full credit for idea, prompt design, and original project goes to [Julius Brussee](https://github.com/JuliusBrussee) and contributors behind [caveman](https://github.com/JuliusBrussee/caveman).
