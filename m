From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] LILO+LVM:  Fatal: This version of LVM does not
    support boot LVs
Message-Id: <20020215151015.H14054@lynx.adilger.int>
References: <m2heoivkr6.fsf@isnogud.escape.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <m2heoivkr6.fsf@isnogud.escape.de>; from
    urs@isnogud.escape.de on Fri, Feb 15, 2002 at 04:15:57PM +0100
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
Date: Fri Feb 15 16:12:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Urs Thuermann <urs@isnogud.escape.de>
Cc: linux-lvm@sistina.com

On Feb 15, 2002  16:15 +0100, Urs Thuermann wrote:
> I installed lilo-22.2 and moved my /boot from /dev/sda1 to my root FS
> which is on LVM /dev/vg0/root.  When running lilo I get the message
> 
>     Fatal: This version of LVM does not support boot LVs

I suppose that in your case this message is misleading.  It should also
say that it doesn't support booting from striped volumes.

> which is from Andreas' LILO patch.  lilo checks wether the logical
> blocks 0 and 255 are also 255 apart from each other on the physical
> device (assuming the device is the same).
> 
> This clearly works only on non-striped and contigous LVs (which is why
> it doesn't work for me since /dev/vg0/root is striped).
> I suppose this is intended, but why?

Well, it was always my understanding that this is a BIOS limitation.
I implemented this test because LILO also refuses to boot from RAID-0
(striped) devices.

> the lilo loader load blocks from different devices and blocks which
> are not in ascending order?  The 5-byte structure describing the
> blocks to load contains the device: (from lilo/README):
> 
>      sector    [1..63] plus 2 high bits of Cylinder
>      cylinder  [0..1023] low eight bits in this byte
>      device    [0..3] for floppies, [0x80..0x8F] for hard disks
>      head      [0..254] no, the max is 254, not 255
>      count     [1...] number of sectors to transfer
> 
> So, why not support booting from striped and non-contiguos LVs?

Well, if this is the case, and it's not a BIOS limitation, feel free
to fix the LILO code and test it.  If it works, then send a patch to
the LILO maintainer.

I for one think it is a terrible idea to boot from a striped device.
This doubles the chance that a disk failure will make your system
unbootable, in addition to all the possible problems you can have
with your LVM config.

What is your motivation for doing this in the first place?  Let me
guess "increased performance"...

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
