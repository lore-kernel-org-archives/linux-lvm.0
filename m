Subject: Re: [linux-lvm] RAID 1 on Device Mapper - best practices?
Message-ID: <20031021171817.GA28462@mail.parplies.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Content-Disposition: inline
In-Reply-To: <200310172212.06301.mike@gaima.co.uk>
From: wopp@parplies.de
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
Date: Wed Oct 22 08:02:02 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Mike Williams wrote on 17.10.2003 at 22:12:06 [Re: [linux-lvm] RAID 1 on De=
vice Mapper - best practices?]:
> On Friday 17 October 2003 21:48, John Stoffel wrote:=20
> > Well, it could make more sense that way, but I was trying to get it do
> > that I could move and expand/shrink the filesystems as needed on the
> > various volumes.
>=20
> Ahh, but that's the beauty of RAID and LVM, what you end up with is just
> another block device. Which ever way you do it you'll get the same benefi=
t.

I believe that is not true. How do you resize a RAID device? The only
option I can think of is to re-create it, which is clearly beside the=20
point. With LVM on top of RAID, you can lvextend (or lvreduce), pvmove
and so on - where's the problem?

To put it differently, LVM devices are not just "another block device",
they're resizeable block devices. You get this benefit at the level you use
LVM on. Below RAID it's not really worth much (which is probably why Debian
starts RAID first).

> > The other downside of the MD underneath LVM is that when a MD RAID
> > goes bad, I need to resync the entire disk.

I've thought about that too. At the moment, I'm experimenting with several
disk partitions on each physical disk and RAID-1 devices made up of one
partition of each disk. Each MD is a PV in my VG. This way, if one
partition fails (i.e. runs in degenerated mode) the others will still be
mirrored. Maybe some ASCII-art can make this a bit clearer:

     +------+   +------+
     | hda1 | + | hdb1 |  -> md0 \
     +------+   +------+          +- VG0
     | hda2 | + | hdb2 |  -> md1 /
     +------+   +------+

[Yes, I'd prefer sda/sdb too ;-]

I'm not totally happy with this setup, because it's partly pointless :).
First of all, I'd like to point out that redundancy-providing RAID is,
PRIMARILY, a means of minimizing downtime, NOT a means of preventing data
loss. RAID reacts on disk failures (which affect the whole disk) and on
read/write errors. In these cases, normal operation proceeds without
interruption. If your data goes bad on disk but does not trigger a read
error, RAID doesn't care, i.e. it does not compare the contents of your
mirrors. Backups are against data loss and data corruption.

Of course, there's also the case of a partial failure (surface damage or
something the like) - I've just recently experienced it myself. In my case,
it hit a non-mirrored LVM PV, resulting in one or more filesystems being
remounted read-only, which was a pain ...
I've replaced the faulty disk with a new one, and now everything is
mirrored as described above (so "next time", there will hopefully be no
service interruption due to an FS which is unexpectedly read-only).
So? I'd have had to resync the whole disk in any case.

My conclusion is: Either you're only "playing around" with RAID, in which
case you should probably do whatever is most fun or gives you the most
learning experience, or you're serious about it, in which case you'll
immediately replace any disk showing errors anyway.


Just for the sake of contradicting myself, I'd like to add one thing which
is not stressed often enough here for my taste :).

People, if you're spreading out file systems over several physical disks
without providing some sort of redundancy, you're asking for trouble.
You're increasing the points of failure, making it much more probable for
a hardware error on any one of the disks to take all your data with it.
This is the reason RAID level 1+0 and RAID level 5 (yes, and 4 ...) were
invented shortly after RAID 0. Learn from other people's mistakes :).

Redundancy does HELP to keep your data safe :).


I'm sure more people have thought about these topics. What are your
conclusions?

Regards,
Holger

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE/lWpYIGbA/1goeB8RAsNfAJ0Y9OS5s6lWKrBxoNPTCuknkvf1SgCfUdp7
M0DID4DWVrj1OdbRc1pUdkE=
=cxVc
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--
