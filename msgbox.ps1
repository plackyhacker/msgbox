$id = get-random
$code = @"
using System;
using System.Text;
using System.Runtime.InteropServices;

namespace test
{
    public class User32$id
    {
        [DllImport("user32.dll", CharSet=CharSet.Auto)]
        public static extern int MessageBox(IntPtr hWnd, String text, String caption, int options);

        public static void Main()
        {
            MessageBox((IntPtr)0, "Malware triggered!", "Malware triggered!", 0);
        }
    }
}
"@

Add-Type -TypeDefinition $code -Language CSharp 
Invoke-Expression "[test.User32$id]::Main()"
