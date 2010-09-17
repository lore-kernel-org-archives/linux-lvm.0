Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o8HKpxT2014052
	for <linux-lvm@redhat.com>; Fri, 17 Sep 2010 16:51:59 -0400
Received: from smtp02-01.atm.binero.net (lb-smtp01.atm.binero.net
	[195.74.38.28] (may be forged))
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o8HKphXs005414
	for <linux-lvm@redhat.com>; Fri, 17 Sep 2010 16:51:44 -0400
Received: from [192.168.21.2] (c-b21d827f-74736162.cust.telenor.se
	[178.29.130.127])
	by smtp02-01.atm.binero.net (Postfix) with ESMTPSA id AEC6311630E
	for <linux-lvm@redhat.com>; Fri, 17 Sep 2010 22:51:39 +0200 (CEST)
From: Turbo Fredriksson <turbo@bayour.com>
Content-Transfer-Encoding: 7bit
Date: Fri, 17 Sep 2010 22:51:36 +0200
References: <E46A566A-CFC4-46D8-838F-5B3350ECD2A0@bayour.com>
Message-Id: <CB664148-9647-42F0-9A07-2407AD8C0DD2@bayour.com>
Mime-Version: 1.0 (Apple Message framework v1081)
Subject: [linux-lvm] LVM - pvmove problems
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

I think I've just fucked up my LVM device...


I have three 500Gb disks and have now bought
a new 1.5Tb that I was going to move all the
data from the three to and then retire the
three 500Gb disks...
I've done this exact same thing succesfully
before..


I started the pvmove yesterday (on disk 1). Then
the machine crashed... Booted it up again and
ran the pvmove again. It (pvmove) said that
there's already a pvmove running. The command
I just ran is counting up from 0.0% up to 100%
(even though it was about finished when it
crashed). This move took about 15h...


Then this shows up:

----- s n i p -----
[...]
 /dev/md7: Moved: 99,9%
 /dev/md7: Moved: 100,0%
 /dev/md7: Moved: 100,0%
 WARNING: Volume group movies is not consistent
 ABORTING: Can't find mirror LV in movies for /dev/md7
celia:~# pvmove /dev/md7 /dev/md9
 No data to move for movies
celia:~# vgreduce -v movies /dev/md7
   Finding volume group "movies"
   Using physical volume(s) on command line
   Archiving volume group "movies" metadata (seqno 85).
   Removing "/dev/md7" from volume group "movies"
   Creating volume group backup "/etc/lvm/backup/movies" (seqno 86).
 Removed "/dev/md7" from volume group "movies"
----- s n i p -----

Looks ok, eventually...

A 'pvdisplay -v' outputs this:

----- s n i p -----
 --- Physical volume ---
 PV Name               /dev/md6
 VG Name               movies
 PV Size               465,76 GB / not usable 1,44 MB
 Allocatable           yes (but full)
 PE Size (KByte)       4096
 Total PE              119234
 Free PE               0
 Allocated PE          119234
 PV UUID               O4Stdr-Izas-1rwv-aPoF-2aNu-15ZR-kfxi2Y

 --- Physical volume ---
 PV Name               /dev/md7
 VG Name               movies
 PV Size               465,76 GB / not usable 1,44 MB
 Allocatable           yes 
 PE Size (KByte)       4096
 Total PE              119234
 Free PE               119234
 Allocated PE          0
 PV UUID               XfBhF4-1F3u-uk3b-VOCl-kuYp-OfjM-sh4Al0

 --- Physical volume ---
 PV Name               /dev/md8
 VG Name               movies
 PV Size               465,76 GB / not usable 1,44 MB
 Allocatable           yes 
 PE Size (KByte)       4096
 Total PE              119234
 Free PE               193
 Allocated PE          119041
 PV UUID               20v6XA-ZAa3-6pQi-Dlkr-C3pW-yREt-SQ3XRn

 --- Physical volume ---
 PV Name               /dev/md9
 VG Name               movies
 PV Size               1,36 TB / not usable 832,00 KB
 Allocatable           yes 
 PE Size (KByte)       4096
 Total PE              357699
 Free PE               238465
 Allocated PE          119234
 PV UUID               KeEYOH-DdWH-ZRZh-TjWZ-r2Ku-DLCr-3AkII8
----- s n i p -----

md7 is disk1, md6 is disk2 and md8 is disk3 which all
is to be removed. md9 is the new disk.


All looks ok, so I continue on to disk2. This is
where the shit hits the fan:

