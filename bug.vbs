Function GetObject() can fail silently if the object doesn't exist, leading to unexpected behavior later in the script.  This is especially problematic because VBScript doesn't always throw an error immediately; instead the issue might surface much later when a property or method of the non-existent object is accessed. 

```vbscript
Dim objFSO
Set objFSO = GetObject("Scripting.FileSystemObject")

if objFSO Is Nothing Then
  ' Handle the error - this part is crucial and often missing
  MsgBox "FileSystemObject not available.", vbCritical
  WScript.Quit
end if

' ...rest of the code using objFSO...
```