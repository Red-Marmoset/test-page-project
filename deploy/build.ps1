param([switch]$Deploy)

$ErrorActionPreference = 'Stop'
Push-Location (Split-Path -Parent $PSScriptRoot)
try {
    & npm.cmd ci
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

    if ($Deploy) {
        # npm's predeploy hook builds before uploading.
        & npm.cmd run deploy
    } else {
        & npm.cmd run build
    }
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
} finally {
    Pop-Location
}
