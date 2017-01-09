function Test
{
    [CmdletBinding()]
    param
    (
    )

    Process
    {
        $oldBufferSize = Get-cBufferSize
        $oldWindowSize = Get-cBufferWindowSize
        $oldContent = Save-cBuffer

        $windowSize = New-cBufferSize -Width 120 -Height 50
        
        Set-cBufferWindowSize -NewWindowSize $windowSize
        Set-cBufferSize -NewBufferSize $windowSize

        # Paint background
        $bufferCellArray = New-cBufferCellArray -Size $windowSize -BufferCell (New-cBufferCell -BackgroundColor Black)
        Set-cBuffer -BufferCellArray $bufferCellArray -Coordinate (New-cBufferCoordinate -X 0 -Y 0)

        # Draw name field
        Set-cBuffer -BufferCellArray (New-cBufferCellArray -Content "Name:" -BackgroundColor Red) -Coordinate (New-cBufferCoordinate -X 20 -Y 5)

        $message = ''
        while ($true)
        {
            $displayMessage = ($message + '                 ').SubString(0, 17)
            Set-cBuffer -BufferCellArray (New-cBufferCellArray -Content $displayMessage -BackgroundColor Gray -ForegroundColor Yellow) -Coordinate (New-cBufferCoordinate -X 26 -Y 5)
            
            if ($message.Length -lt 17)
            {
                Set-cBufferCursorPosition -CursorPosition (New-cBufferCoordinate -X (26 + $message.Length) -Y 5)
            }
            else
            {
                Set-cBufferCursorPosition -CursorPosition (New-cBufferCoordinate -X (26 + 16) -Y 5)
            }

            $key = $Host.UI.RawUI.ReadKey()

            if ($key.VirtualKeyCode -in @(9, 13))
            {
                break;
            }
            elseif ($key.VirtualKeyCode -eq 8)
            {
                if ($message.Length -gt 0)
                {
                    $message = $message.Remove($message.Length - 1)
                }
            }
            elseif ($key.Character.ToString() -ne [String]::Empty)
            {
                if ($message.Length -lt 17)
                {
                    $message += $key.Character
                }
                else
                {
                    $message = $message.Remove($message.Length -1) + $key.Character
                }
            }
        }

        Set-cBufferSize -NewBufferSize $oldBufferSize
        Set-cBufferWindowSize -NewWindowSize $oldWindowSize
        Restore-cBuffer -SavedBuffer $oldContent

        $message
    }
}