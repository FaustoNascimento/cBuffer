function Restore-cBuffer
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [PSTypeName('cBuffer.SavedBuffer')]
        $SavedBuffer,

        [Parameter(ValueFromPipelineByPropertyName)]
        [switch]
        $DoNotRestoreCursor
    )

    Process
    {
        $SavedBuffer | Set-cBuffer
    }
}