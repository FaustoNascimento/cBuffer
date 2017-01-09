function Set-cBufferWindowSize
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [System.Management.Automation.Host.Size]
        $NewWindowSize
    )

    Process
    {
        if ($NewWindowSize.Height -gt $Host.UI.RawUI.MaxPhysicalWindowSize.Height)
        {
            $NewWindowSize.Height = $Host.UI.RawUI.MaxPhysicalWindowSize.Height
        }

        if ($NewWindowSize.Width -gt $Host.UI.RawUI.MaxPhysicalWindowSize.Width)
        {
            $NewWindowSize.Height = $Host.UI.RawUI.MaxPhysicalWindowSize.Width
        }

        $bufferSize = Get-cBufferSize
        if ($NewWindowSize.Height -gt $bufferSize.Height -or $NewWindowSize.Width -gt $bufferSize.Width)
        {
            Set-cBufferSize $NewWindowSize
        }

        $Host.UI.RawUI.WindowSize = $NewWindowSize
    }
}