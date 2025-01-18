The solution is to always check if the GetObject function returned Nothing. If it did, handle the error appropriately, either by displaying an error message to the user, logging an error, or taking some other corrective action.

```vbscript
Dim objFSO
Set objFSO = GetObject("Scripting.FileSystemObject")

if objFSO Is Nothing Then
  ' Handle the error appropriately
  MsgBox "Error: Could not create FileSystemObject. Check if it is installed.", vbExclamation
  WScript.Quit 1 'Exit with an error code
else
  ' ... use the objFSO object ...
  objFSO.CreateTextFile "C:\test.txt", True
  Set objFSO = Nothing
end if
```

By explicitly checking for `Nothing`, you prevent the script from crashing or producing unpredictable results when the object isn't available.