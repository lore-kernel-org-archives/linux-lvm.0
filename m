Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4VB4MO24385
	for <linux-lvm@redhat.com>; Tue, 31 May 2005 07:04:22 -0400
Received: from strugglers.net (strugglers.net [212.13.198.70])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j4VB4GYJ007576
	for <linux-lvm@redhat.com>; Tue, 31 May 2005 07:04:16 -0400
Received: from andy by strugglers.net with local (Exim 4.50)
	id 1Dd4Xe-0007rZ-NP
	for linux-lvm@redhat.com; Tue, 31 May 2005 11:04:15 +0000
Date: Tue, 31 May 2005 11:04:14 +0000
From: Andy Smith <andy@strugglers.net>
Message-ID: <20050531110414.GP686@strugglers.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xXygN3QAmJYWdGtb"
Content-Disposition: inline
Subject: [linux-lvm] deadlock on snapshot creation;
	any way out without a reboot?
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


--xXygN3QAmJYWdGtb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

One of my LVs has just become unusable and I am hoping there is a
way to fix it without rebooting.

I am not sure exactly what happened, but it is possible that an
attempt was made to create a snapshot of the LV while in another
window someone had an lvremove of the same-named snapshot LV waiting
at the 'y/n' prompt.

Anyway the end result is no snapshot LV, and a source LV that
deadlocks whenever there is any attempt made to access it.

An fsck looks like this:

$ sudo e2fsck -f /dev/mainvg/admindata
e2fsck 1.37 (21-Mar-2005)

and then nothing, the e2fsck is now in state D, and has been for
half an hour or so.  top shows machine in 100% iowait, and the
e2fsck process is unkillable.

My question really is, is there any known way to get out of this
sort of situation without having to reboot?  If I reboot it means
downtime and it's not guranteed that the server will actually
complete a reboot since it may hang due to this very problem.  I may
then not be able to do anything even over serial, and there is no
remote power switch.

I'm more concerned about getting out of the 100% iowait situation
than preserving the contents of the LV, since I have backups.

debian sarge, LVM2, kernel 2.6.11.  And yes I am aware that snapshots
are experimental. :)

Thanks,
Andy

--xXygN3QAmJYWdGtb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFCnESuIJm2TL8VSQsRAmM4AKCJOSzCq/3S10cGCMTwSy66TyUqggCdFNMV
jqvnj+oQ/V8fMNNfe3LE/lk=
=4eq8
-----END PGP SIGNATURE-----

--xXygN3QAmJYWdGtb--
