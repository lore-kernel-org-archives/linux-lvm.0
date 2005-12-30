Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBUII2109975
	for <linux-lvm@redhat.com>; Fri, 30 Dec 2005 13:18:02 -0500
Received: from snefru.openlib.org (wuecon195.wustl.edu.wustl.edu
	[128.252.177.195])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jBUII1MX016430
	for <linux-lvm@redhat.com>; Fri, 30 Dec 2005 13:18:01 -0500
Received: from krichel by snefru.openlib.org with local (Exim 4.60)
	(envelope-from <krichel@openlib.org>) id 1EsOpM-0003zV-KU
	for linux-lvm@redhat.com; Fri, 30 Dec 2005 12:18:08 -0600
Date: Fri, 30 Dec 2005 12:18:08 -0600
From: Thomas Krichel <krichel@openlib.org>
Message-ID: <20051230181808.GA15333@openlib.org>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] vg not intact after other disks are exchanged
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
To: Linux LVM <linux-lvm@redhat.com>


  hi LVM gurus!

  I have a Dell computer with a scsi (mounted as root), and
  four ide disks hda to hdd. I have hdb, hdc and hdd in a volume
  group vg1. hda is separate.
 
  I am running lvm2 2.01.04-5 from Debian testing.

  Trouble with the scsi disk let me to take it out and replace
  hda with a differnt physical disk that can act as root. After
  changing the boot sequence in the bios the machine boots up fine.
  I left the three other ide disks untouched. But, when
  I want to activate the vg, I have a problem

fasolt:~# pvscan
  Couldn't find device with uuid 'N0i9f3-0xqW-iPyq-7EG9-e4kI-Oa3F-jPfRpC'.
  Couldn't find device with uuid 'N0i9f3-0xqW-iPyq-7EG9-e4kI-Oa3F-jPfRpC'.
  PV /dev/hdc         VG vg1   lvm2 [186.30 GB / 0    free]
  PV unknown device   VG vg1   lvm2 [167.68 GB / 0    free]
  PV /dev/hdb1        VG vg1   lvm2 [372.61 GB / 0    free]
  Total: 3 [726.59 GB] / in use: 3 [726.59 GB] / in no VG: 0 [0   ]

  But hdd is still there, it is just not recogized as 
  part of vg1. 

fasolt:~# fdisk -l /dev/hdd

Disk /dev/hdd: 180.0 GB, 180045766656 bytes
255 heads, 63 sectors/track, 21889 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

Disk /dev/hdd doesn't contain a valid partition table

  I exclude hda from scanning, 

fasolt:~# grep hda /etc/lvm/lvm.conf
    filter = [ "r|/dev/cdrom|" , "r|/dev/hda|" ]
    # filter = [ "a|^/dev/hda8$|", "r/.*/" ]

  therefore it is likely that hdd is the device
  N0i9f3-0xqW-iPyq-7EG9-e4kI-Oa3F-jPfRpC that could not be found.
 
  What do I do now? How do I add it again saying that this
  is the PV that is unknown?


  Cheers,

  Thomas Krichel                             mailto:krichel@openlib.org
                                        http://openlib.org/home/krichel
                                    RePEc:per:1965-06-05:thomas_krichel
