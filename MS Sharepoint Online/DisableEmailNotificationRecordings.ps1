#--------------------------------------------------------
# Script: DisableEmailNotificationRecordings.ps1
# Author: Alejandro Mazzitelli
# Email: alejandro@mazzitelli.com.ar
# Web: https://www.m365.com.ar
# Description: Este script permite deshabilitar la notificación por correo electrónico cuando se eliminan grabaciones de reuniones en Microsoft Teams. También se puede habilitar nuevamente si es necesario.
# Version: 1.0
# LastUpDate: 2026-06-10
#--------------------------------------------------------

#Comandos para instalar el módulo de SharePoint Online y conectarse al servicio
#Install-Module Microsoft.Online.SharePoint.PowerShell -Scope CurrentUser
#Connect-SPOService -Url https://TU-TENANT-admin.sharepoint.com

#Comando para deshabilitar la notificación de grabaciones eliminadas en Teams
Set-SPOTenant -DisableTeamsMeetingRecordingDeletedNotification $true

#Comando para habilitar la notificación de grabaciones eliminadas en Teams
#Set-SPOTenant -DisableTeamsMeetingRecordingDeletedNotification $false

#Gracias por utilizar este script. Si tienes alguna pregunta o necesitas asistencia adicional, no dudes en contactarme a través de mi correo electrónico o visitar mi sitio web para más recursos y scripts relacionados con Microsoft 365.