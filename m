Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200105012325.RAA27700@lynx.turbolabs.com>
Subject: Re: [linux-lvm] LVM & high system load
Date: Tue, 1 May 2001 17:25:36 -0600 (MDT)
In-Reply-To: <3AEF2F97.E70A8CA7@loria.fr> from "Dominique LARCHEY-WENDLING" at May 01, 2001 11:50:15 PM
MIME-Version: 1.0
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

Dominique Larchey writes:
> I point out that /dev/mmedia/music resides on /dev/hda5
> 
> time dd if=/dev/mmedia/music of=/dev/null bs=512
> count=200000               0m37.113s
> time dd if=/dev/hda5 of=/dev/null bs=512
> count=200000                       0m35.437s

LVM shows 4.7% overhead.  This is not so great.

> Ok I am ridiculous ... this has nothing to do with LVM.
> It has to do with DMA set off by default by linux 2.4.
> This is the reason of poor IO perf. and CPU eating.
> 
> After DMA is set on,
> 
> time dd if=/dev/mmedia/music of=/dev/null bs=512
> count=200000               0m12.934s
> time dd if=/dev/hda5 of=/dev/null bs=512
> count=200000                       0m12.110s

Good news - not an LVM problem.  Bad news - LVM shows 6.8% overhead.

> Perhaps poor perf. for the other person is also DMA related ?-)

No, the other person has drastically different performance with LVM for
512-byte I/O compared to raw disk.  For 64k-byte I/O performance on LVM
and raw disk are the same.  I _suppose_ that if I/O is done in small
chunks that PIO mode will have more overhead.  Maybe worth asking if
CPU is high when he is doing 512-byte I/Os.

Cheers, Andreas
-- 
Andreas Dilger                               Turbolinux filesystem development
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
