Param(
    [Parameter(Position = 0, Mandatory = $true)]
    [String]
    $url
)
$prefix = '.tmp_'
youtube-dl $url -f best -o "$prefix%(title)s.%(ext)s"
gci -filter ('*{0}*' -f $prefix) | % {
    $pathString = $_.ToString()
    $pathString = $pathString.Substring(0, $pathString.Length - '.mp4'.Length)
    $pathString = $pathString.Substring($prefix.Length)
    ffmpeg -i $_ ('{0}.mp3' -f $pathString)
    Remove-Item -force $_
}