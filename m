From: George Karaolides <george.karaolides@planitis.net>
Content-Transfer-Encoding: 7bit
Message-Id: <1049870776.8446.42.camel@ariel>
Mime-Version: 1.0
Subject: [linux-lvm] Re: Swap on LVM - swapoff problem - SOLVED
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
Date: Wed Apr  9 01:46:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: debian-user@lists.debian.org, linux-lvm@sistina.com

Hi all,

I've solved the problem with swapoff and LVM swap devices on Debian
woody; and the solution may well apply to installations with the root fs
on LVM using other distributions as well.

The root filesystem on my machines is in a logical volume device, and to
mount this at boot time I needed to create an initrd with
lvmcreate_initrd.  This starts LVM before the root fs is mounted.  The
init scripts installed by the Debian LVM package then start LVM again,
which seems to cause the problem.

Removing the symlink /etc/rcS.d/S25lvm and rebooting seems to have
solved it:

# free
             total       used       free     shared    buffers    
Swap:       786424          0     786424
# swapoff /dev/vg1/swap
# free
             total       used       free     shared    buffers    
Swap:            0          0          0
# swapon /dev/vg1/swap
# free
             total       used       free     shared    buffers    
Swap:       786424          0     786424


Best regards,

|   George Karaolides                      Planitis Communications Ltd.,
|
|   tel:   +357 22 45 65 00              Office 102, 11 Florinis Street,
|
|   web:   www.planitis.net                             Nicosia CY 1065,
|
|   email: george.karaolides@planitis.net           Republic  of Cyprus.
|
