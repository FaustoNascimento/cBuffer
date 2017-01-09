function New-cBufferCoordinate
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'WidthAndHeight', Position = 0)]
        [Alias('Width')]
        [int]
        $X,

        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'WidthAndHeight', Position = 1)]
        [Alias('Height')]
        [int]
        $Y,

        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName, ParameterSetName = 'Size', Position = 0)]
        [System.Management.Automation.Host.Size]
        $Size
    )
    
    Process
    {
        if ($Size)
        {
            return New-Object System.Management.Automation.Host.Coordinates $Size.Width, $Size.Height
        }

        New-Object System.Management.Automation.Host.Coordinates $X, $Y
    }
}