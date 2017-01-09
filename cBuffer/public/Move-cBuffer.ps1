function Move-cBuffer
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [System.Management.Automation.Host.Coordinates]
        $Destination,

        [Parameter(ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [System.Management.Automation.Host.Rectangle]
        $Source = (New-cBufferRectangle),

        [Parameter(ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [System.Management.Automation.Host.Rectangle]
        $Clip = (New-cBufferRectangle),

        [Parameter(ValueFromPipelineByPropertyName)]
        [System.Management.Automation.Host.BufferCell]
        $Fill = (New-cBufferCell)
    )

    Process
    {
        $Host.UI.RawUI.ScrollBufferContents($Source, $Destination, $Clip, $Fill)
    }
}