Subject: Re: [linux-lvm] strange behavior with 1.0.5 on Linux 2.4.19?
From: Gregory Ade <gkade@bigbrother.net>
In-Reply-To: <20021004105057.B8575@sistina.com>
References: <1033579350.6468.61.camel@gopher> 
	<20021004105057.B8575@sistina.com>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-I94/leUtgERd6McDb3Aw"
Message-Id: <1034107599.28928.105.camel@pslgregory>
Mime-Version: 1.0
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
Date: Tue Oct  8 15:07:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--=-I94/leUtgERd6McDb3Aw
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2002-10-04 at 01:50, Heinz J . Mauelshagen wrote:
>=20
> Gregory,
>=20
> running "lvcreate --size 8G --snapshot --name db1_snap vg01" should give
> a syntax error rather than "... doesn't exist".
>=20
> Did you eventually run
> "lvcreate --size 8G --snapshot --name db1_snap /dev/vg01/db1"
> instead?

according to the manpage and help for lvcreate, the syntax was correct.=20
The problem was that vg01 really didn't exist. :)

That, however, is not the problem.

> I guess the problem has disappeared after your reboot, right?
> If so, are you able to repeat the problem?

Kinda...

I'm hesitant to do any serious poking at it just yet, as the machine
having the problems is already in production and being heavily used.

Rebooting mostly clears up the problem.  After a reboot, I can use
lvdisplay and vgdisplay to my heart's content.  I can lvcreate and
lvremove lv's from the vg without problem.  vgscan and lvscan work as
expected.

It seems that the `vgchange -a n` in /etc/init.d/halt hangs, though.  On
other systems, this is not the case, even with the same version kernel &
LVM utilities (2.4.19 & 1.0.5, respectively).

another point is that this system is configured with root (/) on LVM
(/dev/vg00/root).  On other systems we have configured this way, we
occasionally get an error message that vgchange was unable to deactivate
the volume group because there were open volumes.  On this machine, it
just hangs, requiring a power-cycle to do a reboot (why did they stop
putting reset switches in Intel servers???)

I haven't tried creating a snapshot yet, mainly because I'm gun shy
right now, and I don't want to risk imposing brain damage on the system
in the middle of the week.

I'm also experiencing bizarre behavior with this system when doing any
operations involving rapid traversal of the filesystems, which again
does not happen on any of our other systems with identical software
loaded.  The best example is to run:

	find / > /dev/null

On any other system, this just forces the system to read every directory
on the filesystem.  not very useful, but it doesn't do much more than
take 10%CPU on a P-III 800 for a little bit.  On this system (Quad
1.6GHz Xeon, HyperThreading disabled, 8GB RAM, 8GB Swap, 100GB RAID-10),
running that command will eventually choke up the machine, forcing find
and kswapd to >40%CPU (according to top), and occasionally bringing
kupdated into the mix.

I'm currently trying to figure out if the problem is with LVM, if I need
to double the swap space to 16GB, or if I need to find a new driver for
the RAID card.  As it is, any intrusive testing on this system will have
to wait until I'm physically at the location with this server, which
will likely happen on or about Sat. Oct. 19, so i can have the machine
to myself on a weekend.

I'm starting to get desperate for a solution...

--=20
Gregory K. Ade <gkade@bigbrother.net>
http://bigbrother.net/~gkade
OpenPGP Key ID: EAF4844B  keyserver: pgpkeys.mit.edu

--=-I94/leUtgERd6McDb3Aw
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA9ozrPeQUEYOr0hEsRAlzXAKC1wQ9FZE4amw4wwQyojrsm6JEC3QCeOxNw
X/wj2yuKv/POGhGBSXLF9qo=
=N+Gi
-----END PGP SIGNATURE-----

--=-I94/leUtgERd6McDb3Aw--
