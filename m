Return-Path: <medi@sc.prepass.com>
Message-ID: <3AE46CC1.FEE62DC@sc.prepass.com>
Date: Mon, 23 Apr 2001 10:56:17 -0700
From: Medi Montaseri <medi@sc.prepass.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Need help with LVM on RedHat 7.1
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
Content-Type: text/plain; charset="us-ascii"
To: LVM <linux-lvm@sistina.com>

I have been holding my breath for 2.4 for so long and as I download and
install RedHat 7.1 with 2.4.2-2, I find that LVM is not by default
configured.
vgscan(1) reports no lvm.o module found.

So I get the sources and compile with RAID and LVM marked as modules.

#
# Multi-device support (RAID and LVM)
#
CONFIG_MD=y
CONFIG_BLK_DEV_MD=m
CONFIG_MD_LINEAR=m
CONFIG_MD_RAID0=m
CONFIG_MD_RAID1=m
CONFIG_MD_RAID5=m
# CONFIG_MD_MULTIPATH is not set
CONFIG_BLK_DEV_LVM=m

My make menuconfig; make dep; make clean; make bzImage are all fine.
Based on some docs, I was now supposed to do 'make modules'.
this part is breaking with some errors from 'drivers/md/linear.c"

Other documents say, one has to install the kernel and reboot and then
make modules.

Can someone help me with this.
Is RedHat planning to include LVM in their kernel. I don't like to have
to build kernel
for production. (just in case I have to bring one up fast as a
replacement).

Thanks

--
=======================================================================
Medi Montaseri, medi@prepass.com, 408-450-7114
Prepass Inc, IT/Operations, Software Eng.
=======================================================================
