Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBK4VQr03350
	for <linux-lvm@redhat.com>; Sun, 19 Dec 2004 23:31:26 -0500
Received: from smtp2.prod2.securaserv.com (203-96-158-55.paradise.net.nz
	[203.96.158.55])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iBK4VKrT022860
	for <linux-lvm@redhat.com>; Sun, 19 Dec 2004 23:31:20 -0500
Message-ID: <41C650A3.2090302@vilain.net>
Date: Mon, 20 Dec 2004 17:10:11 +1300
From: Sam Vilain <sam@vilain.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] PVs that are reused / reformatted as filesystems
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi there,

I have a system on which a partition that was once a PV was recycled as
a filesystem.  Now, it has a valid ext3 filesystem on it, but also the
PV signature appears to be there.  So I can't start things up without
liberal use of -P, and I can't seem to get anything except read-only
operation.

IMHO The utilities should probably never try to treat any in-use kernel
object as candidate for any kind of scanning or new use.  ie, the
userland equivalent of checking dev->kobj.kref.refcount == 0

Could someone please give me a fish (tell me how to un-jam my LVM) and
maybe even teach the LVM drivers/utilities to fish as well?

Here's the command output;

samv:~# lvmdiskscan -v
   /dev/hda1 [       13.98 GB] LVM physical volume
   /dev/hda2 [       65.13 GB] LVM physical volume
   /dev/hda3 [       13.97 GB] LVM physical volume
   /dev/hda4 [        1.00 KB]
   /dev/hda5 [     1004.03 MB]
   /dev/hda6 [       17.72 GB] LVM physical volume
   0 disks
   2 partitions
   0 LVM physical volume whole disks
   4 LVM physical volumes
samv:~# mount | grep hda
/dev/hda3 on / type ext2 (rw,errors=remount-ro)
samv:~# vgchange -ay
   Failed to read VG data from PV (/dev/hda3)
   Failed to read VG data from PV (/dev/hda3)
   Unable to find volume group "Mirror"
   Couldn't find device with uuid 'PtbIxo-EmRo-ML7J-yhqx-gglD-ZayH-X6tuWE'.
   Couldn't find all physical volumes for volume group samv.
   Couldn't find device with uuid 'PtbIxo-EmRo-ML7J-yhqx-gglD-ZayH-X6tuWE'.
   Couldn't find all physical volumes for volume group samv.
   Unable to find volume group "samv"
samv:~# vgscan -P
   Partial mode. Incomplete volume groups will be activated read-only.
   Reading all physical volumes.  This may take a while...
   Failed to read VG data from PV (/dev/hda3)
   Failed to read VG data from PV (/dev/hda3)
   Volume group "Mirror" not found
   Couldn't find device with uuid 'PtbIxo-EmRo-ML7J-yhqx-gglD-ZayH-X6tuWE'.
   Couldn't find device with uuid 'PtbIxo-EmRo-ML7J-yhqx-gglD-ZayH-X6tuWE'.
   Found volume group "samv" using metadata type lvm2
samv:~# vgchange -ay -P
   Partial mode. Incomplete volume groups will be activated read-only.
   Failed to read VG data from PV (/dev/hda3)
   Failed to read VG data from PV (/dev/hda3)
   Unable to find volume group "Mirror"
   Couldn't find device with uuid 'PtbIxo-EmRo-ML7J-yhqx-gglD-ZayH-X6tuWE'.
   Couldn't find device with uuid 'PtbIxo-EmRo-ML7J-yhqx-gglD-ZayH-X6tuWE'.
   Couldn't find device with uuid 'PtbIxo-EmRo-ML7J-yhqx-gglD-ZayH-X6tuWE'.
   Couldn't find device with uuid 'PtbIxo-EmRo-ML7J-yhqx-gglD-ZayH-X6tuWE'.
   Couldn't find device with uuid 'PtbIxo-EmRo-ML7J-yhqx-gglD-ZayH-X6tuWE'.
   Couldn't find device with uuid 'PtbIxo-EmRo-ML7J-yhqx-gglD-ZayH-X6tuWE'.
   Couldn't find device with uuid 'PtbIxo-EmRo-ML7J-yhqx-gglD-ZayH-X6tuWE'.
   Couldn't find device with uuid 'PtbIxo-EmRo-ML7J-yhqx-gglD-ZayH-X6tuWE'.
   Couldn't find device with uuid 'PtbIxo-EmRo-ML7J-yhqx-gglD-ZayH-X6tuWE'.
   Couldn't find device with uuid 'PtbIxo-EmRo-ML7J-yhqx-gglD-ZayH-X6tuWE'.
   Couldn't find device with uuid 'PtbIxo-EmRo-ML7J-yhqx-gglD-ZayH-X6tuWE'.
   Couldn't find device with uuid 'PtbIxo-EmRo-ML7J-yhqx-gglD-ZayH-X6tuWE'.
   5 logical volume(s) in volume group "samv" now active
samv:~# mount /export/media
mount: block device /dev/mapper/samv-media is write-protected, mounting 
read-only
samv:~#

-- 
Sam Vilain, sam /\T vilain |><>T net, PGP key ID: 0x05B52F13
(include my PGP key ID in personal replies to avoid spam filtering)
