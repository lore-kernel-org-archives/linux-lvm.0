Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4LFwN0T031349
	for <linux-lvm@redhat.com>; Wed, 21 May 2008 11:58:24 -0400
Received: from boomer.trellisnet.co.uk (sebastian-int.corp.redhat.com
	[172.16.52.221])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m4LFwMUg022591
	for <linux-lvm@redhat.com>; Wed, 21 May 2008 11:58:23 -0400
Message-ID: <48344659.9040401@redhat.com>
Date: Wed, 21 May 2008 16:57:13 +0100
From: Thomas Ellis <tellis@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Restoring data from a SAN based clone/snapshot
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
To: linux-lvm@redhat.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi all,

When you take a hardware based clone of a SAN LUN containing a PV/VG and present it to a
system already using the original PV/VG, LVM notices that the both have the same UUID's
and chooses to use one rather than the other.
Using the clone and copying data from it is not initially obvious, so I've added a
procedure to the wiki for $subject:

http://sources.redhat.com/lvm2/wiki/HardwareSnapshotRestore

Please take a look and let me know what your think, feel free to modify/update as you feel
necessary.

regards,

Tom

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkg0RlkACgkQOZBvfQY8NVp2EgCfYzUno36yrBlzjzmoD0aD7Gkx
SoIAn0Jz1mlrzuV+Q9RiRbwKmdFIquXL
=C9NG
-----END PGP SIGNATURE-----
