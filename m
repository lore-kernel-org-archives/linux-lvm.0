From: Josh Duncan <linux-lvm@msmd.net>
Message-ID: <20021014200329.GA4885@msmd.net>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] lvm with gpt partitioning?
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
Date: Mon Oct 14 15:07:51 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi all,

I hope this isn't a redundant question, I've tried looking through the mailing
lists with no luck:

I'm having a problem setting up physical volumes on an ia64 machine running a
2.4.18+lvm1.0.5 kernel.

the disk is labelled using an "EFI GPT" disk label/partitioning arrangement.  I
currently have two partitions defined, the first is 2gb and the second is 16gb.
I can do a pvcreate on the second, but not on the first.  I've attached output
from parted, fdisk, and pvcreate below...

any ideas?
--Josh

------
fdisk:
------
[root@one sbin]# fdisk -l /dev/sdb

Disk /dev/sdb: 255 heads, 63 sectors, 4427 cylinders
Units = cylinders of 16065 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/sdb1             1      4428  35566479+  ee  EFI GPT

-------
parted:
-------
[root@one sbin]# parted /dev/sdb print
Disk geometry for /dev/sdb: 0.000-34732.890 megabytes
Disk label type: GPT
Minor    Start       End     Filesystem  Name                  Flags
1          0.017   2047.000                                    lba
2       2047.000  18733.000                                    lba

---------
pvcreate:
---------
[root@one sbin]# pvcreate /dev/sdb1
pvcreate -- invalid partition type 0xee for "/dev/sdb1" (must be 0x8e)
