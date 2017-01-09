function New-cBufferCell
{
    [CmdletBinding()]
    param
    (
        [Parameter(ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [Char]
        $Character = ' ',

        [Parameter(ValueFromPipelineByPropertyName)]
        [ConsoleColor]
        $ForegroundColor = $Host.UI.RawUI.ForegroundColor,

        [Parameter(ValueFromPipelineByPropertyName)]
        [ConsoleColor]
        $BackgroundColor = $Host.UI.RawUI.BackgroundColor,

        [Parameter(ValueFromPipelineByPropertyName)]
        [System.Management.Automation.Host.BufferCellType]
        $BufferCellType = [System.Management.Automation.Host.BufferCellType]::Complete
    )

    Process
    {
        New-Object System.Management.Automation.Host.BufferCell $Character, $ForegroundColor, $BackgroundColor, $BufferCellType
    }
}