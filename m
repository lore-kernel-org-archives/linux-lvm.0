Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 500EA600C2
	for <linux-lvm@redhat.com>; Mon,  4 Jun 2018 00:19:35 +0000 (UTC)
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 745AC30A579E
	for <linux-lvm@redhat.com>; Mon,  4 Jun 2018 00:19:24 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id q4-v6so13205306wmq.1
	for <linux-lvm@redhat.com>; Sun, 03 Jun 2018 17:19:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAANaKqdRgfcZvUZXUgwSX-WXaQ0K=yg6ubDGwRkMk8mU+bDpUw@mail.gmail.com>
References: <CAANaKqdnGfgxxHwQVA+L3uNDe5aMydssLius94wcp6LxA1-w+g@mail.gmail.com>
	<CAANaKqdPjq9sK=DvZjDDSm8Vd_28C1k2i2xLyTrkFzwVq69NZw@mail.gmail.com>
	<CAANaKqdRgfcZvUZXUgwSX-WXaQ0K=yg6ubDGwRkMk8mU+bDpUw@mail.gmail.com>
From: Inbox <jimhaddad46@gmail.com>
Date: Sun, 3 Jun 2018 17:19:22 -0700
Message-ID: <CAANaKqcv2bF1X1S3L5xi-7HOsV2J29a4BvhMjiqwigRm2SGbVw@mail.gmail.com>
Subject: Re: [linux-lvm] "write failed.. No space left", "Failed to write VG",
 and "Failed to write a MDA"
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
To: linux-lvm@redhat.com

On Sun, Jun 3, 2018 at 4:57 PM, Inbox <jimhaddad46@gmail.com> wrote:
> OK, I think I've traced this back to a bug in pvcreate with
> "--pvmetadatacopies 2".  Or, at least a bug in lvm2 2.02.162 - the
> version available back then when I started using this disk.
> ...<snip>

The message sent out first, quoted above, is a reply with more
information.  Below is what was supposed to be the original post.  It
was originally sent as non-plain-text, so it looks like it was
silently ignored and not sent out.


Kernel 4.16.8, lvm 2.02.177.

I'm aware I can't let my thin volume get full.  I'm actually about to
delete a lot of things.



I don't understand why it gave the sdh3 then sdh3, sdg3, sdf3 no space
left on device errors.  sdf3 has 366G left in its thin pool, and I
asked to create a virtual 200G within it.  (EDIT: Now, I see it's the
pvmetadata copy at end of the disk, nothing to do with the thin pools)

I don't understand why it failed to write VG, or an MDA of VG.

I'm most concerned if anything's corrupted now, or if I can ignore
this other than that I couldn't create a volume.

disk1thin is on sdh3
disk2thin is on sdg3
disk3thin is on sdf3
disk4thin is on sde3

# lvs
...
  disk1thin                       lvm    twi-aot---  <4.53t
         84.13  76.33
  disk2thin                       lvm    twi-aot---  <4.53t
         85.98  78.09
  disk3thin                       lvm    twi-aot---  <4.53t
         92.10  83.47
  disk4thin                       lvm    twi-aot---   4.53t
         80.99  36.91
...
# lvcreate -V200G lvm/disk3thin -n test3
  WARNING: Sum of all thin volume sizes (21.22 TiB) exceeds the size
of thin pools and the size of whole volume group (<18.17 TiB).
  WARNING: You have not turned on protection against thin pools
running out of space.
  WARNING: Set activation/thin_pool_autoextend_threshold below 100 to
trigger automatic extension of thin pools before they get full.
  /dev/sdh3: write failed after 24064 of 24576 at 4993488961536: No
space left on device
  Failed to write VG lvm.
  Failed to write VG lvm.
  Manual intervention may be required to remove abandoned LV(s) before retrying.
# lvremove lvm/test3
  /dev/sdh3: write failed after 24064 of 24576 at 4993488961536: No
space left on device
  WARNING: Failed to write an MDA of VG lvm.
  /dev/sdg3: write failed after 24064 of 24576 at 4993488961536: No
space left on device
  WARNING: Failed to write an MDA of VG lvm.
  /dev/sdf3: write failed after 24064 of 24576 at 4993488961536: No
space left on device
  WARNING: Failed to write an MDA of VG lvm.
  Logical volume "test3" successfully removed
# lvs --- shows test3 is gone

# pvs
  PV             VG     Fmt  Attr PSize    PFree
  /dev/sde3      lvm    lvm2 a--     4.54t <10.70g
  /dev/sdf3      lvm    lvm2 a--     4.54t      0
  /dev/sdg3      lvm    lvm2 a--     4.54t      0
  /dev/sdh3      lvm    lvm2 a--     4.54t      0
# vgs
  VG     #PV #LV #SN Attr   VSize   VFree
  lvm      4  51   0 wz--n- <18.17t <10.70g



fdisk -l  shows sdf3, sdg3, and sdh3, sdg3, are 4993488985600 bytes.

After some reading, I'm guessing mda means metadata area.

If LVM is trying to write mda2 at 4993488961536, there's only 24064
bytes left in the partition, which is exactly where it's saying the
write is failing.

I did use "--pvmetadatacopies 2" when running pvcreate.

So, am I right that it's trying to write more than 24k of metadata at
the end of the disk, but there's only 24k left@the end of the disk
for a metadata copy?

If so, where the other locations for metadata (both the main one, and
the first copy) only 24k?  Did I lose metadata in those areas?  Did it
overwrite what was after the metadata area?

Where do I go from here?

# pvdisplay --maps /dev/sdh3
  --- Physical volume ---
  PV Name               /dev/sdh3
  VG Name               lvm
  PV Size               4.54 TiB / not usable 2.19 MiB
  Allocatable           yes (but full)
  PE Size               4.00 MiB
  Total PE              1190540
  Free PE               0
  Allocated PE          1190540
  PV UUID               BK8suJ-dqiy-mdK4-IyUH-aeRR-TPUo-3Dj6JG

  --- Physical Segments ---
  Physical extent 0 to 127:
    Logical volume      /dev/lvm/disk1thin_tmeta
    Logical extents     32 to 159
  Physical extent 128 to 4095:
    Logical volume      /dev/lvm/swap1
    Logical extents     0 to 3967
  Physical extent 4096 to 4127:
    Logical volume      /dev/lvm/lvol0_pmspare
    Logical extents     0 to 31
  Physical extent 4128 to 132127:
    Logical volume      /dev/lvm/disk1thin_tdata
    Logical extents     0 to 127999
  Physical extent 132128 to 132159:
    Logical volume      /dev/lvm/disk1thin_tmeta
    Logical extents     0 to 31
  Physical extent 132160 to 1190539:
    Logical volume      /dev/lvm/disk1thin_tdata
    Logical extents     128000 to 1186379

Those physical extents translate to beginning/ending bytes (4MiB PE size) of:

0 532676608
536870912 17175674880
17179869184 17309892608
17314086912 554180804608
554184998912 554315022336
554319216640 4993482489856


Disk size (4993488961536) - last physical extent ending byte
(4993482489856 + 4*1024*1024 assuming worst case scenario here, the
x856 is the starting byte of the last extent) still leaves 2277376
bytes, way more than 24k.
