Date: Tue, 1 Aug 2000 19:09:10 +0200
From: Luca Berra <bluca@comedia.it>
Subject: [linux-lvm] [bluca@comedia.it: help!]
Message-ID: <20000801190910.A4095@colombina.comedia.it>
Reply-To: bluca@comedia.it
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

i'll repost since i did not see it on the list

ah. it is on 2.4.0-test5 :(

----- Forwarded message from Luca Berra <bluca@comedia.it> -----

Date: Mon, 31 Jul 2000 18:25:45 +0200
From: Luca Berra <bluca@comedia.it>
To: linux-lvm@msede.com
Subject: help!
X-Mailer: Mutt 1.0pre3i

lvmdiskscan gets it wrong, pvcreate as well

/dev/md1 (at bottom) should be a 36Gb MD device,
lvmdiskscan takes stats from the first partition on the first disk

# lvmdiskscan
lvmdiskscan -- reading all disks / partitions (this may take a while...)
lvmdiskscan -- /dev/scsi/host1/bus0/target0/lun0/part1  [       7.98 MB] Primary
  LINUX native partition [0x83]
lvmdiskscan -- /dev/scsi/host1/bus0/target0/lun0/part2  [       4.03 GB] DOS ext
ended partition [0x5]
lvmdiskscan -- /dev/scsi/host1/bus0/target0/lun0/part5  [     255.98 MB] Extende
d LINUX native partition [0x83]
lvmdiskscan -- /dev/scsi/host1/bus0/target0/lun0/part6  [        576 MB] Extende
d LINUX native partition [0x83]
lvmdiskscan -- /dev/scsi/host1/bus0/target0/lun0/part7  [     957.98 MB] Extende
d LINUX native partition [0x83]
lvmdiskscan -- /dev/scsi/host1/bus0/target0/lun0/part8  [         64 MB] Extende
d LINUX native partition [0x83]
lvmdiskscan -- /dev/scsi/host1/bus0/target4/lun0/part1  [      29.98 MB] Primary   [0xFD]
lvmdiskscan -- /dev/scsi/host1/bus0/target4/lun0/part2  [      17.07 GB] Primary  LVM partition [0x8E]
lvmdiskscan -- /dev/scsi/host1/bus0/target5/lun0/part1  [      29.98 MB] Primary   [0xFD]
lvmdiskscan -- /dev/scsi/host1/bus0/target5/lun0/part2  [      17.07 GB] Primary   [0xFD]
lvmdiskscan -- /dev/scsi/host1/bus0/target6/lun0/part1  [      29.98 MB] Primary   [0xFD]
lvmdiskscan -- /dev/scsi/host1/bus0/target6/lun0/part2  [      17.07 GB] Primary   [0xFD]
lvmdiskscan -- /dev/md1                                 [       7.98 MB] Primary  LINUX native partition [0x83]
lvmdiskscan -- 4 disks
lvmdiskscan -- 0 whole disks
lvmdiskscan -- 0 loop devices
lvmdiskscan -- 0 multiple devices
lvmdiskscan -- 0 network block devices
lvmdiskscan -- 15 partitions
lvmdiskscan -- 1 LVM physical volume partition


-- 
Luca Berra -- bluca@comedia.it
    Communication Media & Services S.r.l.

----- End forwarded message -----

-- 
Luca Berra -- bluca@comedia.it
    Communication Media & Services S.r.l.
