Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102201045.f1KAj3C10942@webber.adilger.net>
Subject: Re: [linux-lvm] vgscan creation of device nodes for volume groups.
In-Reply-To: <Pine.LNX.4.30.0102172218260.8781-100000@beefcake.hdqt.valinux.com>
 from Jay Weber at "Feb 17, 2001 10:24:38 pm"
Date: Tue, 20 Feb 2001 03:45:03 -0700 (MST)
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

Jay Weber writes:
> [snip]
> Next, I turn all the volumes off and essentially turn off lvm.  I remove
> one of the devices (loop devices in this case to test this out).  I'm
> removing /dev/loop1 which is the device for /dev/vol1.  I then rerun
> vgscan and activate my volumes.  Below are the new /dev entries for the
> volumes.
> [snip]
> Note the duplicate device nodes numbers for vol1 and vol2.  This makes
> sense in that the prior /dev entry for a volume is left around after
> volumes are disable (rather than cleaned up).  Now, the problem I'm having
> with this situation is that obviously any entries in /etc/fstab based on
> the device node entries may not be proper, I could end up with the wrong
> devices mounted on the wrong mount points. ;(

One of the problems of the current LVM is that it deletes and re-creates
the device nodes each time you run vgscan.  IMHO, we should keep devices
around until we do a vgexport or vgremove.  Maybe the tools can be made
so that we do not advocate the use of vgscan except in extreme failure
cases.

Otherwise, we have problems as yours, problems with NFS servers that crash,
etc.  Having non-static device numbers makes it impossible to set up NFS
server failover and other things that export device numbers from the server.

> I gather one possible way around this would be to use a filesystem label
> on the filesystem on above devices and mount via that.  But last I check,
> mount via fslabel didn't work with LVM devices.

I'm surprised that mount-by-label doesn't work.  I use this on most of my
systems, but maybe not in conjunction with LVM.  I would think the right
thing to do (rather than rely on device names) is to use device numbers
for LVM.  It may need a bit of hacking to mount, but I was actually going
to do this anyways - I want to make a "UUID and LABEL" library, because
this code is common to mount, fsck, and others.  We may want to add it to
the kernel as well (I have a patch to mount root by LABEL or UUID).  Also,
when the reiserfs folks get around to adding LABEL and/or UUID support to
their superblock, it makes sense to only need to add this to one place.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
