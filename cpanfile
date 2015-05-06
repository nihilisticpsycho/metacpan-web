requires 'AnyEvent::Curl::Multi';
requires 'CHI';
requires 'CPAN::Changes', '0.21';
requires 'CPAN::Meta', '2.141520'; # Avoid issues with List::Util dep under carton install.
requires 'Captcha::reCAPTCHA', '0.94';
requires 'Capture::Tiny';
requires 'Catalyst', '5.90053';
requires 'Catalyst::Action::RenderView';
requires 'Catalyst::Authentication::Store::Proxy', '0.0.1';
requires 'Catalyst::Authentication::User';
requires 'Catalyst::Model';
requires 'Catalyst::Plugin::Authentication';
requires 'Catalyst::Plugin::ConfigLoader';
requires 'Catalyst::Plugin::Static::Simple';
requires 'Catalyst::TraitFor::Request::REST::ForBrowsers';
requires 'Catalyst::View::JSON';
requires 'Catalyst::View::TT::Alloy';
requires 'CatalystX::RoleApplicator';
requires 'Config::General';
requires 'Config::JFDI';
requires 'Data::Dumper';
requires 'Data::Pageset';
requires 'Data::Printer';
requires 'DateTime';
requires 'DateTime::Format::HTTP';
requires 'DateTime::Format::ISO8601';
requires 'Digest::MD5';
requires 'Digest::SHA1';
requires 'ElasticSearch';
requires 'Encode', '2.51';
requires 'Exporter';
requires 'File::Path';
requires 'Gravatar::URL';
requires 'HTML::Escape';
requires 'HTML::Restrict', '2.2.2';
requires 'HTML::Selector::XPath';
requires 'HTML::Tree';
requires 'HTTP::Message::PSGI';
requires 'HTTP::Request';
requires 'HTTP::Request::Common';
requires 'Hash::AsObject';
requires 'Hash::Merge';
requires 'JSON::MaybeXS', '1.002000';
requires 'List::AllUtils';
requires 'List::MoreUtils';
requires 'List::Util';
requires 'Locale::Country','3.28';
requires 'Module::Build::Tiny', '0.037';
requires 'Module::Runtime';
requires 'Moose';
requires 'MooseX::ClassAttribute';
requires 'MooseX::Role::Parameterized', '1.02';
requires 'MooseX::StrictConstructor';
requires 'PerlIO::gzip';
requires 'MooseX::Types::Common::Numeric';
requires 'MooseX::Types::Common::String';
requires 'MooseX::Types::Moose';
requires 'MooseX::Types::URI';
requires 'Net::Fastly', '1.02';
requires 'Path::Tiny', '0.056';
requires 'Plack::Middleware::Assets';
requires 'Plack::Middleware::ReverseProxy';
requires 'Plack::Middleware::Runtime';
requires 'Plack::Middleware::Headers';
requires 'Plack::Middleware::ServerStatus::Lite';
requires 'Plack::Middleware::Session', '0.22';
requires 'Plack::Middleware::Session::Cookie';
requires 'Plack::Response';
requires 'Plack::Session';
requires 'Plack::Test';
requires 'Regexp::Common';
requires 'Regexp::Common::time';
requires 'Starman', '>= 0.4008';
requires 'Template::Alloy';
requires 'Template::Plugin::DateTime';
requires 'Template::Plugin::JSON';
requires 'Template::Plugin::Markdown';
requires 'Template::Plugin::MultiMarkdown', '0.08';
requires 'Template::Plugin::Number::Format';
requires 'Template::Plugin::Page';
requires 'Text::Pluralize';
requires 'Try::Tiny', '0.09';
requires 'YAML', '1.15'; # fix dep chain issue
requires 'URI';
requires 'XML::Feed';
requires 'XML::Simple';

test_requires 'App::Prove';
test_requires 'Path::Iterator::Rule', '1.008';
test_requires 'Perl::Tidy';
test_requires 'Test::Code::TidyAll';
test_requires 'Test::MockObject','1.09';
test_requires 'Test::More', '0.96';
test_requires 'Test::Perl::Critic';
test_requires 'Test::XPath', '0.15';

author_requires 'Code::TidyAll';
