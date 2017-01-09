function Set-cBuffer
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName, ParameterSetName = 'BufferCellArray')]
        [System.Management.Automation.Host.BufferCell[,]]
        $BufferCellArray,

        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName, ParameterSetName = 'BufferCell')]
        [System.Management.Automation.Host.BufferCell]
        $BufferCell,

        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'BufferCellArray')]
        [System.Management.Automation.Host.Coordinates]
        $Coordinate,

        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'BufferCell')]
        [System.Management.Automation.Host.Coordinates]
        $Rectangle,

        [Parameter(ValueFromPipelineByPropertyName)]
        [Switch]
        $SaveOldContent,

        [Parameter(ValueFromPipelineByPropertyName)]
        [System.Management.Automation.Host.Coordinates]
        $CursorPosition
    )

    Process
    {
        if ($BufferCellArray -ne $null)
        {
            if ($SaveOldContent)
            {
                $right = $BufferCellArray.GetLength(1)
                $bottom = $BufferCellArray.GetLength(0)
                $bottomRight = New-cBufferCoordinate -X $right -Y $bottom
                $rectangle = New-cBufferRectangle -TopLeft $Coordinate -BottomRight $bottomRight
                $oldContent = Save-cBuffer -Rectangle $rectangle
            }
            
            $Host.UI.RawUI.SetBufferContents($Coordinate, $BufferCellArray)
        }
        else
        {
            if ($SaveOldContent)
            {
                $bottomRight = New-cBufferCoordinate -X $Coordinate.X + 1 -Y $Coordinate.Y + 1
                $rectangle = New-cBufferRectangle -TopLeft $Coordinate -BottomRight $bottomRight

                $oldContent = Save-cBuffer -Rectangle $rectangle
            }
            $bufferCell.GetType()
            $Host.UI.RawUI.SetBufferContents($Coordinate, $BufferCell)
        }

        if ($CursorPosition)
        {
            Set-cBufferCursorPosition -CursorPosition $CursorPosition
        }

        if ($SaveOldContent)
        {
            $oldContent
        }
    }
}
