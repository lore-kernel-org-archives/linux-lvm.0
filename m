Return-Path: <lembark@wrkhors.com>
Message-ID: <3B1F9D41.F150CC71@wrkhors.com>
Date: Thu, 07 Jun 2001 10:26:57 -0500
From: Steven Lembark <lembark@wrkhors.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LILO configuration for LVM "boot" filesystem
References: <20010604190123.C2560@pc.ilinx> <3B1CC8D5.9F227A36@wrkhors.com> <20010605104843.A9845@stocks.pillory.com>
Content-Transfer-Encoding: 7bit
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

>     More importantly, it needs to be a lot more stable.  I will probably
> wait on having a LV for root until Linux LVM is a robust as AIX's LVM.
> Under AIX, all of your 'system' volumes (root,usr,var) are in rootvg.
> You can add a disk to rootvg, and then issue pvmove to move all of the
> blocks on the first disk to the new one, run bosboot (LILO, roughly
> speaking) to make the second drive bootable, and then reduce the first
> disk from the VG.  Thus, if your drives are hot-swappable, you can change
> out a drive completely (even if your / is mounted on it and it has active
> swap!) without every shutting down.

HP has a nice trick, the first 3 volumes have to be contiguous
at the start of the disk.  Net result is that if the VG gets
corrupted (e.g., one disk goes down and prevents quorum) you
can boot "-lm" which turns off the LVM service and leaves the
box looking like it was partitioned with boot, / & swap on line.

If LVM is used as a module and your rc.sysinit is sane (i.e., 
heavily stripped from all of the distribution standard ones)
then you can boot single user w/o locking up on a vgscan or 
vgchange.  If everything works, fine.  If not then at least
you can get going.

-- 
 Steven Lembark                                   2930 W. Palmer St.
                                                 Chicago, IL  60647
 lembark@wrkhors.com                                   800-762-1582
