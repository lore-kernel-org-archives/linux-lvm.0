Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oAELx4OU028728
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2010 16:59:04 -0500
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAELwp7Z009338
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2010 16:58:51 -0500
Received: from soda.linbit (unknown [10.9.9.55])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 78FAB1058DE9
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2010 22:58:50 +0100 (CET)
Date: Sun, 14 Nov 2010 22:58:50 +0100
From: Lars Ellenberg <lars.ellenberg@linbit.com>
Message-ID: <20101114215850.GB10579@barkeeper1-xen.linbit>
References: <AANLkTimiX+2WZw5V8P0HjPvEXP6TAerJmFHq63Ktg2fD@mail.gmail.com>
	<20101113230310.GH14546@barkeeper1-xen.linbit>
	<AANLkTinXXW_QFHa7wEM-rb8rvO-8iXmAzK3yEL1j79uL@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AANLkTinXXW_QFHa7wEM-rb8rvO-8iXmAzK3yEL1j79uL@mail.gmail.com>
Subject: Re: [linux-lvm] Need help with a particular use-case for pvmove.
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

On Sat, Nov 13, 2010 at 10:56:05PM -0500, Stirling Westrup wrote:
> On Sat, Nov 13, 2010 at 6:03 PM, Lars Ellenberg
> <lars.ellenberg@linbit.com> wrote:
> > On Sat, Nov 13, 2010 at 04:45:36PM -0500, Stirling Westrup wrote:
> 
> ...
> >> All I want to do is move physical extents from one physical volume to
> >> another. Both of those volumes are present and accessible. Why should
> >> uninvolved missing volumes be an issue, and is there any way around
> >> it? �pmmove suggests running "vgreduce --removemissing" but the
> >> documentation for vgreduce seems to say that I'd need to 1) use
> >> --force and 2) it would likely result in data loss.
> >>
> >> Is there anything I can do, short of borrowing another storage array
> >> somewhere, just so I can have an extra slot to do this move? My other
> >> option is to put the new drive into a USB case, but the server only
> >> supports USB1, so moving a terrabyte will take over a week.
> >>
> 
> > If you do it offline anyways:
> >
> > Shut down.
> > Unplug one of the good old drives, plug in the new drive.
> > If you want to be extra sure against typos,
> > unplug all but the bad-old drive ;-)
> >
> > Boot into maintenance mode, use a live-cd if you have to.
> >
> > Don't activate the VG. �It won't activate with one pv missing anyways,
> > unless you really want it to.
> >
> > Then dd_rescue copy the disk image from bad-old to new, including
> > everything (partition table, if any, LVM signature, the full image).
> >
> > Remove bad-old drive, have all other old and the new plugged,
> > reboot normally.
> >
> > Done.
> >
> > Estimated downtime, assuming a sustained linear write speed of 80 MiB/s:
> > 1 TiB / (80 MiB/s), well under 4 hours.
> >
> 
> Thanks. I did consider this, but the new drive is twice the size of
> the old one, so I would need to make sure I had created a partition on
> the new drive the exact size of the old one, and had dd-ed everything
> correctly. Even then, I wasn't sure if it would work, because I don't
> know what the metadata records in terms of the drive configurations.

No. Don't ask for advice, if you don't take it.  I don't just post
nonsense on mailing lists, just to read my own words in the net ;-)

Demo run, simulating a two drive VG, replacing one drive with a bigger one,
using LVs of some other VG as "drives".

root@racke:~/demo# export LVM_SYSTEM_DIR=$PWD
root@racke:~/demo# pvs
root@racke:~/demo# pvcreate /dev/demo/dummy-a 
  Physical volume "/dev/demo/dummy-a" successfully created
root@racke:~/demo# pvcreate /dev/demo/dummy-b 
  Physical volume "/dev/demo/dummy-b" successfully created
root@racke:~/demo# vgcreate Data /dev/demo/dummy-{a,b}
  Volume group "Data" successfully created
root@racke:~/demo# vgs
  VG   #PV #LV #SN Attr   VSize VFree
  Data   2   0   0 wz--n- 1.99g 1.99g
root@racke:~/demo# lvcreate -n data -L 1.8g Data
  Rounding up size to full physical extent 1.80 GiB
  Logical volume "data" created
root@racke:~/demo# mkefs.ext4 /dev/Data/data 
mke2fs 1.41.11 (14-Mar-2010)
...
Creating journal (8192 blocks): done
Writing superblocks and filesystem accounting information: done
...
root@racke:~/demo# vgs
  VG   #PV #LV #SN Attr   VSize VFree  
  Data   2   1   0 wz--n- 1.99g 196.00m
