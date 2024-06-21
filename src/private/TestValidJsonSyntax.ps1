function Test-ValidJSONInput {
    param (
        $JSONFile
    )
    # TODO Check in depth with json schema
    if (-not(Test-Json -Json $JSONFile -ErrorAction SilentlyContinue)) {
        Write-Error 'Provided backup file is corrupted and not supported' -ErrorAction Stop
    }
}