Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0ULYf117933
	for <linux-lvm@redhat.com>; Mon, 30 Jan 2006 16:34:41 -0500
Received: from mail.cira.colostate.edu (mail.cira.colostate.edu
	[129.82.108.252])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k0ULYXpI015183
	for <linux-lvm@redhat.com>; Mon, 30 Jan 2006 16:34:33 -0500
Message-ID: <43DE866F.7060800@cira.colostate.edu>
Date: Mon, 30 Jan 2006 14:34:39 -0700
From: Adam Carheden <carheden@cira.colostate.edu>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM Confusion
References: <6a83e6620601301326l4c4db027oa748dcff72e368c6@mail.gmail.com>
In-Reply-To: <6a83e6620601301326l4c4db027oa748dcff72e368c6@mail.gmail.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Forgive me if you said you did this somewhere in the post, but did you 
use xfs_growfs to expand the size of the filesystem after you expanded 
the size of the logical volume?

-- 
Adam Carheden
Linux Systems Administrator
970-491-8956 (o)
970-556-2914 (c)



tufkal wrote:
> This is kind of a long story but I will try to keep it simple.  I have a 
> linux file/web/mythtv/blah server that I run at my business.  I recently 
> added a 120GB and a 80GB drive to the machine.  Here was the setup prior 
> to that.
> 
> 120GB Seagate
> -9GB / ext3
> -1GB Swap
> -110GB lvmhome xfs
> 
> 120GB Seagate
> -120GB lvmhome xfs
> 
> 
> The 2 lvm partitions were used together as a ~220GB /home partition, and 
> everything worked well.  Then I decided to add the 2 new drives.  The 
> geometry now looks like this
> 
> 120GB Seagate
> -9GB / ext3
> -1GB Swap
> -110GB lvmhome xfs
> 
> 120GB Seagate
> -120GB lvmhome xfs
> 
> 120GB Seagate
> -80GB lvmhome xfs
> -40GB /home/me linuxraid
> 
> 80GB Seagate
> -40GB lvmhome xfs
> -40GB /home/me linuxraid
> 
> I setup 40GB on each new drive apart in a raid1 mirror using mdadm.  
> Then with the 120GB of new LVM space due to me, I tried to add it to my 
> LVM home.  I am unable to get the space.  Here are the outputs of a few 
> commands for some help.
> 
> tufkal@tux:/home$ sudo lvm lvscan
> Password:
>   ACTIVE            '/dev/lvmhome/home' [325.82 GB] inherit
> tufkal@tux:/home$ sudo lvm pvscan
>   PV /dev/hdb5   VG lvmhome   lvm2 [107.39 GB / 0    free]
>   PV /dev/hdc5   VG lvmhome   lvm2 [ 110.23 GB / 0    free]
>   PV /dev/sdb5   VG lvmhome   lvm2 [35.46 GB / 0    free]
>   PV /dev/sda5   VG lvmhome   lvm2 [72.73 GB / 0    free]
>   Total: 4 [325.82 GB] / in use: 4 [325.82 GB] / in no VG: 0 [0   ]
> tufkal@tux :/home$ sudo lvm vgscan
>   Reading all physical volumes.  This may take a while...
>   Found volume group "lvmhome" using metadata type lvm2
> tufkal@tux:/home$
> 
> According to those, everything looks great!  I should have 325GB of space!
> 
> tufkal@tux:/home$ cat /etc/fstab | grep lvm
> /dev/mapper/lvmhome-home         /home                 xfs         
> defaults       0           2
> 
> And my /home is mounted on my lvm.....
> 
> tufkal@tux:~$ df -h
> Filesystem                              Size  Used Avail Use% Mounted on
> /dev/hdb1                                4.4G  3.0G  1.2G  72% /
> tmpfs                                     253M     0  253M   0% /dev/shm
> tmpfs                                     253M   13M  240M   5% 
> /lib/modules/2.6.12-10-386/volatile
> /dev/mapper/lvmhome-home     218G  197G   22G  91% /home
> /dev/md0                                 39G   29G  7.7G  80% /home/tufkal
> 
> BWAH?  Why do I only have 220GB of space?  I run out of space almost 
> nightly when MythTV starts transcoding the day's recordings.  I gave up 
> trying to figure out what I did wrong and I ask of you.
> 
> More random command line pastes in case they help.
> 
> 
> tufkal@tux:~$ sudo lvm vgs
> Password:
>   VG      #PV #LV #SN Attr  VSize   VFree
>   lvmhome   4   1   0 wz--n 325.82G    0
> tufkal@tux:~$ sudo lvm pvs
>   PV         VG      Fmt  Attr PSize   PFree
>   /dev/hdb5  lvmhome lvm2 a-   107.39G    0
>   /dev/hdc5  lvmhome lvm2 a-   110.23G    0
>   /dev/sda5  lvmhome lvm2 a-    72.73G    0
>   /dev/sdb5  lvmhome lvm2 a-    35.46G    0
> tufkal@tux:~$ sudo lvm lvs
>   LV   VG      Attr   LSize   Origin Snap%  Move Copy%
>   home lvmhome -wi-ao 325.82G
> 
> 
> tufkal@tux:~$ sudo lvm vgdisplay
>   --- Volume group ---
>   VG Name               lvmhome
>   System ID
>   Format                lvm2
>   Metadata Areas        4
>   Metadata Sequence No  96
>   VG Access             read/write
>   VG Status             resizable
>   MAX LV                0
>   Cur LV                1
>   Open LV               1
>   Max PV                0
>   Cur PV                4
>   Act PV                4
>   VG Size               325.82 GB
>   PE Size               4.00 MB
>   Total PE              83409
>   Alloc PE / Size       83409 / 325.82 GB
>   Free  PE / Size       0 / 0
>   VG UUID               8BCR28-5oEl-heGV-97YY-k6Dy-gzaO-QdZcML
> 
> tufkal@tux:~$ sudo lvm pvdisplay
>   --- Physical volume ---
>   PV Name               /dev/hdb5
>   VG Name               lvmhome
>   PV Size               107.39 GB / not usable 0
>   Allocatable           yes (but full)
>   PE Size (KByte)       4096
>   Total PE              27493
>   Free PE               0
>   Allocated PE          27493
>   PV UUID               DIuF4I-JfQH-w1nB-dJlM-0zef-R9An-MWxkLe
> 
>   --- Physical volume ---
>   PV Name               /dev/hdc5
>   VG Name               lvmhome
>   PV Size               110.23 GB / not usable 0
>   Allocatable           yes (but full)
>   PE Size (KByte)       4096
>   Total PE              28219
>   Free PE               0
>   Allocated PE          28219
>   PV UUID               A3uL70-LwK6-61Vx-DoGj-8C7v-Ml7E-9JnWtM
> 
>   --- Physical volume ---
>   PV Name               /dev/sdb5
>   VG Name               lvmhome
>   PV Size               35.46 GB / not usable 0
>   Allocatable           yes (but full)
>   PE Size (KByte)       4096
>   Total PE              9079
>   Free PE               0
>   Allocated PE          9079
>   PV UUID               yo14mv-oyRd-Up5z-DBj2-lEPO-jACe-su53bV
> 
>   --- Physical volume ---
>   PV Name               /dev/sda5
>   VG Name               lvmhome
>   PV Size               72.73 GB / not usable 0
>   Allocatable           yes (but full)
>   PE Size (KByte)       4096
>   Total PE              18618
>   Free PE               0
>   Allocated PE          18618
>   PV UUID               sT4CZO-gIZu-c05A-rrQf-uNw9-zC3B-p5h2vV
> 
> tufkal@tux:~$ sudo lvm lvdisplay
>   --- Logical volume ---
>   LV Name                /dev/lvmhome/home
>   VG Name                lvmhome
>   LV UUID                WrEbxl-7pck-lwbJ-w3V7-BNiZ-ttge-QvIL9r
>   LV Write Access        read/write
>   LV Status              available
>   # open                 1
>   LV Size                325.82 GB
>   Current LE             83409
>   Segments               4
>   Allocation             inherit
>   Read ahead sectors     0
>   Block device           253:0
> 
> tufkal@tux:~$
> 
> AND WHILE IM AT IT, FOR FUTURE REFERENCE
> 
> What is the correct way to add a partition to a LVM (like if I slap 
> another drive in there). 
> 
> Thanks in advance.
> 
> 
> ------------------------------------------------------------------------
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
