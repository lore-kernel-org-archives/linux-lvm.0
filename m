Return-Path: <f44bd48015a873528fe7ce72499b8e2f@interlinx.bc.ca>
Date: Sun, 3 Jun 2001 23:04:53 -0700
Subject: Re: [linux-lvm] Migrating to an LVM system (boot/root) disk
Message-ID: <20010603230453.A1829@pc.ilinx>
References: <20010602191624.E21442@linux.interlinx.bc.ca> <200106040340.f543eKBD005168@webber.adilger.int>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200106040340.f543eKBD005168@webber.adilger.int>; from adilger@turbolinux.com on Sun, Jun 03, 2001 at 09:40:20PM -0600
From: "Brian J. Murrell" <lvm@interlinx.bc.ca>
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

On Sun, Jun 03, 2001 at 09:40:20PM -0600, Andreas Dilger wrote:
> 
> That's because LVM 0.9.1b7 is broken w.r.t. LILO.

Ahhh.  Now that makes sense.  :-)

> You must have a very strange system if your IDE drive will be known as
> /dev/sda1 (maybe IDE-SCSI)?

Oops.  I am a SCSI-head.  I don't normally use IDE but I am giving
ATA66 a whirl on my workstation.  Because of my predominant use of
SCSI /dev/sd* is what I am used to dealing with.  Of course I meant
/dev/hda1 rather than /dev/sda1

> In any case, yes I think that this will
> screw up your boot sector.  What you can try is the "disk=" parameter
> in your lilo.conf, saying /dev/hdc has BIOS number 0x80, so that when
> you shuffle your disks the boot sector will be correct.

It's not so much the boot sector I am worried about.  What concerns me
is that when I set up my new disk (on /dev/hdc1) with LVM, LVM is
associating the device /dev/hdc1 with the PV.  What happens to that
association when I move the disk to the primary ide bus and it becomes
/dev/hda1?

> I put a (non-LVM) rescue boot partition on my disk which has basically
> everything from /bin, /sbin, and some /lib/lib*, /lib/modules/<kernel>.

Everything that is needed for LVM you mean or do you mean you copied
everything from your root filesystem?  If the latter, would that not
be overkill?

But I like the idea.  I was thinking it was time to move on from
emergency boot diskette(s) to a boot CD-ROM.

> Cheers, Andreas

Thanx Andreas,
b.

-- 
Brian J. Murrell
