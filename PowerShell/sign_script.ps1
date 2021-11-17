# This script needs to be manually signed

Param(
    [Parameter(Position=0, Mandatory=$true)]
    [String]
    $script_file
)
Set-AuthenticodeSignature -FilePath $script_file -Certificate $(gci -Path Cert:\CurrentUser\My\ -CodeSigningCert)
