Return-Path: <urs@isnogud.escape.de>
From: Urs Thuermann <urs@isnogud.escape.de>
Date: 26 Feb 2001 16:44:34 +0100
Message-ID: <m2snl1phy5.fsf@isnogud.escape.de>
Subject: [linux-lvm] LVM and *bad* performance (no striping)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I tried to use LVM today using Linux 2.4.2 and it mostly works like I
expected.  But the performance is unacceptably bad:

    isnogud:/root# fdisk -l /dev/sda|grep sda5
    /dev/sda5            80       399   2570368+  8e  Linux LVM
    isnogud:/root# pvcreate /dev/sda5
    pvcreate -- physical volume "/dev/sda5" successfully created
    
    isnogud:/root# vgcreate vg0 /dev/sda5
    vgcreate -- INFO: using default physical extent size 4 MB
    vgcreate -- INFO: maximum logical volume size is 255.99 Gigabyte
    vgcreate -- doing automatic backup of volume group "vg0"
    vgcreate -- volume group "vg0" successfully created and activated
    
    isnogud:/root# lvcreate -n test /dev/vg0 -L 300M
    lvcreate -- doing automatic backup of "vg0"
    lvcreate -- logical volume "/dev/vg0/test" successfully created
    
    isnogud:/root# time dd if=/dev/sda5 of=/dev/null count=100000
    100000+0 records in
    100000+0 records out
    
    real    0m6.720s
    user    0m0.300s
    sys     0m0.970s
    isnogud:/root# time dd if=/dev/vg0/test of=/dev/null count=100000
    100000+0 records in
    100000+0 records out
    
    real    0m41.851s
    user    0m0.350s
    sys     0m2.250s

When making an ext2 filesystem on /dev/sda5 or /dev/vg0/test
respectivley, the performance of cp'ing, grep'ing all files and rm'ing
all files, seems to be comparable.  But why is the performance of
reading the block device with dd so bad?


urs
