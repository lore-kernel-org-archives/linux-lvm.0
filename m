Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p8CKUZBK010759
	for <linux-lvm@redhat.com>; Mon, 12 Sep 2011 16:30:35 -0400
Received: from serenity (serenity.lbt-schoeftner.at [78.47.33.233])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p8CKUUBW010669
	for <linux-lvm@redhat.com>; Mon, 12 Sep 2011 16:30:30 -0400
Received: from [10.73.0.9] (helo=feynman)
	by serenity with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.74)
	(envelope-from <rmu@unfoo.net>) id 1R3D9A-0003dJ-Kt
	for linux-lvm@redhat.com; Mon, 12 Sep 2011 22:30:29 +0200
Received: from dyson.unfoo.rmu ([10.73.1.2]) by feynman with esmtp (Exim 4.74)
	(envelope-from <rmu@unfoo.net>) id 1R3D95-0001yw-4s
	for linux-lvm@redhat.com; Mon, 12 Sep 2011 22:30:23 +0200
Message-ID: <4E6E6BDE.1040301@unfoo.net>
Date: Mon, 12 Sep 2011 22:30:22 +0200
From: =?ISO-8859-1?Q?Robert_Sch=F6ftner?= <rmu@unfoo.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] harddisk dies while pvmove is in progress
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

hi!

i recently noticed some read errors off of one of my "storage" 
harddisks. layout was something like 1*2tb + 1*1,5tb in a linear 
mapping, 1 VG (storage_1), 2 LVs (shares, homevideo). the 1,5gig 
harddisk failed.

so i ordered some disks, built a raid5 out of 4 2tb disks, and added it 
to storage_1. I pvmoved the 2tb disk to the new raid. then i tried to 
move the failed 1,5tb disk to the new raid. this process stopped when 
pvmove was at about 50%, when the drive went completely dead. server was 
rebooted.

it seems pvmove was able to move eveything of LV shares to the raid.

situation as of now:

* LVs fail to activate (needed lvchange -a y --partial)
* after activation, homevideo is completely dead, shares seems to work 
without any problems (though it generates lots of device-mapper: raid1: 
Unable to read primary mirror during recovery messages)
* percentage-counter counting, unsure if actual disk activity happens
* pvmove complains:

# pvmove
   /dev/dm-4: read failed after 0 of 4096 at 0: Eingabe-/Ausgabefehler
   /dev/dm-4: read failed after 0 of 4096 at 971224580096: 
Eingabe-/Ausgabefehler
   /dev/dm-4: read failed after 0 of 4096 at 971224637440: 
Eingabe-/Ausgabefehler
   /dev/dm-4: read failed after 0 of 4096 at 4096: Eingabe-/Ausgabefehler
   /dev/dm-5: read failed after 0 of 4096 at 1500298280960: 
Eingabe-/Ausgabefehler
   /dev/dm-5: read failed after 0 of 4096 at 1500298338304: 
Eingabe-/Ausgabefehler
   Couldn't find device with uuid u1F6AW-pvCR-gM1c-O1c5-oWa0-s1Nd-oKTkf5.
   Cannot change VG storage_1 while PVs are missing.
   Consider vgreduce --removemissing.


# lvs -a -o +devices storage_1
   /dev/dm-4: read failed after 0 of 4096 at 0: Eingabe-/Ausgabefehler
   /dev/dm-4: read failed after 0 of 4096 at 971224580096: 
Eingabe-/Ausgabefehler
   /dev/dm-4: read failed after 0 of 4096 at 971224637440: 
Eingabe-/Ausgabefehler
   /dev/dm-4: read failed after 0 of 4096 at 4096: Eingabe-/Ausgabefehler
   /dev/dm-5: read failed after 0 of 4096 at 1500298280960: 
Eingabe-/Ausgabefehler
   /dev/dm-5: read failed after 0 of 4096 at 1500298338304: 
Eingabe-/Ausgabefehler
   Couldn't find device with uuid u1F6AW-pvCR-gM1c-O1c5-oWa0-s1Nd-oKTkf5.
   LV        VG        Attr   LSize Origin Snap%  Move           Log 
Copy%  Convert Devices
   homevideo storage_1 -wI-a- 
1,08t                                                 pvmove0(126141)
   homevideo storage_1 -wI-a- 
1,08t                                                 /dev/md127(553732)
   [pvmove0] storage_1 p-C-ao 1,36t               unknown device      
38,07         unknown device(0),/dev/md127(604932)
   [pvmove0] storage_1 p-C-ao 1,36t               unknown device      
38,07         unknown device(126141),/dev/md127(731073)
   shares    storage_1 -wI-a- 
2,59t                                                 /dev/md127(128000)
   shares    storage_1 -wI-a- 
2,59t                                                 pvmove0(0)
   shares    storage_1 -wI-a- 
2,59t                                                 /dev/md127(485699)
   shares    storage_1 -wI-a- 
2,59t                                                 /dev/md127(0)

# dmsetup table
storage_1-pvmove0-missing_1_0: 0 1896923136 error
storage_1-shares: 0 2930270208 linear 9:127 1048579072
storage_1-shares: 2930270208 1033347072 linear 252:5 0
storage_1-shares: 3963617280 557326336 linear 9:127 3978849280
storage_1-shares: 4520943616 1048576000 linear 9:127 3072
storage_1-homevideo: 0 1896923136 linear 252:5 1033347072
storage_1-homevideo: 1896923136 419430400 linear 9:127 4536175616

# dmsetup info -c
storage_1-pvmove0             252   5 L--w    2    2      0 
LVM-ONKgAr1yc19fIeDyMClPFjDv92vxDEAFyOZtSj8iJexF2g6PMNRff3rYytIZ5RYJ
storage_1-pvmove0-missing_1_0 252   4 L--w    1    1      0 
LVM-ONKgAr1yc19fIeDyMClPFjDv92vxDEAFyOZtSj8iJexF2g6PMNRff3rYytIZ5RYJ-missing_1_0
storage_1-shares              252   6 L--w    0    4      0 
LVM-ONKgAr1yc19fIeDyMClPFjDv92vxDEAFvbEPv7JJKoctUb2kNtGqjFrfsrHiS0v3
storage_1-homevideo           252   7 L--w    0    2      0 
LVM-ONKgAr1yc19fIeDyMClPFjDv92vxDEAFwFm52QuLABa7OKlHdYp3yEe8wxp6K07I

# dmsetup status
storage_1-pvmove0: 0 1033347072 linear
storage_1-pvmove0: 1033347072 1896923136 mirror 2 252:4 9:127 
89145/1852464 1 SA 1 core
storage_1-pvmove0-missing_1_0: 0 1896923136 error
storage_1-shares: 0 2930270208 linear
storage_1-shares: 2930270208 1033347072 linear
storage_1-shares: 3963617280 557326336 linear
storage_1-shares: 4520943616 1048576000 linear
storage_1-homevideo: 0 1896923136 linear
storage_1-homevideo: 1896923136 419430400 linear

[irrelevant VGs removed from output]

So, LV homevideo is definitely lost, but shares seems to be OK, modulo 
the "running"/interrupted pvmove. Is there a way to clean up this mess 
without creating another LV and copying the contents of shares over?

thanx
   Robert
