Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7JJ55V08373
	for <linux-lvm@redhat.com>; Fri, 19 Aug 2005 15:05:05 -0400
Received: from web52210.mail.yahoo.com (web52210.mail.yahoo.com
	[206.190.48.133])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id j7JJ4vGb018210
	for <linux-lvm@redhat.com>; Fri, 19 Aug 2005 15:04:57 -0400
Message-ID: <20050819190451.21337.qmail@web52210.mail.yahoo.com>
Date: Fri, 19 Aug 2005 12:04:51 -0700 (PDT)
From: <john_gore@yahoo.com>
Subject: Re: [linux-lvm] vg works fine under FC3, but not FC4
In-Reply-To: <43045DFF.1050105@chwing.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>


Thanks all for your help. For the benefit of others,
here is the solution Alasdair and others recommended
that worked. (Putting this into the how-to document
would save Alasdair some time)

Situation: Drive hdc was actually partitioned with 3
partitions when I installed it in an LVM volume. LVM
version 2.00.?? allowed a pvcreate on it with the
partition table intact. Later versions of 2.00.?? (.13
perhaps?) do not ignore the partition table. So, it
worked fine until upgrading to 2.01

Solution:

Wipe the partition table: (some recommended bs=1k and
others recommended bs=512 which I tried first since it
was more conservative)

dd if=/dev/zero of=/dev/hdc bs=512 count=1
blockdev --rereadpt /dev/hdc

Now, do vgscan and pvscan to confirm it worked

Then, I had to exclude the dvd drive (hdb for me) from
LVM scans, adding this to /etc/lvm/lvm.conf:

filter = [ "r|/dev/hdb|","r|/dev/cdrom|",
"r|/dev/dvd|"]

Then, add the vg and mount:
	vgchange -ay my_vg
	mkdir /my_mount_point
	mount /dev/my_vg/my_lv1 /my_mount_point

Finally, add the line in /etc/fstab for the mount

Here's links to earlier messages on the subject:
www.redhat.com/archives/linux-lvm/2005-March/msg00084.html
http://www.archivum.info/debian-bugs-rc@lists.debian.org/2004-12/msg00652.html


--- Antoine <lists@chwing.com> wrote:

