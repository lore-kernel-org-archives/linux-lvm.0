MIME-Version: 1.0
In-Reply-To: <4FE0AB92.7020400@redhat.com>
References: <CAGQjrKZ0CD7O8_KYBd+KvBmK0nnxxoWc+5sm0Pk+XYkZEq3vOQ@mail.gmail.com>
	<4FE0AB92.7020400@redhat.com>
Date: Wed, 20 Jun 2012 15:36:32 +0530
Message-ID: <CAGQjrKZQO07PJZSGuZas3JKkq_a5KJ8S8m9FMUZYX4p27a3sJA@mail.gmail.com>
From: tariq wali <ganaiwali@gmail.com>
Content-Type: multipart/alternative; boundary=bcaec52c6ab7b6560204c2e48d3f
Subject: Re: [linux-lvm] LVM2 recovery on IP-SAN after OS re-install
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
To: "Bryn M. Reeves" <bmr@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

--bcaec52c6ab7b6560204c2e48d3f
Content-Type: text/plain; charset=ISO-8859-1

*Bryn,*
*
*
*
*
*Thanks for the mail but I might have just created a havoc by force
removing the PV*
Here is a series of commands and output ..

[root@datanalytics4 ~]# pvs
  Found duplicate PV XtGmeFOiCTWpLBckKZKlGtYKPVdBgVJn: using /dev/sdd1 not *
/dev/sdc1*
  PV           VG  Fmt  Attr    PSize     PFree
  /dev/sda5  vg1  lvm2 a--     162.99G     0
  /dev/sdb5  vg2  lvm2 a--     230.97G   20.97G
  /dev/PV    VG   Fmt   Attr  PSize       PFree
[root@datanalytics4 ~]#

[root@datanalytics4 ~]# pvdisplay
  Found duplicate PV XtGmeFOiCTWpLBckKZKlGtYKPVdBgVJn: using /dev/sdd1 not
/dev/sdc1
  --- Physical volume ---
  PV Name               /dev/sdd1
  VG Name               vg0
  PV Size               5.45 TB / not usable 1.14 MB
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              1428127
  Free PE               2063
  Allocated PE          1426064
  PV UUID               XtGmeF-OiCT-WpLB-ckKZ-KlGt-YKPV-dBgVJn

  --- Physical volume ---
  PV Name               /dev/sdb5
  VG Name               vg2
  PV Size               230.98 GB / not usable 3.41 MB
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              59129
  Free PE               5369
  Allocated PE          53760
  PV UUID               UP9bH6-Huaf-02ua-tsL0-lfcU-axc3-CIkSvS

  --- Physical volume ---
  PV Name               /dev/sda5
  VG Name               vg1
  PV Size               162.99 GB / not usable 1.83 MB
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              41725
  Free PE               0
  Allocated PE          41725
  PV UUID               9DSyjC-fvzX-wMTa-7NNG-JOzZ-Tu3F-utmpFT

[root@datanalytics4 ~]#


[root@datanalytics4 ~]# pvremove --force --force  /dev/sdc1
  Found duplicate PV XtGmeFOiCTWpLBckKZKlGtYKPVdBgVJn: using /dev/sdd1 not
/dev/sdc1
Really WIPE LABELS from physical volume "/dev/sdc1" of volume group "vg0"
[y/n]? y
  WARNING: Wiping physical volume label from /dev/sdc1 of volume group "vg0"
  Labels on physical volume "/dev/sdc1" successfully wiped

NOW

[root@datanalytics4 ~]# pvs
  PV         VG   Fmt  Attr PSize   PFree
  /dev/sda5  vg1  lvm2 a--  162.99G     0
  /dev/sdb5  vg2  lvm2 a--  230.97G 20.97G
[root@datanalytics4 ~]#

I see the the major chunk vg0 is gone ...however the file system still
exists in df -h

Filesystem                          Size  Used Avail Use% Mounted on
/dev/mapper/vg2-data3          07G  188M  197G   1% /data3
/dev/mapper/vg1-data--sys     61G  188M  153G   1% /data-sys
*/dev/mapper/vg0-data             2.0T  1.4T  561G  71% /data*
*/dev/mapper/vg0-data1           2.0T 1001G  914G  53% /data1*
*/dev/mapper/vg0-data2           1.5T  1.2T  184G  87% /data2*

