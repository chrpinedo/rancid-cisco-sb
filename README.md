Support for Cisco Small Business in RANCID
==========================================

[![Travis CI](https://travis-ci.org/chrpinedo/rancid-cisco-sb.svg)](https://travis-ci.org/chrpinedo/rancid-cisco-sb)

Introduction
------------

I like using [RANCID](http://www.shrubbery.net/rancid) to manage a backup of all
the network devices of a network: switches, routers, firewalls,... However,
RANCID lacks of "official" support for Cisco SG300 series switches. These
switches form part of [Cisco's Small Business
serie](http://www.cisco.com/c/en/us/products/switches/small-business-300-series-managed-switches/index.html)
and although they are not based on Cisco IOS, they are provided with a CLI with
some similar commands to Cisco IOS's ones.

By Googling I found how to [backup a Cisco SRW2008P switch with
RANCID](http://www.mork.no/~bjorn/srw2008/). I have modified those files to
support not only a SRW switch but also a SG300 switch.

These files add support to RANCID in order to backup Cisco Small Business
switches that comes with an tenel/SSH CLI:
- SRW series switches
- SG series switches
- SFE series switches

Caution! Not all switch models of the previous series comes with an telnet/SSH
CLI and so they cannot be backed up with RANCID (see [Issue #12](http://github.com/chrpinedo/rancid-cisco-sb/issues/12)).

Installation
------------

- Download src/csblogin and src/csbrancid files and put them in the 
  RANCID's PATH (in my case, /opt/rancid/bin). Don't forget to give them 
  execution permissions.
- Edit rancid-fe file located in the RANCID's PATH (in my case,
  /opt/rancid/bin/rancid-fe) and insert a new item in the %vendortable
  dictionary:

		'cisco-sb'        => 'csbrancid',

Usage
-----

- Insert the device to backup in the router.db file:

		test.example.com:cisco-sb:up:

- Modify your .cloginrc file:

		add user test.example.com        {user}
		add password test.example.com     {password}
		add autoenable test.example.com    1
		add method test.example.com        ssh
		add userprompt test.example.com  {"User Name:"}

- Enjoy it!


Christian Pinedo
