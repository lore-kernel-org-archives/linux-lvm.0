Return-Path: <steve.wray@the.net.nz>
From: "Steve Wray" <steve.wray@the.net.nz>
Subject: RE: [linux-lvm] Converting my Root file system to LVM
Date: Wed, 23 May 2001 16:01:37 +1200
Message-ID: <NBBBKLKHMJHIJLHOGAOJGEMNIOAA.steve.wray@the.net.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <990575643.1151.0.camel@localhost>
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
To: linux-lvm@sistina.com

> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> Behalf Of Rupert Heesom

> Tnx, Steve for the easy howto of your's below.
> BTW, what on earth is that "mount -o loop" command?

Glad to have helped!
the "-o loop" tells mount to mount the file on the loopback device.
This allows ordinary files (not just block devices) to carry a filesystem.
Its quite cool!
:)

 
> Since my LVol is on my 2nd disk, next, I think I'll try extending my
> Lvol back to cover my 1st disk as well.

Just watch out for your /boot parition.
You might want to copy lilo.conf over to the /boot partition
and make /etc/lilo.conf a symlink to it there.

 
> One more bit of help, if you can? -
> 
> I want to pvmove the file contents of my 2nd disk (/dev/sdb) to my 1st
> disk (/dev/sda).  My 1st disk is nice & quiet!  Now the lvm-howto
> specifies my next step (adding the "old partition" into the Lvol) as --

phew... I have no idea about moving things from PV to PV,
however, you may want to look at setting up a miniroot-in-a-ramdisk
for this sort of thing. I suspect you need to have the VGs deactivated,
and you can't do *that* when its in use as the root LV.

Check out;
http://innominate.org/~graichen/projects/miniroot

miniroot is fantastic, but it needs some work to make it useful
for LVM.
Mainly, just unzip and mount it (like you did for the initrd file before)
and copy over the lvm programs and libraries.

You'll need to set up a lilo entry too, of course.
I think its well documented.

BTW; I'd *seriously* recommend this for anyone with LVM root.
It can get you out of trouble!
