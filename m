Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200105240641.f4O6fIrW031893@webber.adilger.int>
Subject: Re: [linux-lvm] Converting my Root file system to LVM [lastquestion]
In-Reply-To: <NBBBKLKHMJHIJLHOGAOJGENMIOAA.steve.wray@the.net.nz>
 "from Steve Wray at May 24, 2001 10:24:28 am"
Date: Thu, 24 May 2001 00:41:18 -0600 (MDT)
MIME-Version: 1.0
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

Steve Wray writes:
> > If root is unmounted when /sbin/vgchange is called, will the system
> > use the ramdisk?   If so, how does it know to use it?   (I'm kinda
> > new to figuring out how ramdisks work, I just follow instructions
> > and they work!)
> 
> Hey thats a good point... maybe a halt-time ramdisk? :)

Actually, I posted a similar question to linux-kernel, but I think it was
lost in the noise.  Basically, it _is_ possible to have a "finitrd" for
just this situation (at least on 2.4).  You unmount all but root, set up
a ramfs, and pivot_root into the ramfs.  You can then unmount root (not
just a read-only remount), and properly shutdown LVM/RAID/etc.  Haven't
tried it myself, but it should work.

Note that LVM doesn't actually write anything to disk with "vgchange -an",
so there is no real need to do this.  

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
