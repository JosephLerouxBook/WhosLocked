##############################################
##                                          ##
##  Nom du script :WhosLocked.ps1           ##
##  Version : 1                             ##
##  Auteur : Joseph Leroux                  ##
##  tmps d'exec : 3-4s                      ##
##                                          ##
##  Utilisation : Display les utilisateurs  ##
##                    bloqué dans l'ad      ##
##                                          ##
##############################################

function Get_locked{
    $user = Get-ADUser -filter * -Properties *| Where-Object {$_.LockedOut -eq $true} | Format-Table -Property Name,SamAccountName,LastLogonDate, LockedOut
    $user
    $ans = Read-Host "Voulez vous relancer ?(y:oui)"
    if($ans -eq "y"){Get_locked}else{Write-Host "Bonne journee!"}
}
Get_locked