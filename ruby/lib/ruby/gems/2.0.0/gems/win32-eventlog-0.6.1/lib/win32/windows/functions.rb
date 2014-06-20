require 'ffi'

module Windows
  module Functions
    extend FFI::Library
    ffi_lib :advapi32

    typedef :uintptr_t, :handle
    typedef :uintptr_t, :hkey
    typedef :ulong, :dword
    typedef :ushort, :word

    attach_function :BackupEventLog, :BackupEventLogA, [:handle, :string], :bool
    attach_function :ClearEventLog, :ClearEventLogA, [:handle, :string], :bool
    attach_function :CloseEventLog, [:handle], :bool
    attach_function :GetOldestEventLogRecord, [:handle, :pointer], :bool
    attach_function :GetEventLogInformation, [:handle, :dword, :pointer, :dword, :pointer], :bool
    attach_function :GetNumberOfEventLogRecords, [:handle, :pointer], :bool
    attach_function :LookupAccountSid, :LookupAccountSidA, [:string, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], :bool
    attach_function :OpenEventLog, :OpenEventLogA, [:string, :string], :handle
    attach_function :OpenBackupEventLog, :OpenBackupEventLogA, [:string, :string], :handle
    attach_function :NotifyChangeEventLog, [:handle, :handle], :bool
    attach_function :ReadEventLog, :ReadEventLogA, [:handle, :dword, :dword, :buffer_out, :dword, :pointer, :pointer], :bool
    attach_function :RegCloseKey, [:hkey], :long
    attach_function :RegConnectRegistry, :RegConnectRegistryA, [:string, :hkey, :pointer], :long
    attach_function :RegCreateKeyEx, :RegCreateKeyExA, [:hkey, :string, :dword, :string, :dword, :dword, :pointer, :pointer, :pointer], :long
    attach_function :RegisterEventSource, :RegisterEventSourceA, [:string, :string], :handle
    attach_function :RegOpenKeyEx, :RegOpenKeyExA, [:hkey, :string, :dword, :ulong, :pointer], :long
    attach_function :RegQueryValueEx, :RegQueryValueExA, [:hkey, :string, :pointer, :pointer, :pointer, :pointer], :long
    attach_function :RegSetValueEx, :RegSetValueExA, [:hkey, :string, :dword, :dword, :pointer, :dword], :long
    attach_function :ReportEvent, :ReportEventA, [:handle, :word, :word, :dword, :pointer, :word, :dword, :pointer, :pointer], :bool

    ffi_lib :kernel32

    attach_function :CloseHandle, [:handle], :bool
    attach_function :CreateEvent, :CreateEventA, [:pointer, :bool, :bool, :string], :handle
    attach_function :ExpandEnvironmentStrings, :ExpandEnvironmentStringsA, [:string, :pointer, :dword], :dword
    attach_function :FormatMessage, :FormatMessageA, [:dword, :uintptr_t, :dword, :dword, :pointer, :dword, :pointer], :dword
    attach_function :FreeLibrary, [:handle], :bool
    attach_function :LoadLibraryEx, :LoadLibraryExA, [:string, :handle, :dword], :handle
    attach_function :WaitForSingleObject, [:handle, :dword], :dword
    attach_function :Wow64DisableWow64FsRedirection, [:pointer], :bool
    attach_function :Wow64RevertWow64FsRedirection, [:ulong], :bool

    ffi_lib :wevtapi

    attach_function :EvtClose, [:handle], :bool
    attach_function :EvtOpenPublisherMetadata, [:handle, :buffer_in, :buffer_in, :dword, :dword], :handle
    attach_function :EvtGetPublisherMetadataProperty, [:handle, :int, :dword, :dword, :pointer, :pointer], :bool
  end
end
