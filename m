Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j2GGDIY16786
	for <linux-lvm@redhat.com>; Wed, 16 Mar 2005 11:13:18 -0500
Received: from mail.zapeng.com (webdev.zapeng.com [70.150.3.68])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j2GGDHug019666
	for <linux-lvm@redhat.com>; Wed, 16 Mar 2005 11:13:18 -0500
Received: from localhost (smokey [127.0.0.1])
	by mail.zapeng.com (Postfix) with ESMTP id 8CDCE1E4057
	for <linux-lvm@redhat.com>; Wed, 16 Mar 2005 11:13:34 -0500 (EST)
Received: from mail.zapeng.com ([127.0.0.1])
	by localhost (smokey.zapeng.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 07413-10 for <linux-lvm@redhat.com>;
	Wed, 16 Mar 2005 11:13:34 -0500 (EST)
Received: from ze0124 (ws-93.ze.zapeng.com [70.150.3.93])
	by mail.zapeng.com (Postfix) with ESMTP id 35E3E1E404E
	for <linux-lvm@redhat.com>; Wed, 16 Mar 2005 11:13:34 -0500 (EST)
From: "Bryan Ragon" <bragon@zapeng.com>
Subject: RE: [linux-lvm] Can't find physical volume / vgcfgrestore not helping
	(Success!!)
Date: Wed, 16 Mar 2005 11:12:42 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050316155541.GP19749@agk.surrey.redhat.com>
Message-Id: <20050316161334.35E3E1E404E@mail.zapeng.com>
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

-----Original Message-----
>> On Wed, Mar 16, 2005 at 10:30:42AM -0500, Bryan Ragon wrote:
>> # fdisk -l /dev/hdb
>> /dev/hdb1               1       14593   117218241   83  Linux
 
>> (Is that a proper Id? Plus, looking at my media_vg backup, I don't 
>> believe there should be a partition because the hint is /dev/hdb, not 
>> /dev/hdb1)
 
>>                         device = "/dev/hdb"     # Hint only

>Chances are you didn't remove the partition table before using the entire
unpartitioned device as a physical 
>volume, or ran pvcreate on /dev/hdb when you intended to use hdb1.

>(Recent lvm2 versions of pvcreate handle this better.)

>Try removing the partition table.

>[eg delete the partition with fdisk/parted, or write 512 zero bytes to the
start of /dev/hdb - 
>back it up first - and run blockdev --rereadpt]


Here is a detailed list of steps that worked:

;; first backed up the first 512 bytes of /dev/hdb
# dd if=/dev/hdb of=~/hdb.first512 count=1 bs=512
1+0 records in
1+0 records out
 

;; zero them out, per Alasdair
# dd if=/dev/zero of=/dev/hdb count=1 bs=512
1+0 records in
1+0 records out

;; verified
# blockdev --rereadpt /dev/hdb
BLKRRPART: Input/output error

;; find the volumes
# vgscan
  Reading all physical volumes.  This may take a while...
  Found volume group "media_vg" using metadata type lvm2

# pvscan
  PV /dev/hdb   VG media_vg   lvm2 [111.79 GB / 0    free]
  Total: 1 [111.79 GB] / in use: 1 [111.79 GB] / in no VG: 0 [0   ]

# lvmdiskscan
  /dev/hda1 [      494.16 MB]
  /dev/hda2 [        1.92 GB]
  /dev/hda3 [       18.65 GB]
  /dev/hdb  [      111.79 GB] LVM physical volume
  /dev/hdd1 [       71.59 GB]
  0 disks
  4 partitions
  1 LVM physical volume whole disk
  0 LVM physical volumes

# vgchange -a y
  1 logical volume(s) in volume group "media_vg" now active

;; /media is a defined mount point in fstab, listed below for future archive
searches
# mount /media
# ls /media
graphics  lost+found  movies  music


Success!!  Thank you, Alasdair!!!!

/etc/fstab
<snip>
/dev/media_vg/media_lv  /media          ext3            noatime
0 0
<snip>
