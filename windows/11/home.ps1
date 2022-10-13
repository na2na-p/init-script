$script_dir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$custom_exec_dir = "C:\exec_bin"
# custom_exec_dirが存在していなければ
if (!(Test-Path $custom_exec_dir)) {
		# custom_exec_dirを作成
		New-Item -ItemType Directory -Path $custom_exec_dir
}

& $script_dir\parts\drivers.ps1
& $script_dir\init.ps1

winget install -e --id OBSProject.OBSStudio
winget install -e --id Valve.Steam
winget install -e --id EpicGames.EpicGamesLauncher
winget install -e --id Nvidia.Broadcast
winget install -e --id PlayStation.DualSenseFWUpdater
winget install -e --id LINE.LINE
winget install -e --id BlenderFoundation.Blender
winget install -e --id UnityTechnologies.UnityHub

& $script_dir\parts\optional.ps1
