Message-ID: <9BBB7C9EFEF1874BAC4DC204E867EFAF02560CD8@s99mail06>
From: "Little, Chris" <Chris.Little@okdhs.org>
MIME-Version: 1.0
Subject: [linux-lvm] lvm issues
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
Date: Mon Dec  1 17:59:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

I am having an issue with LVM.  Particularly with the "-s" option of
lvcreate.  I have an oracle database contained within 10 lv's of a 15 volume
vg.

When executing the snapshot, the database always returns corrupted.  The
error is :
DBVERIFY: Release 9.2.0.3.0 - Production on Mon Dec 1 17:02:28 2003

Copyright (c) 1982, 2002, Oracle Corporation.  All rights reserved.

DBVERIFY - Verification starting : FILE = /u03/oradata/KIDS/SINVG101.dbf
Page 89582 is influx - most likely media corrupt
***
Corrupt block relative dba: 0x03015dee (file 12, block 89582)
Fractured block found during dbv:
Data in bad block -
 type: 0 format: 2 rdba: 0x03015dee
 last change scn: 0x0000.00000000 seq: 0x1 flg: 0x05
 consistency value in tail: 0x00000000
 check value in block header: 0x5fe9, computed block checksum: 0x26af
 spare1: 0x0, spare2: 0x0, spare3: 0x0
***

We are running SuSE Linux Enterprise Server 8, Service Pack 3 on an IBM
z/900 under z/VM 4.3.  We have tried different filesystems, but currently we
are running ext3.  fsck -f reports clean.  Please let me know what kind of
information you need.


Linux s99lxd02 2.4.21-83-default #1 SMP Fri Oct 31 00:38:02 UTC 2003 s390
unknown
Logical Volume Manager 1.0.5(mp-v6)


+---------------------------------------------------------------------------
+
 | Chris Little                chris.little@okdhs.org                      |
 | Ok Dept of Human Services   Data Services Division  (405)522-1306       |
+---------------------------------------------------------------------------
+
