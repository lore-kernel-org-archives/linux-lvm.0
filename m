Return-Path: <C.R.Ritson@ncl.ac.uk>
Message-Id: <4.3.1.1.20010815163625.00b21460@popin.ncl.ac.uk>
Date: Wed, 15 Aug 2001 16:57:36 +0100
From: Chris Ritson <C.R.Ritson@ncl.ac.uk>
Mime-Version: 1.0
Subject: [linux-lvm] Duplicate minor device numbers
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I have just ben upgrading too many things at once and have got into slight 
problems. The upgrades were:-

	kernel 2.4.5 to 2.4.7
	lvm 0.91_beta7 to 0.91_beta8
	aic7xxx scsi driver 6.1.13 to 6.2.1

Prior to starting the lvm upgrade, I had problems with two volume groups, 
which were of little importance. Somehow I seemed to have got a snapshot of 
a snapshot of a logical volume. For these physical volumes, I destroyed the 
header of the single physical extent involved with dd and did not attempt 
pvversion. I was planning to re-run pvcreate and start again from scratch 
when I brought the system up again. I did not delete anything in 
/etc/pvmtab or /dev/<VG> which may turn out to have been a mistake.

The lvm upgrade went slightly wrong for me in that when I rebooted after 
upgrading the lvm userland tools and THEN running the new pvversion (only 
seen to be the wrong order afterwards) I found that ALL the superblocks for 
my e2fs filesystems in the logical volumes were corrupt. Thankfully I had 
backups for almost everything.

Having restored some logical volumes, I have now been stopped dead by 
finding some duplicate minor device numbers:-

byerhope.ncl.ac.uk: ls -l /dev/vg*/* | sort +4n -5 +5n -6
brw-rw----    1 root     disk      58,   0 Aug 15 14:18 /dev/vgd/pg
brw-rw----    1 root     disk      58,   1 Aug 15 14:18 /dev/vgf/staff3
brw-rw----    1 root     disk      58,   2 Aug 15 14:18 /dev/vgg/staff1
brw-rw----    1 root     disk      58,   3 Aug 15 14:18 /dev/vgg/staff2
brw-rw----    1 root     disk      58,   4 Aug 15 16:08 /dev/vgl/u00
brw-rw----    1 root     disk      58,   5 Aug 15 16:08 /dev/vgl/local
brw-rw----    1 root     disk      58,   6 Aug 15 14:03 /dev/vgc/vgc.scratch
brw-rw----    1 root     disk      58,   6 Aug 15 16:08 /dev/vgk/u99
brw-rw----    1 root     disk      58,   7 Aug 15 16:08 /dev/vgk/cs
crw-r-----    1 root     disk     109,   0 Aug 15 16:08 /dev/vgb/group
crw-r-----    1 root     disk     109,   1 Aug 15 13:54 /dev/vgc/group
crw-r-----    1 root     disk     109,   1 Aug 15 14:18 /dev/vgd/group
crw-r-----    1 root     disk     109,   1 Aug 15 16:08 /dev/vgj/group
crw-r-----    1 root     disk     109,   2 Aug 15 14:18 /dev/vgf/group
crw-r-----    1 root     disk     109,   3 Aug 15 14:18 /dev/vgg/group
crw-r-----    1 root     disk     109,   6 Aug 15 16:08 /dev/vgk/group
crw-r-----    1 root     disk     109,   6 Aug 15 16:08 /dev/vgl/group

lvmtab.d contains

byerhope.ncl.ac.uk: ls /etc/lvmtab.d
vgb  vgj  vgk  vgl

vgk should not yet exist, but vgd should -- these two have both ended up as 
109,1. vgd contains a useful file system. Neither of the device 58,6 file 
systems contain any useful data. How would you recommend recovering this 
situation. Will it be sufficient to write nulls to the start of the 
physical extents making up the volume groups that should not yet exist and 
then to run vgscan? Advice, please.

Chris Ritson
--
EMAIL:	C.R.Ritson@newcastle.ac.uk	POST:	Chris Ritson,
PHONE:	+44 191 222 8175			Department of Computing Science,
FAX :	+44 191 222 8232				University of Newcastle upon Tyne,
ROOM:	618 Claremont Bridge (the Mill)		United Kingdom NE1 7RU.
