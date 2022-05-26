<# 
    Project:Rock Paper Scissors

    Date : 2021/05/06

   
#>
#
#met les variables a zero
#
[int]$Hello = ""
[int]$StrName = ""
[int]$Score = 0
[int]$computerScore = 0
[int]$CompuperMove = ""
#
#efface les ancienne commande pour voir les erreur restante.
#
cls
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
#
#region GUI
#
[Windows.Forms.Application]::EnableVisualStyles()
#
#FrmGames
#
$FrmGames = New-Object System.Windows.Forms.Form
$FrmGames.BackColor          = "Gray"
$FrmGames.Text               = "Roche Papier ciseau"
$FrmGames.KeyPreview         = $true
$FrmGames.ClientSize         = New-Object System.Drawing.Size(454, 520)
$FrmGames.StartPosition      = "CenterScreen"
#
#lblPlayerName
#
$lblPlayerName = New-Object System.Windows.Forms.Label
$lblPlayerName.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 15, [System.Drawing.FontStyle]::Bold)
$lblPlayerName.Text = "PLAYER1"
$lblPlayerName.Size = New-Object System.Drawing.Size(228, 39)
$lblPlayerName.Location = New-Object System.Drawing.Point(196, 455)
$lblPlayerName.Visible = $false
$FrmGames.Controls.Add($lblPlayerName)
#
#BtnRock
#
$BtnRock                     = New-Object System.Windows.Forms.Button
$BtnRock.Text                = "Rock"
$BtnRock.Size                = New-Object System.Drawing.Size(113, 93)
$BtnRock.Location            = New-Object System.Drawing.Point(170, 344)
$FrmGames.Controls.Add($BtnRock)
#
#BtnPaper
#
$BtnPaper                    = New-Object System.Windows.Forms.Button
$BtnPaper.Text               = "Paper"
$BtnPaper.Size               = New-Object System.Drawing.Size(113, 93)
$BtnPaper.Location           = New-Object System.Drawing.Point(34, 345)
$FrmGames.Controls.Add($BtnPaper)
#
#Btnscissors
#
$Btnscissors = New-Object System.Windows.Forms.Button
$Btnscissors.Text = "Scissors"
$Btnscissors.Size = New-Object System.Drawing.Size(113, 93)
$Btnscissors.Location = New-Object System.Drawing.Point(301, 345)
$FrmGames.Controls.Add($Btnscissors)
#
#LblScore
#
$LblScore = New-Object System.Windows.Forms.Label
$LblScore.Text = " Your Score :"
$LblScore.Size = New-Object System.Drawing.Size(70, 23)
$LblScore.Location = New-Object System.Drawing.Point(7, 453)
$FrmGames.Controls.Add($LblScore)
#
#TxtScore
#
$TxtScore = New-Object System.Windows.Forms.TextBox
$TxtScore.Size = New-Object System.Drawing.Size(43, 20)
$TxtScore.Location = New-Object System.Drawing.Point(80, 454)
$FrmGames.Controls.Add($TxtScore)
#
$TxtComputerScore = New-Object System.Windows.Forms.TextBox
$TxtComputerScore.Size = New-Object System.Drawing.Size(43, 20)
$TxtComputerScore.Location = New-Object System.Drawing.Point(80, 479)
$FrmGames.Controls.Add($TxtComputerScore)
#
#LblScore2
#
$LblScore2 = New-Object System.Windows.Forms.Label
$LblScore2.Text = "Computer :"
$LblScore2.Size = New-Object System.Drawing.Size(100, 23)
$LblScore2.Location = New-Object System.Drawing.Point(14, 480)
$FrmGames.Controls.Add($LblScore2)
#TxtDate
#
$TxtDate                     = New-Object System.Windows.Forms.TextBox
$TxtDate.Size                = New-Object System.Drawing.Size(64, 20)
$TxtDate.Location            = New-Object System.Drawing.Point(335, 13)
$FrmGames.Controls.Add($TxtDate)
#
#LblDate
#
$LblDate                     = New-Object System.Windows.Forms.Label
$LblDate.Text                = "Dates :"
$LblDate.Size                = New-Object System.Drawing.Size(100, 23)
$LblDate.Location            = New-Object System.Drawing.Point(291, 15)
$FrmGames.Controls.Add($LblDate)
#
#PictureBox0
#
$Pb0                         = New-Object System.Windows.Forms.PictureBox
$Pb0.Size                    = New-Object System.Drawing.Size(127, 78)
$Pb0.SizeMode                = [System.Windows.Forms.PictureBoxSizeMode]::zoom
$Pb0.BackColor               = "Lime"
$Pb0.Location                = New-Object System.Drawing.Point(163, 225)
$FrmGames.Controls.Add($Pb0)
#
#Text de lordinateur
#
$TxtComputer                 = New-Object System.Windows.Forms.TextBox
$Txtcomputer.Size            = New-Object System.Drawing.Size(127, 78)
$TxtComputer.Font            = New-Object System.Drawing.Font("Microsoft Sans Serif", 15, [System.Drawing.FontStyle]::Bold)
$TxtComputer.Location        = New-Object System.Drawing.Point(163, 80)
$TxtComputer.BackColor       = "red"
$TxtComputer.Multiline       = $true
$FrmGames.Controls.Add($TxtComputer)
#
#PictureBox2
#
$PictureBox2                 = New-Object System.Windows.Forms.PictureBox
$PictureBox2.BackColor       = "Silver"
$PictureBox2.Size            = New-Object System.Drawing.Size(415, 289)
$PictureBox2.Location        = New-Object System.Drawing.Point(17, 45)
$FrmGames.Controls.Add($PictureBox2)


