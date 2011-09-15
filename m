Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p8FI0eOj003683
	for <linux-lvm@redhat.com>; Thu, 15 Sep 2011 14:00:41 -0400
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p8FI0dRU021402
	for <linux-lvm@redhat.com>; Thu, 15 Sep 2011 14:00:39 -0400
Message-ID: <4E723D29.1020209@lichtenwalder.name>
Date: Thu, 15 Sep 2011 20:00:09 +0200
From: Klaus Lichtenwalder <klaus@lichtenwalder.name>
MIME-Version: 1.0
References: <4E6FAC6C.9010207@gmail.com>
	<CAEcYNt7duxpoeRTTA=+atmrNNcrcgMmX3h4JmRf++WMSJmxz1g@mail.gmail.com>
In-Reply-To: <CAEcYNt7duxpoeRTTA=+atmrNNcrcgMmX3h4JmRf++WMSJmxz1g@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigDE4FEAF226A52CF3A71D0CF7"
Subject: Re: [linux-lvm] RHEL: special ownership for lv devices?
Reply-To: klaus@lichtenwalder.name,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Carlos Eduardo Tavares Terra <eduardo.terra@gmail.com>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigDE4FEAF226A52CF3A71D0CF7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am 14.09.2011 19:15, schrieb Carlos Eduardo Tavares Terra:
> Klaus,
> Have you tried to use the package oracleasm?
>=20
> This package installs some binaries to manipulate ASM Disks, creating
> new devices (based on the originals /dev/sd*), into /dev/oracleasm/ and=

> changing the owner of the devices.
>=20
> Oracle Database does not use raw devices in RHEL anymore, by default.
> They recommend installing this package and administrate everything by i=
t.
>=20
> http://www.oracle.com/technetwork/topics/linux/asmlib/index-101839.html=

>=20
> I hope this helps.
>=20

Carlos,

actually, oracleasm is the reason I'm asking. Oracle recommends against
using lvs, but in our domain we need to sort disks, so we want to use
different vgs to avoid human error. Checking the shell scripts from
oracle, it is clear why they don't like lvs. Not because probable
performance problems from an additional layer of complexity, but because
they use /proc/partitions to scan for disks. And vg-devices just don't
show up there...
There are versions, though, that honor their ASM_SCANORDER flag and
check the vg-Directory (SCANORDER=3D"/mapper/vg_asm*/"), but different
versions seem to not to do this.
I created a start script that mknods /dev/dm-X from
/dev/mapper/vg_asm--* devices, but I consider this a kludge...

Thanks anyway,
Klaus

--=20
------------------------------------------------------------------------
 Klaus Lichtenwalder, Dipl. Inform.,  http://www.lichtenwalder.name
 PGP Key fingerprint: BF52 72FA 1F5A 1E29 C0F8  498C C4C6 633C 2821 97DA


--------------enigDE4FEAF226A52CF3A71D0CF7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQIcBAEBAgAGBQJOcj0pAAoJEMTGYzwoIZfazxwP/1rRPKCQxKCVPx//GWY/cIKd
uwwXRUD9ju3Uj7xQrasq7bMMQJCEg5s+Ot4ZwXogAz4Po+NKUr7R6CZeE3We/hn7
XzBt+ywo0hrQLL4iUjDRDBESl52MV7XVmRg8qlimFeOgQGbFLQ/msFzegtcbZOi4
BotOOhZbexwTkZjV4tjkcJUxn76iaMC9WjTY1MizoPThOFi5ixvZQJyTIB08vBJg
KRx8rXCGMh0nnnqp0QbUL1OsRDSFkQ20TlF2PrrIpjauMfGICR2Pq3qrrJci56W+
3p+ujiPT69fRlEOq+A5zIovvl1frbniYjhJgi4zw+lW0uS8njNGpSygMBAgnHIFi
YQQPviWD50puY89skmiRG8qkJDPtZQi/5YieNpIvLS664qhY+js/2IR3cLMPYhdH
6oBd/jkVNyujk1wtPuL53IfvPXge3rCZRimKoJ0xqF4rsqKnDiXlF70TH9zog29l
VJPtq3gFKYe7YeNCWom+8xbyT5c6sMEd9q+cjQJkWKH9SAX8Mfi+RONYaqMiZ/Vh
7mm66dbPjt49KqXSlarhDx68Ti3MsH+SwN2fs2+Rw8zG2YUDG9+YEsa13Z2nGu8j
LTgkAZgxfKaSanp92oHgEApOLrbOu009Iw/BPmTqcqk5JiK1lsitMqdOLizHNxkM
GikoT6zNVx60R5cplTww
=YpAN
-----END PGP SIGNATURE-----

--------------enigDE4FEAF226A52CF3A71D0CF7--
