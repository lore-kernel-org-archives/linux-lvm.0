From: George Karaolides <george.karaolides@planitis.net>
Content-Transfer-Encoding: 7bit
Message-Id: <1049701667.3010.22.camel@ariel>
Mime-Version: 1.0
Subject: [linux-lvm] Swap on LVM - swapoff problem
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
Date: Mon Apr  7 02:48:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi all,

I am swapping on lvm devices and aving a strange problem with swapoff.

I have the swap device configured in /etc/fstab, the relevant line is:

/dev/vg1/swap   none   swap    sw    0   0

swap seems to work OK but I have a strange problem with swapoff:

# swapoff /dev/vg1
swapoff: /dev/vg1: Invalid argument

If I comment out the swap line in /etc/fstab and start the swap manually
with swapon after system boot, then swapoff and swapon seem to work as
expected.

OS:  Debian 3.0r1 "woody"

Kernel: 2.4.18, 2.4.18 patched with VFS lock patch, and 2.4.20 patched
with VFS lock patch (problem is the same on various machines running all
these kernels).

The problem occurs in the same way on LVM swap devices built on disk
partition physical volumes, and also on software-RAID physical volumes.

Any ideas?

-- 
Best regards,

|   George Karaolides                      Planitis Communications Ltd.,
|
|   tel:   +357 22 45 65 00              Office 102, 11 Florinis Street,
|
|   web:   www.planitis.net                             Nicosia CY 1065,
|
|   email: george.karaolides@planitis.net           Republic  of Cyprus.
|
