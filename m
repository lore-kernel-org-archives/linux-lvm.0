Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m0A8khJx010301
	for <linux-lvm@redhat.com>; Thu, 10 Jan 2008 03:46:43 -0500
Received: from snefru.openlib.org (wuecon195.wustl.edu [128.252.177.195])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m0A8kKom019191
	for <linux-lvm@redhat.com>; Thu, 10 Jan 2008 03:46:20 -0500
Received: from krichel by snefru.openlib.org with local (Exim 4.68)
	(envelope-from <krichel@openlib.org>) id 1JCt3Q-0005Cf-Qw
	for linux-lvm@redhat.com; Thu, 10 Jan 2008 02:46:24 -0600
Date: Thu, 10 Jan 2008 02:46:24 -0600
From: Thomas Krichel <krichel@openlib.org>
Subject: Re: [linux-lvm] uuid already in use
Message-ID: <20080110084624.GA19895@openlib.org>
References: <20080108175528.GA6100@openlib.org> <4783BB2C.5060803@redhat.com>
	<20080108182230.GA6223@openlib.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20080108182230.GA6223@openlib.org>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

  Thomas Krichel writes
>    
> raneb:/etc/lvm/archive# vgdisplay 
>   --- Volume group ---
>   VG Name               vg1
>   System ID             
>   Format                lvm2
>   Metadata Areas        2
>   Metadata Sequence No  17
>   VG Access             read/write
>   VG Status             resizable
>   MAX LV                0
>   Cur LV                0
>   Open LV               0
>   Max PV                0
>   Cur PV                2
>   Act PV                2
>   VG Size               652.06 GB
>   PE Size               4.00 MB
>   Total PE              166928
>   Alloc PE / Size       0 / 0   
>   Free  PE / Size       166928 / 652.06 GB
>   VG UUID               Hm2mZH-jACj-gxQI-tbZM-H6pm-ovfr-TVgurC
>    
> raneb:/etc/lvm/archive# lvdisplay 
> raneb:/etc/lvm/archive#
> 
>   I presume I have to restore the lv somehow. But this
>   has got me a step foward.


  I could not see how I would restore the lv, 
  so I created a new one, with the same size and
  name as the previous one

raneb:~# lvcreate -n lv1 -L 652.06G vg1

  However, checking the volume fails

raneb:~# e2fsck /dev/mapper/vg1-lv1 
e2fsck 1.40.2 (12-Jul-2007)
Couldn't find ext2 superblock, trying backup blocks...
e2fsck: Bad magic number in super-block while trying to open /dev/mapper/vg1-lv1

The superblock could not be read or does not describe a correct ext2
filesystem.  If the device is valid and it really contains an ext2
filesystem (and not swap or ufs or something else), then the superblock
is corrupt, and you might try running e2fsck with an alternate superblock:
    e2fsck -b 8193 <device>


  Alternative superblocks, gleaned from

raneb:~# mke2fs -n /dev/mapper/vg1-lv1 
mke2fs 1.40.2 (12-Jul-2007)
Filesystem label=
OS type: Linux
Block size=4096 (log=2)
Fragment size=4096 (log=2)
85475328 inodes, 170934272 blocks
8546713 blocks (5.00%) reserved for the super user
First data block=0
Maximum filesystem blocks=0
5217 block groups
32768 blocks per group, 32768 fragments per group
16384 inodes per group
Superblock backups stored on blocks: 
        32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208, 
        4096000, 7962624, 11239424, 20480000, 23887872, 71663616, 78675968, 
        102400000


  also fail. I presume all superblocks where on disk /dev/hdb,
  and now that disk is gone, it is not possible to recover
  data from /dev/hdc and /dev/hdd, the two other disks 
  in the vg. Thus, a failure on the first disk spills onto
  the other disks because that disk hold vital information
  for all.

  Is that assessment correct?

  Note I am desparate to recover data here because I destroyed
  the backup through a mistake of mine 10 hours before disk
  /dev/hdb crashed. The data represents about 10 years of
  work of mine. 

  Conclusion: next time two backups.

  Cheers,

  Thomas Krichel                    http://openlib.org/home/krichel
                                RePEc:per:1965-06-05:thomas_krichel
                                               skype: thomaskrichel
