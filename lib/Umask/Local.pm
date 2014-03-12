package Umask::Local;

our $VERSION = '1.0';

use strict;
use warnings;
use base qw(Exporter);

our @EXPORTS = qw(umask_localize);

=head1 Methods

=head2 new

Set the umask saving the previous umask
Accepts only one parameter the umask

    Umask::Local->new(0077)

=cut

sub new {
    my $proto = shift;
    my $mask = shift;
    my $class = ref($proto) || $proto;
    my $old_umask = umask($mask);
    return bless \$old_umask,$class;
}

=head2 val

    return the the previous umask

=cut

sub val { ${$_[0]} }

=head2 DESTROY

    Will reset the umask to the previous umask

=cut

=head2 umask_localize

    Convenience function

=cut

sub umask_localize { Umask::Local->new($_[0]) }

sub DESTROY { umask ${$_[0]}; }


1;
__END__

=head1 NAME

Umask::Local - Class for localizing the umask

=head1 SYNOPSIS

  use Umask::Local;
  {
      my $umask_local = Umask::Local->new(0077);
      open(FILE,">only_me");
      close(FILE);
  }
  open(FILE,">default");
  close(FILE);

=head1 DESCRIPTION

    Umask::Local is use to set and reset the umask for the life of the object

=head1 SEE ALSO

    L<umask>

=head1 AUTHOR

root, E<lt>rouzier@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2014 by James Jude Rouzier

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.1 or,
at your option, any later version of Perl 5 you may have available.


=cut
