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
