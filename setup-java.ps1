# setup-java.ps1
# Run with: Right click > Run with PowerShell (as Administrator)

Write-Host "=== Java JDK 21 Installer for Windows ==="

# 1. Check Chocolatey
if (!(Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "Installing Chocolatey..."
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
} else {
    Write-Host "Chocolatey already installed."
}

# 2. Install JDK 21
if (!(choco list --local-only | Select-String "openjdk")) {
    Write-Host "Installing OpenJDK 21..."
    choco install openjdk --version=21 -y
} else {
    Write-Host "OpenJDK already installed."
}

# 3. Set JAVA_HOME and Path
$JavaPath = "C:\Program Files\OpenJDK\jdk-21"
[Environment]::SetEnvironmentVariable("JAVA_HOME", $JavaPath, [System.EnvironmentVariableTarget]::Machine)
$env:Path += ";$JavaPath\bin"
[Environment]::SetEnvironmentVariable("Path", $env:Path, [System.EnvironmentVariableTarget]::Machine)

Write-Host "JAVA_HOME set to $JavaPath"

# 4. Test
java -version
javac -version

Write-Host "=== Installation Completed! ==="
