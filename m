Message-ID: <OFD5B2E37D.868A777F-ONC1256D2C.003E9C8D@phoenixcontact.com>
From: "Dietmar Stein" <DStein@phoenixcontact.com>
MIME-Version: 1.0
Subject: [linux-lvm] Snapshot of ReiserFS
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
Date: Tue May 20 06:31:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi

I am new to the list, but I went through the archives and find some ideas
but not an approbiate answer ... I want to make a snapshot of a mounted
logical volume, which is formated with ReiserFS v3.6.

My configuration:
Compaq DL580 with SmartArray 5300 controller with Storage Enclosure 4312R
attached, 12 disks + 2 disks for system
SuSE Enterprise Server 8 (United Linux 1.0) with kernel 2.4.19-4GB, lvm
1.0.7

I have created six volume groups, consisting of two physical disks each;
each volume group (36 GB large) contains two logical volumes, each 10 GB.
The groups and volumes are labeled as

volgrp01, lv01vg01, lv02vg01 (volume group 01, logical volume 01 on volume
group 01 ...)
volgrp02, lv01vg02, lv02vg02
volgrp03, lv01vg03, lv02vg03

I have mounted lv01vg01 to /data_1 and I have created an empty file with dd
if=/dev/zero of=/data_1/testfile.raw bs=1M count=4000, then I followed
documentation and did a lvcreate -L 11000M -s -n snaplv01vg01
/dev/volgrp01/lv01vg01.

All I can see is harddisk activity, but the command prompt did not return
(I have been waiting for 2 hours), so I turned on verbose mode and last
message is "locking lvm" (something like that) and then I have been waiting
again.

What's the problem, mistake?

Thanks, Dietmar
