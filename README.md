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
- [`.github/copilot-instructions.md`](./.github/copilot-instructions.md)
    - always-on caveman mode
- [`README.md`](./README.md)
    - setup guide

## 🧠 Quick answer

- **VS Code**: supports prompt files directly
- **JetBrains and most other IDEs**: copy prompt text into Copilot custom instructions instead

## ⏩ Fast start

### Option 1: Use caveman globally in VS Code

Use this if you want `/caveman` in every workspace.

1. Open VS Code.
2. `Ctrl + Shift + P`
2. Type `Chat: New Prompt File`.
3. Choose location `User Data`.
4. Name file `caveman.prompt.md`.
5. Paste contents of [`.github/prompts/caveman.prompt.md`](./.github/prompts/caveman.prompt.md).

Now `/caveman` works across your VS Code profile.

### Option 2: Copy `.github/` dir into repo

Use this if you want workspace prompt plus optional always-on mode.

1. Clone this repo:

```bash
git clone git@github.com:Mijutra/caveman-copilot.git
```

2. Copy `.github/` dir into your repo root:

```bash
cp -r caveman-copilot/.github /path/to/your-repo/
```

3. Reopen or refresh workspace.

You now have:

- `.github/prompts/caveman.prompt.md` → for manual `/caveman`
- `.github/copilot-instructions.md` → for default caveman mode in this repo

## ⁉️ How to use

> ℹ️ Use `/caveman` only **once** at the begin of a new chat. No need to use it on every prompt!

Manual prompt:

```text
/caveman
```

Levels:

```text
/caveman lite
/caveman full
/caveman ultra
```

Turn off:

```text
normal mode
```

Prompt behavior:

- default level is `full`
- supports `lite`, `full`, `ultra`
- keeps technical meaning, cuts filler
- stops for current chat when you say `stop caveman` or `normal mode`

## 🔛 Always-on mode

Use [`.github/copilot-instructions.md`](./.github/copilot-instructions.md) if you want caveman mode on by default for this repository.

⚠️ **Important:**
- repo-wide, not global
- better than running `/caveman` every new chat
- in VS Code, instruction files must be enabled in settings

⛔ **If always-on mode not needed:**
- remove `.github/copilot-instructions.md`
- keep using `/caveman` manually

## 💻 IDE notes

### VS Code

- prompt files belong in `.github/prompts` for workspace scope
- user prompts also work through Chat Customizations
- if you open only subfolder, parent customization discovery may matter

### JetBrains

JetBrains supports Copilot custom instructions better than VS Code-style prompt files.

Best path:

1. Open [`.github/prompts/caveman.prompt.md`](./.github/prompts/caveman.prompt.md).
2. Copy prompt body.
3. Paste into GitHub Copilot custom instructions.
4. Save.

If you want repo-level reuse, keep adapted text in [`.github/copilot-instructions.md`](./.github/copilot-instructions.md).

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
2. Mirror behavior into [`.github/copilot-instructions.md`](./.github/copilot-instructions.md) when tool supports repo instructions.
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
