Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k88FNv7g016284
	for <linux-lvm@redhat.com>; Fri, 8 Sep 2006 11:23:57 -0400
Received: from huixtocihuatl.xenguest.geekspirit.net (home.geekspirit.net
	[81.56.52.126])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k88FNtFu032021
	for <linux-lvm@redhat.com>; Fri, 8 Sep 2006 11:23:56 -0400
Received: from localhost (mictecacihuatl.xenguest.geekspirit.net
	[172.24.42.55])
	by huixtocihuatl.xenguest.geekspirit.net (Postfix) with ESMTP id
	835B3716CB
	for <linux-lvm@redhat.com>; Fri,  8 Sep 2006 17:25:07 +0200 (CEST)
Received: from huixtocihuatl.xenguest.geekspirit.net ([172.24.42.53])
	by localhost (mictecacihuatl.xenguest.geekspirit.net [172.24.42.55])
	(amavisd-new, port 10024)
	with ESMTP id CjhCyooZIMs3 for <linux-lvm@redhat.com>;
	Fri,  8 Sep 2006 17:22:35 +0200 (CEST)
Received: from bounty.rider.geekspirit.net (bounty.rider.geekspirit.net
	[172.24.42.200]) (Authenticated sender: rider)
	by huixtocihuatl.xenguest.geekspirit.net (Postfix) with ESMTP id
	9A9D171503
	for <linux-lvm@redhat.com>; Fri,  8 Sep 2006 17:24:51 +0200 (CEST)
Subject: Re: [linux-lvm] LVM metadata checksums
From: Fabien Jakimowicz <fabien@jakimowicz.com>
In-Reply-To: <20060908145527.GA29217@arvo.suso.org>
References: <20060908145527.GA29217@arvo.suso.org>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-6zW6Tn9zMNANOn9T/Cnv"
Date: Fri, 08 Sep 2006 17:23:33 +0200
Message-Id: <1157729013.9596.29.camel@bounty.rider.geekspirit.net>
Mime-Version: 1.0
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>


--=-6zW6Tn9zMNANOn9T/Cnv
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2006-09-08 at 14:55 +0000, Mark Krenz wrote:
>   Before you say, DON'T DO IT THAT WAY, let me assure you that I have my
> reasons and I'm aware of the risks. This is mostly related to my
> question about changing UUIDs of physical volumes and volume groups.
> Anyways, I thought that perhaps I could try to use hexedit to modify the
> UUID within the image file.  However, after I did this I ran into all
> the lvm commands complaining about checksum errors in the metadata.  So
> my question is, where is the checksum stored and how is it calculated.
> I noticed that there is an "LVM header near the beginning of the disk
> followed by a long string:
>=20
>  LABELONE........?... ...LVM2  001M0U7CEZK8M7l2Z4KnOtI1uSVjAu0cCFd
>=20
>  Is that last part the checksum?  What kind is it?
>=20
>=20
after a fast read of sources, i think checksum is computed here :
lib/misc/crc.c :
/* Calculate an endian-independent CRC of supplied buffer */
uint32_t calc_crc(uint32_t initial, void *buf, uint32_t size)
{
        static const uint32_t crctab[] =3D {
                0x00000000, 0x1db71064, 0x3b6e20c8, 0x26d930ac,
                0x76dc4190, 0x6b6b51f4, 0x4db26158, 0x5005713c,
                0xedb88320, 0xf00f9344, 0xd6d6a3e8, 0xcb61b38c,
                0x9b64c2b0, 0x86d3d2d4, 0xa00ae278, 0xbdbdf21c
        };
        uint32_t i, crc =3D initial;
        uint8_t *data =3D (uint8_t *) buf;

        for (i =3D 0; i < size; i++) {
                crc ^=3D *data++;
                crc =3D (crc >> 4) ^ crctab[crc & 0xf];
                crc =3D (crc >> 4) ^ crctab[crc & 0xf];
        }
        return crc;
}

Here is the call :
lib/format_text/format-text.c,139 :
        if (mdah->checksum_xl !=3D xlate32(calc_crc(INITIAL_CRC,
mdah->magic,
                                                  MDA_HEADER_SIZE -

sizeof(mdah->checksum_xl)))) {
                log_error("Incorrect metadata area header checksum");
                return NULL;
        }

--=20
Fabien Jakimowicz <fabien@jakimowicz.com>

--=-6zW6Tn9zMNANOn9T/Cnv
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQBFAYr1zTD+AjVP2VIRAnHXAJ9ZVMF49mQT6q8unfRD8zacFmrM5QCfR+tU
TAjlhvr0pJisPTOxOFm8SVM=
=ahuB
-----END PGP SIGNATURE-----

--=-6zW6Tn9zMNANOn9T/Cnv--
