Date: Thu, 15 Apr 2004 12:42:22 +0200
From: Ihno Krumreich <ihno@suse.de>
Message-ID: <20040415104222.GA5243@wotan.suse.de>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Bug when creating snapshots on lvm on s390
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com, Mauelshagen@redhat.com
Cc: Bernhard Kaindl <bk@suse.de>, Uwe Drechsel <uwedr@suse.de>, Ulrich Hecht <uli@suse.de>

Hi,

we have a filecorruption on a LVM-Volume when a
snapshot is created. This Problem seem to occur only
on s390 (31-Bit mode).

are there any known issues when using snapshots on lvm on s390?

regards 

Ihno Krumreich

How to create the bug:

- Create three volume groups, which are striped over multiple
  physical disks (9 x 2GByte).
- use the second volume group to create a logical volume
- create a file system on this LV (problem occurs with ext2, ext3, reiserfs)
  and put data in the filesystem
- create a snapshot of this LVOL
- the data on the original LVOL are corruptet

- It is important that the filesystem is mounted read/write
  If it is only mounted readonly and the snapshot is
  created the corruption does not occur.
  

Machine setup:

S390 31-Bit with SUSE linux Enterprise Server 8 Service Pack 3
Machine has 2 Gbyte RAM and 9 Model-3 DASD for the LVM.

SLES8 has LVM Version 1.0.5 with IBM patches for multipath support.

To exclude that Kernel modification from SUSE/IBM cause the
problem IBM has testet it with the vanilla kernel 2.4.21 and
LVM Version 1.0.7 and the problem is the same.

At SUSE we tried to reproduce the problem on x86, but without
success (kernel 2.4.21 with lvm 1.0.5).

In the attached tar-ball is a file which showes the corruption
starting at byte 0xc000 with a length of 0x1000 Bytes.


-- 
Best regards/Mit freundlichen Gr��en

Ihno Krumreich

"Never trust a computer you can lift."
--
Ihno Krumreich            ihno@suse.de
SuSE Linux AG             Projectmanager S390 & zSeries
Maxfeldstr. 5             +49-911-74053-439
D-90409 N�rnberg          http://www.suse.de
