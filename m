Message-ID: <39ACB2F6.58A01FDA@twc.de>
Date: Wed, 30 Aug 2000 09:08:38 +0200
From: Ulf Bartelt <ulf@twc.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Strange...
References: <39AB63C5.C58D15F8@twc.de> <20000829195837.A277@guldukat.muon>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Hi!

Nils Juergens wrote:
> 
> On Tue, 29.08.00, Ulf Bartelt <ulf@twc.de> wrote:
> > (root@kira:/0)~# umount /home/ftp/install/
> > (root@kira:/0)~# umount /home/ftp
> > (root@kira:/0)~# e2fsadm -L+1G /dev/vgkira/ftp
> > e2fsadm -- ERROR: "/dev/vgkira/ftp" is mounted on "/home/ftp2"
> > e2fsadm -- please umount it to resize

> Have you tried using "lvextend" by hand? That should work.
> 
> In that case you might try ext2resize instead of resize2fs.
> You don't even need to supply the exact size of the LV to ext2resize.
> "ext2resize <devicename>" will automagically extend the filesystem to
> the size of the LV.

Neither mount nor /proc/mounts claimed the LV to be mounted.

I tried and solved the problem this way:

	rename the LV /dev/vgkira/ftp to /dev/vgkira/ptf
	(necessary lvchange commands not mentioned)

	run e2fsadm on the renamed LV

	rename th LV back

	use the LV as usual

I had no time to look in the sources but I for now I guess e2fsadm fails
if used on a LV with a name that is the beginning of a LV name that
still is in use...

This was the case having LV names ftp and ftp2...

Bye!
	Ulf.
