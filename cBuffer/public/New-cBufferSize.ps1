function New-cBufferSize
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [int]
        $Width,

        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [int]
        $Height
    )

    Process
    {
        New-Object System.Management.Automation.Host.Size $Width, $Height
    }
}