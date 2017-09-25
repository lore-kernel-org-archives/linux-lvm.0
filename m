Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A3391709EA
	for <linux-lvm@redhat.com>; Mon, 25 Sep 2017 10:46:58 +0000 (UTC)
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 144D981DFC
	for <linux-lvm@redhat.com>; Mon, 25 Sep 2017 10:46:56 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id k23so2112836uaf.3
	for <linux-lvm@redhat.com>; Mon, 25 Sep 2017 03:46:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <59C8CCBD.5080407@strike.wu.ac.at>
References: <59C8CCBD.5080407@strike.wu.ac.at>
From: emmanuel segura <emi2fast@gmail.com>
Date: Mon, 25 Sep 2017 12:46:54 +0200
Message-ID: <CAE7pJ3CMc9DkspBgUTxp+EQ08pjEX4cka8Ver=exVu-bWjo1Tw@mail.gmail.com>
Content-Type: multipart/alternative; boundary="f403045f903eec66d8055a01465d"
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--f403045f903eec66d8055a01465d
Content-Type: text/plain; charset="UTF-8"

I did as follow and it works, without storing the metadata on zram:

  truncate -s500M  disk1.dd
  truncate -s500M  disk2.dd
  losetup /dev/loop0 /root/disk1.dd
  losetup /dev/loop1 /root/disk2.dd

pvcreate /dev/loop0
pvcreate /dev/loop1
vgcreate vg00/dev/loop0 /dev/loop1
vgcreate vg00 /dev/loop0 /dev/loop1

lvcreate --type raid1 --name raid1vol -L 400M vg00

