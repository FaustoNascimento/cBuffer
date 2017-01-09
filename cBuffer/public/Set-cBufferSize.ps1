function Set-cBufferSize
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [System.Management.Automation.Host.Size]
        $NewBufferSize
    )

    Process
    {
        if ($NewBufferSize.Height -gt 32766)
        {
            $NewBufferSize.Height = 32766
        }

        if ($NewBufferSize.Width -gt 32766)
        {
            $NewBufferSize.Height = 32766
        }
        
        $windowSize = Get-cBufferWindowSize

        if ($NewBufferSize.Height -lt $windowSize.Height -or $NewBufferSize.Width -lt $windowSize.Width)
        {
            $PSCmdlet.ThrowTerminatingError((New-ErrorRecord 'The new buffer size cannot be smaller than the window size. Use Get-cBufferWindowSize to see what the current window size is.'))
        }
        
        $Host.UI.RawUI.BufferSize = $NewBufferSize
    }
}