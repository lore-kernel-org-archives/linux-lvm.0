Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id k9EITYUc016652
	for <linux-lvm@redhat.com>; Sat, 14 Oct 2006 14:29:34 -0400
Received: from mail.bdmcc-us.com (bdmcc-us.com [209.42.230.180])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k9EITUmf022283
	for <linux-lvm@redhat.com>; Sat, 14 Oct 2006 14:29:31 -0400
Received: from localhost (mail.bdmcc-us.com [192.168.1.133])
	by mail.bdmcc-us.com (Postfix) with ESMTP id D18F417F8AD
	for <linux-lvm@redhat.com>; Sat, 14 Oct 2006 14:26:19 -0400 (EDT)
Received: from mail.bdmcc-us.com ([127.0.0.1])
	by localhost (mail.bdmcc-us.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 26045-06 for <linux-lvm@redhat.com>;
	Sat, 14 Oct 2006 14:26:19 -0400 (EDT)
Date: Sat, 14 Oct 2006 14:26:19 -0400
From: Brian McCullough <bdmc@bdmcc-us.com>
Message-ID: <20061014182619.GA25852@bdmcc-us.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Missing VGs?
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

Folks,

I have a drive with two "Linux raid autodetect" partitions, which, as
far as I know, have LVM VGs on them.

However, even though mdadm happily starts both RAID devices ( each half
of a RAID-1 device ), vgscan and pvscan don't give me answers that I
really understand.


First pvscan -vvv ( edited output ):

        Processing: pvscan -vvv
        O_DIRECT will be used
      Setting global/locking_type to 1
      Setting global/locking_dir to /var/lock/lvm
      File-based locking enabled.
    Wiping cache of LVM-capable devices
        /dev/acpi: Not a block device
        /dev/adsp: Not a block device
.
.
.
      /dev/hda5: No label detected
        Closed /dev/hda5
        Opened /dev/md5 RO
      /dev/md5: size is 78139904 sectors
        Closed /dev/md5
      /dev/md5: size is 78139904 sectors
        Opened /dev/md5 RO O_DIRECT
        /dev/md5: block size is 4096 bytes
        Closed /dev/md5
        Using /dev/md5
        Opened /dev/md5 RO O_DIRECT
        /dev/md5: block size is 4096 bytes
      /dev/md5: lvm2 label detected
        Closed /dev/md5
        lvmcache: /dev/md5 now orphaned
        Opened /dev/md5 RO O_DIRECT
        /dev/md5: block size is 4096 bytes
        Closed /dev/md5
        Opened /dev/Ubuntu/lv_usrsrc RO
.
.
.
        Closed /dev/hda6
        lvmcache: /dev/hda6 now in VG Ubuntu
        Opened /dev/md6 RO
      /dev/md6: size is 312576512 sectors
        Closed /dev/md6
      /dev/md6: size is 312576512 sectors
        Opened /dev/md6 RO O_DIRECT
        /dev/md6: block size is 4096 bytes
        Closed /dev/md6
        Using /dev/md6
        Opened /dev/md6 RO O_DIRECT
        /dev/md6: block size is 4096 bytes
      /dev/md6: lvm2 label detected
        Closed /dev/md6
        lvmcache: /dev/md6 now orphaned
        Opened /dev/md6 RO O_DIRECT
        /dev/md6: block size is 4096 bytes
        Closed /dev/md6
        Opened /dev/Ubuntu/lv_home RO
      /dev/Ubuntu/lv_home: size is 4710400 sectors
.
.
.
        /dev/hda6 9:   3516     62: NULL(0:0)
        Opened /dev/md5 RO O_DIRECT
        /dev/md5: block size is 4096 bytes
      /dev/md5: lvm2 label detected
        Closed /dev/md5
        Opened /dev/md5 RO O_DIRECT
        /dev/md5: block size is 4096 bytes
        Closed /dev/md5
        Opened /dev/md5 RO O_DIRECT
        /dev/md5: block size is 4096 bytes
      /dev/md5: lvm2 label detected
        Closed /dev/md5
        Opened /dev/md5 RO O_DIRECT
        /dev/md5: block size is 4096 bytes
        Closed /dev/md5
        Opened /dev/md6 RO O_DIRECT
        /dev/md6: block size is 4096 bytes
      /dev/md6: lvm2 label detected
        Closed /dev/md6
        Opened /dev/md6 RO O_DIRECT
        /dev/md6: block size is 4096 bytes
        Closed /dev/md6
.
.
.
  PV /dev/hda6   VG Ubuntu        lvm2 [13.98 GB / 2.58 GB free]
  PV /dev/md5                     lvm2 [37.26 GB]
  PV /dev/md6                     lvm2 [149.05 GB]
  Total: 7 [372.62 GB] / in use: 5 [186.31 GB] / in no VG: 2 [186.31 GB]




And then, vgscan -vvv said ( also edited ):

        Processing: vgscan -vvv
        O_DIRECT will be used
      Setting global/locking_type to 1
      Setting global/locking_dir to /var/lock/lvm
      File-based locking enabled.
    Wiping cache of LVM-capable devices
        /dev/acpi: Not a block device
.
.
.
      /dev/hda5: No label detected
        Closed /dev/hda5
        Opened /dev/md5 RO
      /dev/md5: size is 78139904 sectors
        Closed /dev/md5
      /dev/md5: size is 78139904 sectors
        Opened /dev/md5 RO O_DIRECT
        /dev/md5: block size is 4096 bytes
        Closed /dev/md5
        Using /dev/md5
        Opened /dev/md5 RO O_DIRECT
        /dev/md5: block size is 4096 bytes
      /dev/md5: lvm2 label detected
        Closed /dev/md5
        lvmcache: /dev/md5 now orphaned
        Opened /dev/md5 RO O_DIRECT
        /dev/md5: block size is 4096 bytes
        Closed /dev/md5
        Opened /dev/Ubuntu/lv_usrsrc RO
.
.
.
        Closed /dev/hda6
        lvmcache: /dev/hda6 now in VG Ubuntu
        Opened /dev/md6 RO
      /dev/md6: size is 312576512 sectors
        Closed /dev/md6
      /dev/md6: size is 312576512 sectors
        Opened /dev/md6 RO O_DIRECT
        /dev/md6: block size is 4096 bytes
        Closed /dev/md6
        Using /dev/md6
        Opened /dev/md6 RO O_DIRECT
        /dev/md6: block size is 4096 bytes
      /dev/md6: lvm2 label detected
        Closed /dev/md6
        lvmcache: /dev/md6 now orphaned
        Opened /dev/md6 RO O_DIRECT
        /dev/md6: block size is 4096 bytes
        Closed /dev/md6
        Opened /dev/Ubuntu/lv_home RO
.
.
.

And nothing more about the supposed VGs on those partitions.


What should I try next?


Thanks,
Brian
