Date: Tue, 18 Jul 2000 23:15:57 +0200
From: =?iso-8859-1?Q?Erik_B=E5gfors?= <bagfors@pdc.kth.se>
Subject: [linux-lvm] made a big misstake
Message-ID: <20000718231557.B13413@zyrgelkwyt.pdc.kth.se>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@msede.com

Hi!

I just installed a new computer the other day and since I'm a long time
aix-user and love there lvm-system I installed the linux-lvm.

So far I am VERY impressed.  I've tried resizeing and moving end extending
and all kinds of stuff and everything worked!! Good work!!!


However I screwed up today. =20
I had one vg (disk_vg) that was on two pv's (hda5 and hdb1).  I wanted to
remove one of them and did a pvmove and could see that the pv I wanted to
remove was empty.  Great!

Now the misstake, I did not run a vgreduce before I fdisk'ed the whole=20
disk (hdb).  Now when I start up, vgscan cannot find any vg's.

all the vg*-utilities say they cannot find any vg's.

pvdisplay shows my vg on the pv but it's also on another pv :(

pvscan says 'inactive PV "/dev/hda5" is associated to an unknown VG (run
vgscan)'

I was thinking that creating a new pv (on /dev/hdb1) and running=20
vgcfgrestore -n disk_vg /dev/hdb1 would help me get it back but it just
say that "size of physical volume /dev/hdb1 differs from backup" and I
cannot remember what size I had last time.

Is ther any way of finding that out?

There is nothing important on this box but it would be fun not having to
reinstall it!

So.. anyone knows how to solve this?  Sorry I don't have better output from
my commands but it's hard since the network is not working on it right now =
:)

/Erik

--=20
Erik B=EF=BF=BDgfors               | Center for Parallel Computers
http://erik.bagfors.nu/    | http://www.pdc.kth.se/
erik@bagfors.nu            | bagfors@pdc.kth.se =20
Supporter of free software | GSM +46 70 398 54 43=20
