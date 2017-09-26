Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 330EB6F950
	for <linux-lvm@redhat.com>; Tue, 26 Sep 2017 12:07:17 +0000 (UTC)
Received: from strike.wu.ac.at (strike.wu-wien.ac.at [137.208.89.120])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 33208883A2
	for <linux-lvm@redhat.com>; Tue, 26 Sep 2017 12:07:13 +0000 (UTC)
Message-ID: <59CA42EE.9050804@strike.wu.ac.at>
Date: Tue, 26 Sep 2017 14:07:10 +0200
From: "Alexander 'Leo' Bergolth" <leo@strike.wu.ac.at>
MIME-Version: 1.0
References: <59C8CCBD.5080407@strike.wu.ac.at>
	<7CCBD775-8DC1-4803-9D43-E5043686EAC0@redhat.com>
In-Reply-To: <7CCBD775-8DC1-4803-9D43-E5043686EAC0@redhat.com>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] lvm raid1 metadata on different pv
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
Content-Type: text/plain; charset="windows-1252"
To: linux-lvm@redhat.com

On 09/25/2017 11:49 PM, Brassow Jonathan wrote:
> I=E2=80=99m not entirely sure how I would advocate moving the metadata ar=
ea
> of a RAID LV, but trying it in a way similar to yours seemed to work
> for me.

Strange..

> If this does turn out to be a bug, we should probably fix it.

Hmm. Looks like it was a false-alarm.. :-)
The issue seems to be connected to my test-target-devices of type zram.
If I use brd devices (/dev/ram0 and /dev/ram1) for my test, activation
works as expected:

modprobe brd rd_size=3D307200 max_part=3D0 rd_nr=3D2
# pvcreate /dev/ram0
  Physical volume "/dev/ram0" successfully created.
# pvcreate /dev/ram1
  Physical volume "/dev/ram1" successfully created.
# vgextend vg1 /dev/ram0 /dev/ram1
  Volume group "vg1" successfully extended
# pvmove /dev/sdc:0 /dev/ram0
  /dev/sdc: Moved: 0.00%
  /dev/sdc: Moved: 100.00%
# pvmove /dev/sdd:0 /dev/ram1
  /dev/sdd: Moved: 0.00%
# vgchange -a n
  0 logical volume(s) in volume group "vg1" now active
# vgchange -a y
  1 logical volume(s) in volume group "vg1" now active

Maybe the different block size characteristics of the zram device are
causing the error?
(See below for a diff.)

> 1) performance is probably not impacted
> 2) You are reducing your redundancy.

I am aware of that. Nevertheless I think it might be reasonable for my
usage scenario:

I'd like to build an SSD-cached raid1 using two harddisks for data and
and two SSDs for cache and metadata.
The use case is big volumes using cheap sata disks that should be pimped
in terms of access time by the SSD cache.

My (raid1-backed) cache-pool in writeback mode already decreases my
fault-tolerance, so putting raid metadata on the corresponding SSDs
won't do further harm.

Cheers,
--leo


-------------------- 8< --------------------
# cd /sys/block
# diff -aryW10 --suppress-common-lines ram0/queue zram0/queue
diff -aryW10 --suppress-common-lines ram0/queue/hw_sector_size zram0/queue/=
hw_sector_size
51  |   40
diff -aryW10 --suppress-common-lines ram0/queue/logical_block_size zram0/qu=
eue/logical_block_size
51  |   40
diff -aryW10 --suppress-common-lines ram0/queue/max_hw_sectors_kb zram0/que=
ue/max_hw_sectors_kb
51  |   12
diff -aryW10 --suppress-common-lines ram0/queue/max_sectors_kb zram0/queue/=
max_sectors_kb
51  |   12
diff -aryW10 --suppress-common-lines ram0/queue/minimum_io_size zram0/queue=
/minimum_io_size
51  |   40
diff -aryW10 --suppress-common-lines ram0/queue/optimal_io_size zram0/queue=
/optimal_io_size
0   |   40
diff -aryW10 --suppress-common-lines ram0/queue/physical_block_size zram0/q=
ueue/physical_block_size
51  |   40
diff -aryW10 --suppress-common-lines ram0/queue/read_ahead_kb zram0/queue/r=
ead_ahead_kb
40  |   12
diff -aryW10 --suppress-common-lines ram0/queue/rotational zram0/queue/rota=
tional
1   |   0
-------------------- 8< --------------------




