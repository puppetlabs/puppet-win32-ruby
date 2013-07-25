require File.join(File.dirname(File.expand_path(__FILE__)), 'dir', 'constants')
require File.join(File.dirname(File.expand_path(__FILE__)), 'dir', 'functions')
require File.join(File.dirname(File.expand_path(__FILE__)), 'dir', 'structs')

class Dir
  include Dir::Structs
  include Dir::Constants
  extend Dir::Functions

  # The version of the win32-dir library.
  VERSION = '0.4.3'

  # CSIDL constants
  csidl = Hash[
    'DESKTOP',                  0x0000,
    'INTERNET',                 0x0001,
    'PROGRAMS',                 0x0002,
    'CONTROLS',                 0x0003,
    'PRINTERS',                 0x0004,
    'PERSONAL',                 0x0005,
    'FAVORITES',                0x0006,
    'STARTUP',                  0x0007,
    'RECENT',                   0x0008,
    'SENDTO',                   0x0009,
    'BITBUCKET',                0x000a,
    'STARTMENU',                0x000b,
    'MYDOCUMENTS',              0x000c,
    'MYMUSIC',                  0x000d,
    'MYVIDEO',                  0x000e,
    'DESKTOPDIRECTORY',         0x0010,
    'DRIVES',                   0x0011,
    'NETWORK',                  0x0012,
    'NETHOOD',                  0x0013,
    'FONTS',                    0x0014,
    'TEMPLATES',                0x0015,
    'COMMON_STARTMENU',         0x0016,
    'COMMON_PROGRAMS',          0X0017,
    'COMMON_STARTUP',           0x0018,
    'COMMON_FAVORITES',         0x001f,
    'COMMON_DESKTOPDIRECTORY',  0x0019,
    'APPDATA',                  0x001a,
    'PRINTHOOD',                0x001b,
    'LOCAL_APPDATA',            0x001c,
    'ALTSTARTUP',               0x001d,
    'COMMON_ALTSTARTUP',        0x001e,
    'INTERNET_CACHE',           0x0020,
    'COOKIES',                  0x0021,
    'HISTORY',                  0x0022,
    'COMMON_APPDATA',           0x0023,
    'WINDOWS',                  0x0024,
    'SYSTEM',                   0x0025,
    'PROGRAM_FILES',            0x0026,
    'MYPICTURES',               0x0027,
    'PROFILE',                  0x0028,
    'SYSTEMX86',                0x0029,
    'PROGRAM_FILESX86',         0x002a,
    'PROGRAM_FILES_COMMON',     0x002b,
    'PROGRAM_FILES_COMMONX86',  0x002c,
    'COMMON_TEMPLATES',         0x002d,
    'COMMON_DOCUMENTS',         0x002e,
    'CONNECTIONS',              0x0031,
    'COMMON_MUSIC',             0x0035,
    'COMMON_PICTURES',          0x0036,
    'COMMON_VIDEO',             0x0037,
    'RESOURCES',                0x0038,
    'RESOURCES_LOCALIZED',      0x0039,
    'COMMON_OEM_LINKS',         0x003a,
    'CDBURN_AREA',              0x003b,
    'COMMON_ADMINTOOLS',        0x002f,
    'ADMINTOOLS',               0x0030
  ]

  # Dynamically set each of the CSIDL constants
  csidl.each{ |key, value|
    buf  = 0.chr * 1024
    path = nil
    buf.encode!('UTF-16LE')

    if SHGetFolderPathW(0, value, 0, 0, buf) == 0 # Current path
      path = buf.strip
    elsif SHGetFolderPathW(0, value, 0, 1, buf) == 0 # Default path
      path = buf.strip
    else
      ptr   = FFI::MemoryPointer.new(:long)
      info  = SHFILEINFO.new
      flags = SHGFI_DISPLAYNAME | SHGFI_PIDL

      if SHGetFolderLocation(0, value, 0, 0, ptr) == 0
        if SHGetFileInfo(ptr.read_long, 0, info, info.size, flags) != 0
          path = info[:szDisplayName].to_s
        end
      end
    end

    Dir.const_set(key, path.encode(Encoding.default_external)) if path
  }

  # Set Dir::MYDOCUMENTS to the same as Dir::PERSONAL if undefined
  unless defined? MYDOCUMENTS
    MYDOCUMENTS = PERSONAL
  end

  class << self
    alias old_glob glob

    # Same as the standard MRI Dir.glob method except that it handles
    # backslashes in path names.
    #
    def glob(glob_pattern, flags = 0, &block)
      glob_pattern = glob_pattern.tr("\\", "/")
      old_glob(glob_pattern, flags, &block)
    end

    alias old_ref []

    # Same as the standard MRI Dir[] method except that it handles
    # backslashes in path names.
    #
    def [](glob_pattern)
      glob_pattern = glob_pattern.tr("\\", "/")
      old_ref(glob_pattern)
    end

    # JRuby normalizes the path by default.
    unless RUBY_PLATFORM == 'java'
      alias oldgetwd getwd
      alias oldpwd pwd

      # Returns the present working directory. Unlike MRI, this method always
      # normalizes the path.
      #
      # Examples:
      #
      #    Dir.chdir("C:/Progra~1")
      #    Dir.getwd # => C:\Program Files
      #
      #    Dir.chdir("C:/PROGRAM FILES")
      #    Dir.getwd # => C:\Program Files
      #
      def getwd
        path1 = 0.chr * 1024
        path2 = 0.chr * 1024
        path3 = 0.chr * 1024

        path1.encode!('UTF-16LE')

        if GetCurrentDirectoryW(path1.size, path1) == 0
          raise SystemCallError.new("GetCurrentDirectoryW", FFI.errno)
        end

        path2.encode!('UTF-16LE')

        if GetShortPathNameW(path1, path2, path2.size) == 0
          raise SystemCallError.new("GetShortPathNameW", FFI.errno)
        end

        path3.encode!('UTF-16LE')

        if GetLongPathNameW(path2, path3, path3.size) == 0
          raise SystemCallError.new("GetLongPathNameW", FFI.errno)
        end

        path3.strip.encode(Encoding.default_external)
      end

      alias :pwd :getwd
    end
  end

  # Creates the symlink +to+, linked to the existing directory +from+. If the
  # +to+ directory already exists, it must be empty or an error is raised.
  #
  # Example:
  #
  #    Dir.mkdir('C:/from')
  #    Dir.create_junction('C:/to', 'C:/from')
  #
  def self.create_junction(to, from)
    to   = to.wincode
    from = from.wincode

    from_path = 0.chr * 1024
    from_path.encode!('UTF-16LE')

    length = GetFullPathNameW(from, from_path.size, from_path, nil)

    if length == 0
      raise SystemCallError.new("GetFullPathNameW", FFI.errno)
    else
      from_path.strip!
    end

    to_path = 0.chr * 1024
    to_path.encode!('UTF-16LE')

    length = GetFullPathNameW(to, to_path.size, to_path, nil)

    if length == 0
      raise SystemCallError.new("GetFullPathNameW", FFI.errno)
    else
      to_path.strip!
    end

    # You can create a junction to a directory that already exists, so
    # long as it's empty.
    unless CreateDirectoryW(to_path, nil)
      if FFI.errno != ERROR_ALREADY_EXISTS
        raise SystemCallError.new("CreateDirectoryW", FFI.errno)
      end
    end

    begin
      # Generic read & write + open existing + reparse point & backup semantics
      handle = CreateFileW(
        to_path,
        GENERIC_READ | GENERIC_WRITE,
        0,
        nil,
        OPEN_EXISTING,
        FILE_FLAG_OPEN_REPARSE_POINT | FILE_FLAG_BACKUP_SEMANTICS,
        0
      )

      if handle == INVALID_HANDLE_VALUE
        raise SystemCallError.new("CreateFileW", FFI.errno)
      end

      target = "\\??\\".encode('UTF-16LE') + from_path

      rdb = REPARSE_JDATA_BUFFER.new
      rdb[:ReparseTag] = 2684354563 # IO_REPARSE_TAG_MOUNT_POINT
      rdb[:ReparseDataLength] = target.bytesize + 12
      rdb[:Reserved] = 0
      rdb[:SubstituteNameOffset] = 0
      rdb[:SubstituteNameLength] = target.bytesize
      rdb[:PrintNameOffset] = target.bytesize + 2
      rdb[:PrintNameLength] = 0
      rdb[:PathBuffer] = target

      bytes = FFI::MemoryPointer.new(:ulong)

      begin
        bool = DeviceIoControl(
          handle,
          CTL_CODE(FILE_DEVICE_FILE_SYSTEM, 41, METHOD_BUFFERED, 0),
          rdb,
          rdb[:ReparseDataLength] + 8,
          nil,
          0,
          bytes,
          nil
        )

        error = FFI.errno

        unless bool
          RemoveDirectoryW(to_path)
          raise SystemCallError.new("DeviceIoControl", error)
        end
      ensure
        CloseHandle(handle)
      end
    end

    self
  end

  # Returns the+ +path+ that a given +symlink+ points to.
  # Raises +ENOENT+ if given path does not exist, returns +false+
  # if it is not a junction.
  #
  # Example:
  #
  #    Dir.mkdir('C:/from')
  #    Dir.create_junction('C:/to', 'C:/from')
  #    Dir.read_junction("c:/to")          => "c:/from"
  #
  def self.read_junction(junction)
    return false unless Dir.junction?(junction)

    junction = junction.wincode

    junction_path = 0.chr * 1024
    junction_path.encode!('UTF-16LE')

    length = GetFullPathNameW(junction, junction_path.size, junction_path, nil)

    if length == 0
      raise SystemCallError.new("GetFullPathNameW", FFI.errno)
    else
      junction_path.strip!
    end

    begin
      # Generic read & write + open existing + reparse point & backup semantics
      handle = CreateFileW(
        junction_path,
        GENERIC_READ | GENERIC_WRITE,
        0,
        nil,
        OPEN_EXISTING,
        FILE_FLAG_OPEN_REPARSE_POINT | FILE_FLAG_BACKUP_SEMANTICS,
        0
      )

      if handle == INVALID_HANDLE_VALUE
        raise SystemCallError.new("CreateFileW", FFI.errno)
      end

      rdb = REPARSE_JDATA_BUFFER.new
      rdb[:ReparseTag] = 0
      rdb[:ReparseDataLength] = 0
      rdb[:Reserved] = 0
      rdb[:SubstituteNameOffset] = 0
      rdb[:SubstituteNameLength] = 0
      rdb[:PrintNameOffset] = 0
      rdb[:PrintNameLength] = 0
      rdb[:PathBuffer] = ''

      bytes = FFI::MemoryPointer.new(:ulong)

      begin
        bool = DeviceIoControl(
          handle,
          CTL_CODE(FILE_DEVICE_FILE_SYSTEM, 42, METHOD_BUFFERED, 0),
          nil,
          0,
          rdb,
          1024,
          bytes,
          nil
        )

        error = FFI.errno

        unless bool
          raise SystemCallError.new("DeviceIoControl", error)
        end
      ensure
        CloseHandle(handle)
      end
    end

    # MSDN says print and substitute names can be in any order
    jname = (rdb[:PathBuffer].to_ptr + rdb[:SubstituteNameOffset]).read_string(rdb[:SubstituteNameLength])
    jname = jname.bytes.to_a.pack('C*')
    jname = jname.force_encoding("UTF-16LE")
    raise "Junction name came back as #{jname}" unless jname[0..3] == "\\??\\".encode("UTF-16LE")
    File.expand_path(jname[4..-1].encode(Encoding.default_external))
  end

  # Returns whether or not +path+ is empty.  Returns false if +path+ is not
  # a directory, or contains any files other than '.' or '..'.
  #
  def self.empty?(path)
    PathIsDirectoryEmptyW(path.wincode)
  end

  # Returns whether or not +path+ is a junction.
  #
  def self.junction?(path)
    bool = true

    attrib = GetFileAttributesW(path.wincode)

    # Only directories with a reparse point attribute can be junctions
    if attrib == INVALID_FILE_ATTRIBUTES ||
       attrib & FILE_ATTRIBUTE_DIRECTORY == 0 ||
       attrib & FILE_ATTRIBUTE_REPARSE_POINT == 0
    then
      bool = false
    end

    bool
  end

  # Class level aliases
  #
  class << self
    alias reparse_dir? junction?
  end

  private

  # Macro from Windows header file, used by the create_junction method.
  def self.CTL_CODE(device, function, method, access)
    ((device) << 16) | ((access) << 14) | ((function) << 2) | (method)
  end
end
