do
{
$Create = Read-Host '

Create a new Active Directory Organizational Unit (OU) Enter 1
Create Active Directory group                          Enter 2
Create a new Active Directory user account             Enter 3
Add User to Active Directory group                     Enter 4
Add a Computer to Active Directory                     Enter 5
Move a group to another OU within the same domain      Enter 6
Move a user to another OU  within the same domain      Enter 7
Move a computer to another OU within the same domain   Enter 8
Exit                                                   Enter 9

Enter number here'

if ($Create -eq 1){
ForEach-Object ($NewOU = Read-Host 'Enter name of new OU ')
New-ADOrganizationalUnit $NewOU | Read-Host "$NewOU has been created. Press Enter to continue"}

if ($Create -eq 2){
ForEach-Object ($NewADGroup = Read-Host 'Enter the name of new Group ')
New-ADGroup $NewADGroup -GroupScope Global | Read-Host "$NewADGroup has been created. Press Enter to continue"}


if ($Create -eq 3){
ForEach-Object ($NewADUserFname = Read-Host 'Enter first name of new User ') ; ForEach-Object ($NewADUserLname = Read-Host 'Enter last name of new User ')
New-ADUser -Name $NewADUserFname -DisplayName "$NewADUserFname $NewADUserLname" | Read-Host "$NewADUserFname $NewADUserLname has been created. Press Enter to continue"}

if ($Create -eq 4){
ForEach-Object ($ADGroup = Read-Host 'Enter the name of the Active Directory Group you would like to add the member to ') ; ForEach-Object ($AddADUsertoAGroup = Read-Host "Enter User name to be added to $ADGroup ")
Add-ADGroupMember $ADGroup -Members $AddADUsertoAGroup | Read-Host "$AddADUsertoAGroup has been added to $ADGroup. Press Enter to continue"}

if ($Create -eq 5){
ForEach-Object ($NewComp = Read-Host 'Enter name of new computer ')
New-ADComputer $NewComp | Read-Host "$NewComp has been created. Press Enter to continue"}

if ($Create -eq 6){
ForEach-Object ($MoveADGroup = Read-Host 'Enter the name of the Active Directory Group you would like to move ') ; ForEach-Object ($OULocation = Read-Host "Enter the new OU location for $MoveADGroup ")
Move-ADObject -Identity "CN=$MoveADGroup,CN=Users,DC=Adatum,DC=com" -TargetPath "OU=$OULocation,DC=Adatum,DC=com" | Read-Host "$MoveADGroup has been moved to $OULocation. Press Enter to continue"}

if ($Create -eq 7){
ForEach-Object ($MoveADUser = Read-Host 'Enter the name of the Active Directory User you would like to move ') ; ForEach-Object ($OUUserLocation = Read-Host "Enter the new OU location for $MoveADUser ")
Move-ADObject -Identity "CN=$MoveADUser,CN=Users,DC=Adatum,DC=com" -TargetPath "OU=$OUUserLocation,DC=Adatum,DC=com" | Read-Host "$MoveADUser has been moved to $OUUserLocation. Press Enter to continue"}

if ($Create -eq 8){
ForEach-Object ($MoveADComp = Read-Host 'Enter the name of the Active Directory computer you would like to move ') ; ForEach-Object ($OUCompLocation = Read-Host "Enter the new OU location for $MoveADComp ")
Move-ADObject -Identity "CN=$MoveADComp,CN=Computers,DC=Adatum,DC=com" -TargetPath "OU=$OUCompLocation,DC=Adatum,DC=com" | Read-Host "$MoveADComp has been moved to $OUCompLocation. Press Enter to continue"}

}
until ($Create -eq '9')

