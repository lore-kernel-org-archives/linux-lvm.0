Message-ID: <85063BBE668FD411944400D0B744267A8885C7@AUSMAIL>
From: "Gonyou, Austin" <austin@coremetrics.com>
Date: Tue, 25 Sep 2001 12:01:18 -0500
MIME-Version: 1.0
Subject: [linux-lvm] Cannot create LV beyond 16GB in size?
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
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

I've made 3 partitions. /dev/hdd1 /dev/hdd2 /dev/hdb9. 
I'm going to stripe them and then use all available size. 
When I do lvcreate, it won't let me go above 16G. Whats up with that?
Kernel 2.4.10
LVM 1.0 tools. 

-- 
Austin Gonyou
Systems Architect, CCNA
Coremetrics, Inc.
Phone: 512-796-9023
email: austin@coremetrics.com 

> -----Original Message-----
> From: lembark@wrkhors.com [mailto:lembark@wrkhors.com]
> Sent: Tuesday, September 25, 2001 11:56 AM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] Disk Died - Ideas?
> 
> 
> 
> 
> -- Jeff Layton <jeffrey.b.layton@lmco.com> on 09/25/01 11:02:32 -0400
> 
> > Hello,
> > 
> >    I searched the mailing list and the web but didn't come up with
> > too much to help me - so I thought I would ask the experts.
> >    I had 6 PVs across 6 disks (the first one was just part 
> of the disk,
> > the other 5 spanned the entire drives). On top of this I had vg01
> > and in that I had lvol1. lvol1 was ext2 formatted and mounted as
> > /home. There is no striping across the disks. The first drive is
> > internal (part of the root disk) and the other five are external to
> > the machine.
> >    Well, of course, the last disk gave up the ghost (lots of SCSI
> > errors, machine will not boot without unplugging drives from
> > machine). I'm pretty sure you can guess what I'm going to ask :)
> > Can I just unplug the last drive, bring the system up, don't run
> > fsck on lvol1, mount lvol1, and try to pull as much data as I can
> > off what's left of the filesystem? If this works, then I can just
> > redo the PVs, the VGs, and the LVOLs and recreate the filesystem
> > and move over what data I can recover.
> >    Oh, by the way, this filesystem had no backups. The powers
> > to be claimed they were working on a backup solution for us,
> > but they didn't get one in place by the time this drive 
> died. I know,
> > I know. I screamed very loudly, made lots of enemies internally,
> > but still no backups were ever done. It's a good thing they don't
> > allow firearms on the site :>
> 
> 
> vgexport vgXX;
> vgimport vgXX <list of disks that didn't fail>
> 
> 
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
