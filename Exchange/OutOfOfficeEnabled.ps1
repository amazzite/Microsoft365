#--------------------------------------------------------
# Script: OutOfOfficeEnabled.ps1
# Author: Alejandro Mazzitelli
# Email: alejandro@mazzitelli.com.ar
# Web: https://www.mazzitelli.com.ar
# Description: Este script obtiene todos los buzones de usuario en Exchange Online y verifica si tienen la respuesta automática (Out of Office) habilitada.
#              Si está habilitada, muestra el estado, los mensajes interno y externo, y las fechas de inicio y fin de la respuesta automática.
# Version: 1.1
# LastUpDate: 2025-07-10
#--------------------------------------------------------

#Conectate al servicio:
Connect-ExchangeOnline

# Obtenemos todos los buzones de usuario
$mailboxes = Get-Mailbox -RecipientTypeDetails UserMailbox -ResultSize Unlimited

# Creamos una lista vacía para los resultados
$resultados = @()

foreach ($mailbox in $mailboxes) {
    $oooSettings = Get-MailboxAutoReplyConfiguration -Identity $mailbox.UserPrincipalName

    if ($oooSettings.AutoReplyState -eq "Enabled") {
        $resultados += [PSCustomObject]@{
            Usuario           = $mailbox.DisplayName
            UPN               = $mailbox.UserPrincipalName
            Estado            = $oooSettings.AutoReplyState
            MensajeInterno    = $oooSettings.InternalMessage
            MensajeExterno    = $oooSettings.ExternalMessage
            Inicio            = $oooSettings.StartTime
            Fin               = $oooSettings.EndTime
        }
    }
}

#Tenemos 2 modos de mostrar los resultados:
# 1. Mostrar en consola o 2. Exportar a un archivo CSV. De momento, solo exportamos a CSV.

# Mostramos los resultados en una tabla
#$resultados | Format-Table -AutoSize

# Exportar a archivo CSV
$archivo = "Usuarios_Fuera_De_Oficina.csv"
$resultados | Export-Csv -Path $archivo -NoTypeInformation -Encoding UTF8

Write-Host "Exportación completada. Archivo generado: $archivo"