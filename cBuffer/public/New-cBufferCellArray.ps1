function New-cBufferCellArray
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'IntBufferCell')]
        [int]
        $Width,

        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'IntBufferCell')]
        [int]
        $Height,

        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'IntBufferCell')]
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'SizeBufferCell')]
        [System.Management.Automation.Host.BufferCell]
        $BufferCell,

        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'SizeBufferCell')]
        [System.Management.Automation.Host.Size]
        $Size,
        
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'Content')]
        [AllowEmptyString()]
        [String[]]
        $Content,

        [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = 'Content')]
        [ConsoleColor]
        $ForegroundColor = $Host.UI.RawUI.ForegroundColor,

        [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = 'Content')]
        [ConsoleColor]
        $BackgroundColor = $Host.UI.RawUI.BackgroundColor
    )

    Process
    {
        if ($Width)
        {
            return , $Host.UI.RawUI.NewBufferCellArray($Width, $Height, $BufferCell)
        }
        elseif ($Size)
        {
            return , $Host.UI.RawUI.NewBufferCellArray($Size, $BufferCell)
        }
        else 
        {
            return , $Host.UI.RawUI.NewBufferCellArray($Content, $ForegroundColor, $BackgroundColor)
        }
    }
}