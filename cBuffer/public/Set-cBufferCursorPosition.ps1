function Set-cBufferCursorPosition
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [System.Management.Automation.Host.Coordinates]
        $CursorPosition
    )

    Process
    {
        $bufferSize = Get-cBufferSize

        if ($CursorPosition.X -lt 0 -or $CursorPosition.X -gt $bufferSize.Width -or $CursorPosition.Y -lt 0 -or $CursorPosition.Y -gt $bufferSize.Height)
        {
            $PSCmdlet.ThrowTerminatingError((New-ErrorRecord 'Cursor position cannot be lower than 0 or outside the outside the bounds of the buffer size. Use Get-cBufferSize to get the current buffer size.'))
        }

        $Host.UI.RawUI.CursorPosition = $CursorPosition
    }
}