Subject: Re: [linux-lvm] Ext3 -> ReiserFS on '/' conversion problem
Message-ID: <20031220005645.GA7068@mail.parplies.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline
In-Reply-To: <3FE37C0B.2080609@alteeve.com>
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
Date: Sun Dec 21 15:47:02 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

at some point in this thread, Madison Kelly wrote:
> I am still getting a kernel panic now but it no longer
> seems to have anything to do with LVM, simply it is -still- looking for
> an ext3 partition and obviously failing to find it.

sorry to say so, but it never did have anything to do with LVM. Unless I
completely misunderstood you, you first had / on LVM as ext3, and it worked.
When you try to boot with / on /dev/sdd1 as reiserfs, it doesn't work.

It may sound obvious (and the thread has already come to this conclusion -
I'm just trying to make it more clear), but your kernel doesn't support
reiserfs, so you have to load reiserfs as a module from initrd - by whatever
means Redhat provides or by manually creating an appropriate initrd (if you
do that, use the one you have as a starting point). Or, of course, compile a
kernel with reiserfs support built in.

You don't need to do any of this from the 'rescue disk' (especially not
compile a kernel ;-). You can just as well boot into your normal setup (with
/ as ext3). If I'm not totally mistaken, the FS type of / is not specified
anywhere but rather autodetected by the kernel on boot. Between booting into
your ext3 system on /dev/vg0/root and your reiserfs copy on /dev/sdd1, you
don't have to change any files. Come to think of it, how would the kernel
use any file-based information to determine the type of the root FS? It would
obviously need to mount / before reading the configuration, so once it can
read it, it doesn't need it any more.
And you can most probably tell GRUB what root device it is to pass to the
kernel on its boot command line too [I don't use GRUB, so I can't tell you
how] - or specify two alternative boot targets in the configuration file.

Concerning the 'df' output, 'df' takes its information from /etc/mtab, so if
you put the line

/dev/ttyS0 / ext3 rw 0 0

in there, it may appear as though your first serial port were mounted on
/ :-). Nothing really seems to need to know where / physically resides, or
if they do (LILO ...), they have better means of finding out [though I've
never tried running 'lilo' with /boot as a part of / and the above entry in
/etc/mtab :-]. This seems to result in not much effort being put into
writing the correct root device name into /etc/mtab on boot (see the
'rootfs' output of 'df' on your 'rescue disk' - that simply means 'well,
whatever it may be').

It IS sometimes confusing when you want to be 100% sure which disk you are
operating on. It might help to go by the size reported by 'df', which should
be accurate in any case.

> Anyway, I am off to try converting again now that I know to try passing
> "init=reiserfs" in grub (will it work though?... Off to see!)

What would that do? Run 'reiserfs' [relative to the CWD, probably /] instead
of /sbin/init after mounting the root FS? ;-)


A remark on your original question:
> Am I on the right track?

I don't think you'll be able to resize a software raid array and extend the
PV. Can you create your array in degraded mode instead (with three data disks
and the fourth one marked 'failed')? Then you'd have your spare disk for
installation which you could later 'raidhotadd' to the array to get your
parity information rebuilt. I don't think you're too worried about
interruption of service during the installation ;-).
I doubt a standard installation frontend supports this though, so you might
need a bit of tweaking to get that to work.

Hope that helps in some way.

Holger

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE/455NIGbA/1goeB8RAps5AJ0Wzxy/hN8J8khfICWmDuM2gz09kACcCJXp
CSfCSilTcLi+Sgw7+ckIpZ8=
=8pXg
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--
