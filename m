Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r98KCFNL032493
	for <linux-lvm@redhat.com>; Tue, 8 Oct 2013 16:12:15 -0400
Received: from mail-qa0-f50.google.com (mail-qa0-f50.google.com
	[209.85.216.50])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r98KCDX2000771
	for <linux-lvm@redhat.com>; Tue, 8 Oct 2013 16:12:14 -0400
Received: by mail-qa0-f50.google.com with SMTP id cm18so301901qab.9
	for <linux-lvm@redhat.com>; Tue, 08 Oct 2013 13:12:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5253CB06.2000901@fu-berlin.de>
References: <5253CB06.2000901@fu-berlin.de>
From: Gabriel <jarod125@gmail.com>
Date: Tue, 8 Oct 2013 23:11:53 +0300
Message-ID: <CAJc7SsYG90wMMaK6SrM-mNTiFhDxRJYGR3WapchAZSWD9vsdYw@mail.gmail.com>
Subject: Re: [linux-lvm] Find Correct LE Size of ext4 Partition (16TB)
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,

by multiplying block count by block size you get de filesystem size in
bytes. Converting into TiB yields a value just shy of 16 TiB (as
expected). More precisely 15.99999999627470970153.

If the PE size is 4 MiB and my calculations are correct, you would
need 16 TiB * 1024 * 1024 / 4 = 4194304  LEs.

On Tue, Oct 8, 2013 at 12:06 PM, Sebastian Walter
<sebastian.walter@fu-berlin.de> wrote:
> Dear List,
>
> For extending an ext4 partition to some additional TBs, I extended the
> underlying logical volume (LV) to fill the entire physical volume of the
> disk. This was about 19.4 TB. While trying to extend the ext4 partition
> to fill the hole LV, I realized that the ext4 size limit is still at
> 16TB. So I set the partition to 16TB. Now I'm wasting space on the LV
> which I would like to again be reduced to the minimum size of the
> partition (16TB).
>
> Has anyone an idea to exactly calculate the amount of logical extends
> (LE) needed for holding the 16TB partition? I'm sure there are some
> bytes needed for overhead, journaling, etc. Maybe we can read it from
> one of these outputs:
>
> This is the partition:
> tune2fs -l /dev/storage/storage
> tune2fs 1.42.8 (20-Jun-2013)
> Filesystem volume name:   storage
> Last mounted on:          /mnt/storage/mnt/storage
> Filesystem UUID:          9c05fe79-6a1b-484e-980d-788a6cf5b99c
> Filesystem magic number:  0xEF53
> Filesystem revision #:    1 (dynamic)
> Filesystem features:      has_journal ext_attr resize_inode dir_index
> filetype needs_recovery extent sparse_super large_file uninit_bg
> Filesystem flags:         signed_directory_hash
> Default mount options:    (none)
> Filesystem state:         clean
> Errors behavior:          Continue
> Filesystem OS type:       Linux
> Inode count:              2147483648
> Block count:              4294967295
> Reserved block count:     42909770
> Free blocks:              229845414
> Free inodes:              1929998857
> First block:              0
> Block size:               4096
> Fragment size:            4096
> Blocks per group:         32768
> Fragments per group:      32768
> Inodes per group:         16384
> Inode blocks per group:   512
> Filesystem created:       Tue Sep 18 14:50:21 2007
> Last mount time:          Tue Oct  8 04:00:16 2013
> Last write time:          Tue Oct  8 04:00:16 2013
> Mount count:              24
> Maximum mount count:      36
> Last checked:             Sat Oct  6 14:50:58 2012
> Check interval:           15552000 (6 months)
> Next check after:         Thu Apr  4 14:50:58 2013
> Reserved blocks uid:      0 (user root)
> Reserved blocks gid:      0 (group root)
> First inode:              11
> Inode size:               128
> Journal inode:            8
> Default directory hash:   tea
> Directory Hash Seed:      675a96e5-faf3-4576-af10-713007ac8387
> Journal backup:           inode blocks
>
> This is the Logical Volume (vgdisplay -v):
> --- Logical volume ---
>   LV Name                /dev/storage/storage
>   VG Name                storage
>   LV UUID                KQtBJN-RXzo-UUhT-MeiR-Ack8-QB2x-g9aPOT
>   LV Write Access        read/write
>   LV Status              available
>   # open                 1
>   LV Size                19.18 TB
>   Current LE             5027838
>   Segments               4
>   Allocation             inherit
>   Read ahead sectors     auto
>   - currently set to     256
>   Block device           253:24
>
> And this is the Volume Group (vgdisplay):
>   --- Volume group ---
>   VG Name               storage
>   System ID
>   Format                lvm2
>   Metadata Areas        2
>   Metadata Sequence No  174
>   VG Access             read/write
>   VG Status             resizable
>   MAX LV                0
>   Cur LV                3
>   Open LV               3
>   Max PV                0
>   Cur PV                2
>   Act PV                2
>   VG Size               19.77 TB
>   PE Size               4.00 MB
>   Total PE              5181438
>   Alloc PE / Size       5181438 / 19.77 TB
>   Free  PE / Size       0 / 0
>   VG UUID               ZalMV7-fZqp-mBA3-aYzi-iADF-VDWV-YIifQr
>
> What I would like to know is the correct *extents* parameter for
> lvreduce. Any help is greatly appreciated!
>
> Sebastian
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
