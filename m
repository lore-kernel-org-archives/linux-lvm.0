Date: Mon, 9 Oct 2000 14:23:42 -0700
From: Charles Duffy <cduffy@mvista.com>
Subject: Re: [linux-lvm] Unable to boot using LVM for "/"
Message-ID: <20001009142342.H6371@mvista.com>
References: <39E21C56.B57AC5D4@attglobal.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="7SrMUQONj8Rl9QNG"
Content-Disposition: inline
In-Reply-To: <39E21C56.B57AC5D4@attglobal.net>; from seawolf@attglobal.net on Mon, Oct 09, 2000 at 03:28:22PM -0400
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: Les Hazelton <seawolf@attglobal.net>
Cc: linux-lvm@msede.com


--7SrMUQONj8Rl9QNG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 09, 2000 at 03:28:22PM -0400, Les Hazelton wrote:
> I have been attempting to move my root partition to a logical volume and
> eliminate the current normal partition.  No luck.  I have read the
> lvmcreate_initrd man page found at=20
>=20
> http://linux.msede.com/lvm/man/man2html.cgi?lvmcreate_initrd:8
>=20
> and followed those instructions but it doesn't work for me. I have tried
> two different versions of lilo (lilo-0.21.5.1-4mdk and the 0.21.6
> binaries from the lilo site) and get the same result from both.
>=20
> If I use grub with the menu.lst shown below I can boot the entry for
> linux-2 and the system runs correctly. Neither of the other two entries
> will boot correctly. The /dev/hda9 is the real partition I am attempting
> to eliminate.  If I try to boot the first, linux, entry it gets a kernel
> panic because it can't locate init. The third entry produces a kernel
> panic because it can't mound device 0:0

"root=3D/dev/vg01/main" fails because the kernel, when booting, just
determines the major/minor numbers for the root partition based on
looking up the root device in a fixed table. What you need to do to
get the "test" entry running is change the root to the major/minor
number combo in hex; in my case, where /dev/vg01/root has major/minor
number 58,3 in decimal, I pass "root=3D3a03" to grub and that works
correctly.

Note that the above presumes that the initrd runs correctly. Does it?
(Be aware that I had to add /dev/console and /dev/tty0 entries to the
initrd to see output from the programs run from it... this may have
been fixed by now, or maybe not).

Hope this has been of some use.

--7SrMUQONj8Rl9QNG
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.3 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE54jder/O29KUQmJURAjSDAKCDIvsunmzU2fyQ1tYwSDmDTJFEsACgu7mj
MTN7aoddnQvOpeyvPV8NChU=
=i8HZ
-----END PGP SIGNATURE-----

--7SrMUQONj8Rl9QNG--
