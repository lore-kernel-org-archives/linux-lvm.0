Return-Path: <evan.day@home.com>
From: evan.day@home.com
Subject: Re: [linux-lvm] mirroring boot and root
Message-Id: <E156DD7-00078c-00@kirk.banal.collective>
Date: Sat, 02 Jun 2001 08:21:05 -0700
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

> Hi,
> Can someone point me in the right direction.
> I'm coming from hpux-land.  They allow for mirroring of the boot
lvm's.
> 
> Is this doable under linux/lvm?

Linux LVM does not have any support for mirroring in itself.  However,
the linux kernel does contain software RAID support - it is possible to
run LVM on top of a RAID 1.  I do this, and have successfully booted 
from each disk with the other disk in the RAID down.

LILO 21.7 contains support for placing a boot sector on RAID devices.  I
used install-mbr to put a boot MBR on sda and sdb, then lilo to put a 
LILO boot sector on /dev/md0, which is sda1 and sdb1.  The rest of my
system is built on PV /dev/md1, which is sda4 and sdb4.

I'm not sure if there are future plans to add mirroring to LVM or not. 
However, by building LVM on top of RAID, you don't have to worry about
quorum when you lose a disk.  The first time we lost a boot drive on 
HP-UX at work it was quite a learning experience :)

--
Evan Day <evan.day@home.com>
GPG:1024D/237C1C84 FP:1615 E312 A6D1 542B C4A6 38B5 69B1 2844 237C 1C84
"My bologna has first name, it's H-O-M-E-R..."
