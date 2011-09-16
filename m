Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p8GItW62009835
	for <linux-lvm@redhat.com>; Fri, 16 Sep 2011 14:55:32 -0400
Received: from mail-fx0-f46.google.com (mail-fx0-f46.google.com
	[209.85.161.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p8GItVBe025398
	for <linux-lvm@redhat.com>; Fri, 16 Sep 2011 14:55:31 -0400
Received: by fxe4 with SMTP id 4so2832976fxe.33
	for <linux-lvm@redhat.com>; Fri, 16 Sep 2011 11:55:30 -0700 (PDT)
Message-ID: <4E739B9A.3040608@gmail.com>
Date: Fri, 16 Sep 2011 20:55:22 +0200
From: Klaus Lichtenwalder <lichtenwalder@gmail.com>
MIME-Version: 1.0
References: <4E6FAC6C.9010207@gmail.com>
	<CAEcYNt7duxpoeRTTA=+atmrNNcrcgMmX3h4JmRf++WMSJmxz1g@mail.gmail.com>
	<4E723D29.1020209@lichtenwalder.name>
	<alpine.LRH.2.00.1109161318530.23537@bmsred.bmsi.com>
In-Reply-To: <alpine.LRH.2.00.1109161318530.23537@bmsred.bmsi.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig1863A06EB0E5293DA527A15F"
Subject: Re: [linux-lvm] RHEL: special ownership for lv devices?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig1863A06EB0E5293DA527A15F
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am 16.09.2011 19:19, schrieb Stuart D. Gathman:
> On Thu, 15 Sep 2011, Klaus Lichtenwalder wrote:
>=20
>> I created a start script that mknods /dev/dm-X from
>> /dev/mapper/vg_asm--* devices, but I consider this a kludge...
>=20
> Wouldn't symlinks be safer?
>=20

Stuart,

sorry for me being clueless, but why do you think symlinks being safer?
I keep the dm-X X number consisten with the minor number of the device.

Klaus

--=20
------------------------------------------------------------------------
 Klaus Lichtenwalder, Dipl. Inform.,  http://www.lichtenwalder.name
 PGP Key fingerprint: BF52 72FA 1F5A 1E29 C0F8  498C C4C6 633C 2821 97DA


--------------enig1863A06EB0E5293DA527A15F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQIcBAEBAgAGBQJOc5uaAAoJEMTGYzwoIZfavFYQAK2BAIQ0AOfaAeksXxqoqbPG
P5mY3jxiT1JYggXvoKteYnGbtcez8CarQmw7UYster4WSCphDliPQgA7d9rNKHI/
A3ra5iGjr3lJm4P3kjEIWzOjzYBD5eu40nxwfdHeXgqUiRDbWrrGMu8h/JHaJWmY
yOWexUTlxlBdmQGQIpqfasqATJGSCOC2fNZ7iPl3PVH2Up/Tuh2DuxgKpvD9BotG
TN+tCE+4wLTpWB8i1XAu2UrH3+li3RRERNqmJfwMVAG1JoRYvQGHXVlst86D50rc
jQjt4Js9k6GNMLPbTUPVcOcP2beZ0CSRRQVLJYwNJprxm4exYgx5MKnm0FPKOzV/
hzHny8dL3IXA+f6uVvEosF26dhyqFkOPieRnv07CWmaGW5eMLiQZFZNgr6a992zs
KFMwv+nn3djyOxIekgjR/xNIlzm+mhesmswNqAlJJsorSOMyDy1/uELcguzH9f3m
Wwgmj1vyGOnhGSiCbRDZBC1c58vPbSuqgXlEHPI/zLj2JE6+QXKC86QLTLervvoF
T307OhGtJL0zitWJPJ90vKSHp+8F4K3D01YjMG55PWm5kP+Xj8NWV1/KkWe2deFB
WHAQ45Fc7DIQEipuWGyuPbdKTI83W78dYVExw+bw48xzbb9sLzfMSyqiL6gPZ2VC
bI6lamDD1ftUXZxAxRFL
=UURW
-----END PGP SIGNATURE-----

--------------enig1863A06EB0E5293DA527A15F--
