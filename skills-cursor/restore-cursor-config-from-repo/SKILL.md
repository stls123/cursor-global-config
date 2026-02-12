---
name: restore-cursor-config-from-repo
description: 从 GitHub 上的 cursor-global-config 仓库恢复 Cursor 全局配置（规则、技能、命令、MCP）。当用户说「从 GitHub 恢复 Cursor 配置」「同步我的 Cursor 规则」「把仓库里的配置装到 Cursor」等时使用。
---

# 从 GitHub 仓库恢复 Cursor 全局配置

当用户希望在新电脑或本机把已推送到 GitHub 的 **cursor-global-config** 仓库中的规则、技能、命令、MCP 安装到 Cursor 时，按本技能操作。

## 前置条件

- 用户已把本仓库克隆到本地（例如 `E:\cursor-global-config` 或家里电脑的某个目录）。
- 若未克隆，先让用户执行：  
  `git clone https://github.com/<用户名>/cursor-global-config.git <目标目录>`

## 安装步骤（Windows）

1. **一键安装（推荐）**  
   在仓库根目录打开 PowerShell，执行：  
   ```powershell
   .\install.ps1
   ```  
   按提示确认覆盖即可。脚本会把 `rules/`、`commands/`、`skills-cursor/`、`mcp.json` 复制到 `%USERPROFILE%\.cursor\`。

2. **手动复制**  
   若脚本无法运行，则手动复制：
   - 仓库 `rules/*` → `C:\Users\<当前用户名>\.cursor\rules\`
   - 仓库 `commands/*` → `C:\Users\<当前用户名>\.cursor\commands\`
   - 仓库 `skills-cursor/*` → `C:\Users\<当前用户名>\.cursor\skills-cursor\`
   - 仓库 `mcp.json` → `C:\Users\<当前用户名>\.cursor\mcp.json`

3. **重启 Cursor**  
   复制完成后提醒用户重启 Cursor，配置即可生效。

## 长期记忆说明

「长期记忆」文件（`user-requests-log.md`）不在本仓库中，通常放在 E 盘等固定路径。若用户在新电脑上也需要同一份记忆，可：
- 用网盘或另一仓库单独同步该文件，或
- 在新电脑上创建相同路径并复制一份记录过去。

## 更新仓库内容（从本机 Cursor 拷回）

若用户在本机修改了 Cursor 全局配置，希望同步回 GitHub：
1. 在仓库根目录执行：`.\copy-from-cursor.ps1`
2. 再执行：`git add .`、`git commit -m "更新配置"`、`git push`

提醒用户不要将 GitHub 密码或 Token 写在聊天或代码里，使用 `gh auth login`、SSH 或 PAT 在本地完成认证。
