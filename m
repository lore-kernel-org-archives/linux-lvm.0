Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200103232311.f2NNBoG24415@webber.adilger.int>
Subject: Re: [linux-lvm] LVM corruption with ext2resize on Ultrasparc
In-Reply-To: <20010323225559.A20479@mercury.mercury.multiweb.nl> from Dave Wapstra
 at "Mar 23, 2001 10:55:59 pm"
Date: Fri, 23 Mar 2001 16:11:50 -0700 (MST)
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

Dave Wapstra writes:
> I recently tried to use ext2resize on my extended LV to resize the
> filesystem.  I found out that ext2resize does not yet support big-endian.
> However by even trying to use it, I messed up the volume group info on
> my PV's.
> 
> Here's what I did:
> 
> Created logical volume, made ext2 filesytem, extended logical volume)
> 
> [/root]# pvscan
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- ACTIVE   PV "/dev/sdb" of VG "ftp" [8.43 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/sdc" of VG "ftp" [8.43 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/sdd" of VG "ftp" [8.43 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/sde" of VG "ftp" [8.43 GB / 72 MB free]
> pvscan -- total: 4 [33.74 GB] / in use: 4 [33.74 GB] / in no VG: 0 [0]
> 
> [/root]# ext2resize /dev/ftp/lvol1 33g
> ext2resize v1.1.15 - 2000/08/08 for EXT2FS 0.5b
> ext2resize: ext2_open: invalid superblock
> ext2resize: can't open /dev/ftp/lvol1
> [/root]# pvscan
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- ACTIVE   PV "/dev/sdb"   is associated to an unknown VG (run vgscan)
> pvscan -- ACTIVE   PV "/dev/sdc"   is associated to an unknown VG (run vgscan)
> pvscan -- ACTIVE   PV "/dev/sdd"   is associated to an unknown VG (run vgscan)
> pvscan -- ACTIVE   PV "/dev/sde"   is associated to an unknown VG (run vgscan)
> pvscan -- total: 4 [33.74 GB] / in use: 4 [33.74 GB] / in no VG: 0 [0]
> 
> Note: this output is edited, but does show the problem.  After this, I get
> 
> vgcreate -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please run vgscan
> 
> and have to do dd if=/dev/zero of=/dev/sd<x> to clear all the tables
> and do a reboot to clean up the VGDA in the kernel

I _really_ need to see what you did in between here that could cause the
problem.  Did you do an lvextend or something?  Any messages in the
syslog?  Basically, it is impossible that ext2resize caused any problems.

All it does to generate the above messages is:
- open /dev/ftp/lvol1 for reading
- open /dev/ftp/lvol1 for writing
- read a 1kB block from the start of the disk
- exit because the EXT2 magic is wrong (byte swapped)

So whatever cause this problem is part of the missing output that was
edited away.  I take it you have tried running vgscan?  What about
"pvdata -a" and/or vgcfgrestore?

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
