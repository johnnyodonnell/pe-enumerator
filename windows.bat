
:: From PWK pdf (p. 536)
:: Check to see if AlwaysInstallElevated is active
reg query HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Installer
reg query HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Installer

:: From WinPEAS https://github.com/carlospolop/PEASS-ng/blob/6e091377950dbc9519bbd621256e3bfe33ec5cb3/winPEAS/winPEASexe/winPEAS/Info/UserInfo/UserInfoHelper.cs
:: Check to see if AutoLogon credentials are available
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultDomainName
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultUserName
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultPassword
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AltDefaultDomainName
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AltDefaultUserName
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AltDefaultPassword

:: Find files that are writeable by low privileged users
icacls "C:\Program Files" /t /c 2> nul | findstr /n ^^ > tmp-search-results && type tmp-search-results | findstr "BUILTIN\\Users:.*(F) BUILTIN\\Users:.*(M) BUILTIN\\Users:.*(W) NT.AUTHORITY\\Authenticated.Users:.*(F) NT.AUTHORITY\\Authenticated.Users:.*(M) NT.AUTHORITY\\Authenticated.Users:.*(W)"
icacls "C:\Program Files (x86)" /t /c 2> nul | findstr "BUILTIN\\Users:.*(F) BUILTIN\\Users:.*(M) BUILTIN\\Users:.*(W) NT.AUTHORITY\\Authenticated.Users:.*(F) NT.AUTHORITY\\Authenticated.Users:.*(M) NT.AUTHORITY\\Authenticated.Users:.*(W)"
icacls "C:\Users" /t /c 2> nul | findstr /n ^^ > tmp-search-results && type tmp-search-results | findstr "BUILTIN\\Users:.*(F) BUILTIN\\Users:.*(M) BUILTIN\\Users:.*(W) NT.AUTHORITY\\Authenticated.Users:.*(F) NT.AUTHORITY\\Authenticated.Users:.*(M) NT.AUTHORITY\\Authenticated.Users:.*(W)"
del tmp-search-results

