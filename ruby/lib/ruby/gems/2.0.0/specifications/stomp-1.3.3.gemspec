# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "stomp"
  s.version = "1.3.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Brian McCallister", "Marius Mathiesen", "Thiago Morello", "Guy M. Allard"]
  s.date = "2014-08-09"
  s.description = "Ruby client for the Stomp messaging protocol.  Note that this gem is no longer supported on rubyforge."
  s.email = ["brianm@apache.org", "marius@stones.com", "morellon@gmail.com", "allard.guy.m@gmail.com"]
  s.executables = ["catstomp", "stompcat"]
  s.extra_rdoc_files = ["CHANGELOG.rdoc", "LICENSE", "README.rdoc", "examples/client11_ex1.rb", "examples/client11_putget1.rb", "examples/conn11_ex1.rb", "examples/conn11_ex2.rb", "examples/conn11_hb1.rb", "examples/consumer.rb", "examples/examplogger.rb", "examples/get11conn_ex1.rb", "examples/get11conn_ex2.rb", "examples/logexamp.rb", "examples/logexamp_ssl.rb", "examples/publisher.rb", "examples/put11conn_ex1.rb", "examples/putget11_rh1.rb", "examples/ssl_uc1.rb", "examples/ssl_uc1_ciphers.rb", "examples/ssl_uc2.rb", "examples/ssl_uc2_ciphers.rb", "examples/ssl_uc3.rb", "examples/ssl_uc3_ciphers.rb", "examples/ssl_uc4.rb", "examples/ssl_uc4_ciphers.rb", "examples/ssl_ucx_default_ciphers.rb", "examples/stomp11_common.rb", "examples/topic_consumer.rb", "examples/topic_publisher.rb", "lib/client/utils.rb", "lib/connection/heartbeats.rb", "lib/connection/netio.rb", "lib/connection/utf8.rb", "lib/connection/utils.rb", "lib/stomp.rb", "lib/stomp/client.rb", "lib/stomp/codec.rb", "lib/stomp/connection.rb", "lib/stomp/constants.rb", "lib/stomp/errors.rb", "lib/stomp/ext/hash.rb", "lib/stomp/message.rb", "lib/stomp/null_logger.rb", "lib/stomp/slogger.rb", "lib/stomp/sslparams.rb", "lib/stomp/version.rb", "test/test_anonymous.rb", "test/test_client.rb", "test/test_codec.rb", "test/test_connection.rb", "test/test_connection1p.rb", "test/test_helper.rb", "test/test_message.rb", "test/test_ssl.rb", "test/test_urlogin.rb", "test/tlogger.rb"]
  s.files = ["bin/catstomp", "bin/stompcat", "CHANGELOG.rdoc", "LICENSE", "README.rdoc", "examples/client11_ex1.rb", "examples/client11_putget1.rb", "examples/conn11_ex1.rb", "examples/conn11_ex2.rb", "examples/conn11_hb1.rb", "examples/consumer.rb", "examples/examplogger.rb", "examples/get11conn_ex1.rb", "examples/get11conn_ex2.rb", "examples/logexamp.rb", "examples/logexamp_ssl.rb", "examples/publisher.rb", "examples/put11conn_ex1.rb", "examples/putget11_rh1.rb", "examples/ssl_uc1.rb", "examples/ssl_uc1_ciphers.rb", "examples/ssl_uc2.rb", "examples/ssl_uc2_ciphers.rb", "examples/ssl_uc3.rb", "examples/ssl_uc3_ciphers.rb", "examples/ssl_uc4.rb", "examples/ssl_uc4_ciphers.rb", "examples/ssl_ucx_default_ciphers.rb", "examples/stomp11_common.rb", "examples/topic_consumer.rb", "examples/topic_publisher.rb", "lib/client/utils.rb", "lib/connection/heartbeats.rb", "lib/connection/netio.rb", "lib/connection/utf8.rb", "lib/connection/utils.rb", "lib/stomp.rb", "lib/stomp/client.rb", "lib/stomp/codec.rb", "lib/stomp/connection.rb", "lib/stomp/constants.rb", "lib/stomp/errors.rb", "lib/stomp/ext/hash.rb", "lib/stomp/message.rb", "lib/stomp/null_logger.rb", "lib/stomp/slogger.rb", "lib/stomp/sslparams.rb", "lib/stomp/version.rb", "test/test_anonymous.rb", "test/test_client.rb", "test/test_codec.rb", "test/test_connection.rb", "test/test_connection1p.rb", "test/test_helper.rb", "test/test_message.rb", "test/test_ssl.rb", "test/test_urlogin.rb", "test/tlogger.rb"]
  s.homepage = "https://github.com/stompgem/stomp"
  s.licenses = ["Apache 2.0"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.14"
  s.summary = "Ruby client for the Stomp messaging protocol"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 2.3"])
    else
      s.add_dependency(%q<rspec>, [">= 2.3"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 2.3"])
  end
end