Subject: Re: [linux-lvm] strange behavior with 1.0.5 on Linux 2.4.19?
From: "Gregory K. Ade" <gkade@bigbrother.net>
In-Reply-To: <20021009133650.E23965@sistina.com>
References: <1033579350.6468.61.camel@gopher>
	<20021004105057.B8575@sistina.com> <1034107599.28928.105.camel@pslgregory> 
	<20021009133650.E23965@sistina.com>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-ohdbXPsbXszD8OWg+lws"
Message-Id: <1035782975.3398.128.camel@gopher>
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
Date: Sun Oct 27 22:30:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--=-ohdbXPsbXszD8OWg+lws
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2002-10-09 at 04:36, Heinz J . Mauelshagen wrote:
> <pickymode>
> True, it is not. Manual page says "OriginalLogicalVolumePath".
> </pickymode>

root@burpr(pts/0):~ 24 # lvcreate --snapshot --extents 512 --name tmp_snap =
/dev/vg00/tmp
lvcreate -- INFO: using default snapshot chunk size of 64 KB for "/dev/vg00=
/tmp_snap"
Segmentation fault
root@burpr(pts/0):~ 25 #

This is not good.  This is a system that has been recently rebooted, and
come up clean.  This i sthe very first LVM command I have run by hand
since the boot.

In terms of the other problems I was having, I think I _may_ have gotten
those fixed (i.e., things like `find /` killing the system) by some
friendly souls in the linux-kernel mailing list with a VM patch.  There
seemed to be a bug in largemem systems that was being exercised.

Now, I just rebooted the system with that patch on a fresh kernel:=20
Linux Kernel 2.4.19, patched with the VM patch, LVM 1.0.5 and Broadcom
Gigabit Ethernet patches.

I left for dinner, during which time nobody did anything to the
machine.  I came back and decided to try creating a snapshot volume of
/dev/vg00/tmp, and lvcreate segfaulted.  lvscan also segfaults, vgscan
hangs, and vgdisplay and lvdisplay seem to still work.

trying to create a test volume after that (`lvcreate --extents 512
--name testvol vg00`) simply hangs.

So, who do I give what information to so that we can trace down the base
of this problem, and get a fix?  Ask me for whatever you need from the
system, and I'll provide it if I can.

Thanks again in advance,

Gregory



--=20
Gregory K. Ade <gkade@bigbrother.net>
http://bigbrother.net/~gkade
OpenPGP Key ID: EAF4844B  keyserver: pgpkeys.mit.edu

--=-ohdbXPsbXszD8OWg+lws
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA9vMs/eQUEYOr0hEsRAt2NAKCNLYXNGIpeCG+c7GjuYak8JZLlwwCg1LOY
AA35f8at8rnff4kgSuMqH7Y=
=SVxm
-----END PGP SIGNATURE-----

--=-ohdbXPsbXszD8OWg+lws--
