Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8OA6gbQ014850
	for <linux-lvm@redhat.com>; Thu, 24 Sep 2009 06:06:42 -0400
Received: from smtp-out1.berkeley.edu (smtp-out1.Berkeley.EDU [128.32.61.106])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8OA6PpH025369
	for <linux-lvm@redhat.com>; Thu, 24 Sep 2009 06:06:26 -0400
Received: from nx.neuro.berkeley.edu ([169.229.158.6]
	helo=venus.neuro.bekeley.edu)
	by fe6.calmail with esmtpsa (TLSv1:AES128-SHA:128) (Exim 4.69)
	(auth plain:ashworth@berkeley.edu)
	(envelope-from <julie.ashworth@berkeley.edu>) id 1MqlDU-0001fB-K0
	for linux-lvm@redhat.com; Thu, 24 Sep 2009 03:06:25 -0700
Date: Thu, 24 Sep 2009 03:06:22 -0700
From: Julie Ashworth <julie.ashworth@berkeley.edu>
Message-ID: <20090924100622.GA3517@venus.neuro.bekeley.edu>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] missing physical volumes after upgrade to rhel 5.4
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

I apologize for the cross-posting (to rhelv5-list).
The lvm list is a more relevant list for my problem, 
and I'm sorry I didn't realize this sooner.

After an upgrade from rhel5.3 -> rhel5.4 (and reboot)
I can no longer see PVs for 3 fibre-channel storage 
devices.

The operating system still see the disk:
----------------------
# multipath -l
mpath2 (2001b4d28000064db) dm-1 JetStor,Volume Set # 00
[size=12T][features=0][hwhandler=0][rw]
\_ round-robin 0 [prio=0][active]
 \_ 11:0:1:0 sdj 8:144 [active][undef]
mpath16 (1ACNCorp_FF01000113200019) dm-2 ACNCorp,R_LogVol-despo
[size=15T][features=0][hwhandler=0][rw]
\_ round-robin 0 [prio=0][active]
 \_ 11:0:2:0 sdk 8:160 [active][undef]
mpath7 (32800001b4d00cf5b) dm-0 JetStor,Volume Set 416F
[size=12T][features=0][hwhandler=0][rw]
\_ round-robin 0 [prio=0][active]
 \_ 11:0:0:0 sdi 8:128 [active][undef]
----------------------


There are files in /etc/lvm/backup/ that contain the
original volume information, e.g.
----------------------
jetstor642 {
        id = "0e53Q3-evHX-I5f9-CWqf-NPcw-IqmC-0fVcTO"
        seqno = 2
        status = ["RESIZEABLE", "READ", "WRITE"]
        flags = []
        extent_size = 8192              # 4 Megabytes
        max_lv = 0
        max_pv = 0

        physical_volumes {

                pv0 {
                        id = "5wJCEA-IDC1-5GhI-jnEs-EpYF-8Uf3-sqPL4O"
                        device = "/dev/dm-7"    # Hint only

                        status = ["ALLOCATABLE"]
                        flags = []
                        dev_size = 31214845952  # 14.5355 Terabytes
                        pe_start = 384
                        pe_count = 3810405  # 14.5355 Terabytes
                }
        }
----------------------

The devices were formatted using parted on the entire disk, 
i.e.  I didn't create a partition.
The partition table is "gpt" (possible label types are
"bsd", "dvh", "gpt",  "loop", "mac", "msdos", "pc98"
or "sun".)


partition table information for one of the devices is below:
--------------------------
# parted /dev/sdi
GNU Parted 1.8.1
Using /dev/sdi
Welcome to GNU Parted! Type 'help' to view a list of commands.
(parted) print

Model: JetStor Volume Set 416F (scsi)
Disk /dev/sdi: 13.0TB
Sector size (logical/physical): 512B/512B
Partition Table: gpt

Number  Start  End  Size  File system  Name  Flags
--------------------------

output of some commands:

$ pvdisplay
returns nothing (no error)

$ lvs -a -o +devices
returns nothing (no error)

$ pvck -vvvvv /dev/sdb
#lvmcmdline.c:915         Processing: pvck -vvvvv /dev/sdb
#lvmcmdline.c:918         O_DIRECT will be used
#config/config.c:950     Setting global/locking_type to 3
#locking/locking.c:245       Cluster locking selected.
#locking/cluster_locking.c:83   connect() failed on local socket: Connection
+refused
#config/config.c:955     locking/fallback_to_local_locking not found in
+config: defaulting to 1
  WARNING: Falling back to local file-based locking.
  Volume Groups with the clustered attribute will be inaccessible.
#config/config.c:927     Setting global/locking_dir to /var/lock/lvm
#pvck.c:32     Scanning /dev/sdb
#device/dev-cache.c:260         /dev/sdb: Added to device cache
#device/dev-io.c:439         Opened /dev/sdb RO
#device/dev-io.c:260     /dev/sdb: size is 25395814912 sectors
#device/dev-io.c:134         /dev/sdb: block size is 4096 bytes
#filters/filter.c:124         /dev/sdb: Skipping: Partition table signature
+found
#device/dev-io.c:485         Closed /dev/sdb
#metadata/metadata.c:2337   Device /dev/sdb not found (or ignored by filtering).
-------------------------

from doing google searches, I found this gem to restore a
PV:
pvcreate --uuid "cqH4SD-VrCw-jMsN-GcwH-omCq-ThpE-dO9KmJ"
                  --restorefile /etc/lvm/backup/vg_04 /dev/sdd1


however, the man page says to 'use with care'. I don't want
to lose data. Can anybody comment on how safe it would be to
run this?

Thanks in advance,
Julie Ashworth


-- 
Julie Ashworth <julie.ashworth@berkeley.edu>
Computational Infrastructure for Research Labs, UC Berkeley 
http://cirl.berkeley.edu/
PGP Key ID: 0x17F013D2
