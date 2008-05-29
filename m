Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4TNCSRH029555
	for <linux-lvm@redhat.com>; Thu, 29 May 2008 19:12:28 -0400
Received: from lug-owl.de (lug-owl.de [195.71.106.12])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m4TNCEdw029122
	for <linux-lvm@redhat.com>; Thu, 29 May 2008 19:12:14 -0400
Date: Fri, 30 May 2008 01:12:13 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Message-ID: <20080529231213.GY19431@lug-owl.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Ca23f2aBZR6YDKM9"
Content-Disposition: inline
Subject: [linux-lvm] Distributed LVM/filesystem/storage
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
To: linux-lvm@redhat.com


--Ca23f2aBZR6YDKM9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

I'm just thinking about using my friend's overly empty harddisks for a
common large filesystem by merging them all together into a single,
large storage pool accessible by everybody.

However I still fail to find a good approach. One initial idea was to
export all physical volumes (partitions or full disks) vie NBD, join
them all on a single machine into one VG/LV, create a filesystem and
re-export that via NFS/SMB/...  However, all data would need to go
through the net twice. While speed isn't the most important thing here
(but storage is!), that's way suboptimal.

I also thought about something like tahoe (www.allmydata.org), or
other P2P based approaches like Freenet, but I'm not sure if that's a
good start.

It would be nice to see if anybody of you did the same before (merging
the free space from a lot computers into one commonly used large
filesystem), if it was successful and what techniques
(LVM/NBD/DM/MD/iSCSI/Tahoe/Freenet/Other P2P/...) you used to get there,
and how well that worked out in the end.

Thanks, JBG

--=20
      Jan-Benedict Glaw      jbglaw@lug-owl.de              +49-172-7608481
Signature of:               http://www.eyrie.org/~eagle/faqs/questions.html
the second  :

--Ca23f2aBZR6YDKM9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIPzhNHb1edYOZ4bsRAkMhAJ955A8amVdOpiac6W85jkWEguiqWgCdHEFd
9sWzBA+VfUm9Rvf4yemkdUk=
=eqCe
-----END PGP SIGNATURE-----

--Ca23f2aBZR6YDKM9--
