Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200101260035.f0Q0ZaM01818@webber.adilger.net>
Subject: Re: [linux-lvm] Basic Questions on LVM
Date: Thu, 25 Jan 2001 17:35:36 -0700 (MST)
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
To: Linux LVM mailing list <linux-lvm@sistina.com>

Sherlock writes:
> 1.During initialisation y is it LVM is registered both
> as a block and char device where as according to me it
> is supposed to be a block device driver and when one
> does the pvcreate,vgcreate..etc it calls the ioctls of
> the char device of LVM.

The LVM char device is used to control the kernel LVM.  This is needed
because there may not be any block devices (LVs) yet.  There is 1 char
device per VG.

> 2.what is exactly the control flow when and read/write
> request is given to a file residing on the LVM
> partition...(ie where and how exactly the mapping
> tables exist..?)

The mapping tables are read from disk by the user tools, and sent to the
kernel when a VG is activated.  The mapping tables are kept in RAM and
are never changed by the kernel.  The block remapping is done inside
ll_rw_block(), and is just a small amount of math.

> 3.what is the importance of VGDA and vgscan?

The VGDA is the Volume Group Descriptor Area, and it is where the above
mapping tables are stored on disk, along with other PV, VG, LV info.
The vgscan command reads the VGDA from the disk.

> 4.during boot up time what are checks/modification
> made by the kernel with respect to the LVM/logical
> volumes?

Almost nothing is done by the kernel, except the block remapping.  Most
of the work is done by the user tools.

> 5.moreover to what extent is KIOBUF supported on linux
> 2.4. Can someone give me the workaround to check for
> KIOBUF working..

The KIOBUF code is only used for LVM snapshots.  The normal LVM block
I/O code does not use KIOBUFs.

Cheers, Andreas

PS - resending because my mail was broken, sorry if you get it twice
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
