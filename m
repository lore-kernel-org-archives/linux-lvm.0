Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m61B3j2B020774
	for <linux-lvm@redhat.com>; Tue, 1 Jul 2008 07:03:45 -0400
Received: from nlpi053.prodigy.net (nlpi053.sbcis.sbc.com [207.115.36.82])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m61B3W8F023121
	for <linux-lvm@redhat.com>; Tue, 1 Jul 2008 07:03:32 -0400
Received: from mail.kdzbn.homelinux.net
	(adsl-75-40-253-44.dsl.klmzmi.sbcglobal.net [75.40.253.44])
	(authenticated bits=0)
	by nlpi053.prodigy.net (8.13.8 smtpauth/dk/8.13.8) with ESMTP id
	m61B3QhY028252
	for <linux-lvm@redhat.com>; Tue, 1 Jul 2008 06:03:27 -0500
Received: from beta.mydomain ([192.168.2.237])
	by mail.kdzbn.homelinux.net with esmtp (Exim 4.62)
	(envelope-from <bryan@kadzban.is-a-geek.net>) id 1KDddu-0003x1-6Y
	for linux-lvm@redhat.com; Tue, 01 Jul 2008 07:03:26 -0400
Message-ID: <486A0EFE.8020805@kadzban.is-a-geek.net>
Date: Tue, 01 Jul 2008 07:03:26 -0400
From: Bryan Kadzban <bryan@kadzban.is-a-geek.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Backup of ROOT Partition.
References: <48694ABE.2080307@globetrotter.net>
In-Reply-To: <48694ABE.2080307@globetrotter.net>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: RIPEMD160

Jean-Philippe Villeneuve wrote:
> I would like to know if I can backup all my system partitions(ROOT 
> included) using a snapshot?

Depends on what you mean by "backup [...] using a snapshot".

If you mean taking a snapshot, then mounting it somewhere and pointing
your backup software to that mount point, then unmounting and deleting
the snapshot after the backup is done, then yes, it should work fine.

If you mean taking a snapshot and leaving it around forever *as* the
backup, then that will work -- but the more backups you have, the slower
LVM gets (currently).  This is because of the copy-on-write code: every
time the root logical volume changes, all of the snapshots need to be
updated.  If you only have one or two snapshots, this isn't so bad, but
if you had (say) 20, writing to your real root LV would slow to a crawl.

There is some code hanging around somewhere that I *think* is supposed
to handle this better, but I don't know the status...
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFIag79S5vET1Wea5wRA6aRAKCuFkT9BXlmtiyke1bFPw5CJYGtRQCeI27D
++3wT6+y0d3oYjmxEVA2NmY=
=1UlT
-----END PGP SIGNATURE-----
