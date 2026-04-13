# Caveman Prompt for GitHub Copilot 🪨

This repository exists for one very practical reason: I did not want to install the original [caveman repository](https://github.com/JuliusBrussee/caveman) through NPM when the thing I actually needed for GitHub Copilot was only one Markdown prompt file.

So this repo keeps that part simple: grab [`.github/prompts/caveman.prompt.md`](./.github/prompts/caveman.prompt.md), drop it where your editor expects it, and use it.

Credit goes to [Julius Brussee](https://github.com/JuliusBrussee) and all contributors to the original project. This repo is only a lightweight guide and packaging of the prompt-file workflow. 🙌

## What this repository contains

- [`.github/prompts/caveman.prompt.md`](./.github/prompts/caveman.prompt.md): reusable GitHub Copilot prompt file
- [`.github/copilot-instructions.md`](./.github/copilot-instructions.md): always-on caveman mode for this repository
- [`README.md`](./README.md): setup guide for VS Code, JetBrains, and other IDEs

## Quick answer

- **VS Code**: supports prompt files directly, so you can use `caveman.prompt.md` as intended
- **JetBrains and most other IDEs**: do **not** currently use VS Code-style prompt files directly, so you should copy prompt content into Copilot custom instructions instead

## Always-on mode 🔁

If you want caveman mode on for every chat in this repository, use [`.github/copilot-instructions.md`](./.github/copilot-instructions.md).

This file is repo-wide always-on instructions for GitHub Copilot. When this repository is open, Copilot can apply those instructions automatically to chat requests.

Current setup in this repo:

- [`.github/copilot-instructions.md`](./.github/copilot-instructions.md) tells Copilot to use caveman mode by default
- [`.github/prompts/caveman.prompt.md`](./.github/prompts/caveman.prompt.md) is source of truth for caveman behavior

Use this when you want:

- no need to run `/caveman` every new chat
- caveman mode active by default in this repo
- `normal mode` or `stop caveman` to turn it off for current conversation

⚠️**Important:**

- this is **repository-wide**, not global across all projects
- prompt files are manual tools; `copilot-instructions.md` is better for always-on behavior
- in VS Code, make sure instruction files are enabled in settings

❌ **If always-on mode is not needed:**
- remove the `copilot-instructions.md` from your repository
- use `/caveman` manually on every new chat

## VS Code setup ✅

VS Code has first-class support for prompt files.

### Option 1: Install it as a user prompt for all projects

If you want `caveman` available in every workspace:

1. Open VS Code.
2. Run `Chat: New Prompt File` from Command Palette.
3. Choose **User** location.
4. Name file `caveman.prompt.md`.
5. Copy contents of [`.github/prompts/caveman.prompt.md`](./.github/prompts/caveman.prompt.md) into that file.

After that, `/caveman` is available across your VS Code profile. 🔥


### Option 2: Copy `.github/` directory into your repository

1. Clone this repository:

```bash
git clone --depth 1 git@github.com:Mijutra/caveman-copilot.git
```

2. Copy `.github/` into your repository root:

```bash
cp -r caveman-copilot/.github /path/to/your-repo/
```

3. Reopen or refresh your repository in VS Code.
4. You now have both:

- `.github/prompts/caveman.prompt.md` → for manual `/caveman` usage
- `.github/copilot-instructions.md` → for always-on caveman mode in this repo

5. Run it like this:

```text
/caveman
```

Or with level selection:

```text
/caveman lite
/caveman full
/caveman ultra
```

Because the prompt file already lives in `.github/prompts`, VS Code can discover it as a workspace prompt.


### Notes for VS Code

- Prompt files belong in `.github/prompts` for workspace scope.
- User-level prompt files can also be created from the Chat Customizations editor.
- If you opened only a subfolder of a larger repo, you may need parent customization discovery enabled in VS Code.

## JetBrains setup 🧠

JetBrains IDEs support GitHub Copilot custom instructions, but not VS Code prompt files in `.github/prompts` the same way.

That means [`.github/prompts/caveman.prompt.md`](./.github/prompts/caveman.prompt.md) is still useful, but you will use its content as **instruction text**, not as native slash-command prompt file.

### Recommended approach

1. Open [`.github/prompts/caveman.prompt.md`](./.github/prompts/caveman.prompt.md).
2. Copy the body of the prompt.
3. In your JetBrains IDE, open GitHub Copilot custom instructions or personal instructions.
4. Paste the prompt content there.
5. Save.

Then you can trigger it with messages like:

```text
Use caveman mode.
```

Or:

```text
Talk like caveman. Level: ultra.
```

### Best JetBrains-friendly adaptation

If you want repo-level reuse, create this file in your project:

```text
.github/copilot-instructions.md
```

Then paste adapted contents from [`.github/prompts/caveman.prompt.md`](./.github/prompts/caveman.prompt.md) into it.

That gives GitHub Copilot a repo-wide instruction source that JetBrains understands much better than a VS Code-only prompt file.

## Other IDEs and tools 🌍

Support depends on editor.

### Works directly as prompt file

- **VS Code**: yes

### Usually needs conversion into custom instructions

- **JetBrains IDEs**
- **Visual Studio**
- **Eclipse**
- **Xcode**
- **Copilot CLI**
- **GitHub.com / web Copilot**

For those, safest approach is:

1. Keep [`.github/prompts/caveman.prompt.md`](./.github/prompts/caveman.prompt.md) as source of truth.
2. Copy its behavior into `.github/copilot-instructions.md` when your editor supports repository custom instructions.
3. If repo instructions are not ideal for your workflow, paste same content into personal Copilot instructions instead.

## Suggested cross-IDE structure

If you want one repo that works well everywhere, use both files:

```text
.github/
├── prompts/
│   └── caveman.prompt.md
└── copilot-instructions.md
```

- `prompts/caveman.prompt.md` for VS Code slash-command usage
- `copilot-instructions.md` for JetBrains and broader Copilot instruction support

## How to use prompt once installed 💬

> ℹ️ Use `/caveman` only **once** at the begin of a new chat. No need to use it on every prompt!


**Examples:**

```text
/caveman
```

```text
/caveman ultra
```

```text
Use caveman mode for rest of this chat.
```

```text
Normal mode.
```

Behavior built into prompt:

- default level is `full`
- supports `lite`, `full`, and `ultra`
- keeps technical meaning while cutting filler
- returns to normal when you say `stop caveman` or `normal mode`


## Why this repo exists

Original project is great. But for GitHub Copilot prompt-file usage, installing full package through NPM felt unnecessary when all that was needed was one Markdown file.

This repository is for people who want simplest path:

- no package install
- no runtime setup
- no extra tooling
- one prompt file
- one guide

## Credits ❤️

Full credit for idea, prompt design, and original project goes to [Julius Brussee](https://github.com/JuliusBrussee) and contributors behind [caveman](https://github.com/JuliusBrussee/caveman).

If you want full original project experience, use upstream repository.
If you only want GitHub Copilot prompt-file workflow, this repo keeps that path small and obvious.
