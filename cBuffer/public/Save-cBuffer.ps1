function Save-cBuffer
{
    [CmdletBinding()]
    param
    (
        [Parameter(ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [System.Management.Automation.Host.Rectangle]
        $Rectangle = (New-cBufferRectangle)
    )

    Process
    {
        $savedBuffer = [ordered] @{}
        $savedBuffer.BufferCellArray = Get-cBuffer -Rectangle $Rectangle
        $savedBuffer.Coordinate = New-cBufferCoordinate -X $Rectangle.Left -Y $Rectangle.Top
        $savedBuffer.CursorPosition = Get-cBufferCursorPosition

        $object = [PSCustomObject] $savedBuffer
        $object.PSTypeNames.Insert(0, 'cBuffer.SavedBuffer')
        $object
    }
}