[root@datanalytics4 ~]# dmsetup ls
vg0-data2 (253, 4)
vg0-data1 (253, 2)
vg1-data--sys (253, 1)
vg0-data (253, 3)
vg2-data3 (253, 0)
[root@datanalytics4 ~]#


[root@datanalytics4 ~]# dmsetup -vvv status
dm version   OF   [16384]
dm names   OF   [16384]
dm status vg0-data2  OF   [16384]
Name:              vg0-data2
State:             ACTIVE
vg0-data2: read ahead is 256
Read Ahead:        256
Tables present:    LIVE
Open count:        1
Event number:      0
Major, minor:      253, 4
Number of targets: 1
UUID: LVM-nvyZYGRy1X5SmKvKhqdpOeb4DZVxsdFgUX0dltiRbAVlZEuS2onnkTcEcDguv4IN

0 3092381696 linear

dm status vg0-data1  OF   [16384]
Name:              vg0-data1
State:             ACTIVE
vg0-data1: read ahead is 256
Read Ahead:        256
Tables present:    LIVE
Open count:        1
Event number:      0
Major, minor:      253, 2
Number of targets: 1
UUID: LVM-nvyZYGRy1X5SmKvKhqdpOeb4DZVxsdFgUWO0MJ5zoLA1Tgpa1wor3aAV35LItt46

0 4294967296 linear

dm status vg1-data--sys  OF   [16384]
Name:              vg1-data--sys
State:             ACTIVE
vg1-data--sys: read ahead is 256
Read Ahead:        256
Tables present:    LIVE
Open count:        1
Event number:      0
Major, minor:      253, 1
Number of targets: 1
UUID: LVM-gIeIufCQkSPf4iElhYM7c2Ja1OJZvycI55wsnecjG3VANNHAMz1BmThmiEIKh02b

0 341811200 linear

dm status vg0-data  OF   [16384]
Name:              vg0-data
State:             ACTIVE
vg0-data: read ahead is 256
Read Ahead:        256
Tables present:    LIVE
Open count:        1
Event number:      0
Major, minor:      253, 3
Number of targets: 1
UUID: LVM-nvyZYGRy1X5SmKvKhqdpOeb4DZVxsdFgQe2Q2DWZcxbwsPEaD2OsF7ZmgUsnCVfE

0 4294967296 linear

dm status vg2-data3  OF   [16384]
Name:              vg2-data3
State:             ACTIVE
vg2-data3: read ahead is 256
Read Ahead:        256
Tables present:    LIVE
Open count:        1
Event number:      0
Major, minor:      253, 0
Number of targets: 1
UUID: LVM-kCeA3BTSB2jeagki4MtPzswpZMmS2nuHXCMnuXWN9YdPlDuiLo03ebvuCMZTkzBr

0 440401920 linear

[root@datanalytics4 ~]#


as you can see above the file systems are there but i dont see the vg and
lv in the system now

[root@datanalytics4 ~]# pvs
  PV         VG   Fmt  Attr PSize   PFree
  /dev/sda5  vg1  lvm2 a--  162.99G     0
  /dev/sdb5  vg2  lvm2 a--  230.97G 20.97G
[root@datanalytics4 ~]# vgs -a
  VG   #PV #LV #SN Attr   VSize   VFree
  vg1    1   1   0 wz--n- 162.99G     0
  vg2    1   1   0 wz--n- 230.97G 20.97G
[root@datanalytics4 ~]# lvs -a
  LV       VG   Attr   LSize   Origin Snap%  Move Log Copy%  Convert
  data-sys vg1  -wi-ao 162.99G
  data3    vg2  -wi-ao 210.00G
[root@datanalytics4 ~]#


Did I screw up ?? is there a way to fix ? why does lvm not show the vg0 its
LV's but they exist in the system >?


