use Irssi;
use Irssi::Irc;
use strict;

sub event_privmsg {
	my ($server, $data, $nick, $address) = @_;
	my ($target, $text) = split(/ :/, $data, 2);

	my $h = "MSG $target "."\x0313[https변환]\x0F ";

	$server->command($h."https://www.snucse.org/".$3)
	if ($text =~ /http:\/\/(www\.)?snucse\.org(\:80)?\/([0-9]*)/);

	$server->command($h."https://".$1)
	if ($text =~ /http:\/\/(([a-zA-Z0-9]*\.)?google\.com\/[a-zA-Z0-9\%\?\+\,\;*\[\]\@\$\'\"\&\/\\\_\#\.\~\:\=\^\-]*)/);
}

Irssi::signal_add("event privmsg", "event_privmsg");
