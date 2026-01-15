# Script de Setup Complet pour Developpeur
# Necessite PowerShell en mode Administrateur

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  SETUP ENVIRONNEMENT DE DEVELOPPEMENT" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Verifier les privileges administrateur
$isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Host "ERREUR: Ce script doit etre execute en tant qu'administrateur!" -ForegroundColor Red
    Write-Host "Faites un clic droit sur PowerShell et selectionnez 'Executer en tant qu'administrateur'" -ForegroundColor Yellow
    pause
    exit
}

# Fonction d'installation avec gestion d'erreur
function Install-App {
    param(
        [string]$Name,
        [string]$Id
    )
    Write-Host "Installation de $Name..." -ForegroundColor Yellow
    try {
        winget install --id $Id --accept-package-agreements --accept-source-agreements -e
        Write-Host "OK $Name installe avec succes" -ForegroundColor Green
    }
    catch {
        Write-Host "ERREUR lors de l'installation de $Name" -ForegroundColor Red
    }
    Write-Host ""
}

# 1. LANGAGES DE PROGRAMMATION
Write-Host "`n=== LANGAGES DE PROGRAMMATION ===" -ForegroundColor Cyan

# Python - Toutes les versions depuis 3.11
Install-App "Python 3.11" "Python.Python.3.11"
Install-App "Python 3.12" "Python.Python.3.12"
Install-App "Python 3.13" "Python.Python.3.13"

# Autres langages
Install-App "Node.js LTS" "OpenJS.NodeJS.LTS"
Install-App "Go" "GoLang.Go"
Install-App "Rust" "Rustlang.Rust.MSVC"
Install-App "Java JDK" "Oracle.JDK.21"
Install-App ".NET SDK" "Microsoft.DotNet.SDK.8"
Install-App "Ruby" "RubyInstallerTeam.Ruby.3.2"
Install-App "PHP" "PHP.PHP"

# 2. OUTILS DE DEVELOPPEMENT
Write-Host "`n=== OUTILS DE DEVELOPPEMENT ===" -ForegroundColor Cyan

Install-App "Git" "Git.Git"
Install-App "Visual Studio Code" "Microsoft.VisualStudioCode"
Install-App "Docker Desktop" "Docker.DockerDesktop"
Install-App "Postman" "Postman.Postman"
Install-App "DBeaver (DB Manager)" "dbeaver.dbeaver"
Install-App "Windows Terminal" "Microsoft.WindowsTerminal"

# 3. BASES DE DONNEES
Write-Host "`n=== BASES DE DONNEES ===" -ForegroundColor Cyan

Install-App "PostgreSQL" "PostgreSQL.PostgreSQL"
Install-App "MySQL" "Oracle.MySQL"
Install-App "MongoDB" "MongoDB.Server"
Install-App "Redis" "Redis.Redis"

# 4. UTILITAIRES
Write-Host "`n=== UTILITAIRES ===" -ForegroundColor Cyan

Install-App "7-Zip" "7zip.7zip"
Install-App "Notepad++" "Notepad++.Notepad++"
Install-App "HTTPie (CLI HTTP client)" "HTTPie.HTTPie"

# 5. INSTALLATION DES PACKAGES PYTHON
Write-Host "`n=== INSTALLATION DES PACKAGES PYTHON ===" -ForegroundColor Cyan

# Attendre que Python soit bien installe
Start-Sleep -Seconds 5

# Packages essentiels a installer
$packages = @(
    "numpy", "pandas", "matplotlib", "seaborn", "scikit-learn",
    "tensorflow", "torch", "opencv-python", "pillow",
    "flask", "django", "fastapi", "uvicorn", "requests",
    "beautifulsoup4", "selenium", "scrapy",
    "sqlalchemy", "psycopg2-binary", "pymongo", "redis",
    "pytest", "pytest-cov",
    "black", "flake8", "pylint", "mypy",
    "python-dotenv", "pyyaml", "click", "rich",
    "jupyter", "ipython", "notebook",
    "httpx", "aiohttp", "pydantic",
    "boto3", "sphinx"
)

