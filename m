Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r32DHK7K006584
	for <linux-lvm@redhat.com>; Tue, 2 Apr 2013 09:17:20 -0400
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r32DHIT6024109
	for <linux-lvm@redhat.com>; Tue, 2 Apr 2013 09:17:18 -0400
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gllg-linux-lvm@m.gmane.org>) id 1UN15n-0004W1-PK
	for linux-lvm@redhat.com; Tue, 02 Apr 2013 15:17:39 +0200
Received: from d67-193-232-12.home3.cgocable.net ([67.193.232.12])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Tue, 02 Apr 2013 15:17:39 +0200
Received: from brian by d67-193-232-12.home3.cgocable.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Tue, 02 Apr 2013 15:17:39 +0200
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Date: Tue, 02 Apr 2013 09:17:02 -0400
Message-ID: <kjeloc$hvh$1@ger.gmane.org>
References: <kjbu7f$5pd$1@ger.gmane.org> <515AC642.7000609@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="----enig2KGPMSPXFRTBIVRGGFBFS"
In-Reply-To: <515AC642.7000609@redhat.com>
Subject: Re: [linux-lvm] Insufficient free space: 1 extents needed,
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
------enig2KGPMSPXFRTBIVRGGFBFS
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 13-04-02 07:51 AM, Marian Csontos wrote:
>=20
> You said there is a LV containing the bad block. You can not have a
> block belonging to two LVs

Ah ha!  The missing link.  Interestingly enough, as I was going through
this process I had a nagging feeling that I somehow needed to release
the block from the existing LV.

> Use something like `pvmove --alloc anywhere /dev/sda2:2812` first.

Yeah.  That did the trick.

> I fully respect your choice, I myself have enough of throw away data
> like VMs...

Thanks.

> Just for convenience, if you can spare more than 2 blocks be more
> generous and disable larger extent of blocks - those disk errors like t=
o
> spread... (or allocate to LV which loosing will be least )

Yeah.  I don't mind handling them piecemeal.  Like I said, nothing on
this machine is irreplaceable.

> Sometimes backups are not backups. To check if the backups work, have
> you ever tried to recover *all* data from those backups?

But of course!  You can't really call it a backup unless you have done a
successful restore.  I had to restore a machine from this same backup
only a few weeks ago.

> By size of the disk looks like notebook.

Nope.  Just old enough that that size disk was "common" when it was built=
=2E

> Are you using disk encryption?

Nope.

> (Loosing LUKS header could be rather painful!

Indeed.  But not encrypting.  In any case, losing the LUKS header might
be just enough excuse to restore to bare-metal.

> And also depending on FS you may loose more than just few files.

Yeah.  Pass on XFS and Reiserfs.  Both have lost me too much data to use
again.  Fortunately ext{3,4} don't have such catastrophic failures just
losing a block or two.

Cheers,
b.



------enig2KGPMSPXFRTBIVRGGFBFS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlFa2k8ACgkQl3EQlGLyuXA+bQCgr9alzGsVfLlpxRKQOUX0P7N6
RJwAoIwRo5O3yri/p5wkZzOEGT+1CceL
=poAN
-----END PGP SIGNATURE-----

------enig2KGPMSPXFRTBIVRGGFBFS--
