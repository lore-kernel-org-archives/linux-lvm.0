Return-Path: <raheesom@navpoint.com>
Subject: RE: [linux-lvm] Converting my Root file system to LVM
From: Rupert Heesom <raheesom@navpoint.com>
In-Reply-To: <NBBBKLKHMJHIJLHOGAOJGEMNIOAA.steve.wray@the.net.nz>
References: <NBBBKLKHMJHIJLHOGAOJGEMNIOAA.steve.wray@the.net.nz>
Date: 23 May 2001 09:14:54 -0400
Message-Id: <990623699.8904.2.camel@localhost>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On 23 May 2001 16:01:37 +1200, Steve Wray wrote:
> > From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> > Behalf Of Rupert Heesom
> 
> > Tnx, Steve for the easy howto of your's below.
> > BTW, what on earth is that "mount -o loop" command?
> 
> Glad to have helped!
> the "-o loop" tells mount to mount the file on the loopback device.
> This allows ordinary files (not just block devices) to carry a filesystem.
> Its quite cool!
> :)

That IS pretty cool.

> 
>  
> > Since my LVol is on my 2nd disk, next, I think I'll try extending my
> > Lvol back to cover my 1st disk as well.
> 
> Just watch out for your /boot parition.
> You might want to copy lilo.conf over to the /boot partition
> and make /etc/lilo.conf a symlink to it there.

Yes, I've done that already.  The suggestion was in the man page for
"lvmcreate_initrd".

> 
>  
> > One more bit of help, if you can? -
> > 
> > I want to pvmove the file contents of my 2nd disk (/dev/sdb) to my 1st
> > disk (/dev/sda).  My 1st disk is nice & quiet!  Now the lvm-howto
> > specifies my next step (adding the "old partition" into the Lvol) as --
> 
> phew... I have no idea about moving things from PV to PV,
> however, you may want to look at setting up a miniroot-in-a-ramdisk
> for this sort of thing. I suspect you need to have the VGs deactivated,
> and you can't do *that* when its in use as the root LV.

I think the concept is covered (to a degree) in the lvm-howto under
"removing an old disk" or something like that.

I've practiced this pvmove thing on my 2nd disk when it was spare.
From what I remember, the both PVs had to be inside a VG.  The pvmove
itself wasn't a problem for me, but the LV had to be dismounted to
resize it. I will have to extend my LV & resize the file system using
e2fsadm, so I will have to dismount the root volume.  It sounds like I
DO need the root ram disk which you mention.  I'll read up about it.

> 
> Check out;
> http://innominate.org/~graichen/projects/miniroot
> 
> miniroot is fantastic, but it needs some work to make it useful
> for LVM.
> Mainly, just unzip and mount it (like you did for the initrd file before)
> and copy over the lvm programs and libraries.
> 
> You'll need to set up a lilo entry too, of course.
> I think its well documented.
> 
> BTW; I'd *seriously* recommend this for anyone with LVM root.
> It can get you out of trouble!
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> 

-- 
regs
rupert