On Tue, Jun 19, 2012 at 10:10 PM, Bryn M. Reeves <bmr@redhat.com> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 05/28/2012 07:40 PM, tariq wali wrote:
> > I tried to fix this by but it just won't go.. vgreduce
> > --removemissing vg0 Found duplicate PV
> > XtGmeFOiCTWpLBckKZKlGtYKPVdBgVJn: using /dev/sdd1 not /dev/sdc1
> > Volume group "vg0" is already consistent
> >
> > why does LVM think that it's still using PV ( /dev/sdc1 ) when it
> > no more exists ? and how do i get rid of it ?
>
> Although you have removed the PV from the volume group it still has a
> PV label on it which has the same UUID value as some other valid
> device that is part of the volume group.
>
> You should verify which device is correct and then remove the PV label
> from the other device (or re-run pvcreate to give it a new random UUID):
>
> # pvremove /dev/sdc1
>
> Once the label is removed you should stop seeing those messages.
>
> Regards,
> Bryn.
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.12 (GNU/Linux)
> Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/
>
> iEYEARECAAYFAk/gq5EACgkQ6YSQoMYUY97zTACdEn2l2OkwM/4naoqzZwJFDSiO
> WpYAnjSN8Uppia//lZK28FnhXvyDwK+Y
> =v7ST
> -----END PGP SIGNATURE-----
>



-- 
*Tariq Wali.*

--bcaec52c6ab7b6560204c2e48d3f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><b>Bryn,</b><div><b><br></b></div><div><b><br></b></div><d=
iv><b>Thanks for the mail but I might have just created a havoc by force re=
moving the PV</b></div><div>Here is a series of commands and output ..</div=
>
<div><br></div><div><div>[root@datanalytics4 ~]# pvs</div><div>=A0 Found du=
plicate PV XtGmeFOiCTWpLBckKZKlGtYKPVdBgVJn: using /dev/sdd1 not <b>/dev/sd=
c1</b></div><div>=A0 PV =A0 =A0 =A0 =A0 =A0 VG =A0Fmt =A0Attr =A0 =A0PSize =
=A0 =A0 PFree=A0</div><div>
=A0 /dev/sda5 =A0vg1 =A0lvm2 a-- =A0 =A0 162.99G =A0 =A0 0=A0</div><div>=A0=
 /dev/sdb5 =A0vg2 =A0lvm2 a-- =A0 =A0 230.97G =A0 20.97G</div><div>=A0 /dev=
