function Get-cBufferWindowSize
{
    [CmdletBinding()]
    param
    (
    )

    Process
    {
        $Host.UI.RawUI.WindowSize
    }
}
