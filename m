Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p7V9Qu5o020914
	for <linux-lvm@redhat.com>; Wed, 31 Aug 2011 05:26:56 -0400
Received: from contumacia.investici.org (contumacia.investici.org
	[178.255.144.35])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p7V9QpOZ009117
	for <linux-lvm@redhat.com>; Wed, 31 Aug 2011 05:26:51 -0400
Received: from [178.255.144.35] (contumacia [178.255.144.35]) (Authenticated
	sender: benry@autistici.org) by localhost (Postfix) with
	ESMTPSA id 8BE80E8152
	for <linux-lvm@redhat.com>; Wed, 31 Aug 2011 09:26:48 +0000 (UTC)
Message-ID: <4E5DFE51.7090304@autistici.org>
Date: Wed, 31 Aug 2011 11:26:41 +0200
From: benry <benry@autistici.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] simple LVM disk failure recover
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,
I'm quite new to LVM and I think to have a quite simple problem, but I
can not find a clear answer to it and, since it is a quite critical
problem, I'm asking to you for the right solution before messing up
everything.

I have an LVM volume made by two raid sda and sdb, with an XFS
filesystem on it; sda had a failure and its data is completely lost...
what I would like to do is to restore at least what is contained in sdb.
(The situation displayed by "lvdisplay -mP" is reported at the end of
this mail).

I tried this command: "vgchange -P -a y raid", but the device
/dev/raid/data does not exist and the /dev/mapper/raid-data I used to
mount the volume seems to be not accessible:

# xfs_check /dev/mapper/raid-data
xfs_check: /dev/mapper/raid-data is invalid (cannot read first 512 bytes)

Is the data contained in sdb recoverable? (as far as I understood, it
should) And if it is the case, which should be the right procedure to
restore it?


Thanks in advance for your help.

Enrico

# lvdisplay -mP
  Partial mode. Incomplete volume groups will be activated read-only.
  /dev/sda: read failed after 0 of 4096 at 0: Input/output error
  /dev/sda: read failed after 0 of 4096 at 0: Input/output error
  /dev/sda: read failed after 0 of 4096 at 19989989883904: Input/output
error
  /dev/sda: read failed after 0 of 4096 at 19989989941248: Input/output
error
  /dev/sda: read failed after 0 of 4096 at 0: Input/output error
  /dev/sda: read failed after 0 of 4096 at 4096: Input/output error
  /dev/sda: read failed after 0 of 4096 at 0: Input/output error
  Couldn't find device with uuid 'AkLdC5-wPgi-hDbv-Sqf3-2wBv-hBzu-2OhDaQ'.
  /dev/sda: read failed after 0 of 4096 at 0: Input/output error
  /dev/sda: read failed after 0 of 4096 at 0: Input/output error
  Couldn't find device with uuid 'AkLdC5-wPgi-hDbv-Sqf3-2wBv-hBzu-2OhDaQ'.
  --- Logical volume ---
  LV Name                /dev/raid/data
  VG Name                raid
  LV UUID                4rjFt7-ZuQX-f3n4-iDVR-2gJv-5cFf-77gG5f
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                36.36 TB
  Current LE             9531968
  Segments               2
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           254:0

  --- Segments ---
  Logical extent 0 to 4765983:
    Type                linear
    Physical volume     unknown device
    Physical extents    0 to 4765983

  Logical extent 4765984 to 9531967:
    Type                linear
    Physical volume     /dev/sdb1
    Physical extents    0 to 4765983
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk5d/lEACgkQOideAxdXzI87ZACgll/dlythiZi3REwdJRMwj5Vf
I2kAnir0p+Owr+2Hnanzu2K5Zf1Gg0+k
=Odjy
-----END PGP SIGNATURE-----
