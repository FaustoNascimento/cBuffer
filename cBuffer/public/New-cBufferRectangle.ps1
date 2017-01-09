function New-cBufferRectangle
{
    [CmdletBinding()]
    param
    (
        [Parameter(ValueFromPipelineByPropertyName)]
        [System.Management.Automation.Host.Coordinates]
        $TopLeft = (New-cBufferCoordinate -X 0 -Y 0),

        [Parameter(ValueFromPipelineByPropertyName)]
        [System.Management.Automation.Host.Coordinates]
        $BottomRight = (New-cBufferCoordinate -Size $Host.UI.RawUI.BufferSize)
    )
    
    Process
    {
        New-Object System.Management.Automation.Host.Rectangle $TopLeft, $BottomRight
    }
}