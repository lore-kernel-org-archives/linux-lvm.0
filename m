Return-Path: <evan.day@home.com>
From: evan.day@home.com
Message-Id: <20010727032755.E8509DA7@spock.banal.collective>
Date: Thu, 26 Jul 2001 20:27:55 -0700 (PDT)
Subject: [linux-lvm] LVM 0.9.1beta8 upgrade okay?
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

After a few reboots and fiddling with the RAID (to make sure I always
had at least one disk that wasn't upgraded and still bootable, since I
do have my root fs on LVM :), everything seems to be okay at beta 8.  

However, at boot time, I get the following:

Jul 26 18:43:14 spock kernel: lvm -- lvm_blk_ioctl: unknown command
0x5310

Everything comes up okay, though, and pvversion says I have version 2:

spock:~/LVM/0.9.1_beta8/tools# ./pvversion -version /dev/md1
pvversion -- physical volume "/dev/md1" has version: 2 / data_location:
6144

Kernel is definitely upgraded, it reports LVM 0.9.1beta8 during boot.  I
rebuilt the initial ramdisk and it is at beta 8, so I'm not sure about
that lvm_blk_ioctl error.
