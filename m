From: George Karaolides <george@karaolides.com>
Message-Id: <Pine.LNX.4.40.0202020226580.695-100000@phobos.internal.parmastocks.com>
MIME-Version: 1.0
Subject: [linux-lvm] Root fs on LV on software RAID
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
Date: Fri Feb  1 19:00:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi all,

I'm a new subscriber to this list, learning how to use LVM on Debian
woody with kernel version 2.4.17.

So far, I've managed to build filesystems (ext2) in logical volumes on
top of software RAID-1, mount them and copy data into them.

I'd like to know if it is possible to have the root filesystem on an LV on
top of software RAID (provided, of course, that /boot is on a separate
partition readable by lilo).  I've searched the past few months' worth of
list archives and have found no reference to whether this is actually
possible or not.  Has anyone done this?

Thanks in advance and best regards,

|      George Karaolides       8, Costakis Pantelides St.,         |
|      tel:   +357 99 68 08 86                  Strovolos,         |
|      email: george@karaolides.com       Nicosia CY 2057,         |
|      web:   www.karaolides.com      Republic  of Cyprus          |
