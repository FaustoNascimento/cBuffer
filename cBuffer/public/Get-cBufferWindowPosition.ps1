function Get-cBufferWindowPosition
{
    [CmdletBinding()]
    param
    (
    )

    Process
    {
        $Host.UI.RawUI.WindowPosition
    }
}