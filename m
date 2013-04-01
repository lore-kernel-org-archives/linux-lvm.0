Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r31CNXHU025591
	for <linux-lvm@redhat.com>; Mon, 1 Apr 2013 08:23:34 -0400
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r31CNTNC021739
	for <linux-lvm@redhat.com>; Mon, 1 Apr 2013 08:23:29 -0400
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gllg-linux-lvm@m.gmane.org>) id 1UMdmA-0006tk-FO
	for linux-lvm@redhat.com; Mon, 01 Apr 2013 14:23:50 +0200
Received: from d67-193-232-12.home3.cgocable.net ([67.193.232.12])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Mon, 01 Apr 2013 14:23:50 +0200
Received: from brian by d67-193-232-12.home3.cgocable.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Mon, 01 Apr 2013 14:23:50 +0200
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Date: Mon, 01 Apr 2013 08:23:14 -0400
Message-ID: <kjbu7f$5pd$1@ger.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="----enig2UCBMELSHVFVXVDVDRQXA"
Subject: [linux-lvm] Insufficient free space: 1 extents needed,
 but only 0 available with 32.83g available
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2UCBMELSHVFVXVDVDRQXA
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I have a VG:

  VG          #PV #LV #SN Attr   VSize   VFree=20
  rootvol_tmp   1  26   0 wz--n-  74.40g 32.83g

Which has an LV in it which has a bad disk block on it.  Per previous
discussions here I have an LV into which I can remap PEs with bad blocks =
on them:

# lvdisplay --maps /dev/rootvol_tmp/badblocks
  --- Logical volume ---
  LV Name                /dev/rootvol_tmp/badblocks
  VG Name                rootvol_tmp
  LV UUID                oRCTFY-XNxh-3FA5-8lUG-FsOG-GjaO-giAcIu
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                4.00 MiB
  Current LE             1
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           252:2
  =20
  --- Segments ---
  Logical extent 0 to 0:
    Type		linear
    Physical volume	/dev/sda2
    Physical extents	2805 to 2805

As you can see, it has a PE in it already.  I am trying to map another
PE into it but getting an error:

# lvextend --alloc anywhere /dev/rootvol_tmp/badblocks -l +1 /dev/sda2:28=
12
  Extending logical volume badblocks to 8.00 MiB
  Insufficient free space: 1 extents needed, but only 0 available

Clearly there is something wrong with my syntax but I'm not quite sure
what it is.  Any ideas?

Much thanks!

b.

P.S. Please, no lectures about replacing the disk.  I understand the risk=
s
of operating on a disk that is starting to show signs of wear.  All of
the data on this disk is backed up twice daily and anything lost
between those backups will not be missed.  It's just not feasible for me
to replace this disk at this time.  Thanks.


------enig2UCBMELSHVFVXVDVDRQXA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlFZfDMACgkQl3EQlGLyuXATCACfSkqXUME53bZ5wqx7N8k2VR3w
vC8Ani6Xl2HE5ueySNYk5XuA5oZMoe0U
=0ZfN
-----END PGP SIGNATURE-----

------enig2UCBMELSHVFVXVDVDRQXA--
