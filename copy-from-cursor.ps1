# 从当前用户的 Cursor 全局目录拷回本仓库（用于在「公司电脑」更新仓库内容后 push）
# 用法：在仓库根目录执行 .\copy-from-cursor.ps1

$ErrorActionPreference = "Stop"
$repoRoot = $PSScriptRoot
$cursorHome = Join-Path $env:USERPROFILE ".cursor"

if (-not (Test-Path $cursorHome)) {
    Write-Host "未找到 .cursor 目录: $cursorHome"
    exit 1
}

$dirs = @("rules", "commands", "skills-cursor")
foreach ($d in $dirs) {
    $src = Join-Path $cursorHome $d
    $dst = Join-Path $repoRoot $d
    if (-not (Test-Path $src)) { continue }
    if (-not (Test-Path $dst)) { New-Item -ItemType Directory -Path $dst -Force | Out-Null }
    Copy-Item -Path "$src\*" -Destination $dst -Recurse -Force
    Write-Host "已拷回: $d"
}

$mcpSrc = Join-Path $cursorHome "mcp.json"
$mcpDst = Join-Path $repoRoot "mcp.json"
if (Test-Path $mcpSrc) {
    Copy-Item -Path $mcpSrc -Destination $mcpDst -Force
    Write-Host "已拷回: mcp.json"
}

Write-Host "`n拷回完成。可执行 git add . && git commit -m \"...\" && git push 推送到 GitHub。"