root@racke:~/demo# blockdev --getsize64 /dev/demo/dummy-*
1073741824
1073741824
2147483648
root@racke:~/demo# blockdev --getsize64 /dev/demo/dummy-c
2147483648

Ok, so you now have a LV data in a VG Data consisting of two "drives", 1gig each,
and a third drive of two gig.

Now, simulating drive replacement with the method I told you.

root@racke:~/demo# vgchange -an Data
  0 logical volume(s) in volume group "Data" now active
root@racke:~/demo# lvs
  LV   VG   Attr   LSize Origin Snap%  Move Log Copy%  Convert
  data Data -wi--- 1.80g                                      


(you may want to play with some options of dd_rescue
to get best performance)
root@racke:~/demo# dd_rescue /dev/demo/dummy-a /dev/demo/dummy-c
...
dd_rescue: (info): /dev/demo/dummy-a (1048576.0k): EOF
Summary for /dev/demo/dummy-a -> /dev/demo/dummy-c:
dd_rescue: (info): ipos:   1048576.0k, opos:   1048576.0k, xferd:   1048576.0k
...

root@racke:~/demo# pvs -v
    Scanning for physical volume names
  Found duplicate PV 8Miyc0iXMErbqbTBMfCxrMSLMIo0F2IP: using /dev/demo/dummy-c not /dev/demo/dummy-a
  PV                          VG   Fmt  Attr PSize    PFree   DevSize PV UUID                               
  /dev/demo/dummy-b Data lvm2 a-   1020.00m 196.00m   1.00g N8tSRP-qwxK-M8wo-wy5A-4f8V-u07s-8xDwgi
  /dev/demo/dummy-c Data lvm2 a-   1020.00m      0    2.00g 8Miyc0-iXME-rbqb-TBMf-CxrM-SLMI-o0F2IP

Uh oh... duplicate PV signature...  Well, yes, of course, we physically
copied the image, including any signatures..

	=>> if you have your PVs on partitions, not the full disks,
	    just create a partition fully covering the new drive,
	    and dd the old PV partition into the new partition.
	    No matter if the new partition is bigger.

Now, simulate unplugging the old drive by adjusting my demo filter:
root@racke:~/demo# vi lvm.conf +/filter\ =

...
-    filter = [ "a|^/dev/demo/dummy-[abc]$|", "r/.*/" ]
+    filter = [ "a|^/dev/demo/dummy-[bc]$|", "r/.*/" ]

root@racke:~/demo# vgscan
  Reading all physical volumes.  This may take a while...
  Found volume group "Data" using metadata type lvm2
root@racke:~/demo# pvscan
  PV /dev/demo/dummy-c   VG Data   lvm2 [1020.00 MiB / 0    free]
  PV /dev/demo/dummy-b   VG Data   lvm2 [1020.00 MiB / 196.00 MiB free]
  Total: 2 [1.99 GiB] / in use: 2 [1.99 GiB] / in no VG: 0 [0   ]

There. No more duplicate PV signatures.

root@racke:~/demo# lvs
  LV   VG   Attr   LSize Origin Snap%  Move Log Copy%  Convert
  data Data -wi-a- 1.80g                                      
root@racke:~/demo# vgs
  VG   #PV #LV #SN Attr   VSize VFree  
  Data   2   1   0 wz--n- 1.99g 196.00m

have lvm recognize the new PV size:
root@racke:~/demo# pvresize /dev/demo/dummy-c
  Physical volume "/dev/demo/dummy-c" changed
  1 physical volume(s) resized / 0 physical volume(s) not resized
root@racke:~/demo# vgs
  VG   #PV #LV #SN Attr   VSize VFree
  Data   2   1   0 wz--n- 2.99g 1.19g
                          ^^^^^ ^^^^^
root@racke:~/demo# lvs
  LV   VG   Attr   LSize Origin Snap%  Move Log Copy%  Convert
  data Data -wi-a- 1.80g                                      

reactivate the VG:
root@racke:~/demo# vgchange -ay Data

and now mount your LV, and be happy.


You now can add more space to your LV,
or pvmove an other drive onto the new space of the new bigger drive,
reducing it from the VGs, replace it with an other bigger one,
pvcreate and add it into the VG to grow your VG further.

Still you should consider some RAID, as in _redundancy_ of your data.


-- 
: Lars Ellenberg
: LINBIT | Your Way to High Availability
: DRBD/HA support and consulting http://www.linbit.com

DRBD� and LINBIT� are registered trademarks of LINBIT, Austria.
