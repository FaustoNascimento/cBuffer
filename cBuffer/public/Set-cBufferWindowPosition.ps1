function Set-cBufferWindowPosition
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [System.Management.Automation.Host.Coordinates]
        $NewWindowPosition
    )

    Process
    {
        $bufferSize = Get-cBufferSize

        if ($NewWindowPosition.X -lt 0 -or $NewWindowPosition.Y -lt 0 -or $NewWindowPosition.X -gt $bufferSize.Width -or $NewWindowPosition.Y -gt $bufferSize.Height)
        {
            $PSCmdlet.ThrowTerminatingError((New-ErrorRecord 'The new windows position cannot be lower than 0 nor bigger than go past the bounds of the buffer size. Use Get-cBufferSize to retrieve the current buffer size.'))
        }

        $Host.UI.RawUI.WindowPosition = $NewWindowPosition
    }
}