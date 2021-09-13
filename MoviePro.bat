set SDKROOT=%SystemDrive%/Library/Developer/Platforms/windows.platform/Developer/SDKs/Windows.sdk
set SWIFTFLAGS=-sdk %SDKROOT% -I %SDKROOT%/usr/lib/swift -L %SDKROOT%/usr/lib/swift/windows
swiftc MoviePro.swift -o MoviePro.exe %SWIFTFLAGS%