Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m6U4uQUB029193
	for <linux-lvm@redhat.com>; Wed, 30 Jul 2008 00:56:26 -0400
Received: from qw-out-2122.google.com (qw-out-2122.google.com [74.125.92.25])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m6U4uGxo010511
	for <linux-lvm@redhat.com>; Wed, 30 Jul 2008 00:56:16 -0400
Received: by qw-out-2122.google.com with SMTP id 3so83653qwe.39
	for <linux-lvm@redhat.com>; Tue, 29 Jul 2008 21:56:15 -0700 (PDT)
Message-ID: <769e0ec0807292156k5d01d731n69570ff619add413@mail.gmail.com>
Date: Tue, 29 Jul 2008 21:56:15 -0700
From: "Wil Decius" <wilson.decius@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] Possible to extend a partition "nested" in an LV?
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
To: linux-lvm@redhat.com

Hi,

I'd like to expand the /root partition of a partitioned-OS on an LV.
Combinations of pv/lv/vg extend,resize, etc as well as resize2fs,
parted, fdisk have mainly resulted in garbage.

Here's what I'm trying to do:

I've a VolumeGroup, "VG_MAIN" sized @ 50GB.  It's empty/unused, except
for a 3GB LV,

    /dev/VG_MAIN/test

LV(/dev/VG_MAIN/test) contains a deployable/bootable Xen DomU OS.

LV(/dev/VG_MAIN/test) has two partitions

 kpartx -av /dev/VG_MAIN/test
   add map VG_MAIN-test1 (253:13): 0 192717 linear  /dev/VG_MAIN/test 63
   add map VG_MAIN-test2 (253:14): 0 6056505 linear /dev/VG_MAIN/test 192780

partition(VG_MAIN-test1) is formatted as

    /boot, ext3, 100MB

partition(VG_MAIN-test2) itself contains a single VolumeGroup, "vg0",
partitioned into to LV's,

    vgchange -ay vg0
    lvs | grep vg0
      LVROOT       vg0     -wi-a-   2.31G
      LVSWAP       vg0     -wi-a- 512.00M

i.e., the partitioning "looks" like,

    HD
        VG(VG_MAIN) -> 3G
            LV(test) -> 100%
                PART(1) = /boot, ext3 -> 100MB
                PART(2)               -> *
                    VG(vg0) -> 100%
                        LV(LVSWAP) -> 512 MB
                            PART(1) = swap, swap -> *
                        LV(LVROOT) -> *
***->                    PART(1) = /, ext3 -> *    i.e., ~ 2.31 GB


QUESTION --

 I'd like to EXPAND the Xen DomU image by +9B to 12GB, total, adding
the add'l 9GB space to the currently 2.31GB last (***->) partition.

Can I do that? If so, how?

Wil
