From: jasonf@Cronosys.COM
Message-ID: <20000322181245.A23099@nccr-cle-c.nccrs.com>
Date: Wed, 22 Mar 2000 18:12:45 -0500
Subject: Re: [linux-lvm] RaidZone RAID hardware.
References: <20000322104034.B23747@nccr-cle-c.nccrs.com> <20000322182603.A2086@sb.t-online.de>
Mime-Version: 1.0
In-Reply-To: <20000322182603.A2086@sb.t-online.de>; from Christoph Hellwig on Wed, Mar 22, 2000 at 06:26:03PM +0100
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

On Wed, Mar 22, 2000 at 06:26:03PM +0100, Christoph Hellwig wrote:
> On Wed, Mar 22, 2000 at 10:40:34AM -0500, jasonf@Cronosys.COM wrote:
> > Has this been seen before, and might anyone have any clues?  My config is
> > using the 0.8i patch on 2.2.14 with the RaidZone patch.  The RaidZone patch
> > basically just implements the RaidZone devices (/dev/rz*), but also adds
> > support for more IDE major numbers (all of the drives in the
> > RAID can are also individually accessible, although I haven't tested that).
> 
> Try ingo's raid patches for 2.2.14 (http://www.redhat.com/~mingo/),
> they should be much better then the raidzone crap.

Okay, I got that up and working, and a huge md0 device.  It's a pitty I
can't monitor the can temperature and fan power draw now ;-)

(I can probably hack Consensus' patch to get that info without enabling
the fault tolerant stuff, but I'm lazy.)

> 
> > The RaidZone patch is only available for 2.2.12, 2.2.13, and 2.2.14, which
> > is why I chose 2.2.14; are there any issues with 0.8i on 2.2.14 this might
> > be exposing?  When will 0.8final be available for 2.2.14, and what needs to
> > be done there?
> 
> You can use 2.2.14aa10, that has lvm included
> (ftp.kernel.org/pub/linux/kernel/andrea/)

I ended up throwing the aforementioned raid patches with lvm and Consensus'
patches so that the IDE drives are detected (but with Consensus' software
raid and other stuff disabled).

> 
> > P.S. [offtopic] Anyone know where the ext3 patches are, and whether any of
> 
> ftp://ftp.linux.org.uk/pub/linux/sct/fs/jfs/
> 
> > the various ext2 resizers (including the one that works when mounted) will
> > work with the ext3 journal in place? 
> > And that ext3 works with LVM, of course.
> 
> ext3 works with lvm but no with software raid.

Okay, ext2 it is then.

I'm having another problem now.  I've made the md0 raid device, and it's
the proper size (about 155 gig).  Now I create a volume group, and it seems
to work, but vgdisplay shows me:

[root@medusa /root]# vgdisplay
--- Volume group ---
VG Name               raid_vg
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                1
Open LV               1
MAX LV Size           64 GB
Max PV                32
Cur PV                1
Act PV                1
VG Size               159 MB
PE Size               1 MB
Total PE              159
Alloc PE / Size       100 / 100 MB
Free  PE / Size       59 / 59 MB


[root@medusa /root]#

Why is the VG size 159Mb when the md0 volume is ~150Gb?

(I have a logical volume I was playing around with to make sure LVM wasn't
lying to me, and it *works*, but I can't create a lv greater than 159Mb,
and this is with a 1mb PE.  The default 4mb PE gives me like thirty-something
PEs to play with, and 8mb gives me a different number, but still way
inapropriate.)

What do you think?  Have I hit a limit of lvm or software RAID?  There
will be more playing to-morrow.

> 
> 
> Christoph
> 
> -- 
> Always remember that you are unique.  Just like everyone else.


-Jay 'Eraserhead' Felice
(Hmm, forgot to sign that last message).