/PV =A0 =A0VG =A0 Fmt =A0 Attr =A0PSize =A0 =A0 =A0 PFree</div><div>[root@d=
atanalytics4 ~]#=A0</div></div><div><br></div>
<div><div>[root@datanalytics4 ~]# pvdisplay=A0</div><div>=A0 Found duplicat=
e PV XtGmeFOiCTWpLBckKZKlGtYKPVdBgVJn: using /dev/sdd1 not /dev/sdc1</div><=
div>=A0 --- Physical volume ---</div><div>=A0 PV Name =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 /dev/sdd1</div>
<div>=A0 VG Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 vg0</div><div>=A0 PV Size =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 5.45 TB / not usable 1.14 MB</div><div>=A0 Allocata=
ble =A0 =A0 =A0 =A0 =A0 yes=A0</div><div>=A0 PE Size (KByte) =A0 =A0 =A0 40=
96</div><div>=A0 Total PE =A0 =A0 =A0 =A0 =A0 =A0 =A01428127</div>
<div>=A0 Free PE =A0 =A0 =A0 =A0 =A0 =A0 =A0 2063</div><div>=A0 Allocated P=
E =A0 =A0 =A0 =A0 =A01426064</div><div>=A0 PV UUID =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 XtGmeF-OiCT-WpLB-ckKZ-KlGt-YKPV-dBgVJn</div><div>=A0 =A0</div><div>=A0 =
--- Physical volume ---</div><div>=A0 PV Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 /=
dev/sdb5</div>
<div>=A0 VG Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 vg2</div><div>=A0 PV Size =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 230.98 GB / not usable 3.41 MB</div><div>=A0 Alloca=
table =A0 =A0 =A0 =A0 =A0 yes=A0</div><div>=A0 PE Size (KByte) =A0 =A0 =A0 =
4096</div><div>=A0 Total PE =A0 =A0 =A0 =A0 =A0 =A0 =A059129</div>
<div>=A0 Free PE =A0 =A0 =A0 =A0 =A0 =A0 =A0 5369</div><div>=A0 Allocated P=
E =A0 =A0 =A0 =A0 =A053760</div><div>=A0 PV UUID =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 UP9bH6-Huaf-02ua-tsL0-lfcU-axc3-CIkSvS</div><div>=A0 =A0</div><div>=A0 =
--- Physical volume ---</div><div>=A0 PV Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 /=
dev/sda5</div>
<div>=A0 VG Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 vg1</div><div>=A0 PV Size =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 162.99 GB / not usable 1.83 MB</div><div>=A0 Alloca=
table =A0 =A0 =A0 =A0 =A0 yes (but full)</div><div>=A0 PE Size (KByte) =A0 =
=A0 =A0 4096</div><div>=A0 Total PE =A0 =A0 =A0 =A0 =A0 =A0 =A041725</div>
<div>=A0 Free PE =A0 =A0 =A0 =A0 =A0 =A0 =A0 0</div><div>=A0 Allocated PE =
=A0 =A0 =A0 =A0 =A041725</div><div>=A0 PV UUID =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
9DSyjC-fvzX-wMTa-7NNG-JOzZ-Tu3F-utmpFT</div><div>=A0 =A0</div><div>[root@da=
tanalytics4 ~]#=A0</div></div><div><br></div><div>
<br></div><div><div>[root@datanalytics4 ~]# pvremove --force --force =A0/de=
v/sdc1</div><div>=A0 Found duplicate PV XtGmeFOiCTWpLBckKZKlGtYKPVdBgVJn: u=
sing /dev/sdd1 not /dev/sdc1</div><div>Really WIPE LABELS from physical vol=
ume &quot;/dev/sdc1&quot; of volume group &quot;vg0&quot; [y/n]? y</div>
<div>=A0 WARNING: Wiping physical volume label from /dev/sdc1 of volume gro=
up &quot;vg0&quot;</div><div>=A0 Labels on physical volume &quot;/dev/sdc1&=
quot; successfully wiped</div></div><div><br></div><div>NOW</div><div><br><=
/div>
<div><div>[root@datanalytics4 ~]# pvs</div><div>=A0 PV =A0 =A0 =A0 =A0 VG =
=A0 Fmt =A0Attr PSize =A0 PFree=A0</div><div>=A0 /dev/sda5 =A0vg1 =A0lvm2 a=
-- =A0162.99G =A0 =A0 0=A0</div><div>=A0 /dev/sdb5 =A0vg2 =A0lvm2 a-- =A023=
0.97G 20.97G</div><div>[root@datanalytics4 ~]#</div>
</div><div><br></div><div>I see the the major chunk vg0 is gone ...however =
the file system still exists in df -h</div><div><br></div><div>Filesystem =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Size =A0Used Avail Use% =
Mounted on</div><div><div>
/dev/mapper/vg2-data3 =A0 =A0 =A0 =A0 =A007G =A0188M =A0197G =A0 1% /data3<=
/div><div>/dev/mapper/vg1-data--sys =A0 =A0=A061G =A0188M =A0153G =A0 1% /d=
ata-sys</div><div><b>/dev/mapper/vg0-data =A0 =A0 =A0 =A0 =A0 =A0 2.0T =A01=
.4T =A0561G =A071% /data</b></div><div><b>/dev/mapper/vg0-data1=A0 =A0 =A0 =
=A0 =A0 =A02.0T 1001G =A0914G =A053% /data1</b></div>
<div><b>/dev/mapper/vg0-data2=A0 =A0 =A0 =A0 =A0 =A01.5T =A01.2T =A0184G =
=A087% /data2</b></div></div><div><br></div><div><div>[root@datanalytics4 ~=
]# dmsetup ls</div><div>vg0-data2<span class=3D"Apple-tab-span" style=3D"wh=
ite-space:pre">	</span>(253, 4)</div>
<div>vg0-data1<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</s=
pan>(253, 2)</div><div>vg1-data--sys<span class=3D"Apple-tab-span" style=3D=
"white-space:pre">	</span>(253, 1)</div><div>vg0-data<span class=3D"Apple-t=
ab-span" style=3D"white-space:pre">	</span>(253, 3)</div>
<div>vg2-data3<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</s=
pan>(253, 0)</div><div>[root@datanalytics4 ~]#</div></div><div><br></div><d=
iv><br></div><div><div>[root@datanalytics4 ~]# dmsetup -vvv status</div><di=
v>
dm version =A0 OF =A0 [16384]</div><div>dm names =A0 OF =A0 [16384]</div><d=
iv>dm status vg0-data2 =A0OF =A0 [16384]</div><div>Name: =A0 =A0 =A0 =A0 =
=A0 =A0 =A0vg0-data2</div><div>State: =A0 =A0 =A0 =A0 =A0 =A0 ACTIVE</div><=
div>vg0-data2: read ahead is 256</div>
<div>Read Ahead: =A0 =A0 =A0 =A0256</div><div>Tables present: =A0 =A0LIVE</=
div><div>Open count: =A0 =A0 =A0 =A01</div><div>Event number: =A0 =A0 =A00<=
/div><div>Major, minor: =A0 =A0 =A0253, 4</div><div>Number of targets: 1</d=
iv><div>UUID: LVM-nvyZYGRy1X5SmKvKhqdpOeb4DZVxsdFgUX0dltiRbAVlZEuS2onnkTcEc=
Dguv4IN</div>
<div><br></div><div>0 3092381696 linear=A0</div><div><br></div><div>dm stat=
us vg0-data1 =A0OF =A0 [16384]</div><div>Name: =A0 =A0 =A0 =A0 =A0 =A0 =A0v=
g0-data1</div><div>State: =A0 =A0 =A0 =A0 =A0 =A0 ACTIVE</div><div>vg0-data=
1: read ahead is 256</div><div>
Read Ahead: =A0 =A0 =A0 =A0256</div><div>Tables present: =A0 =A0LIVE</div><=
div>Open count: =A0 =A0 =A0 =A01</div><div>Event number: =A0 =A0 =A00</div>=
<div>Major, minor: =A0 =A0 =A0253, 2</div><div>Number of targets: 1</div><d=
iv>UUID: LVM-nvyZYGRy1X5SmKvKhqdpOeb4DZVxsdFgUWO0MJ5zoLA1Tgpa1wor3aAV35LItt=
46</div>
<div><br></div><div>0 4294967296 linear=A0</div><div><br></div><div>dm stat=
us vg1-data--sys =A0OF =A0 [16384]</div><div>Name: =A0 =A0 =A0 =A0 =A0 =A0 =
=A0vg1-data--sys</div><div>State: =A0 =A0 =A0 =A0 =A0 =A0 ACTIVE</div><div>=
vg1-data--sys: read ahead is 256</div>
<div>Read Ahead: =A0 =A0 =A0 =A0256</div><div>Tables present: =A0 =A0LIVE</=
div><div>Open count: =A0 =A0 =A0 =A01</div><div>Event number: =A0 =A0 =A00<=
/div><div>Major, minor: =A0 =A0 =A0253, 1</div><div>Number of targets: 1</d=
iv><div>UUID: LVM-gIeIufCQkSPf4iElhYM7c2Ja1OJZvycI55wsnecjG3VANNHAMz1BmThmi=
EIKh02b</div>
<div><br></div><div>0 341811200 linear=A0</div><div><br></div><div>dm statu=
s vg0-data =A0OF =A0 [16384]</div><div>Name: =A0 =A0 =A0 =A0 =A0 =A0 =A0vg0=
-data</div><div>State: =A0 =A0 =A0 =A0 =A0 =A0 ACTIVE</div><div>vg0-data: r=
ead ahead is 256</div><div>Read Ahead: =A0 =A0 =A0 =A0256</div>
<div>Tables present: =A0 =A0LIVE</div><div>Open count: =A0 =A0 =A0 =A01</di=
v><div>Event number: =A0 =A0 =A00</div><div>Major, minor: =A0 =A0 =A0253, 3=
</div><div>Number of targets: 1</div><div>UUID: LVM-nvyZYGRy1X5SmKvKhqdpOeb=
4DZVxsdFgQe2Q2DWZcxbwsPEaD2OsF7ZmgUsnCVfE</div>
<div><br></div><div>0 4294967296 linear=A0</div><div><br></div><div>dm stat=
us vg2-data3 =A0OF =A0 [16384]</div><div>Name: =A0 =A0 =A0 =A0 =A0 =A0 =A0v=
g2-data3</div><div>State: =A0 =A0 =A0 =A0 =A0 =A0 ACTIVE</div><div>vg2-data=
3: read ahead is 256</div><div>
Read Ahead: =A0 =A0 =A0 =A0256</div><div>Tables present: =A0 =A0LIVE</div><=
div>Open count: =A0 =A0 =A0 =A01</div><div>Event number: =A0 =A0 =A00</div>=
<div>Major, minor: =A0 =A0 =A0253, 0</div><div>Number of targets: 1</div><d=
iv>UUID: LVM-kCeA3BTSB2jeagki4MtPzswpZMmS2nuHXCMnuXWN9YdPlDuiLo03ebvuCMZTkz=
Br</div>
<div><br></div><div>0 440401920 linear=A0</div><div><br></div><div>[root@da=
tanalytics4 ~]#=A0</div></div><div><br></div><div><br></div><div>as you can=
 see above the file systems are there but i dont see the vg and lv in the s=