[root@puppetserver:~# lvs -ao +devices
  LV                  VG   Attr     LSize   Pool Origin Data%  Move Log
Copy%  Convert Devices
  raid1vol            vg00 rwi-a-m- 400.00m
100.00         raid1vol_rimage_0(0),raid1vol_rimage_1(0)
  [raid1vol_rimage_0] vg00 iwi-aor-
400.00m
/dev/loop0(1)
  [raid1vol_rimage_1] vg00 iwi-aor-
400.00m
/dev/loop1(1)
  [raid1vol_rmeta_0]  vg00 ewi-aor-
4.00m
/dev/loop0(0)
  [raid1vol_rmeta_1]  vg00 ewi-aor-
4.00m
/dev/loop1(0)

Now I will the metadata to other pvs:

truncate -s 100M meta1.dd
truncate -s 100M meta2.dd

 losetup /dev/loop2 meta1.dd
 losetup /dev/loop3 meta2.dd

 vgextend vg00 /dev/loop2
 vgextend vg00 /dev/loop3

pvmove -n 'raid1vol_rmeta_0' /dev/loop0 /dev/loop2
pvmove -n 'raid1vol_rmeta_1' /dev/loop1 /dev/loop3

vgchange -an vg00
  0 logical volume(s) in volume group "vg00" now active

vgchange -ay vg00
  1 logical volume(s) in volume group "vg00" now active




2017-09-25 11:30 GMT+02:00 Alexander 'Leo' Bergolth <leo@strike.wu.ac.at>:

> Hi!
>
> I tried to move the raid1 metadata subvolumes to different PVs (SSD
> devices for performance).
>
> Moving with pvmove works fine but activation fails when both legs of the
> metadata had been moved to external devices. (See below.)
>
> Interestingly moving just one metadata LV to another device works fine.
> (Raid LV can be activated afterwards.)
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
> lvcreate --type raid1 -m 1 --regionsize 64M -L 500m -n lv_boot vg_sys
> /dev/sda2 /dev/sdb2
>
> pvmove -n 'lv_boot_rmeta_0' /dev/sda2 /dev/zram0
> # and maybe
> # pvmove -n 'lv_boot_rmeta_1' /dev/sdb2 /dev/zram1
>
> -------------------- 8< --------------------
>     Creating vg_sys-lv_boot
>         dm create vg_sys-lv_boot LVM-l6Eg7Uvcm2KieevnXDjLLje3wqmSVG
> a1e56whxycwUR2RvGvcQNLy1GdfpzlZuQk [ noopencount flush ]   [16384] (*1)
>     Loading vg_sys-lv_boot table (253:7)
>       Getting target version for raid
>         dm versions   [ opencount flush ]   [16384] (*1)
>       Found raid target v1.12.0.
>         Adding target to (253:7): 0 1024000 raid raid1 3 0 region_size
> 8192 2 253:3 253:4 253:5 253:6
>         dm table   (253:7) [ opencount flush ]   [16384] (*1)
>         dm reload   (253:7) [ noopencount flush ]   [16384] (*1)
>   device-mapper: reload ioctl on  (253:7) failed: Input/output error
> -------------------- 8< --------------------
> [ 8130.110467] md/raid1:mdX: active with 2 out of 2 mirrors
> [ 8130.111361] mdX: failed to create bitmap (-5)
> [ 8130.112254] device-mapper: table: 253:7: raid: Failed to run raid array
> [ 8130.113154] device-mapper: ioctl: error adding target to table
> -------------------- 8< --------------------
> # lvs -a -o+devices
>   LV                 VG     Attr       LSize   Pool Origin Data%  Meta%
> Move Log Cpy%Sync Convert Devices
>   lv_boot            vg_sys rwi---r--- 500.00m
>                          lv_boot_rimage_0(0),lv_boot_rimage_1(0)
>   [lv_boot_rimage_0] vg_sys Iwi-a-r-r- 500.00m
>                          /dev/sda2(1)
>   [lv_boot_rimage_1] vg_sys Iwi-a-r-r- 500.00m
>                          /dev/sdb2(1)
>   [lv_boot_rmeta_0]  vg_sys ewi-a-r-r-   4.00m
>                          /dev/zram0(0)
>   [lv_boot_rmeta_1]  vg_sys ewi-a-r-r-   4.00m
>                          /dev/zram1(0)
> -------------------- 8< --------------------
>
> Full vgchange output can be found at:
>   http://leo.kloburg.at/tmp/lvm-raid1-ext-meta/
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
>



-- 
  .~.
  /V\
 //  \\
/(   )\
^`~'^

--f403045f903eec66d8055a01465d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I did as follow and it works, without storing the met=
adata on zram:<br><br>=C2=A0 truncate -s500M=C2=A0 disk1.dd <br>=C2=A0 trun=
cate -s500M=C2=A0 disk2.dd <br>=C2=A0 losetup /dev/loop0 /root/disk1.dd <br=
>=C2=A0 losetup /dev/loop1 /root/disk2.dd <br><br>pvcreate /dev/loop0<br>pv=
create /dev/loop1<br>vgcreate vg00/dev/loop0 /dev/loop1<br>vgcreate vg00 /d=
ev/loop0 /dev/loop1<br><br>lvcreate --type raid1 --name raid1vol -L 400M vg=
00<br><br>[root@puppetserver:~# lvs -ao +devices<br>=C2=A0 LV=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 VG=C2=A0=C2=A0 Attr=C2=A0=C2=A0=C2=A0=C2=A0 LSize=C2=A0=C2=
=A0 Pool Origin Data%=C2=A0 Move Log Copy%=C2=A0 Convert Devices=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>=C2=A0 raid1vol=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vg00 rwi-a-m- 400.00m=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 100.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
aid1vol_rimage_0(0),raid1vol_rimage_1(0)<br>=C2=A0 [raid1vol_rimage_0] vg00=
 iwi-aor- 400.00m=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /dev/loop0(1)=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 <br>=C2=A0 [raid1vol_rimage_1] vg00 iwi-aor- 400.00m=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 /dev/loop1(1)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>=C2=A0 [raid1vol_rmeta_0]=C2=
=A0 vg00 ewi-aor-=C2=A0=C2=A0 4.00m=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /dev/=
loop0(0)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 <br>=C2=A0 [raid1vol_rmeta_1]=C2=A0 vg00 ewi-aor-=C2=
=A0=C2=A0 4.00m=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /dev/loop1(0)=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 <br><br></div>Now I will the metadata to other pvs:<br><br>truncate -s =
100M meta1.dd<br>truncate -s 100M meta2.dd<br><br>=C2=A0losetup /dev/loop2 =
meta1.dd<br>=C2=A0losetup /dev/loop3 meta2.dd<br><br>=C2=A0vgextend vg00 /d=
ev/loop2<br>=C2=A0vgextend vg00 /dev/loop3<br><br>pvmove -n &#39;raid1vol_r=
meta_0&#39; /dev/loop0 /dev/loop2<br>pvmove -n &#39;raid1vol_rmeta_1&#39; /=
dev/loop1 /dev/loop3<br><div><div><br></div><div>vgchange -an vg00<br>=C2=
=A0 0 logical volume(s) in volume group &quot;vg00&quot; now active<br></di=
v><div><br></div><div>vgchange -ay vg00<br>=C2=A0 1 logical volume(s) in vo=
lume group &quot;vg00&quot; now active<br><br><br><br></div></div></div><di=
v class=3D"gmail_extra"><br><div class=3D"gmail_quote">2017-09-25 11:30 GMT=
+02:00 Alexander &#39;Leo&#39; Bergolth <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:leo@strike.wu.ac.at" target=3D"_blank">leo@strike.wu.ac.at</a>&gt;</sp=
an>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">Hi!<br>
<br>
I tried to move the raid1 metadata subvolumes to different PVs (SSD devices=
 for performance).<br>
<br>
Moving with pvmove works fine but activation fails when both legs of the me=
tadata had been moved to external devices. (See below.)<br>
<br>
Interestingly moving just one metadata LV to another device works fine. (Ra=
id LV can be activated afterwards.)<br>
<br>
I guess raid1 metadata on different PVs is not supported (yet)?<br>
<br>
I am using Centos 7.4 and kernel 3.10.0-693.el7.x86_64.<br>
<br>
Cheers,<br>
--leo<br>
<br>
-------------------- 8&lt; --------------------<br>
modprobe zram num_devices=3D2<br>
echo 300M &gt; /sys/block/zram0/disksize<br>
echo 300M &gt; /sys/block/zram1/disksize<br>
<br>
pvcreate /dev/sda2<br>
pvcreate /dev/sdb2<br>
pvcreate /dev/zram0<br>
pvcreate /dev/zram1<br>
<br>
vgcreate vg_sys /dev/sda2 /dev/sdb2 /dev/zram0 /dev/zram1<br>
lvcreate --type raid1 -m 1 --regionsize 64M -L 500m -n lv_boot vg_sys /dev/=
sda2 /dev/sdb2<br>
<br>
pvmove -n &#39;lv_boot_rmeta_0&#39; /dev/sda2 /dev/zram0<br>
# and maybe<br>
# pvmove -n &#39;lv_boot_rmeta_1&#39; /dev/sdb2 /dev/zram1<br>
<br>
-------------------- 8&lt; --------------------<br>
=C2=A0 =C2=A0 Creating vg_sys-lv_boot<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dm create vg_sys-lv_boot LVM-<wbr>l6Eg7Uvcm2Kie=
evnXDjLLje3wqmSVG<wbr>a1e56whxycwUR2RvGvcQNLy1Gdfpzl<wbr>ZuQk [ noopencount=
 flush ]=C2=A0 =C2=A0[16384] (*1)<br>
=C2=A0 =C2=A0 Loading vg_sys-lv_boot table (253:7)<br>
=C2=A0 =C2=A0 =C2=A0 Getting target version for raid<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dm versions=C2=A0 =C2=A0[ opencount flush ]=C2=
=A0 =C2=A0[16384] (*1)<br>
=C2=A0 =C2=A0 =C2=A0 Found raid target v1.12.0.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Adding target to (253:7): 0 1024000 raid raid1 =
3 0 region_size 8192 2 253:3 253:4 253:5 253:6<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dm table=C2=A0 =C2=A0(253:7) [ opencount flush =
]=C2=A0 =C2=A0[16384] (*1)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dm reload=C2=A0 =C2=A0(253:7) [ noopencount flu=
sh ]=C2=A0 =C2=A0[16384] (*1)<br>
=C2=A0 device-mapper: reload ioctl on=C2=A0 (253:7) failed: Input/output er=
ror<br>
-------------------- 8&lt; --------------------<br>
[ 8130.110467] md/raid1:mdX: active with 2 out of 2 mirrors<br>
[ 8130.111361] mdX: failed to create bitmap (-5)<br>
[ 8130.112254] device-mapper: table: 253:7: raid: Failed to run raid array<=
br>
[ 8130.113154] device-mapper: ioctl: error adding target to table<br>
-------------------- 8&lt; --------------------<br>
# lvs -a -o+devices<br>
=C2=A0 LV=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VG=
=C2=A0 =C2=A0 =C2=A0Attr=C2=A0 =C2=A0 =C2=A0 =C2=A0LSize=C2=A0 =C2=A0Pool O=
rigin Data%=C2=A0 Meta%=C2=A0 Move Log Cpy%Sync Convert Devices<br>
=C2=A0 lv_boot=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vg_sys rwi---r--- 5=
00.00m=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lv_boot_rimage_0(0),lv_boot_<w=
br>rimage_1(0)<br>
=C2=A0 [lv_boot_rimage_0] vg_sys Iwi-a-r-r- 500.00m=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/dev/sda2(1)<br>
=C2=A0 [lv_boot_rimage_1] vg_sys Iwi-a-r-r- 500.00m=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/dev/sdb2(1)<br>
=C2=A0 [lv_boot_rmeta_0]=C2=A0 vg_sys ewi-a-r-r-=C2=A0 =C2=A04.00m=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/dev/zram0(0)<br>
=C2=A0 [lv_boot_rmeta_1]=C2=A0 vg_sys ewi-a-r-r-=C2=A0 =C2=A04.00m=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/dev/zram1(0)<br>
-------------------- 8&lt; --------------------<br>
<br>
Full vgchange output can be found at:<br>
=C2=A0 <a href=3D"http://leo.kloburg.at/tmp/lvm-raid1-ext-meta/" rel=3D"nor=
eferrer" target=3D"_blank">http://leo.kloburg.at/tmp/lvm-<wbr>raid1-ext-met=
a/</a><br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
<br>
--<br>
e-mail=C2=A0 =C2=A0::: Leo.Bergolth (at) <a href=3D"http://wu.ac.at" rel=3D=
"noreferrer" target=3D"_blank">wu.ac.at</a><br>
fax=C2=A0 =C2=A0 =C2=A0 ::: <a href=3D"tel:%2B43-1-31336-906050" value=3D"+=
43131336906050">+43-1-31336-906050</a><br>
location ::: IT-Services | Vienna University of Economics | Austria<br>
<br>
______________________________<wbr>_________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" rel=3D"norefe=
rrer" target=3D"_blank">https://www.redhat.com/<wbr>mailman/listinfo/linux-=
lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"=
noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-<wbr>HOWTO/</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature">=C2=A0 .~.<br>=C2=
=A0 /V\<br>=C2=A0// =C2=A0\\<br>/( =C2=A0 )\<br>^`~&#39;^</div>
</div>

--f403045f903eec66d8055a01465d--
