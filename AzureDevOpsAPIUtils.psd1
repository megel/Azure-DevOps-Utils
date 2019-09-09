#
# Modulmanifest f�r das Modul "PSGet_AzureDevOpsAPIUtils"
#
# Generiert von: Michael Megel
#
# Generiert am: 09.09.2019
#

@{

# Die diesem Manifest zugeordnete Skript- oder Bin�rmoduldatei.
RootModule = 'AzureDevOpsAPIUtils.psm1'

# Die Versionsnummer dieses Moduls
ModuleVersion = '0.2.4'

# Unterst�tzte PSEditions
# CompatiblePSEditions = @()

# ID zur eindeutigen Kennzeichnung dieses Moduls
GUID = '66a31504-768a-468a-a4cc-c8c35bc98b0b'

# Autor dieses Moduls
Author = 'Michael Megel'

# Unternehmen oder Hersteller dieses Moduls
CompanyName = 'Michael Megel'

# Urheberrechtserkl�rung f�r dieses Modul
Copyright = '© 2019 Michael Megel. All rights reserved.'

# Beschreibung der von diesem Modul bereitgestellten Funktionen
Description = 'Azure DevOps API Utils Library'

# Die f�r dieses Modul mindestens erforderliche Version des Windows PowerShell-Moduls
# PowerShellVersion = ''

# Der Name des f�r dieses Modul erforderlichen Windows PowerShell-Hosts
# PowerShellHostName = ''

# Die f�r dieses Modul mindestens erforderliche Version des Windows PowerShell-Hosts
# PowerShellHostVersion = ''

# Die f�r dieses Modul mindestens erforderliche Microsoft .NET Framework-Version. Diese erforderliche Komponente ist nur f�r die PowerShell Desktop-Edition g�ltig.
# DotNetFrameworkVersion = ''

# Die f�r dieses Modul mindestens erforderliche Version der CLR (Common Language Runtime). Diese erforderliche Komponente ist nur f�r die PowerShell Desktop-Edition g�ltig.
# CLRVersion = ''

# Die f�r dieses Modul erforderliche Prozessorarchitektur ("Keine", "X86", "Amd64").
# ProcessorArchitecture = ''

# Die Module, die vor dem Importieren dieses Moduls in die globale Umgebung geladen werden m�ssen
# RequiredModules = @()

# Die Assemblys, die vor dem Importieren dieses Moduls geladen werden m�ssen
# RequiredAssemblies = @()

# Die Skriptdateien (PS1-Dateien), die vor dem Importieren dieses Moduls in der Umgebung des Aufrufers ausgef�hrt werden.
# ScriptsToProcess = @()

# Die Typdateien (.ps1xml), die beim Importieren dieses Moduls geladen werden sollen
# TypesToProcess = @()

# Die Formatdateien (.ps1xml), die beim Importieren dieses Moduls geladen werden sollen
# FormatsToProcess = @()

# Die Module, die als geschachtelte Module des in "RootModule/ModuleToProcess" angegebenen Moduls importiert werden sollen.
# NestedModules = @()

# Aus diesem Modul zu exportierende Funktionen. Um optimale Leistung zu erzielen, verwenden Sie keine Platzhalter und l�schen den Eintrag nicht. Verwenden Sie ein leeres Array, wenn keine zu exportierenden Funktionen vorhanden sind.
FunctionsToExport = 'Add-AzureDevOpsAgentPool', 'Add-AzureDevOpsDeploymentGroup', 
               'Add-AzureDevOpsVariableGroup', 
               'Get-AzureDevOpsAgentInstallParameters', 
               'Get-AzureDevOpsAgentPools', 'Get-AzureDevOpsAgents', 
               'Get-AzureDevOpsAgentUnInstallParameters', 
               'Get-AzureDevOpsDeploymentGroups', 'Get-AzureDevOpsVariableGroups', 
               'Remove-AzureDevOpsAgent', 'Update-AzureDevOpsVariableGroup'

# Aus diesem Modul zu exportierende Cmdlets. Um optimale Leistung zu erzielen, verwenden Sie keine Platzhalter und l�schen den Eintrag nicht. Verwenden Sie ein leeres Array, wenn keine zu exportierenden Cmdlets vorhanden sind.
CmdletsToExport = @()

# Die aus diesem Modul zu exportierenden Variablen
# VariablesToExport = @()

# Aus diesem Modul zu exportierende Aliase. Um optimale Leistung zu erzielen, verwenden Sie keine Platzhalter und l�schen den Eintrag nicht. Verwenden Sie ein leeres Array, wenn keine zu exportierenden Aliase vorhanden sind.
AliasesToExport = 'Get-AgentInstallParams', 'Get-AgentUnInstallParams'

# Aus diesem Modul zu exportierende DSC-Ressourcen
# DscResourcesToExport = @()

# Liste aller Module in diesem Modulpaket
# ModuleList = @()

# Liste aller Dateien in diesem Modulpaket
# FileList = @()

# Die privaten Daten, die an das in "RootModule/ModuleToProcess" angegebene Modul �bergeben werden sollen. Diese k�nnen auch eine PSData-Hashtabelle mit zus�tzlichen von PowerShell verwendeten Modulmetadaten enthalten.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        # Tags = @()

        # A URL to the license for this module.
        LicenseUri = 'https://github.com/megel/Azure-DevOps-Utils/blob/master/LICENSE'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/megel/Azure-DevOps-Utils'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        ReleaseNotes = '0.2.4
Minor improvements to Get-AzureDevOpsAgentInstallParameters (unattended installation, replace agent)

0.2.3
New parameter added ''deploymentGroupTags'' to Get-AzureDevOpsAgentInstallParameters

0.2.2
Package URLs (project and license) added

0.2.1
Exported Functions & Aliases fixed

0.2.0
Functions for Azure DevOps Variable Groups added
Function Alias added

0.1.2
Wrong Export Name for function fixed

0.1.1
Module Fixed

0.1.0
Initial releases 
use help on the individual functions to get info.'

        # External dependent modules of this module
        # ExternalModuleDependencies = ''

    } # End of PSData hashtable
    
 } # End of PrivateData hashtable

# HelpInfo-URI dieses Moduls
# HelpInfoURI = ''

# Standardpr�fix f�r Befehle, die aus diesem Modul exportiert werden. Das Standardpr�fix kann mit "Import-Module -Prefix" �berschrieben werden.
# DefaultCommandPrefix = ''

}

