function Get-cBufferSize
{
    [CmdletBinding()]
    param
    (
    )

    Process
    {
        $Host.UI.RawUI.BufferSize
    }
}