ystem now=A0</div>
<div><div><br></div><div>[root@datanalytics4 ~]# pvs</div><div>=A0 PV =A0 =
=A0 =A0 =A0 VG =A0 Fmt =A0Attr PSize =A0 PFree=A0</div><div>=A0 /dev/sda5 =
=A0vg1 =A0lvm2 a-- =A0162.99G =A0 =A0 0=A0</div><div>=A0 /dev/sdb5 =A0vg2 =
=A0lvm2 a-- =A0230.97G 20.97G</div><div>
[root@datanalytics4 ~]# vgs -a</div><div>=A0 VG =A0 #PV #LV #SN Attr =A0 VS=
ize =A0 VFree=A0</div><div>=A0 vg1 =A0 =A01 =A0 1 =A0 0 wz--n- 162.99G =A0 =
=A0 0=A0</div><div>=A0 vg2 =A0 =A01 =A0 1 =A0 0 wz--n- 230.97G 20.97G</div>=
<div>[root@datanalytics4 ~]# lvs -a</div>
<div>=A0 LV =A0 =A0 =A0 VG =A0 Attr =A0 LSize =A0 Origin Snap% =A0Move Log =
Copy% =A0Convert</div><div>=A0 data-sys vg1 =A0-wi-ao 162.99G =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0</div><div>=
=A0 data3 =A0 =A0vg2 =A0-wi-ao 210.00G =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0</div>
<div>[root@datanalytics4 ~]#</div></div><div><br></div><div><br></div><div>=
Did I screw up ?? is there a way to fix ? why does lvm not show the vg0 its=
 LV&#39;s but they exist in the system &gt;?</div><div><br><br><div class=
