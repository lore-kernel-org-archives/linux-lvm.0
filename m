Message-ID: <20040203190727.12810.qmail@web41508.mail.yahoo.com>
From: Iordan Kolev Iordanov <iiordanovv@yahoo.com>
Subject: Re: [linux-lvm] wrong available size reported by df on lvm
In-Reply-To: <Pine.LNX.4.44.0402021857360.23295-100000@arrow.utias.utoronto.ca>
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
Date: Wed Feb  4 09:04:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I am replying to myself in order to save time for people who would try
to help me. The source of this odd df output is the reserved blocks
that the ext3 file system makes for the super user. I do not currently
know why they ended up different on the two file systems I created,
because I created them with the defaults.

One of the file systems I expanded and then reduced, so perhaps the
reserved percentage was altered by e2fsadm.

At any rate, in case anybody has the same problem, they can refer to
the answer I gave myself :)

Thanks!
Iordan

--- Iordan Iordanov <iordanov@utias.utoronto.ca> wrote:
> Hi,
> 
> I wonder if anybody can help me with this. I have created two volume 
> groups, each with four 67GB SCSI drives. The total reported size is
> 267GB. 
> I have also created a single logical volume on top of each of the two
> 
> volume groups, and a single ext3 file system on each of the two
> logical 
> volumes. Output of all utilities looks alright, except for 'df',
> which 
> reports the following *odd* values:
> 
> ------------------------------------------------------------------
> Filesystem           1k-blocks      Used Available Use% Mounted on
> .
> .
> .
> .
> /dev/fe02_lvm_1/vol1 279834624     32828 274115896   1% /mnt/lvm1
> /dev/fe02_lvm_2/vol1 279834624     32828 265587040   1% /mnt/lvm2
> ------------------------------------------------------------------
> 
> the two volume groups are fe01_lvm_1 and fe02_lvm_2, the logical
> volumes 
> are both called vol1. Notice - the size is reported correctly. The
> usage 
> is reported correctly. However, the Available size is wrong on both
> of the 
> file systems!
> 
> I am also attaching output from vgdisplay, lvdisplay,
> 
> ------------------------------------------------------------------
> vgdisplay:
> ------------------------------------------------------------------
> 
> --- Volume group ---
> VG Name               fe02_lvm_1
> VG Access             read/write
> VG Status             available/resizable
> VG #                  0
> MAX LV                256
> Cur LV                1
> Open LV               1
> MAX LV Size           2 TB
> Max PV                256
> Cur PV                4
> Act PV                4
> VG Size               271.12 GB
> PE Size               32 MB
> Total PE              8676
> Alloc PE / Size       8676 / 271.12 GB
> Free  PE / Size       0 / 0
> VG UUID               kdkfM2-vQEg-Ppw1-O4r8-8dvc-matc-w680LA
>  
> --- Volume group ---
> VG Name               fe02_lvm_2
> VG Access             read/write
> VG Status             available/resizable
> VG #                  1
> MAX LV                256
> Cur LV                1
> Open LV               1
> MAX LV Size           2 TB
> Max PV                256
> Cur PV                4
> Act PV                4
> VG Size               271.12 GB
> PE Size               32 MB
> Total PE              8676
> Alloc PE / Size       8676 / 271.12 GB
> Free  PE / Size       0 / 0
> VG UUID               nnD2OW-9J5w-BFvM-Qnpt-IN8v-NOnm-UMNWa5
> 
> ------------------------------------------------------------------
> lvdisplay /dev/fe02_lvm_1
> ------------------------------------------------------------------
> --- Logical volume ---
> LV Name                /dev/fe02_lvm_1/vol1
> VG Name                fe02_lvm_1
> LV Write Access        read/write
> LV Status              available
> LV #                   1
> # open                 1
> LV Size                271.12 GB
> Current LE             8676
> Allocated LE           8676
> Allocation             next free
> Read ahead sectors     1024
> Block device           58:0
> ------------------------------------------------------------------
> 
> ------------------------------------------------------------------
> lvdisplay /dev/fe02_lvm_2
> ------------------------------------------------------------------
> --- Logical volume ---
> LV Name                /dev/fe02_lvm_2/vol1
> VG Name                fe02_lvm_2
> LV Write Access        read/write
> LV Status              available
> LV #                   1
> # open                 1
> LV Size                271.12 GB
> Current LE             8676
> Allocated LE           8676
> Allocation             next free
> Read ahead sectors     1024
> Block device           58:1
> ------------------------------------------------------------------
> 
> Has anybody seen this alleged bug, or can anybody explain it?  Thank
> you 
> very much!
> 
> Sincerely yours,
> Iordan Iordanov
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


=====
The conscious mind has only one thread of execution.

__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free web site building tool. Try it!
http://webhosting.yahoo.com/ps/sb/
