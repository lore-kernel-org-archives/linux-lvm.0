Message-ID: <XFMail.000429123820.daniel.etter@etter.ch>
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
In-Reply-To: <3905652C.5B5CF85C@ednet.ns.ca>
Date: Sat, 29 Apr 2000 12:38:20 +0200 (MEST)
From: Daniel Etter <daniel.etter@etter.ch>
Subject: Re: [linux-lvm] mounting lv's from fstab
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Patrick Boutilier <boutilpj@ednet.ns.ca>
Cc: "linux-lvm@msede.com" <linux-lvm@msede.com>


Am 25-Apr-00 toeggelte Patrick Boutilier:
> I just put the vgchange command in /etc/rc.d/rc.sysinit just before
> the
> RAID part.
> 
> .......
># Load modules (for backward compatibility with VARs)
> if [ -f /etc/rc.d/rc.modules ]; then
>         /etc/rc.d/rc.modules
> fi
> 
># LVM
> /sbin/vgscan

I dont use vgscan, because I don't boot neither with intrd nor with
devfs, so for me vgscan would be just waisting time during boot.

> /sbin/vgchange -a y
> 
># Add raid devices
> if [ -f /proc/mdstat -a -f /etc/raidtab ]; then
>         echo -n "Starting up RAID devices: "
-----------------------------------------------------------------------
Daniel Etter   | http://www.etter.ch/~daniel  | Tel. : +41 1  884 75 01
Ringstrasse 2  |                              | Fax  : +41 1  884 62 50
8107 Buchs ZH  | mailto:Daniel.Etter@etter.ch | Natel: +41 79 354 93 75
