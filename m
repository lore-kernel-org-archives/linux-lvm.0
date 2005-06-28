Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5SAMMu24082
	for <linux-lvm@redhat.com>; Tue, 28 Jun 2005 06:22:22 -0400
Received: from postman.arcor.de (postman2.arcor-online.net [151.189.20.157])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j5SAM7GS019010
	for <linux-lvm@redhat.com>; Tue, 28 Jun 2005 06:22:12 -0400
Received: from bongo.freakout.de (freakout.homeip.net [217.173.146.67])
	(authenticated bits=0)
	by postman.arcor.de (8.13.4/8.13.4) with ESMTP id j5SAM6Px020666
	for <linux-lvm@redhat.com>; Tue, 28 Jun 2005 12:22:06 +0200 (MEST)
Received: from smtphost (bongo.freakout.de [192.168.7.68])
	by bongo.freakout.de (8.13.4/8.13.3) with ESMTP id j5SAHboW019307
	for linux-lvm@redhat.com; Tue, 28 Jun 2005 12:17:37 +0200
Date: Tue, 28 Jun 2005 12:17:37 +0200
Message-Id: <200506281017.j5SAHboW019307@bongo.freakout.de>
From: Axel Reinhold <lvm@freakout.de>
Subject: [linux-lvm] enlarge a physical partition
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hello,

when i create a lvm1-metadata volume group with lvm2-tools/dm-mod
lvm-mod with lvm1-tools cannot vgscan this volume group - it complains
about inconsistencies - the vg was created with options:

devices {

    # Where do you want your volume groups to appear ?
    dir = "/tmp/lvm"

because while creating the volume group i must boot with
read-only root filesystem. It seams the lvm1 sees the original
device files! Even exporting the vg and importing doesn't help.

Any idea out there?

Axel
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1-PB (GNU/Linux)

iD8DBQFCwSPBHQ9JwE2bDw0RAlc9AKCrlmXXqEvEL+IIPJ2Kfi3GmdK26wCg9Jpd
ord21DH5DtifdFMqc+FiDss=
=NsZ1
-----END PGP SIGNATURE-----