=3D"gmail_quote">
On Tue, Jun 19, 2012 at 10:10 PM, Bryn M. Reeves <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:bmr@redhat.com" target=3D"_blank">bmr@redhat.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">
-----BEGIN PGP SIGNED MESSAGE-----<br>
Hash: SHA1<br>
<div class=3D"im"><br>
On 05/28/2012 07:40 PM, tariq wali wrote:<br>
&gt; I tried to fix this by but it just won&#39;t go.. vgreduce<br>
&gt; --removemissing vg0 Found duplicate PV<br>
&gt; XtGmeFOiCTWpLBckKZKlGtYKPVdBgVJn: using /dev/sdd1 not /dev/sdc1<br>
&gt; Volume group &quot;vg0&quot; is already consistent<br>
&gt;<br>
&gt; why does LVM think that it&#39;s still using PV ( /dev/sdc1 ) when it<=
br>
&gt; no more exists ? and how do i get rid of it ?<br>
<br>
</div>Although you have removed the PV from the volume group it still has a=
<br>
PV label on it which has the same UUID value as some other valid<br>
device that is part of the volume group.<br>
<br>
You should verify which device is correct and then remove the PV label<br>
from the other device (or re-run pvcreate to give it a new random UUID):<br=
>
<br>
# pvremove /dev/sdc1<br>
<br>
Once the label is removed you should stop seeing those messages.<br>
<br>
Regards,<br>
Bryn.<br>
-----BEGIN PGP SIGNATURE-----<br>
Version: GnuPG v1.4.12 (GNU/Linux)<br>
Comment: Using GnuPG with Mozilla - <a href=3D"http://enigmail.mozdev.org/"=
 target=3D"_blank">http://enigmail.mozdev.org/</a><br>
<br>
iEYEARECAAYFAk/gq5EACgkQ6YSQoMYUY97zTACdEn2l2OkwM/4naoqzZwJFDSiO<br>
WpYAnjSN8Uppia//lZK28FnhXvyDwK+Y<br>
=3Dv7ST<br>
-----END PGP SIGNATURE-----<br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div dir=3D"=
ltr"><i style=3D"background-color:rgb(255,0,0);color:rgb(0,102,0)">Tariq Wa=
li.</i><span><span style=3D"background-color:rgb(255,255,153)"></span></spa=
n><br>
</div><br>
</div></div>

--bcaec52c6ab7b6560204c2e48d3f--
