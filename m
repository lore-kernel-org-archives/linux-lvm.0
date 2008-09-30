Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8UJsmR4028782
	for <linux-lvm@redhat.com>; Tue, 30 Sep 2008 15:54:48 -0400
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m8UJrqgK010427
	for <linux-lvm@redhat.com>; Tue, 30 Sep 2008 15:53:53 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KklI3-0007cI-7f
	for linux-lvm@redhat.com; Tue, 30 Sep 2008 19:53:47 +0000
Received: from vpn-132-204-232-132.acd.umontreal.ca ([132.204.232.132])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Tue, 30 Sep 2008 19:53:47 +0000
Received: from monnier by vpn-132-204-232-132.acd.umontreal.ca with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Tue, 30 Sep 2008 19:53:47 +0000
From: Stefan Monnier <monnier@iro.umontreal.ca>
Date: Tue, 30 Sep 2008 15:53:38 -0400
Message-ID: <jwvfxnhbevl.fsf-monnier+gmane.linux.lvm.general@gnu.org>
Mime-Version: 1.0
Sender: news <news@ger.gmane.org>
Subject: [linux-lvm] Hot(un)plugging LVM volumes
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com


How is LVM supposed to work for hotpluggable disks?
The best I came up with so far is something like:

   <plug>
   lvchange -a y <lvname>
   mount <lvname> <mountpoint>

and when unplugging, doing the reverse:

   umount <mountpoint>
   lvchange -a n <lvname>
   <plug>

But it's rather inconvenient, and brittle.  If I just unplug while the
volume is mounted, I can still unmount the volume afterwards, but LVM
seems to keep some info about the volume, so I get errors and subsequent
hotplugging does not bring me back the volume (probably because the old
instance is still left around and in an inconsistent state).

More specifically, after unplugging and unmounting, I get errors like:

# pvs
  /dev/dm-3: read failed after 0 of 4096 at 0: Input/output error
  PV         VG      Fmt  Attr PSize  PFree
  /dev/hda3  Toto    lvm2 a-   26.39G    0 
# ~-0# ~-0# lvchange -a n /dev/Titi/tata
  /dev/dm-3: read failed after 0 of 4096 at 0: Input/output error
  /dev/dm-3: read failed after 0 of 4096 at 300647645184: Input/output error
  /dev/dm-3: read failed after 0 of 4096 at 300647702528: Input/output error
  /dev/dm-3: read failed after 0 of 4096 at 0: Input/output error
  /dev/dm-3: read failed after 0 of 4096 at 4096: Input/output error
  /dev/dm-3: read failed after 0 of 4096 at 0: Input/output error
  Volume group "Titi" not found
# l /dev/mapper/Titi-tata
brw-rw---- 1 root disk 254, 3 2008-09-29 13:39 /dev/mapper/Titi-tata
# 

I did find a workaround, tho: after unplugging "uncleanly", I need to
unmount all the volumes, the plug the disk back in, then deactivate all
the volumes with "lvchange -a n <lvname>" (which signals the same
errors as above, except for the last line, and which does deactivate
the volume this time), and then reactive them with "lvchange -a y <lvname>".


        Stefan