#ou on choisi le nom du joueur
$FrmGames.Add_Shown({
    # Lire le nom
    $StrName= [Microsoft.VisualBasic.Interaction]::InputBox("Chose your name Player", "Name")

#Player Name
$lblPlayerName.Text = $StrName
$lblPlayerName.Visible = $true
})
#
#Fonction qui met 3 variables totalement au hasard a la disposition de l'ordinateurs.
#
Function Get-Random1 {

     $global:computermove = Get-Random  "Rock","Paper","Scissors"
     return $computermove
   }

#
#region Events
#
#affiche la date
#
$TxtDate.Text = Get-Date
#
#Les Boutton qui permet de choisir entre roche papier ciseaux    
#
$BtnPaper.add_click({ 
    $Pb0.ImageLocation = "D:\Projet Roche papier ciseaux\paper projet.png"
    #
    #affiche une des variable de la fonction
    $TxtComputer.Text = Get-Random1
    #
    #déside les points selon la variable de l'ordinateur
    if ($Choix = "2" -and $computerMove -eq "Scissors")         {
        [System.Windows.MessageBox]::Show("You Lose !","Games Master ","ok","None")
        $global:computerScore = $computerScore + 1
        $TxtComputerScore.Text = $computerScore
        }
    if ($Choix = "2" -and $computerMove -eq "Rock"){
        [System.Windows.MessageBox]::Show("You Win !","Games Master ","ok","None")
        $global:Score = $Score + 1
        $TxtScore.Text = $Score
        }
    if ($Choix = "2" -and $computerMove -eq "Paper"){
        [System.Windows.MessageBox]::Show("Tied !","Games Master ","ok","None")
        }
})

$BtnRock.add_click({ 
    $Pb0.ImageLocation = "D:\Projet Roche papier ciseaux\Rock projet.png"
    #
    #affiche une des variable de la fonction  
    $TxtComputer.Text = Get-Random1
    #
    #déside les points selon la variable de l'ordinateur
    if ($Choix = "1" -and $computerMove -eq "Paper")         {
        [System.Windows.MessageBox]::Show("You Lose !","Games Master ","ok","None")
        $global:computerScore = $computerScore + 1
        $TxtComputerScore.Text = $computerScore
        }
    if ($Choix = "1" -and $computerMove -eq "Scissors"){
        [System.Windows.MessageBox]::Show("You Win !","Games Master ","ok","None")
        $global:Score = $Score + 1
        $TxtScore.Text = $Score
        }
    if ($Choix = "1" -and $computerMove -eq "Rock"){
        [System.Windows.MessageBox]::Show("Tied !","Games Master ","ok","None")
        }
})

$Btnscissors.add_click({ 
    $Pb0.ImageLocation = "D:\Projet Roche papier ciseaux.png"
    #
    #affiche une des variable de la fonction  
    $TxtComputer.Text = Get-Random1
    #
    #déside les points selon la variable de l'ordinateur
    if ($Choix = "3" -and $computerMove -eq "Rock")         {
        [System.Windows.MessageBox]::Show("You Lose !","Games Master ","ok","None")
        $global:computerScore = $computerScore + 1
        $TxtComputerScore.Text = $computerScore
        }
    if ($Choix = "3" -and $computerMove -eq "Paper"){
        $global:Score = $Score + 1
        $TxtScore.Text = $Score
        [System.Windows.MessageBox]::Show("You Win !","Games Master ","ok","None")
        }
    if ($Choix = "3" -and $computerMove -eq "Scissors"){
        [System.Windows.MessageBox]::Show("Tied !","Games Master ","ok","None")
        }
})


#endregion Events

#ferme le programme si la touche escape est utiliser.
$FrmGames.Add_KeyDown( { if ($_.KeyCode -eq "Escape") { 
                                $FrmGames.Close() 
                               }   
                            } )

#endregion special events

#endregion GUI

[void]$FrmGames.ShowDialog()
