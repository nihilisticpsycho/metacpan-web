use strict;
use warnings;

use Test::More;
use MetaCPAN::Web;
use MetaCPAN::Web::Model::API::Permission;
use MetaCPAN::Web::Test;
use Cpanel::JSON::XS qw( decode_json encode_json );

subtest 'notification_type' => sub {
    my @tests = (
        {
            params   => {},
            expected => undef,
            message  => 'empty hash of data passed'
        },
        {
            params => {
                co_maintainers => [ 'ONE', 'TWO', 'THREE' ]
            },
            expected => undef,
            message =>
                'co_maintainers passed without "special" co_maintainer existing'
        },
        {
            params => {
                module_name    => 'Mod::Name',
                co_maintainers => [ 'ADOPTME', 'ONE', 'TWO', 'THREE' ]
            },
            expected => {
                module_name => 'Mod::Name',
                type        => 'ADOPTME',
                emails      => [
                    'one@example.com',   'two@example.com',
                    'three@example.com', 'modules@perl.org'
                ],
            },
            message => 'ADOPTME passed in co_maintainers'
        },
        {
            params => {
                module_name    => 'Mod::Name',
                co_maintainers => [ 'ONE', 'NEEDHELP', 'TWO', 'THREE' ]
            },
            expected => {
                module_name => 'Mod::Name',
                type        => 'NEEDHELP',
                emails      => [
                    'one@example.com', 'two@example.com',
                    'three@example.com'
                ],
            },
            message => 'NEEDHELP passed in co_maintainers'
        },
        {
            params => {
                module_name    => 'Mod::Name',
                owner          => 'LNATION',
                co_maintainers => [ 'ONE', 'TWO', 'THREE', 'HANDOFF' ]
            },
            expected => {
                module_name => 'Mod::Name',
                type        => 'HANDOFF',
                emails      => [
                    'lnation@example.com', 'one@example.com',
                    'two@example.com',     'three@example.com'
                ],
            },
            message => 'HANDOFF passed in co_maintainers'
        },
        {
            params => {
                owner => ''
            },
            expected => undef,
            message  => 'Null string as owner',
        },
        {
            params => {
                owner => undef
            },
            expected => undef,
            message  => 'Undef as owner'
        },
        {
            params => {
                owner => 'LNATION'
            },
            expected => undef,
            message  => 'LNATION as owner'
        },
        {
            params => {
                module_name => 'Mod::Name',
                owner       => 'ADOPTME'
            },
            expected => {
                module_name => 'Mod::Name',
                type        => 'ADOPTME',
                emails      => ['modules@perl.org'],
            },
            message => 'ADOPTME passed as owner'
        },
        {
            params => {
                module_name => 'Mod::Name',
                owner       => 'HANDOFF'
            },
            expected => {
                module_name => 'Mod::Name',
                type        => 'HANDOFF',
                emails      => ['modules@perl.org'],
            },
            message => 'HANDOFF passed as owner'
        },
        {
            params => {
                module_name => 'Mod::Name',
                owner       => 'NEEDHELP'
            },
            expected => {
                module_name => 'Mod::Name',
                type        => 'NEEDHELP',
                emails      => ['modules@perl.org'],
            },
            message => 'NEEDHELP passed as owner'
        },
    );

    my $api_data;
    override_api_response( sub {
        my ( undef, $req ) = @_;
        my $this_api_data = $api_data;
        if ( $req->uri !~ /permission/ ) {
            $this_api_data = {
                authors => [
                    map +( {
                        pauseid => $_,
                        email   => lc($_) . '@example.com',
                    } ),
                    @{ decode_json( $req->content )->{id} }
                ]
            };
        }
        return [
            200,
            [ "Content-Type" => "application/json" ],
            [ encode_json $this_api_data ],
        ];
    } );

    my $model = MetaCPAN::Web->model( 'API::Permission',
        api => 'http://example.com' );
    for my $test (@tests) {
        $api_data = $test->{params};
        my $notif = $model->get_notification_info( $api_data->{module_name} );
        is_deeply( $notif->get->{notification},
            $test->{expected}, $test->{message} );
    }
};

done_testing;
