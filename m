Return-Path: <darren_young@yahoo.com>
Message-ID: <20010503004851.897.qmail@web10803.mail.yahoo.com>
Date: Wed, 2 May 2001 17:48:51 -0700 (PDT)
From: Darren Young <darren_young@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] LVM Questions
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I have only recently discovered and played with LVM.
If anyone can answer some general questions, it would
be most appreciated.

What I would like to have is a system where I can add
space via new disks and expand file systems at will. I
have used volume managers on HP and Solaris for
precisely these purposes (HP and Veritas). Too many
times I have been called by a customer or a customer
of a friend with the "I underestimated the space
needed for my Oracle databases and I need space,
now!". Adding disks and placing db's on alternate
filesystems gets the job done, but an LVM would be a
great method to move them to.

First, does LVM do RAID or do I need to employ the md
driver to accomplish this? It seems to me (as a
sysadmin) that LVM is great for adding space when
needed, but having RAID capabilities in conjunction
with this would be required to produce a highly
available system.

What ext2 resize utility is the ideal choice for LVM
to use. parted seems to be quite functional, but
having to down the machine to single is a but
annoying. Has anyone successfully used the ext2online
utility on RedHat? It seems as though the version of
e2fsprogs that includes this code is part of RH 7.1
anyways. At least from what I can tell. The online
resizing would definitely be required for a highly
available system as well.

I started with RedHat 7.1 with the 2.4.2 kernel and
patched it. What kernel is ideal to use with LVM? This
one seems to work, but I read a reference in the list
archive that certain components are in 2.4. Is this
the case?

The howto mentions to add a couple of commands to the
RH start script, but a scan of them reveals that RH
7.1 already has them. If they are correct, perhaps the
howto needs to reflect this. Does anyone know if they
are correct?

I picked up on an older thread about the mailing list
rejecting certain email and just had to dump in my .02
worth. I don't want to start a war, but the list
should be completely open. I remember the FreeSWAN
list having wars over open vs closed and open won. The
maintainers are of the opinion (from what I read) that
filtering spam is up to the user and cleaning of any
type of a list is censoring. I had to get that out
since I will most likely be using this product
somewhere down the road.

I also read an older thread on an X11 GUI as well as
some replies to it. The GUI that comes with Veritas is
completely useless and the command line tools are
completely over-engineered. While it would be nice for
a small company trying to save money not to call in a
specialist to create VG's, it certainly wouldn't be a
requirement. Get everything stable, reliable and
consistent than someone will probably have the time to
create the GUI. I'd dedicate time to that type of
project, but why bother when the code isn't quite
there yet. There's no reason.

Guess that's a total of .04 cents...

Thanks in advance,

Darren Young
Senior UNIX Administrator
GSX.com

__________________________________________________
Do You Yahoo!?
Yahoo! Auctions - buy the things you want at great prices
http://auctions.yahoo.com/
