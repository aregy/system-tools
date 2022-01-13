Param(
    [Parameter(Position = 0, Mandatory = $true)]
    [String[]]
    $urls
)
ForEach ($url in $urls) {
     Start-ThreadJob `
        -ScriptBlock {
        $url = $args[0]
        cd ~/Desktop/dl_2022 #$PSScriptRoot
        $pfx = $(New-Guid).Guid;
        youtube-dl.exe -f 140 "$url" -o "$pfx%(title)s.%(ext)s";
        gci -Filter "$pfx*" `
        | % {
            ffmpeg.exe -i $_ "$($_.BaseName.Substring(36)).mp3"
            echo "Done!"
            Remove-Item $_
            }
        } `
        -ArgumentList $url
}

# SIG # Begin signature block
# MIIFlAYJKoZIhvcNAQcCoIIFhTCCBYECAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUKrv7S3AKi7EiiOxkw+F/vbd+
# sLmgggMiMIIDHjCCAgagAwIBAgIQbznjnlFijbdA1TZ6/7A0fTANBgkqhkiG9w0B
# AQsFADAnMSUwIwYDVQQDDBxQb3dlclNoZWxsIENvZGUgU2lnbmluZyBDZXJ0MB4X
# DTIxMTAyMzIwMDIwOVoXDTIyMTAyMzIwMjIwOVowJzElMCMGA1UEAwwcUG93ZXJT
# aGVsbCBDb2RlIFNpZ25pbmcgQ2VydDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCC
# AQoCggEBAN4cZSqrTc82+et8Na3A/GKz119+h7R5bE42GysA4brs3UdMMklE3wcy
# B6HVdUK+5swrWfSOLiJCZMdrfTsOARSzsNM5PyKj7qpbaHw1V97GhgLsENqq1BTa
# i2FFIjvxfzQlTiKpno9ixUE9VMEexIjySAZcIvl42XoUaQ0UVIbgcpOUbZHSQUT6
# yVq4gYdSYuQad+/KIDhe3lXVrROk+AABxZc5YV3uO1bOmLzO5DePOvdj58Ss2qDW
# 3LiJuxE1qfLDwNQVGIK2JoIbYN0Rd4QNz2vXkyfvN59r9HmtnpCL4VjNf/PZYdEW
# m1nA8D5UtNOman5AOoTXrPHMG6L9BB0CAwEAAaNGMEQwDgYDVR0PAQH/BAQDAgeA
# MBMGA1UdJQQMMAoGCCsGAQUFBwMDMB0GA1UdDgQWBBTRiQSsV94W1hDqimMeKibW
# LXJPmDANBgkqhkiG9w0BAQsFAAOCAQEAz5P2pXdxDjlg7jj4h5azKsMpF3yQRhB9
# arSoPp100veFu2AlM95AXGpS71HGJDi1JHOPM8WskQf8QTrOOTiJYhafITtq1Adg
# HY8uAUNhU9dUvGIRHE2tFzpzBPQBZ8JGelov2wPC6kgV6pwwPoEKeH3jLDZfCQJ+
# dO66nGFBGrNB176HdGG3v3CJUh1k6ewv0Bg3JUNf00MRN1MJ8o7hD6hLyd20wLYu
# nm6L3UcxvcB4NHmzyCqB1C3iS5WAkNaNVYFDuUIthLuLueTHQNheAaijofETuaut
# GHPKL9PbyIu7zWTAhhgMwm+M6vcPCtiLPWNCAtwFOaflfJCvGKt6pjGCAdwwggHY
# AgEBMDswJzElMCMGA1UEAwwcUG93ZXJTaGVsbCBDb2RlIFNpZ25pbmcgQ2VydAIQ
# bznjnlFijbdA1TZ6/7A0fTAJBgUrDgMCGgUAoHgwGAYKKwYBBAGCNwIBDDEKMAig
# AoAAoQKAADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgorBgEEAYI3AgEL
# MQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQUCaB34mNtnIINxWAFgMf7
# mtZ2S1wwDQYJKoZIhvcNAQEBBQAEggEAQY3HJhUeadugWI7bJp+W44IDB/EPLpE4
# Sj6oUSgNVbLAufvqYyuPr/pfW3FOV8N1NIDjdKrWBwktfUlmSssgbYQU2rslOp3k
# P5ZHkUGBWDtHsAWGEZ2J+mrXkkOzBzocNuiDrMgkYd71psDUEX5dYm3QFZ0nq6Sc
# /nSWO2tgF29lHlGAoRT6ecpJJN1C8DFXsdjgXyHUv7iKDWSfEudMyaavbsZt/J1+
# 6UyTeVQsrlUtXu64qpTgD3ZO3nyvGJ2E1PBiGIHWrKWzpGPxOkjwRBeHVMoc+sEa
# oBS4BCii3fgHoZKwmwacjmG9Df6CcZBpu1RWJ34qa+GsWcElkzFVjw==
# SIG # End signature block
