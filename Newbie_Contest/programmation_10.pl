# Newbie Contest - Challenge programmation 10

use AnyEvent;
use AnyEvent::IRC::Client;

my $c = AnyEvent->condvar;

my $timer;
my $con = new AnyEvent::IRC::Client;

$con->reg_cb (connect => sub {
   my ($con, $err) = @_;
   print "connect";
   if (defined $err) {
      warn "connect error: $err\n";
      return;
   }
});
$con->reg_cb (join => sub { print "I'm join!\n"; });
$con->reg_cb (registered => sub { print "I'm in!\n"; });
$con->reg_cb (disconnect => sub { print "I'm out!\n"; $c->broadcast });
$con->reg_cb (
   sent => sub {
      my ($con) = @_;

      if ($_[2] eq 'PRIVMSG') {
         print "Sent message!\n";

         $timer = AnyEvent->timer (
            after => 1,
            cb => sub {
               undef $timer;
               $con->disconnect ('done')
            }
         );
      }
   }
);

$con->connect ("irc.worldnet.net", 6667, { nick => "ircmsg$$" });
$con->send_srv(JOIN => "#nc-irc-challs");
$con->send_srv (
   PRIVMSG => 'Daneel',
   ".challenge_caesar start"
);

#$c->wait;
$con->disconnect;
   