> from my experience, this doesn't help, it seems that
> pvscan, vgscan 
> doesn't recognize whole device as lvm capable device
> and then remove it 
> from .cache (so your vg seems to disappear but if
> you manually put your 
> device in .cache, it fixes everything)
> 
> 
> see output for exemple :
> pitch:/etc/lvm# pvs
>   PV         VG   Fmt  Attr PSize   PFree
>   /dev/hdc   vg0  lvm2 a-    19.11G 19.11G
>   /dev/hdd   vg0  lvm2 a-   149.05G  4.05G
> pitch:/etc/lvm#
> pitch:/etc/lvm#
> pitch:/etc/lvm# pvscan
>   Couldn't find device with uuid
> 'iZzizb-LmBD-0wx1-QD3g-76aO-1zJI-d61tNs'.
>   PV unknown device   VG vg0   lvm2 [149.05 GB /
> 4.05 GB free]
>   PV /dev/hdc         VG vg0   lvm2 [19.11 GB /
> 19.11 GB free]
>   Total: 2 [168.16 GB] / in use: 2 [168.16 GB] / in
> no VG: 0 [0   ]
> pitch:/etc/lvm# pvs
>   Couldn't find device with uuid
> 'iZzizb-LmBD-0wx1-QD3g-76aO-1zJI-d61tNs'.
>   Couldn't find device with uuid
> 'iZzizb-LmBD-0wx1-QD3g-76aO-1zJI-d61tNs'.
>   Couldn't find all physical volumes for volume
> group vg0.
>   Can't read vg0: skipping
>   Couldn't find device with uuid
> 'iZzizb-LmBD-0wx1-QD3g-76aO-1zJI-d61tNs'.
>   Couldn't find all physical volumes for volume
> group vg0.
>   Can't read vg0: skipping
> 
> note that it doesn't happen on both disks, but they
> were set up identically.
> 
> see also this output, pvdisplay on the faulty device
> seems to fix it :
> pitch:/etc/lvm# vgdisplay
>   Couldn't find device with uuid
> 'iZzizb-LmBD-0wx1-QD3g-76aO-1zJI-d61tNs'.
>   Couldn't find all physical volumes for volume
> group vg0.
>   Volume group "vg0" doesn't exist
> pitch:/etc/lvm# pvdisplay
>   Couldn't find device with uuid
> 'iZzizb-LmBD-0wx1-QD3g-76aO-1zJI-d61tNs'.
>   --- Physical volume ---
>   PV Name               unknown device
>   VG Name               vg0
>   PV Size               149.05 GB / not usable 0  
>   Allocatable           yes
>   PE Size (KByte)       4096
>   Total PE              38156
>   Free PE               1036
>   Allocated PE          37120
>   PV UUID              
> iZzizb-LmBD-0wx1-QD3g-76aO-1zJI-d61tNs
>   
>   --- Physical volume ---
>   PV Name               /dev/hdc
>   VG Name               vg0
>   PV Size               19.11 GB / not usable 0  
>   Allocatable           yes
>   PE Size (KByte)       4096
>   Total PE              4892
>   Free PE               4892
>   Allocated PE          0
>   PV UUID              
> vzCHIG-WqYt-w2Kv-qGog-vK74-GEBu-svsWBm
>   
> pitch:/etc/lvm# pvdisplay /dev/hdd
>   --- Physical volume ---
>   PV Name               /dev/hdd
>   VG Name               vg0
>   PV Size               149.05 GB / not usable 0  
>   Allocatable           yes
>   PE Size (KByte)       4096
>   Total PE              38156
>   Free PE               1036
>   Allocated PE          37120
>   PV UUID              
> iZzizb-LmBD-0wx1-QD3g-76aO-1zJI-d61tNs
>   
> 
> pitch:/etc/lvm#
> pitch:/etc/lvm# pvdisplay
>   --- Physical volume ---
>   PV Name               /dev/hdd
>   VG Name               vg0
>   PV Size               149.05 GB / not usable 0  
>   Allocatable           yes
>   PE Size (KByte)       4096
>   Total PE              38156
>   Free PE               1036
>   Allocated PE          37120
>   PV UUID              
> iZzizb-LmBD-0wx1-QD3g-76aO-1zJI-d61tNs
>   
>   --- Physical volume ---
>   PV Name               /dev/hdc
>   VG Name               vg0
>   PV Size               19.11 GB / not usable 0  
>   Allocatable           yes
>   PE Size (KByte)       4096
>   Total PE              4892
>   Free PE               4892
>   Allocated PE          0
>   PV UUID              
> vzCHIG-WqYt-w2Kv-qGog-vK74-GEBu-svsWBm
>   
> pitch:/etc/lvm# vgs
>   VG   #PV #LV #SN Attr  VSize   VFree
>   vg0    2   1   0 wz--n 168.16G 23.16G
> 
> so for me at least, the best practice for now is to
> set a partition on 
> the whole disk (hdd1) set its type '8e' and use it
> instead of the whole 
> device. I didnt have any problem working like this.
> 
> fyi: debian sarge with :
> pitch:~# vgscan --version
>   LVM version:     2.01.04 (2005-02-09)
>   Library version: 1.01.00-ioctl (2005-01-17)
>   Driver version:  4.1.1
> 
> Alasdair G Kergon wrote:
> 
> >No - I'm suggesting you need to check if any *whole
> device* PVs like hdd 
> >actually have partition tables on them, and if so,
> remove them.
> >
> >Alasdair
> >
> >_______________________________________________
> >linux-lvm mailing list
> >linux-lvm@redhat.com
> >https://www.redhat.com/mailman/listinfo/linux-lvm
> >read the LVM HOW-TO at
> http://tldp.org/HOWTO/LVM-HOWTO/
> >
> >
> >  
> >
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at
> http://tldp.org/HOWTO/LVM-HOWTO/
> 
