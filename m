Date: Mon, 1 Oct 2001 08:01:14 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] [BUG] vgscan and removeable scsi disks
Message-ID: <20011001080114.B29215@sistina.com>
References: <20010929113728.02CC8AD2A@oscar.casa.dyndns.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="GID0FwUMdk1T2AWN"
Content-Disposition: inline
In-Reply-To: <20010929113728.02CC8AD2A@oscar.casa.dyndns.org>; from tomlins@CAM.ORG on Sat, Sep 29, 2001 at 07:37:27AM -0400
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
To: linux-lvm@sistina.com

--GID0FwUMdk1T2AWN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 29, 2001 at 07:37:27AM -0400, Ed Tomlinson wrote:
> I just had an lvm problem that triggered softdog to reboot my box.  I hav=
e a
> digital camera and a smartmeadia reader.  Both the camera and the reader =
can
> appear as sbd and/or sda.  Running a vgscan after I have inserted/mounted=
,=20
> unmounted/removed these devices can cause vgscan to loop, or worst yet, to
> stall the system (and trigger the watchdog code...).

Hmm...looks like you're seeing the /proc/partitions error in 2.4.10.  :)
Before trying to run vgscan, try catting /proc/partitions after you have
inserted/mounted, unmounted/removed these devices.  I believe it is an issue
with the SCSI layer somehow.

> 1. Its obvious that vgscan needs better error checking/handling - once it=
 gets
> an error it should stop trying the device.
>=20
> 2. It would be a good idea to be able to supply vgscan with a backlist.  =
ie.=20
> under no circumstances should it look at sda or sdb on my box.  Think of =
a box
> with a defective drive you cannot replace just yet...

This is being addressed in the LVM2 experimental tree, but I don't know that
it will get into LVM 1.0x

Regards,
--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-638-0500
1313 5th St SE, Suite 111              Fax:    612-638-0500
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 60F3 160D C0D5 2C4B 751B  4FF9 6F67 E9BC 44CD D=
E95

-----Begin Obligatory Humorous Quote----------------------------------------
Hope is NOT a thing with feathers, the thing with feathers is my nephew,
and I have to take him to a specialist in Zurich. - Woody Allen
-----End Obligatory Humorous Quote------------------------------------------

--GID0FwUMdk1T2AWN
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7uGkab2fpvETN3pURAjL9AJ0bfmT5eEPLrRGElGKpQkmmqFA+TwCfU28T
pEspSfH/n1+wwiqt+FEpSYo=
=/97l
-----END PGP SIGNATURE-----

--GID0FwUMdk1T2AWN--
