function Get-cBuffer
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [System.Management.Automation.Host.Rectangle]
        $Rectangle
    )

    Process
    {
        , $Host.UI.RawUI.GetBufferContents($Rectangle)
    }
}