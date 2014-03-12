# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Local-Umask.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test::More tests => 4;
BEGIN { use_ok('Umask::Local') };
my $oldmask = umask;
  {
      my $localized_umask = Umask::Local->new(0077);
      is(0077,umask,"Current mask is 0077");
      is($oldmask,$localized_umask->val,"Is old umask");
  }
is($oldmask,umask,"umask is reset");

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

