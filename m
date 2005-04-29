Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3TK0tO03585
	for <linux-lvm@redhat.com>; Fri, 29 Apr 2005 16:00:55 -0400
Received: from zproxy.gmail.com (zproxy.gmail.com [64.233.162.205])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j3TK0nwq021647
	for <linux-lvm@redhat.com>; Fri, 29 Apr 2005 16:00:49 -0400
Received: by zproxy.gmail.com with SMTP id 13so812753nzp
	for <linux-lvm@redhat.com>; Fri, 29 Apr 2005 13:00:44 -0700 (PDT)
Message-ID: <3b24531c0504291300587dd539@mail.gmail.com>
Date: Fri, 29 Apr 2005 15:00:43 -0500
From: Myrddin Emrys <myrddin@gmail.com>
Subject: Re: [linux-lvm] large logical volumes
In-Reply-To: <424B4459.5050207@utoronto.ca>
Mime-Version: 1.0
Content-Disposition: inline
References: <424B4459.5050207@utoronto.ca>
Content-Transfer-Encoding: 8bit
Reply-To: Myrddin Emrys <myrddin@gmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Looks like you never got a response. I hardly consider myself
qualified, but have you considered increasing the block size? The
other option, have you tried a different filesystem? Different fs have
different limitations... what you're describing appears to be a
limitation of ext2fs, not LVM. Have you considered XFS or ReiserFS?

On 3/30/05, Guido Vettoretti <g.vettoretti@utoronto.ca> wrote:
> Hello,
> 
> I'm trying to set up a large logical volume (13.1 TB) on a RHEL 4.0
> server. I have 8 scsi devices of 1.8Tb each.
> 
> When I try to do a 'mkfs' and set up a large disk I get limited to 4Tbytes.
> This command creates a smaller filesystem then
> [root@cyclone ~]# lvcreate -l 1287525 -i 3 -n lvol0 vol0
> this one.
> [root@cyclone ~]# lvcreate -l 1000000 -i 3 -n lvol0 vol0
> 
> It seems that there is a limit on the number of  block groups of 32768
> and blocks per group of 32768.
> My block size is 4096
> so I can only get an LV of 4096*32768*32768 = 4TB.
> 
> I tried modifying the PE size on the volume group, but I'm still having
> problems.
> 
> Can anyone help please?
> 
> Thanks
> Guido
> ---------------
> [root@cyclone ~]# mkfs -t ext3 /dev/vol0/lvol0
> mke2fs 1.35 (28-Feb-2004)
> max_blocks 4294967295, rsv_groups = 0, rsv_gdb = 1024
> Filesystem label=
> OS type: Linux
> Block size=4096 (log=2)
> Fragment size=4096 (log=2)
> 512016384 inodes, 1024002048 blocks
> 8250429 blocks (0.81%) reserved for the super user
> First data block=0
> Maximum filesystem blocks=1027604480
> 31251 block groups
> 32768 blocks per group, 32768 fragments per group
> 16384 inodes per group
> Superblock backups stored on blocks:
>         32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632,
> 2654208,
>         4096000, 7962624, 11239424, 20480000, 23887872, 71663616, 78675968,
>         102400000, 214990848, 512000000, 550731776, 644972544
> 
> Here is the entire process I typed:
> ------------------------------------------------------------------------------
> 
> [root@cyclone ~]# pvcreate /dev/sdc1 /dev/sdd1 /dev/sde1
>   Physical volume "/dev/sdc1" successfully created
>   Physical volume "/dev/sdd1" successfully created
>   Physical volume "/dev/sde1" successfully created
> [root@cyclone ~]# pvscan
>   /dev/cdrom: open failed: No medium found
>   PV /dev/sda2   VG VolGroup00   lvm2 [34.06 GB / 0    free]
>   PV /dev/sdb1   VG VolGroup00   lvm2 [34.16 GB / 0    free]
>   PV /dev/sdc1                   lvm2 [1.64 TB]
>   PV /dev/sdd1                   lvm2 [1.64 TB]
>   PV /dev/sde1                   lvm2 [1.64 TB]
>   Total: 5 [4.98 TB] / in use: 2 [68.22 GB] / in no VG: 3 [4.91 TB]
> [root@cyclone ~]# vgcreate vol0 /dev/sd[c-e]1
>   Volume group "vol0" successfully created
> [root@cyclone ~]# vgdisplay
>   --- Volume group ---
>   VG Name               vol0
>   System ID
>   Format                lvm2
>   Metadata Areas        3
>   Metadata Sequence No  1
>   VG Access             read/write
>   VG Status             resizable
>   MAX LV                0
>   Cur LV                0
>   Open LV               0
>   Max PV                0
>   Cur PV                3
>   Act PV                3
>   VG Size               4.91 TB
>   PE Size               4.00 MB
>   Total PE              1287525
>   Alloc PE / Size       0 / 0
>   Free  PE / Size       1287525 / 4.91 TB
>   VG UUID               fQ7cKh-FVnl-NglQ-jimv-RsZK-dU5j-zYKIcG
> 
> [root@cyclone ~]# lvcreate -l 1287525 -i 3 -n lvol0 vol0
>   Using default stripesize 64KB
>   Logical volume "lvol0" created
> [root@cyclone ~]# lvdisplay
>   --- Logical volume ---
>   LV Name                /dev/vol0/lvol0
>   VG Name                vol0
>   LV UUID                c2MADb-BoAO-lhl3-3ukj-XfyQ-K8L0-cxcIlw
>   LV Write Access        read/write
>   LV Status              available
>   # open                 0
>   LV Size                4.91 TB
>   Current LE             1287525
>   Segments               1
>   Allocation             inherit
>   Read ahead sectors     0
>   Block device           253:2
> 
> [root@cyclone ~]# mkfs -t ext3 /dev/vol0/lvol0
> mke2fs 1.35 (28-Feb-2004)
> max_blocks 4294967295, rsv_groups = 0, rsv_gdb = 1024
> Filesystem label=
> OS type: Linux
> Block size=4096 (log=2)
> Fragment size=4096 (log=2)
> 122355712 inodes, 244683776 blocks
> 12234188 blocks (5.00%) reserved for the super user
> First data block=0
> Maximum filesystem blocks=247463936
> 7468 block groups
> 32768 blocks per group, 32768 fragments per group
> 16384 inodes per group
> Superblock backups stored on blocks:
>         32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632,
> 2654208,
>         4096000, 7962624, 11239424, 20480000, 23887872, 71663616, 78675968,
>         102400000, 214990848
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
