# -*- encoding: utf-8 -*-
# stub: stomp 1.3.3 ruby lib

Gem::Specification.new do |s|
  s.name = "stomp".freeze
  s.version = "1.3.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Brian McCallister".freeze, "Marius Mathiesen".freeze, "Thiago Morello".freeze, "Guy M. Allard".freeze]
  s.date = "2014-08-10"
  s.description = "Ruby client for the Stomp messaging protocol.  Note that this gem is no longer supported on rubyforge.".freeze
  s.email = ["brianm@apache.org".freeze, "marius@stones.com".freeze, "morellon@gmail.com".freeze, "allard.guy.m@gmail.com".freeze]
  s.executables = ["catstomp".freeze, "stompcat".freeze]
  s.extra_rdoc_files = ["CHANGELOG.rdoc".freeze, "LICENSE".freeze, "README.rdoc".freeze, "examples/client11_ex1.rb".freeze, "examples/client11_putget1.rb".freeze, "examples/conn11_ex1.rb".freeze, "examples/conn11_ex2.rb".freeze, "examples/conn11_hb1.rb".freeze, "examples/consumer.rb".freeze, "examples/examplogger.rb".freeze, "examples/get11conn_ex1.rb".freeze, "examples/get11conn_ex2.rb".freeze, "examples/logexamp.rb".freeze, "examples/logexamp_ssl.rb".freeze, "examples/publisher.rb".freeze, "examples/put11conn_ex1.rb".freeze, "examples/putget11_rh1.rb".freeze, "examples/ssl_uc1.rb".freeze, "examples/ssl_uc1_ciphers.rb".freeze, "examples/ssl_uc2.rb".freeze, "examples/ssl_uc2_ciphers.rb".freeze, "examples/ssl_uc3.rb".freeze, "examples/ssl_uc3_ciphers.rb".freeze, "examples/ssl_uc4.rb".freeze, "examples/ssl_uc4_ciphers.rb".freeze, "examples/ssl_ucx_default_ciphers.rb".freeze, "examples/stomp11_common.rb".freeze, "examples/topic_consumer.rb".freeze, "examples/topic_publisher.rb".freeze, "lib/client/utils.rb".freeze, "lib/connection/heartbeats.rb".freeze, "lib/connection/netio.rb".freeze, "lib/connection/utf8.rb".freeze, "lib/connection/utils.rb".freeze, "lib/stomp.rb".freeze, "lib/stomp/client.rb".freeze, "lib/stomp/codec.rb".freeze, "lib/stomp/connection.rb".freeze, "lib/stomp/constants.rb".freeze, "lib/stomp/errors.rb".freeze, "lib/stomp/ext/hash.rb".freeze, "lib/stomp/message.rb".freeze, "lib/stomp/null_logger.rb".freeze, "lib/stomp/slogger.rb".freeze, "lib/stomp/sslparams.rb".freeze, "lib/stomp/version.rb".freeze, "test/test_anonymous.rb".freeze, "test/test_client.rb".freeze, "test/test_codec.rb".freeze, "test/test_connection.rb".freeze, "test/test_connection1p.rb".freeze, "test/test_helper.rb".freeze, "test/test_message.rb".freeze, "test/test_ssl.rb".freeze, "test/test_urlogin.rb".freeze, "test/tlogger.rb".freeze]
  s.files = ["CHANGELOG.rdoc".freeze, "LICENSE".freeze, "README.rdoc".freeze, "bin/catstomp".freeze, "bin/stompcat".freeze, "examples/client11_ex1.rb".freeze, "examples/client11_putget1.rb".freeze, "examples/conn11_ex1.rb".freeze, "examples/conn11_ex2.rb".freeze, "examples/conn11_hb1.rb".freeze, "examples/consumer.rb".freeze, "examples/examplogger.rb".freeze, "examples/get11conn_ex1.rb".freeze, "examples/get11conn_ex2.rb".freeze, "examples/logexamp.rb".freeze, "examples/logexamp_ssl.rb".freeze, "examples/publisher.rb".freeze, "examples/put11conn_ex1.rb".freeze, "examples/putget11_rh1.rb".freeze, "examples/ssl_uc1.rb".freeze, "examples/ssl_uc1_ciphers.rb".freeze, "examples/ssl_uc2.rb".freeze, "examples/ssl_uc2_ciphers.rb".freeze, "examples/ssl_uc3.rb".freeze, "examples/ssl_uc3_ciphers.rb".freeze, "examples/ssl_uc4.rb".freeze, "examples/ssl_uc4_ciphers.rb".freeze, "examples/ssl_ucx_default_ciphers.rb".freeze, "examples/stomp11_common.rb".freeze, "examples/topic_consumer.rb".freeze, "examples/topic_publisher.rb".freeze, "lib/client/utils.rb".freeze, "lib/connection/heartbeats.rb".freeze, "lib/connection/netio.rb".freeze, "lib/connection/utf8.rb".freeze, "lib/connection/utils.rb".freeze, "lib/stomp.rb".freeze, "lib/stomp/client.rb".freeze, "lib/stomp/codec.rb".freeze, "lib/stomp/connection.rb".freeze, "lib/stomp/constants.rb".freeze, "lib/stomp/errors.rb".freeze, "lib/stomp/ext/hash.rb".freeze, "lib/stomp/message.rb".freeze, "lib/stomp/null_logger.rb".freeze, "lib/stomp/slogger.rb".freeze, "lib/stomp/sslparams.rb".freeze, "lib/stomp/version.rb".freeze, "test/test_anonymous.rb".freeze, "test/test_client.rb".freeze, "test/test_codec.rb".freeze, "test/test_connection.rb".freeze, "test/test_connection1p.rb".freeze, "test/test_helper.rb".freeze, "test/test_message.rb".freeze, "test/test_ssl.rb".freeze, "test/test_urlogin.rb".freeze, "test/tlogger.rb".freeze]
  s.homepage = "https://github.com/stompgem/stomp".freeze
  s.licenses = ["Apache 2.0".freeze]
  s.rubygems_version = "2.6.11".freeze
  s.summary = "Ruby client for the Stomp messaging protocol".freeze

  s.installed_by_version = "2.6.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>.freeze, [">= 2.3"])
    else
      s.add_dependency(%q<rspec>.freeze, [">= 2.3"])
    end
  else
    s.add_dependency(%q<rspec>.freeze, [">= 2.3"])
  end
end
