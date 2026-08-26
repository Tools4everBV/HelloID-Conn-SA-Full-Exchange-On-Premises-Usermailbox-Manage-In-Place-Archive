$enabled = $false
if($datasource.selectedmailbox.ArchiveStatus -eq "Enabled") {
    $enabled = $true
}  
write-information $enabled  
Write-Output @{ enabled = $enabled }    
    
