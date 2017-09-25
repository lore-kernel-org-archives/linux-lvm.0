Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
From: Brassow Jonathan <jbrassow@redhat.com>
In-Reply-To: <59C8CCBD.5080407@strike.wu.ac.at>
Date: Mon, 25 Sep 2017 16:49:09 -0500
Message-Id: <7CCBD775-8DC1-4803-9D43-E5043686EAC0@redhat.com>
References: <59C8CCBD.5080407@strike.wu.ac.at>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

I’m not entirely sure how I would advocate moving the metadata area of a RAID LV, but trying it in a way similar to yours seemed to work for me:

[root@bp-01 ~]# devices vg
  LV            Attr       Cpy%Sync Devices
  lv            rwi-a-r--- 100.00   lv_rimage_0(0),lv_rimage_1(0)
  [lv_rimage_0] iwi-aor---          /dev/sdb1(1)
  [lv_rimage_1] iwi-aor---          /dev/sdc1(1)
  [lv_rmeta_0]  ewi-aor---          /dev/sdb1(0)
  [lv_rmeta_1]  ewi-aor---          /dev/sdc1(0)
[root@bp-01 ~]# pvmove /dev/sdb1:0 /dev/sdd1
  /dev/sdb1: Moved: 0.00%
  /dev/sdb1: Moved: 100.00%
[root@bp-01 ~]# devices vg
  LV            Attr       Cpy%Sync Devices
  lv            rwi-a-r--- 100.00   lv_rimage_0(0),lv_rimage_1(0)
  [lv_rimage_0] iwi-aor---          /dev/sdb1(1)
  [lv_rimage_1] iwi-aor---          /dev/sdc1(1)
  [lv_rmeta_0]  ewi-aor---          /dev/sdd1(0)
  [lv_rmeta_1]  ewi-aor---          /dev/sdc1(0)
[root@bp-01 ~]# pvmove /dev/sdc1:0 /dev/sde1
  /dev/sdc1: Moved: 0.00%
  /dev/sdc1: Moved: 100.00%
[root@bp-01 ~]# devices vg
  LV            Attr       Cpy%Sync Devices
  lv            rwi-a-r--- 100.00   lv_rimage_0(0),lv_rimage_1(0)
  [lv_rimage_0] iwi-aor---          /dev/sdb1(1)
  [lv_rimage_1] iwi-aor---          /dev/sdc1(1)
  [lv_rmeta_0]  ewi-aor---          /dev/sdd1(0)
  [lv_rmeta_1]  ewi-aor---          /dev/sde1(0)
[root@bp-01 ~]# vgchange -an vg
  0 logical volume(s) in volume group "vg" now active
[root@bp-01 ~]# vgchange -ay vg
  1 logical volume(s) in volume group "vg" now active
[root@bp-01 ~]# devices vg
  LV            Attr       Cpy%Sync Devices
  lv            rwi-a-r--- 100.00   lv_rimage_0(0),lv_rimage_1(0)
  [lv_rimage_0] iwi-aor---          /dev/sdb1(1)
  [lv_rimage_1] iwi-aor---          /dev/sdc1(1)
  [lv_rmeta_0]  ewi-aor---          /dev/sdd1(0)
  [lv_rmeta_1]  ewi-aor---          /dev/sde1(0)

If this does turn out to be a bug, we should probably fix it.  However, I probably wouldn’t do what you are attempting to do for the following reasons:
1) performance is probably not impacted /that/ much by having the metadata area on the same device.
Although I am sure that you can find some benchmark that proves me wrong, there have been a number of things done to mitigate the effect of having a write intent bitmap.  I don’t believe the overhead is much in normal use.)
2) You are reducing your redundancy.
Before, 1 device made up a side.  Now two devices make up a side.  If you loose any component of a side, it will effectively mean that side has failed.  The likelihood of a failure from 2 drives is more than the likelihood of failure from just one of them.

 brassow


