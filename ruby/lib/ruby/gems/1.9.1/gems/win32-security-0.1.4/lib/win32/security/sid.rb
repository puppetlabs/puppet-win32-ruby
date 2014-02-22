require 'windows/security'
require 'windows/thread'
require 'windows/process'
require 'windows/error'
require 'windows/msvcrt/string'
require 'windows/msvcrt/buffer'
require 'socket'

# The Win32 module serves as a namespace only.
module Win32

  # The Security class serves as a toplevel class namespace.
  class Security

    # The SID class encapsulates a Security Identifier.
    class SID
      include Windows::Security
      include Windows::Error
      include Windows::MSVCRT::String
      include Windows::MSVCRT::Buffer
      include Windows::Thread
      include Windows::Process

      extend Windows::Security
      extend Windows::Error
      extend Windows::MSVCRT::String
      extend Windows::MSVCRT::Buffer

      # Error class typically raised if any of the SID methods fail
      class Error < StandardError; end

      # The version of the Win32::Security::SID class.
      VERSION = '0.1.4'

      # Some constant SID's for your convenience, in string format.
      # See http://support.microsoft.com/kb/243330 for details.

      Null                        = 'S-1-0'
      Nobody                      = 'S-1-0-0'
      World                       = 'S-1-1'
      Everyone                    = 'S-1-1-0'
      Local                       = 'S-1-2'
      Creator                     = 'S-1-3'
      CreatorOwner                = 'S-1-3-0'
      CreatorGroup                = 'S-1-3-1'
      CreatorOwnerServer          = 'S-1-3-2'
      CreatorGroupServer          = 'S-1-3-3'
      NonUnique                   = 'S-1-4'
      Nt                          = 'S-1-5'
      Dialup                      = 'S-1-5-1'
      Network                     = 'S-1-5-2'
      Batch                       = 'S-1-5-3'
      Interactive                 = 'S-1-5-4'
      Service                     = 'S-1-5-6'
      Anonymous                   = 'S-1-5-7'
      Proxy                       = 'S-1-5-8'
      EnterpriseDomainControllers = 'S-1-5-9'
      PrincipalSelf               = 'S-1-5-10'
      AuthenticatedUsers          = 'S-1-5-11'
      RestrictedCode              = 'S-1-5-12'
      TerminalServerUsers         = 'S-1-5-13'
      LocalSystem                 = 'S-1-5-18'
      NtLocal                     = 'S-1-5-19'
      NtNetwork                   = 'S-1-5-20'
      BuiltinAdministrators       = 'S-1-5-32-544'
      BuiltinUsers                = 'S-1-5-32-545'
      Guests                      = 'S-1-5-32-546'
      PowerUsers                  = 'S-1-5-32-547'
      AccountOperators            = 'S-1-5-32-548'
      ServerOperators             = 'S-1-5-32-549'
      PrintOperators              = 'S-1-5-32-550'
      BackupOperators             = 'S-1-5-32-551'
      Replicators                 = 'S-1-5-32-552'

      # The binary SID object itself.
      attr_reader :sid

      # The account name passed to the constructor.
      attr_reader :account

      # The SID account type, e.g. 'user, 'group', etc.
      attr_reader :account_type

      # The domain the SID is on.
      attr_reader :domain

      # The host passed to the constructor, or the localhost if none
      # was specified.
      attr_reader :host

      # Converts a binary SID to a string in S-R-I-S-S... format.
      #
      def self.sid_to_string(sid)
        sid_addr = [sid].pack('p*').unpack('L')[0]
        sid_buf  = 0.chr * 80
        sid_ptr  = 0.chr * 4

        unless ConvertSidToStringSid(sid_addr, sid_ptr)
          raise Error, get_last_error
        end

        strcpy(sid_buf, sid_ptr.unpack('L')[0])
        sid_buf.strip
      end

      # Converts a string in S-R-I-S-S... format back to a binary SID.
      #
      def self.string_to_sid(string)
        string_addr = [string].pack('p*').unpack('L')[0]
        sid_ptr  = 0.chr * 4

        unless ConvertStringSidToSid(string_addr, sid_ptr)
          raise Error, get_last_error
        end

        unless IsValidSid(sid_ptr.unpack('L')[0])
          raise Error, get_last_error
        end

        sid_len = GetLengthSid(sid_ptr.unpack('L')[0])
        sid_buf = 0.chr * sid_len

        unless CopySid(sid_len, [sid_buf].pack('p*').unpack('L')[0], sid_ptr.unpack('L')[0])
          raise Error, get_last_error
        end

        sid_buf
      end

      # Creates a new SID with +authority+ and up to 8 +subauthorities+,
      # and returns new Win32::Security::SID object.
      #
      # Example:
      #
      #    sec = Security::SID.create(
      #       Security::SID::SECURITY_WORLD_SID_AUTHORITY,
      #       Security::SID::SECURITY_WORLD_RID
      #    )
      #
      #    p sec
      #
      #    #<Win32::Security::SID:0x2c5a95c
      #       @host="your_host",
      #       @account="Everyone",
      #       @account_type="well known group",
      #       @sid="\001\001\000\000\000\000\000\001\000\000\000\000",
      #       @domain=""
      #    >
      #
      def self.create(authority, *sub_authorities)
        if sub_authorities.length > 8
           raise ArgumentError, "maximum of 8 subauthorities allowed"
        end

        sid = 0.chr * GetSidLengthRequired(sub_authorities.length)

        auth = 0.chr * 5 + authority.chr

        unless InitializeSid(sid, auth, sub_authorities.length)
           raise Error, get_last_error
        end

        sub_authorities.each_index do |i|
           value = [sub_authorities[i]].pack('L')
           auth_ptr = GetSidSubAuthority(sid, i)
           memcpy(auth_ptr, value, 4)
        end

        new(sid)
      end

      # Creates and returns a new Win32::Security::SID object, based on
      # the account name, which may also be a binary SID. If a host is
      # provided, then the information is retrieved from that host.
      # Otherwise, the local host is used.
      #
      # If no account is provided then it retrieves information for the
      # user account associated with the calling thread and the host argument
      # is ignored.
      #
      # Note that this does NOT create a new SID, but merely retrieves
      # information for an existing SID. To create a new SID, use the
      # SID.create method.
      #
      # Examples:
      #
      #  # Current user
      #  Win32::Security::SID.new
      #
      #  # User 'john' on the localhost
      #  Win32::Security::SID.new('john')
      #
      #  # User 'jane' on a remote machine
      #  Win32::Security::SID.new('jane', 'some_host')
      #
      #  # Binary SID
      #  Win32::Security::SID.new("\001\000\000\000\000\000\001\000\000\000\000")
      #
      def initialize(account=nil, host=Socket.gethostname)
        if account.nil?
          htoken = [0].pack('L')
          bool   = OpenThreadToken(GetCurrentThread(), TOKEN_QUERY, 1, htoken)
          errno  = GetLastError()

          if !bool
            if errno == ERROR_NO_TOKEN
              unless OpenProcessToken(GetCurrentProcess(), TOKEN_QUERY, htoken)
                raise get_last_error
              end
            else
              raise get_last_error(errno)
            end
          end

          htoken = htoken.unpack('V').first
          cbti = [0].pack('L')
          token_info = 0.chr * 36

          bool = GetTokenInformation(
            htoken,
            TokenOwner,
            token_info,
            token_info.size,
            cbti
          )

          unless bool
            raise Error, get_last_error
          end
        end

        bool   = false
        sid    = 0.chr * 28
        sid_cb = [sid.size].pack('L')

        domain_buf = 0.chr * 80
        domain_cch = [domain_buf.size].pack('L')

        sid_name_use = 0.chr * 4

        if account
          ordinal_val = account[0]
          ordinal_val = ordinal_val.ord if RUBY_VERSION.to_f >= 1.9
        else
          ordinal_val = nil
        end

        if ordinal_val.nil?
          bool = LookupAccountSid(
            nil,
            token_info.unpack('L')[0],
            sid,
            sid_cb,
            domain_buf,
            domain_cch,
            sid_name_use
          )
        elsif ordinal_val < 10 # Assume it's a binary SID.
          bool = LookupAccountSid(
            host,
            [account].pack('p*').unpack('L')[0],
            sid,
            sid_cb,
            domain_buf,
            domain_cch,
            sid_name_use
          )
        else
          bool = LookupAccountName(
            host,
            account,
            sid,
            sid_cb,
            domain_buf,
            domain_cch,
            sid_name_use
          )
        end

        unless bool
          raise Error, get_last_error
        end

        # The arguments are flipped depending on which path we took
        if ordinal_val.nil?
          buf = 0.chr * 260
          ptr = token_info.unpack('L')[0]
          memcpy(buf, ptr, token_info.size)
          @sid = buf.strip
          @account = sid.strip
        elsif ordinal_val < 10
          @sid     = account
          @account = sid.strip
        else
          # patch this for now, until we roll to 0.2.3+
          # https://github.com/djberg96/win32-security/issues/3
          length = GetLengthSid(sid)
          @sid = sid[0,length]
          @account = account
        end

        @host   = host
        @domain = domain_buf.strip

        @account_type = get_account_type(sid_name_use.unpack('L')[0])
      end

      # Synonym for SID.new.
      #
      def self.open(account=nil, host=Socket.gethostname)
        new(account, host)
      end

      # Returns the binary SID in string format suitable for display,
      # storage or transmission.
      #
      def to_s
        sid_addr = [@sid].pack('p*').unpack('L').first
        sid_buf  = 0.chr * 80
        sid_ptr  = 0.chr * 4

        unless ConvertSidToStringSid(sid_addr, sid_ptr)
          raise Error, get_last_error
        end

        strcpy(sid_buf, sid_ptr.unpack('L').first)
        sid_buf.strip
      end

      alias to_str to_s

      # Returns whether or not the SID object is equal to +other+.
      #
      def ==(other)
        EqualSid(@sid, other.sid)
      end

      # Returns whether or not the SID is a valid sid.
      #
      def valid?
        IsValidSid(@sid)
      end

      # Returns whether or not the SID is a well known SID.
      #
      # Requires Windows XP or later. Earlier versions will raise a
      # NoMethodError.
      #
      def well_known?
        if defined? IsWellKnownSid
          IsWellKnownSid(@sid)
        else
          raise NoMethodError, 'requires Windows XP or later'
        end
      end

      # Returns the length of the SID object, in bytes.
      #
      def length
        GetLengthSid(@sid)
      end

      private

      # Converts a numeric account type into a human readable string.
      #
      def get_account_type(value)
        case value
          when SidTypeUser
            'user'
          when SidTypeGroup
            'group'
          when SidTypeDomain
            'domain'
          when SidTypeAlias
            'alias'
          when SidTypeWellKnownGroup
            'well known group'
          when SidTypeDeletedAccount
            'deleted account'
          when SidTypeInvalid
            'invalid'
          when SidTypeUnknown
            'unknown'
          when SidComputer
            'computer'
        end
      end
    end
  end
end
