Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kASKEliE005166
	for <linux-lvm@redhat.com>; Tue, 28 Nov 2006 15:14:47 -0500
Received: from mout2.freenet.de (mout2.freenet.de [194.97.50.155])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kASKEkAb004600
	for <linux-lvm@redhat.com>; Tue, 28 Nov 2006 15:14:46 -0500
Received: from [194.97.50.135] (helo=mx2.freenet.de)
	by mout2.freenet.de with esmtpa (Exim 4.62)
	(envelope-from <Richard.Kampmann@freenet.de>) id 1Gp9Lp-00009i-MU
	for linux-lvm@redhat.com; Tue, 28 Nov 2006 21:14:45 +0100
Received: from p54abcf57.dip.t-dialin.net ([84.171.207.87]:21269
	helo=mars.rkampmann.local)
	by mx2.freenet.de with esmtpsa (ID Richard.Kampmann@freenet.de)
	(TLSv1:AES256-SHA:256) (port 25) (Exim 4.62 #12) id 1Gp9Lp-0003dB-Hy
	for linux-lvm@redhat.com; Tue, 28 Nov 2006 21:14:45 +0100
From: Richard Kampmann <Richard.Kampmann@freenet.de>
Date: Tue, 28 Nov 2006 21:15:09 +0100
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart10496939.OyN0COiaYQ";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200611282115.15335.Richard.Kampmann@freenet.de>
Subject: [linux-lvm] LVM problem - how to recover?
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

--nextPart10496939.OyN0COiaYQ
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi everybody ...

I recently had a lvm crash from which I now have to recover. So now I need=
=20
your help ...

The system is a SUSE 10.1 system with actual patches.
# uname -rio
2.6.16.21-0.25-default i386 GNU/Linux
# lvm version
  LVM version:     2.02.02 (2006-02-07)
  Library version: 1.02.03 (2006-02-08)
  Driver version:  4.5.0
#

There was the unenlightened crash and before there was a volume goup spanni=
ng=20
two physical partitions (sda2, sdb2), each on one physical disk (sda, sdb).
The system froze (maybe in coincidence with some snapshot-handling) and I h=
ad=20
to press the reset button. When rebooting lvm told me he could not open the=
=20
volume group because one pv was missing. The partition looked OK when=20
checking the partition table. I tried several things - and to do a=20
vgcfgrestore but it did not help.

The volume group (system_vg) contained the root partition, so I installed a=
=20
new system on a third disc and tried to recover the old volume group.
Unfortunately when doing the pvcreate for the two physical volumes I did NO=
T=20
choose the "--zero n" switch.

=46act is: I now have the volume group containing two physical discs and tw=
o=20
physical volumes with the correct PV UUIDs. But the first sectors are zeroe=
d,=20
aren't they?

Any way to recover the LVs of the old volume group? A vgcfgrestore (YES, th=
ere=20
was a vgcfgbackup before!) does not work ... bad luck.

Ah - and all logical volumes contain Reiser Filesystems V 3.6 - they MUST=20
still be there ...

So - what could be my next steps?

Bye

Richard Kampmann

--nextPart10496939.OyN0COiaYQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBFbJjTyBq3/LsKGjcRApwOAJwOlbeodeVV6+Bx64glsodSIH6EqQCg3fPW
W14uoc/zRYPckSSJ3z/t+LA=
=v2kK
-----END PGP SIGNATURE-----

--nextPart10496939.OyN0COiaYQ--
