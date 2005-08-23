Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7N8HiV29401
	for <linux-lvm@redhat.com>; Tue, 23 Aug 2005 04:17:44 -0400
Received: from styx.nll.se (styx.nll.se [81.216.21.34])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j7N8Hf5R011178
	for <linux-lvm@redhat.com>; Tue, 23 Aug 2005 04:17:41 -0400
Received: (from daemon@localhost) by styx.nll.se (8.9.3/8.9.3) id KAA11531
	for linux-lvm@redhat.com; Tue, 23 Aug 2005 10:17:30 +0200
From: fredrik.backman@nll.se
Received: (from daemon@localhost) by styx.nll.se (8.9.3/8.9.3) id KAA11056
	for <linux-lvm@redhat.com>; Tue, 23 Aug 2005 10:17:24 +0200
Received: from fsu50.nll.se (fsu50.nll.se [128.45.193.79])
	by flff0.nll.se (8.8.6 (PHNE_17135)/8.8.6) with ESMTP id KAA16702
	for <linux-lvm@redhat.com>; Tue, 23 Aug 2005 10:13:42 +0200 (METDST)
Received: from localhost (openmail@localhost)
	by fsu50.nll.se (8.11.6/8.11.6) with ESMTP id j7N8Dg409801
	for <linux-lvm@redhat.com>; Tue, 23 Aug 2005 10:13:42 +0200
Date: Tue, 23 Aug 2005 10:13:42 +0200
Message-Id: <H000007200561625.1124784821.fsu50.nll.se@MHS>
MIME-Version: 1.0
Content-Disposition: inline
	;Creation-Date="Tue, 23 Aug 2005 10:13:42 +0200"
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] (no subject)
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
To: linux-lvm@redhat.com

Hi

I try to create a regular LV striped over two PV:s but if i read the 
output from lvdisplay right i only get a linear distribution. Shouldn't 
the 1st LE be on PV#1, 2nd on PV#2 and so on?

lvcreate -i 2 -I 512 -L 1000 vg01

localhost.root 293> lvdisplay -v "/dev/vg01/lvol1" |more
--- Logical volume ---
LV Name                /dev/vg01/lvol1
VG Name                vg01
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 0
LV Size                1 GB
Current LE             32
Allocated LE           32
Stripes                2
Stripe size (KByte)    512
Allocation             next free
Read ahead sectors     1024
Block device           58:5

   --- Distribution of logical volume on 2 physical volumes  ---
   PV Name                  PE on PV     reads      writes
   /dev/sda                 16           0          2
   /dev/sdb                 16           0          0

   --- logical volume i/o statistic ---
   0 reads  2 writes

   --- Logical extents ---
   LE    PV                        PE     reads      writes
   00000 /dev/sda                  00000  0          2
   00001 /dev/sda                  00001  0          0
   00002 /dev/sda                  00002  0          0
   00003 /dev/sda                  00003  0          0
   00004 /dev/sda                  00004  0          0
   00005 /dev/sda                  00005  0          0
   00006 /dev/sda                  00006  0          0
   00007 /dev/sda                  00007  0          0
   00008 /dev/sda                  00008  0          0
   00009 /dev/sda                  00009  0          0
   00010 /dev/sda                  00010  0          0
   00011 /dev/sda                  00011  0          0
   00012 /dev/sda                  00012  0          0
   00013 /dev/sda                  00013  0          0
   00014 /dev/sda                  00014  0          0
   00015 /dev/sda                  00015  0          0
   00016 /dev/sdb                  00000  0          0
   00017 /dev/sdb                  00001  0          0
   00018 /dev/sdb                  00002  0          0
   00019 /dev/sdb                  00003  0          0
   00020 /dev/sdb                  00004  0          0
   00021 /dev/sdb                  00005  0          0
   00022 /dev/sdb                  00006  0          0
   00023 /dev/sdb                  00007  0          0
   00024 /dev/sdb                  00008  0          0
   00025 /dev/sdb                  00009  0          0
   00026 /dev/sdb                  00010  0          0
   00027 /dev/sdb                  00011  0          0
   00028 /dev/sdb                  00012  0          0
   00029 /dev/sdb                  00013  0          0
   00030 /dev/sdb                  00014  0          0
   00031 /dev/sdb                  00015  0          0


Regards Fredrik
