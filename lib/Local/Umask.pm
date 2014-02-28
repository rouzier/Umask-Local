package Local::Umask;

our $VERSION = '1.0';

use strict;
use warnings;

sub new {
    my $proto = shift;
    my $mask = shift;
    my $class = ref($proto) || $proto;
    my $old_umask = umask($mask);
    return bless \$old_umask,$class;
}

sub val { ${$_[0]} }

sub DESTROY { umask ${$_[0]}; }


1;
__END__

=head1 NAME

Local::Umask - Perl extension for localizing the umask

=head1 SYNOPSIS

  use Local::Umask;
  {
      my $local_umask = Local::Umask->new(0077);
      open(FILE,">only_me");
      close(FILE);
  }
  open(FILE,">default");
  close(FILE);

=head1 DESCRIPTION


=head1 SEE ALSO


=head1 AUTHOR

root, E<lt>rouzier@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2014 by James Jude Rouzier

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.1 or,
at your option, any later version of Perl 5 you may have available.


=cut
