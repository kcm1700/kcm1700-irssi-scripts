use Irssi;
use Irssi::Irc;
use strict;

sub event_privmsg {
	my ($server, $data, $nick, $address) = @_;
	my ($target, $text) = split(/ :/, $data, 2);

	$server->command("MSG $target "."\x0313[https변환] \x0Fhttps://www.snucse.org/".$2)
	if ($text =~ /http:\/\/(www\.)?snucse\.org\/([0-9]*)/);
}

Irssi::signal_add("event privmsg", "event_privmsg");