>> On Sep 25, 2017, at 4:30 AM, Alexander 'Leo' Bergolth <leo@strike.wu.ac.=
at> wrote:
>>
>> Hi!
>>
>> I tried to move the raid1 metadata subvolumes to different PVs (SSD devi=
ces for performance).
>>
>> Moving with pvmove works fine but activation fails when both legs of the=
 metadata had been moved to external devices. (See below.)
>>
>> Interestingly moving just one metadata LV to another device works fine. =
(Raid LV can be activated afterwards.)
>>
>> I guess raid1 metadata on different PVs is not supported (yet)?
>>
>> I am using Centos 7.4 and kernel 3.10.0-693.el7.x86_64.
>>
>> Cheers,
>> --leo
>>
>> -------------------- 8< --------------------
>> modprobe zram num_devices=3D2
>> echo 300M > /sys/block/zram0/disksize
>> echo 300M > /sys/block/zram1/disksize
>>
>> pvcreate /dev/sda2
>> pvcreate /dev/sdb2
>> pvcreate /dev/zram0
>> pvcreate /dev/zram1
>>
>> vgcreate vg_sys /dev/sda2 /dev/sdb2 /dev/zram0 /dev/zram1
>> lvcreate --type raid1 -m 1 --regionsize 64M -L 500m -n lv_boot vg_sys /d=
ev/sda2 /dev/sdb2
>>
>> pvmove -n 'lv_boot_rmeta_0' /dev/sda2 /dev/zram0
>> # and maybe
>> # pvmove -n 'lv_boot_rmeta_1' /dev/sdb2 /dev/zram1
>>
>> -------------------- 8< --------------------
>>    Creating vg_sys-lv_boot
>>        dm create vg_sys-lv_boot LVM-l6Eg7Uvcm2KieevnXDjLLje3wqmSVGa1e56w=
hxycwUR2RvGvcQNLy1GdfpzlZuQk [ noopencount flush ]   [16384] (*1)
>>    Loading vg_sys-lv_boot table (253:7)
>>      Getting target version for raid
>>        dm versions   [ opencount flush ]   [16384] (*1)
>>      Found raid target v1.12.0.
>>        Adding target to (253:7): 0 1024000 raid raid1 3 0 region_size 81=
92 2 253:3 253:4 253:5 253:6
>>        dm table   (253:7) [ opencount flush ]   [16384] (*1)
>>        dm reload   (253:7) [ noopencount flush ]   [16384] (*1)
>>  device-mapper: reload ioctl on  (253:7) failed: Input/output error
>> -------------------- 8< --------------------
>> [ 8130.110467] md/raid1:mdX: active with 2 out of 2 mirrors
>> [ 8130.111361] mdX: failed to create bitmap (-5)
>> [ 8130.112254] device-mapper: table: 253:7: raid: Failed to run raid arr=
ay
>> [ 8130.113154] device-mapper: ioctl: error adding target to table
>> -------------------- 8< --------------------
>> # lvs -a -o+devices
>>  LV                 VG     Attr       LSize   Pool Origin Data%  Meta%  =
Move Log Cpy%Sync Convert Devices                               =20
>>  lv_boot            vg_sys rwi---r--- 500.00m                           =
                          lv_boot_rimage_0(0),lv_boot_rimage_1(0)
>>  [lv_boot_rimage_0] vg_sys Iwi-a-r-r- 500.00m                           =
                          /dev/sda2(1)                          =20
>>  [lv_boot_rimage_1] vg_sys Iwi-a-r-r- 500.00m                           =
                          /dev/sdb2(1)                          =20
>>  [lv_boot_rmeta_0]  vg_sys ewi-a-r-r-   4.00m                           =
                          /dev/zram0(0)                         =20
>>  [lv_boot_rmeta_1]  vg_sys ewi-a-r-r-   4.00m                           =
                          /dev/zram1(0)                         =20
>> -------------------- 8< --------------------
>>
>> Full vgchange output can be found at:
>>  http://leo.kloburg.at/tmp/lvm-raid1-ext-meta/
>>
>>
>> --=20
>> e-mail   ::: Leo.Bergolth (at) wu.ac.at  =20
>> fax      ::: +43-1-31336-906050
>> location ::: IT-Services | Vienna University of Economics | Austria
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>=20


--=20
e-mail   ::: Leo.Bergolth (at) wu.ac.at
fax      ::: +43-1-31336-906050
location ::: IT-Services | Vienna University of Economics | Austria
