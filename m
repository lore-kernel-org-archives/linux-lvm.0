Message-ID: <3DF39CAE.1050301@comedia.it>
From: Luca Berra <bluca@comedia.it>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Recovering from a disaster...
References: <Pine.LNX.4.44.0212061842370.13951-100000@dragon.inside.ntisys.c om> <98420000.1039364520@[192.168.100.3]>
In-Reply-To: <98420000.1039364520@[192.168.100.3]>
Content-Transfer-Encoding: 7bit
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
Date: Sun Dec  8 13:25:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Steven Lembark wrote:

> Among the things they don't have is a sane boot command prompt
> that allows cleaning up the system by bypassing LVM on startup
> (e.g., "boot -lm /dev/blah" on HP PARISC systems). And, yes,
> this is true of Wintel-look-alike systems also, AMD has not
> done any better job of leaving you with a command line at boot
> to handle nasty situations.

i won't say about sgi or sun, but HP PARISC system do not provide this 
in firmware.


i have already posted on this list about hp systems, i'll do again (from 
memory so forgive any imprecisions)

hp 9000 firmware is able of identifying most hardware and of booting 
from disk, cd, tape or lan (dhcp + proprietary load method)

on the boot media ther is a 2Mb area called LIF area that contains an 
archive with some utilities (you can peek at containts using 'lifls 
/dev/rdsk/cXtYdZ)
hp firmware loads and runs something called ISL contained in this archive.
- end of firmware work (mostly) -

ISL is a secondary loader it can load other utilities contained in the lif.
HPUX is one of these utilities: it is able to read data from an hfs 
formatted filesystem and sets up the kernel using this data.
it can pass parameters to the kernel.
the magic
hpux -lm (device path)/path/to/kernel
works by reading a file contained in the same place as the kernel called 
rootconf, rootconf contains in binary form the offset on disk and lenght 
of the root filesystem.

That's all, it can be implemented with grub and linux lvm NOW if we want 
to accept the limit of having a fixed size contiguous root filesystem.

we can do better than that even with the crippling pc bios and we should 
be able to disregarding the firmware we are running from (assuming it is 
at least able to boot from one of (disk/tape/cd/floppy/lan)

I am strongly annoyed at ppl that continuously state 'dont put root on 
lvm because it is unsafe'.

the only difference between code parsing a partition table and code 
parsing lvm metadata is complexity, if you screw the partition table
(or if you rm /stand/rootconf on hp-ux AND screw LVM boot area) you are 
in the same situation.

linux already has the means of making it extremely safe and much more 
extensible than what other systems have. and if it is designed to work 
on the most crippled firmware we have (pc bios) it will certainly work 
with better firmware.

just create an lvm on disk format that reserves the first megabytes for 
a secondary loader (we can even use a linux kernel and it's initramfs as 
a secondary loader with 2.6).

tell the secondary loader where the root filesystem is placed (in case 
you screw LVM) it should not be a very complex map and it can be 
replicated in more than one place if necessary.

oh, we probably have to dump pc partition table format for this (too 
sorry :)

L.
