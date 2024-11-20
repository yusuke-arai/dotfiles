if ($Host.Name -eq 'ConsoleHost')
{
  Import-Module PSReadLine
  Set-PSReadLineOption -EditMode Emacs
  Set-PSReadLineKeyHandler -Chord Tab -Function Complete
  Set-PSReadLineKeyHandler -Key Ctrl+i -Function Complete
  Set-PSReadLineKeyHandler -Key Ctrl+j -Function AcceptLine
  Import-Module Posh-Git
}