----- s n i p -----
celia:~# pvmove -v /dev/md6 /dev/md9
   Finding volume group "movies"
   Archiving volume group "movies" metadata (seqno 86).
   Creating logical volume pvmove0
   Moving 119234 extents of logical volume movies/movies
   Found volume group "movies"
   Updating volume group metadata
   Creating volume group backup "/etc/lvm/backup/movies" (seqno 87).
   Found volume group "movies"
   Found volume group "movies"
   Suspending movies-movies (253:1) with device flush
   Found volume group "movies"
   Found volume group "movies"
   Creating movies-pvmove0
 device-mapper: create ioctl failed: Enhet eller resurs upptagen
   Loading movies-movies table
 device-mapper: reload ioctl failed: Ogiltigt argument
   Checking progress every 15 seconds
 WARNING: dev_open(/dev/md6) called while suspended
 WARNING: dev_open(/dev/md2) called while suspended
 WARNING: dev_open(/dev/md3) called while suspended
 WARNING: dev_open(/dev/md4) called while suspended
 WARNING: dev_open(/dev/md5) called while suspended
 WARNING: dev_open(/dev/md8) called while suspended
 WARNING: dev_open(/dev/md9) called while suspended
 WARNING: dev_open(/dev/md6) called while suspended
 WARNING: dev_open(/dev/md2) called while suspended
 WARNING: dev_open(/dev/md3) called while suspended
 WARNING: dev_open(/dev/md4) called while suspended
 WARNING: dev_open(/dev/md5) called while suspended
 WARNING: dev_open(/dev/md8) called while suspended
 WARNING: dev_open(/dev/md9) called while suspended
 WARNING: dev_open(/dev/md6) called while suspended
 WARNING: dev_open(/dev/md2) called while suspended
 WARNING: dev_open(/dev/md3) called while suspended
 WARNING: dev_open(/dev/md4) called while suspended
 WARNING: dev_open(/dev/md5) called while suspended
 WARNING: dev_open(/dev/md8) called while suspended
 WARNING: dev_open(/dev/md9) called while suspended
 /dev/md6: Moved: 100,0%
   Found volume group "movies"
   Found volume group "movies"
   Found volume group "movies"
   Found volume group "movies"
   Suspending movies-pvmove0 (253:0) with device flush
   Found volume group "movies"
   Creating movies-pvmove0
 device-mapper: create ioctl failed: Enhet eller resurs upptagen
 Unable to reactivate logical volume "pvmove0"
   Found volume group "movies"
   Loading movies-movies table
   Resuming movies-movies (253:1)
   Found volume group "movies"
   Removing movies-pvmove0 (253:0)
   Found volume group "movies"
   Removing temporary pvmove LV
   Writing out final volume group after pvmove
   Creating volume group backup "/etc/lvm/backup/movies" (seqno 89).
celia:~# pvmove -v /dev/md6 /dev/md9
   Finding volume group "movies"
   Archiving volume group "movies" metadata (seqno 89).
   Creating logical volume pvmove0
 No data to move for movies
----- s n i p -----

Now a 'pvdisplay -v /dev/md6' say:

----- s n i p -----
celia:~# pvdisplay -v /dev/md6 
   Using physical volume(s) on command line
 --- Physical volume ---
 PV Name               /dev/md6
 VG Name               movies
 PV Size               465,76 GB / not usable 1,44 MB
 Allocatable           yes 
 PE Size (KByte)       4096
 Total PE              119234
 Free PE               119234
 Allocated PE          0
 PV UUID               O4Stdr-Izas-1rwv-aPoF-2aNu-15ZR-kfxi2Y
----- s n i p -----

This device was just as full as disk1, but it took
only a few seconds to reach 100% and fail. The new
disk didn't change however:

----- s n i p -----
celia:~# pvdisplay -v /dev/md9
   Using physical volume(s) on command line
 --- Physical volume ---
 PV Name               /dev/md9
 VG Name               movies
 PV Size               1,36 TB / not usable 832,00 KB
 Allocatable           yes 
 PE Size (KByte)       4096
 Total PE              357699
 Free PE               119231
 Allocated PE          238468
 PV UUID               KeEYOH-DdWH-ZRZh-TjWZ-r2Ku-DLCr-3AkII8
----- s n i p -----


Anyone got an idea before I starts to cry?! And of
course I don't have a backup - I just didn't have
any possibility to do a backup of 7Tb...
