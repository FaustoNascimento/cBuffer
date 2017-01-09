function Get-cBufferCursorPosition
{
    [CmdletBinding()]
    param
    (
    )

    Process
    {
        $Host.UI.RawUI.CursorPosition
    }
}