# Installer pour chaque version de Python
$pythonVersions = @("3.11", "3.12", "3.13")

foreach ($version in $pythonVersions) {
    Write-Host "`nConfiguration de Python $version..." -ForegroundColor Yellow
    
    # Essayer de trouver Python
    $pythonExe = $null
    $possiblePaths = @(
        "C:\Python$($version.Replace('.',''))\python.exe",
        "C:\Program Files\Python$($version.Replace('.',''))\python.exe",
        "$env:LOCALAPPDATA\Programs\Python\Python$($version.Replace('.',''))\python.exe"
    )
    
    foreach ($path in $possiblePaths) {
        if (Test-Path $path) {
            $pythonExe = $path
            break
        }
    }
    
    if ($pythonExe) {
        Write-Host "Python $version trouve: $pythonExe" -ForegroundColor Green
        
        # Mise a jour de pip
        & $pythonExe -m pip install --upgrade pip
        
        # Installation des packages
        Write-Host "Installation des packages pour Python $version..." -ForegroundColor Yellow
        & $pythonExe -m pip install $packages
        
        Write-Host "OK Packages Python $version installes" -ForegroundColor Green
    }
    else {
        Write-Host "Python $version non trouve, passage a la version suivante..." -ForegroundColor Yellow
    }
}

# Essayer aussi avec la commande python par defaut
Write-Host "`nInstallation des packages pour Python par defaut..." -ForegroundColor Yellow
try {
    python -m pip install --upgrade pip
    python -m pip install $packages
    Write-Host "OK Packages installes pour Python par defaut" -ForegroundColor Green
}
catch {
    Write-Host "Installation via 'python' non disponible" -ForegroundColor Yellow
}

# 6. INSTALLATION DES PACKAGES NODE.JS
Write-Host "`n=== INSTALLATION DES PACKAGES NODE.JS ===" -ForegroundColor Cyan

$nodePackages = @(
    "express", "typescript", "ts-node",
    "jest", "eslint", "prettier",
    "nodemon", "dotenv", "axios"
)

Write-Host "Installation des packages Node.js globaux..." -ForegroundColor Yellow
try {
    foreach ($pkg in $nodePackages) {
        npm install -g $pkg
    }
    Write-Host "OK Packages Node.js installes" -ForegroundColor Green
}
catch {
    Write-Host "Erreur lors de l'installation des packages Node.js" -ForegroundColor Red
}

# 7. CONFIGURATION FINALE
Write-Host "`n=== CONFIGURATION FINALE ===" -ForegroundColor Cyan

# Rafraichir les variables d'environnement
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# Afficher les versions installees
Write-Host "`n=== VERSIONS INSTALLEES ===" -ForegroundColor Cyan

Write-Host "`nPython:" -ForegroundColor Yellow
try { python --version } catch { Write-Host "Non disponible" }

Write-Host "`nNode.js:" -ForegroundColor Yellow
try { node --version } catch { Write-Host "Non disponible" }

Write-Host "`nGit:" -ForegroundColor Yellow
try { git --version } catch { Write-Host "Non disponible" }

Write-Host "`nDocker:" -ForegroundColor Yellow
try { docker --version } catch { Write-Host "Non disponible" }

Write-Host "`nGo:" -ForegroundColor Yellow
try { go version } catch { Write-Host "Non disponible" }

Write-Host "`nRust:" -ForegroundColor Yellow
try { rustc --version } catch { Write-Host "Non disponible" }

Write-Host "`n========================================" -ForegroundColor Green
Write-Host "  INSTALLATION TERMINEE !" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host "`nRedemarrez votre terminal pour appliquer tous les changements." -ForegroundColor Yellow
Write-Host "Certains outils peuvent necessiter un redemarrage complet du systeme." -ForegroundColor Yellow

pause