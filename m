Return-Path: <steve.wray@the.net.nz>
From: "Steve Wray" <steve.wray@the.net.nz>
Subject: RE: [linux-lvm] Migrating to an LVM system (boot/root) disk
Date: Sun, 3 Jun 2001 22:59:35 +1200
Message-ID: <NBBBKLKHMJHIJLHOGAOJEEAMIPAA.steve.wray@the.net.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20010603032225.K21442@linux.interlinx.bc.ca>
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

> Behalf Of Brian J. Murrell
> On Sun, Jun 03, 2001 at 05:02:41PM +1200, Steve Wray wrote:

> > 2. Having a /boot on LVM *is* possible, BUT you will need to boot
> > from floppy.
> 
> No you don't.  There are several in depth discussions in the archive
> about doing this including a posting (several times in fact) of a
> patch to Lilo to help it locate the kernel and initrd on an LVM /boot.
> Please see the archives for details.

Cool, I'll check it out!


> > 3. to get over your night horrors, make a boot disk
> 
> disks!  My initrd is 1.3MB alone!

compressed? Two disks (1 for kernel 1 for root) is not unusual.


> > that includes the LVM
> > tools. A good starting point is miniroot. I posted a URL to it on this
> > list a little while ago. I don't have it to hand but it'll be in the
> > archive!
> 
> Yeah, I realize that making boot diskettes is what I have to do, but
> the "automated" mkbootdisk that some distros ship as well as the
> various root/boot kits out there sure are not going to inclue the LMV
> tools.  Having to manually craft the pair is a pain.  :-)

No need.
Given the miniroot.gz file, one uncompresses it, mounts it
(eg)
mount -o loop miniroot /mnt/loop/

then simply copy the lvm tools over to /mnt/loop/sbin
You can change the init script too.
Then just unmount it and regzip it and rerun lilo.

The lvm initramdrive can be mounted in the same way.
It should give some clues.

 
> Perhaps just like LVM has a nice little script for creating the
> initrd, they can ship with a nice little script for creating root/boot
> diskettes.

Yes and I hope the mkinitrd (whatever its called...) is fixed so that
it copies sed to the ramdrive...

 
> Of course a lot of this headache goes away if the kernel had the
> "auto-detection" code like it does for MDs.

ahhhh that would be cool!
:)
Shoudn't be too far off?
