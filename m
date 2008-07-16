Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m6GMNGSG031149
	for <linux-lvm@redhat.com>; Wed, 16 Jul 2008 18:23:16 -0400
Received: from nlpi053.prodigy.net (nlpi053.sbcis.sbc.com [207.115.36.82])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m6GMMsFW015906
	for <linux-lvm@redhat.com>; Wed, 16 Jul 2008 18:22:54 -0400
Received: from mail.kdzbn.homelinux.net
	(adsl-75-40-253-44.dsl.klmzmi.sbcglobal.net [75.40.253.44])
	(authenticated bits=0)
	by nlpi053.prodigy.net (8.13.8 smtpauth/dk/8.13.8) with ESMTP id
	m6GMMlXw016527
	for <linux-lvm@redhat.com>; Wed, 16 Jul 2008 17:22:48 -0500
Received: from beta.mydomain ([192.168.2.237])
	by mail.kdzbn.homelinux.net with esmtp (Exim 4.62)
	(envelope-from <bryan@kadzban.is-a-geek.net>) id 1KJFOa-0006m6-OA
	for linux-lvm@redhat.com; Wed, 16 Jul 2008 18:22:48 -0400
Message-ID: <487E74B8.7010904@kadzban.is-a-geek.net>
Date: Wed, 16 Jul 2008 18:22:48 -0400
From: Bryan Kadzban <bryan@kadzban.is-a-geek.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Backup of ROOT Partition.
References: <48694ABE.2080307@globetrotter.net>	<486A0EFE.8020805@kadzban.is-a-geek.net>	<486B8550.6070605@globetrotter.net>
	<487E6219.7030507@globetrotter.net>
In-Reply-To: <487E6219.7030507@globetrotter.net>
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
> I get the folowing error:
> 
> Insufficient free extents (1) in volume group VolGroup00: 19 required
> 
> It works find if I do it with -L20M.

You need to either grow the physical volume if possible, add extra
physical volumes to the volume group (and therefore grow the volume
group), or shrink the existing logical volume.

> according to 'df' I have plenty of space for data.

Yeah, but that's not the space that logical volumes use.

LVs are allocated from inside the group-of-physical-volumes in a VG.
Think of LVs like partitions: if you have tons of space available on the
FS that's inside a partition, that doesn't necessarily mean you can add
a new partition to the disk.  You'll have to either shrink the existing
LV, or add more physical volumes to the group.

I believe either can be done while the FS is mounted.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFIfnS4S5vET1Wea5wRA2bLAKDbIXtd9c56WFCWM8hf2Au5t7D/TgCgoV0k
BPTR74O1ES4C1bFJKdfhESI=
=p+QB
-----END PGP SIGNATURE-----
