Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mA9IvjjG026662
	for <linux-lvm@redhat.com>; Sun, 9 Nov 2008 13:57:45 -0500
Received: from biostat.ucsf.edu (upstrm185.psg-ucsf.org [38.99.193.74])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mA9IvWxW010531
	for <linux-lvm@redhat.com>; Sun, 9 Nov 2008 13:57:32 -0500
From: Ross Boylan <ross@biostat.ucsf.edu>
Date: Sun, 09 Nov 2008 10:57:23 -0800
Message-Id: <1226257043.29638.27.camel@corn.betterworld.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] /dev/dm-31 no longer valid...
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

I have been using snapshotting before backup without incident, but this
morning got errors in the cleanup job that deletes the snapshots.  It
looks as if I successfully accessed and deleted one volume and then, as
I was moving to the next, got an error about the first volume.  Then the
next volume was also successfully deleted.

Can anyone tell me what's going on?

Thanks.
Ross Boylan

Log:

 + umount /snap/usr
 + lvdisplay daisy/_usr
   --- Logical volume ---
   LV Name                /dev/daisy/_usr
   VG Name                daisy
   LV UUID                F22t33-miwV-JNGZ-kxA1-P7M9-y8Ul-JZB693
   LV Write Access        read/write
   LV snapshot status     active destination for /dev/daisy/usr
   LV Status              available
   # open                 0
   LV Size                9.75 GB
   Current LE             312
   COW-table size         2.00 GB
   COW-table LE           64
   Allocated to snapshot  1.89% 
   Snapshot chunk size    4.00 KB
   Segments               1
   Allocation             inherit
   Read ahead sectors     auto
   - currently set to     256
   Block device           254:30
    
 + lvremove -f daisy/_usr
   Logical volume "_usr" successfully removed
 + for path in '$paths'
 + getdev /home
 /bin/df -P $1 | sed -e 1d  -e "2 s~/dev/mapper/\([^-]*\)-\([^ \t]\
+\).*~/dev/\1/\2~m"
 ++ /bin/df -P /home
 ++ sed -e 1d -e '2 s~/dev/mapper/\([^-]*\)-\([^ \t]\+\).*~/dev/\1/\2~m'
 + dev=/dev/daisy/home
 echo $path | sed -e s~/~_~g
 ++ echo /home
 ++ sed -e s~/~_~g
 + snappath=_home
 + umount /snap/home
 + lvdisplay daisy/_home
   /dev/dm-31: stat failed: No such file or directory
   Path /dev/dm-31 no longer valid for device(254,31)
   /dev/disk/by-id/dm-name-daisy-usr-real: stat failed: No such file or
directory
   Path /dev/disk/by-id/dm-name-daisy-usr-real no longer valid for
device(254,31)
   /dev/disk/by-id/dm-uuid-LVM-z2DbsrYwb0J56tBMDTcfxH7cumFodpe9ms4sDqr4OU3qk4cad1EnGhq0TavE22hA-real: stat failed: No such file or directory

Path /dev/disk/by-id/dm-uuid-LVM-z2DbsrYwb0J56tBMDTcfxH7cumFodpe9ms4sDqr4OU3qk4cad1EnGhq0TavE22hA-real no longer valid for device(254,31)
   --- Logical volume ---
   LV Name                /dev/daisy/_home
   VG Name                daisy
   LV UUID                Qa9UI6-y0j3-NJ5x-pmX0-HAS5-CQ4B-zTOMEy
   LV Write Access        read/write
   LV snapshot status     active destination for /dev/daisy/home
   LV Status              available
   # open                 0
   LV Size                38.25 GB
   Current LE             1224
   COW-table size         10.00 GB
   COW-table LE           320
   Allocated to snapshot  0.54% 
   Snapshot chunk size    4.00 KB
   Segments               1
   Allocation             inherit
   Read ahead sectors     auto
   - currently set to     256
   Block device           254:27
    
 + lvremove -f daisy/_home
   Logical volume "_home" successfully removed
