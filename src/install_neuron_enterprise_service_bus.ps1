# Powershell 2.0

if($env:RS_REBOOT){exit 0}

try
{
    
    $neuron_path = $env:NEURON_INSTALL_FOLDER
    
    if (test-path $neuron_path)
    {
        Write-Output "Neruon already installed. Skipping installation."
        exit 0
    }

    Write-Host "Installing Neuron to $neuron_path"

$parameters = "/i $env:RS_ATTACH_DIR\NeuronESB_v3.0.3.308_x64_Release.msi LICENSEKEY=$env:NEURON_LICENSE_KEY MSINEWINSTANCE=1 TRANSFORMS=:Instance1 INSTALLFOLDER=$env:NEURON_INSTALL_FOLDER /qb /lvx* C:\install.log"
$installStatement = [System.Diagnostics.Process]::Start( "msiexec", $parameters )
write-host "Installation complete"
$installStatement.WaitForExit()

}
catch
{
    ResolveError
    exit 1
}
