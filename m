Date: Thu, 30 Aug 2001 07:35:52 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] extending striped lv
Message-ID: <20010830073552.B19415@sistina.com>
References: <20010823232349.9882.qmail@web20306.mail.yahoo.com> <20010824112859.A10992@dragon.blacknet.de> <20010827124212.C1308@sistina.com> <3B8B78AC.164BDA67@sap.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="0ntfKIWw70PvrIHh"
Content-Disposition: inline
In-Reply-To: <3B8B78AC.164BDA67@sap.com>; from Jan.Schreckenbach@sap.com on Tue, Aug 28, 2001 at 12:55:40PM +0200
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

--0ntfKIWw70PvrIHh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 28, 2001 at 12:55:40PM +0200, Jan Schreckenbach wrote:
> does this mean I can initially build a striped LV from two smaller
> disks, let me say sda and sdb and later move the LE from sda to sdc
> and from sdb to sdd (where sdc and sdb a bigger than sda/sdb)?=20

Yes, that should work.  Then the LEs would be just on sdc and sdd, and sda
and sdb would be empty.

> It is to be said that the performance of md RAID0 is somewhat better
> than from striped LV's but I would prefer LVM if I could extend
> a striped LV without rebuilding RAID/restoring data.

Well, like I said, if you used md RAID0 underneath LVM, you could stripe
across, say, sda and sdb,  and then creat your LV on top of the md device,
then when you wanted to extend it, create a striped md device across sdc and
sdd and and extend the VG/LV to that md device.

Anyway, it really depends upon your application.  If you're really concerned
about speed, you'd probably go with hardware RAID0 anyway, but that's a who=
le
different discussion.

Regards,
--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-638-0500
1313 5th St SE, Suite 111              Fax:    612-638-0500
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2=
648
Get my key at: http://people.sistina.com/~lewis/gpgkey
 (Unfortunately, the PKS-type keyservers do not work with multiple sub-keys)

-----Begin Obligatory Humorous Quote----------------------------------------
Behind every good computer -- is a jumble of wires 'n stuff.
-----End Obligatory Humorous Quote------------------------------------------

--0ntfKIWw70PvrIHh
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7jjMopE6/iGtdjLERAjXiAJ43howNKnXSOP7l+F6IA5xH5OwREACbB7W9
FQGEYZky2DGKzo88UEk/xH0=
=5Tt/
-----END PGP SIGNATURE-----

--0ntfKIWw70PvrIHh--
