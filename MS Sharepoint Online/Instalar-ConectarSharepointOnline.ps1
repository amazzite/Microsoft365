#--------------------------------------------------------
# Script: Instalar-ConectarSharepointOnline.ps1
# Author: Alejandro Mazzitelli
# Email: alejandro@mazzitelli.com.ar
# Web: https://www.m365.com.ar
# Description: Este script permite instalar y conectar al servicio de SharePoint Online.
# Version: 1.0
# LastUpDate: 2026-04-08
#--------------------------------------------------------


Install-Module Microsoft.Online.SharePoint.PowerShell -Scope CurrentUser
Connect-SPOService -Url https://TU-TENANT-admin.sharepoint.com


#Gracias por utilizar este script. Si tienes alguna pregunta o necesitas asistencia adicional, no dudes en contactarme a través de mi correo electrónico o visitar mi sitio web para más recursos y scripts relacionados con Microsoft 365.