Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j238GGK09126
	for <linux-lvm@redhat.com>; Thu, 3 Mar 2005 03:16:16 -0500
Received: from Datawav.net ([63.228.244.4])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j238GEw5014775
	for <linux-lvm@redhat.com>; Thu, 3 Mar 2005 03:16:15 -0500
Message-ID: <4226C7C8.10406@theserrs.net>
Date: Thu, 03 Mar 2005 01:16:08 -0700
From: Scott Serr <serrs@theserrs.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm2 on raid5 speed, not so bad
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Just to share some information...

Here is a "bonnie -s 1024" on a P4 2.4 with 512MB RAM.  The RAID5 is my 
weirdo way of doing multiple RAID5 devices so that I can move things 
around.  All 4 RAID5 meta devices are on the same 5 disks... 300GB SATA 
and (4) 200GB PATA drives.

LVM2 over RAID5
             -------Sequential Output-------- ---Sequential Input-- 
--Random--
             -Per Char- --Block--- -Rewrite-- -Per Char- --Block--- 
--Seeks---
          MB K/sec %CPU K/sec %CPU K/sec %CPU K/sec %CPU K/sec %CPU  
/sec %CPU
        1024 16987 69.9 34777  7.4 16659  4.1 21532 86.4 49760  9.2 
470.7  1.7


"Hot" SATA 300GB (Maxtor)
             -------Sequential Output-------- ---Sequential Input-- 
--Random--
             -Per Char- --Block--- -Rewrite-- -Per Char- --Block--- 
--Seeks---
          MB K/sec %CPU K/sec %CPU K/sec %CPU K/sec %CPU K/sec %CPU  
/sec %CPU
        1024 23553 96.2 62613 14.0 26123  5.1 22094 87.5 57233  6.9 
200.9  0.4

Forgot to mention that the RAID5 devices are 1024k "chunk-size".  
Filesystem is reiserfs.

-Scott
