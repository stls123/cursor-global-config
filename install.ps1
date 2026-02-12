# 将本仓库的规则、命令、技能、MCP 安装到当前用户的 Cursor 全局目录
# 用法：在仓库根目录执行 .\install.ps1

$ErrorActionPreference = "Stop"
$repoRoot = $PSScriptRoot
$cursorHome = Join-Path $env:USERPROFILE ".cursor"

if (-not (Test-Path $cursorHome)) {
    New-Item -ItemType Directory -Path $cursorHome -Force | Out-Null
}

$dirs = @(
    @{ From = "rules"; To = "rules" },
    @{ From = "commands"; To = "commands" },
    @{ From = "skills-cursor"; To = "skills-cursor" }
)
foreach ($d in $dirs) {
    $src = Join-Path $repoRoot $d.From
    $dst = Join-Path $cursorHome $d.To
    if (-not (Test-Path $src)) { continue }
    if (Test-Path $dst) {
        $r = Read-Host "已存在 $($d.To)，覆盖? (Y/N)"
        if ($r -ne "Y" -and $r -ne "y") { continue }
    } else {
        New-Item -ItemType Directory -Path $dst -Force | Out-Null
    }
    Copy-Item -Path "$src\*" -Destination $dst -Recurse -Force
    Write-Host "已安装: $($d.To)"
}

$mcpSrc = Join-Path $repoRoot "mcp.json"
$mcpDst = Join-Path $cursorHome "mcp.json"
if (Test-Path $mcpSrc) {
    if (Test-Path $mcpDst) {
        $r = Read-Host "已存在 mcp.json，覆盖? (Y/N)"
        if ($r -eq "Y" -or $r -eq "y") {
            Copy-Item -Path $mcpSrc -Destination $mcpDst -Force
            Write-Host "已安装: mcp.json"
        }
    } else {
        Copy-Item -Path $mcpSrc -Destination $mcpDst -Force
        Write-Host "已安装: mcp.json"
    }
}

Write-Host "`n安装完成。请重启 Cursor 使配置生效。"
Write-Host "Cursor 全局目录: $cursorHome"