> On Sep 25, 2017, at 4:30 AM, Alexander 'Leo' Bergolth <leo@strike.wu.ac.at> wrote:
> 
> Hi!
> 
> I tried to move the raid1 metadata subvolumes to different PVs (SSD devices for performance).
> 
> Moving with pvmove works fine but activation fails when both legs of the metadata had been moved to external devices. (See below.)
> 
> Interestingly moving just one metadata LV to another device works fine. (Raid LV can be activated afterwards.)
> 
> I guess raid1 metadata on different PVs is not supported (yet)?
> 
> I am using Centos 7.4 and kernel 3.10.0-693.el7.x86_64.
> 
> Cheers,
> --leo
> 
> -------------------- 8< --------------------
> modprobe zram num_devices=2
> echo 300M > /sys/block/zram0/disksize
> echo 300M > /sys/block/zram1/disksize
> 
> pvcreate /dev/sda2
> pvcreate /dev/sdb2
> pvcreate /dev/zram0
> pvcreate /dev/zram1
> 
> vgcreate vg_sys /dev/sda2 /dev/sdb2 /dev/zram0 /dev/zram1
> lvcreate --type raid1 -m 1 --regionsize 64M -L 500m -n lv_boot vg_sys /dev/sda2 /dev/sdb2
> 
> pvmove -n 'lv_boot_rmeta_0' /dev/sda2 /dev/zram0
> # and maybe
> # pvmove -n 'lv_boot_rmeta_1' /dev/sdb2 /dev/zram1
> 
> -------------------- 8< --------------------
>    Creating vg_sys-lv_boot
>        dm create vg_sys-lv_boot LVM-l6Eg7Uvcm2KieevnXDjLLje3wqmSVGa1e56whxycwUR2RvGvcQNLy1GdfpzlZuQk [ noopencount flush ]   [16384] (*1)
>    Loading vg_sys-lv_boot table (253:7)
>      Getting target version for raid
>        dm versions   [ opencount flush ]   [16384] (*1)
>      Found raid target v1.12.0.
>        Adding target to (253:7): 0 1024000 raid raid1 3 0 region_size 8192 2 253:3 253:4 253:5 253:6
>        dm table   (253:7) [ opencount flush ]   [16384] (*1)
>        dm reload   (253:7) [ noopencount flush ]   [16384] (*1)
>  device-mapper: reload ioctl on  (253:7) failed: Input/output error
> -------------------- 8< --------------------
> [ 8130.110467] md/raid1:mdX: active with 2 out of 2 mirrors
> [ 8130.111361] mdX: failed to create bitmap (-5)
> [ 8130.112254] device-mapper: table: 253:7: raid: Failed to run raid array
> [ 8130.113154] device-mapper: ioctl: error adding target to table
> -------------------- 8< --------------------
> # lvs -a -o+devices
>  LV                 VG     Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert Devices                                
>  lv_boot            vg_sys rwi---r--- 500.00m                                                     lv_boot_rimage_0(0),lv_boot_rimage_1(0)
>  [lv_boot_rimage_0] vg_sys Iwi-a-r-r- 500.00m                                                     /dev/sda2(1)                           
>  [lv_boot_rimage_1] vg_sys Iwi-a-r-r- 500.00m                                                     /dev/sdb2(1)                           
>  [lv_boot_rmeta_0]  vg_sys ewi-a-r-r-   4.00m                                                     /dev/zram0(0)                          
>  [lv_boot_rmeta_1]  vg_sys ewi-a-r-r-   4.00m                                                     /dev/zram1(0)                          
> -------------------- 8< --------------------
> 
> Full vgchange output can be found at:
>  http://leo.kloburg.at/tmp/lvm-raid1-ext-meta/
> 
> 
> -- 
> e-mail   ::: Leo.Bergolth (at) wu.ac.at   
> fax      ::: +43-1-31336-906050
> location ::: IT-Services | Vienna University of Economics | Austria
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
