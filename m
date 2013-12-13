Message-ID: <52AB1A5C.9000508@redhat.com>
Date: Fri, 13 Dec 2013 15:31:56 +0100
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <CA+Q0qhddVT+JH9__r7cnONZmr7EE9mFnV8ax-e=ObyNc8hAong@mail.gmail.com>	<20131211141911.GF4894@agk-dp.fab.redhat.com>
	<CA+Q0qhcU8Wbu8oGaCm13m9-LR3nz3am+5zAQ+B8PsCk7eBPG=w@mail.gmail.com>
In-Reply-To: <CA+Q0qhcU8Wbu8oGaCm13m9-LR3nz3am+5zAQ+B8PsCk7eBPG=w@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] How to place LVM2 metadata to other disks which
 don't belong to any volume group?
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
To: LVM general discussion and development <linux-lvm@redhat.com>, George Brian <biangw@gmail.com>

On 12/13/2013 08:15 AM, George Brian wrote:
> I indeed want to  store metadata in common disk such as /dev/sdb, 
> eventually to store all vg's metadata to one singe disk which specially
> used to store metadata without data.
> 

This is probably not directly supported, but you should be able to achieve
what you want by using two-level LVM layout:

  - (step 1) you could create a PV/VG on /dev/sdb, let's call it VG_A

  - (step 2) then create LV with the size just to store the metadata,
    let's call it LV_A. This is the first level - the A level.

  - (step 3) then create a PV on LV_A (with 1-2 metadatacopies), then make PVs
    from others disk with 0 metadatacopies, then group it into a VG_B.
    That's the second level - the B level.

  - (repeat step 2 and 3 for as many other VGs as you need)

So you have a dedicated /dev/sdb disk to store metadata for as many VGs
as you want (and as the disk space allows) and just store data on any other disks.

Or to be more concrete with commands (just a quick example):

  pvcreate /dev/sdb
  vgcreate -s 1M VG_A /dev/sdb

  lvcreate -l 1M VG_A -n LV_A_0
  pvcreate /dev/VG_A/LV_A_0
  pvcreate --metadatacopies 0 /dev/sda ... (or whatever other disks)
  vgcreate VG_B_0 /dev/VG_A/LV_A_0 /dev/sda
  lvcreate -L1G -n my_lv1_to_use VG_B_0
  lvcreate -L1G -n my_lv2_to_use VG_B_0
  ...

  lvcreate -l 1M VG_A -n LV_A_1
  pvcreate /dev/VG_A/LV_A_1
  pvcreate --metadatacopies 0 /dev/sdc ... (or whatever other disks)
  vgcreate VG_B_1 /dev/VG_A/LV_A_1 /dev/sdc
  lvcreate -L1G -n another_lv1_to_use VG_B_1
  ...
  ..

With such setup, you need to activate the level A VG first with the LVs
storing PVs with metadata and after that level B VGs that use the metadata.
It's not a problem when LVM volumes are autoactivated based on events with
the help of lvmetad (global/use_lvmetad=1 lvm.conf option), otherwise you
need to call vgchange -ay twice.

(Also, if you like more manual tweaking, you can just create mappings yourself
with dmesetup to accomplish step 2. But with LVs it's easier to manage.
So there are several ways how to achieve that as a matter of fact...).

-- 
Peter
