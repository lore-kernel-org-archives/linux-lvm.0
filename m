Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q4GFmo06005248
	for <linux-lvm@redhat.com>; Wed, 16 May 2012 11:48:50 -0400
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q4GFmlaS027353
	for <linux-lvm@redhat.com>; Wed, 16 May 2012 11:48:48 -0400
Received: by wgbdq10 with SMTP id dq10so627155wgb.27
	for <linux-lvm@redhat.com>; Wed, 16 May 2012 08:48:47 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 16 May 2012 21:18:46 +0530
Message-ID: <CAGQjrKb6_HuVc2Ro8vnkMwEmHg-H4gJHJVf_Q5GVaZfSM1p7yA@mail.gmail.com>
From: tariq wali <ganaiwali@gmail.com>
Content-Type: multipart/alternative; boundary=0016e6de037237cd6204c02941e9
Subject: [linux-lvm] lvreduce nightmare
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
To: linux-lvm@redhat.com
Cc: tariq wali <ganaiwali@gmail.com>

--0016e6de037237cd6204c02941e9
Content-Type: text/plain; charset=ISO-8859-1

Hi,

 I tried to reduce the VG and this is what it looked like before I tried to
reduce it

Filesystem                       Size  Used Avail   Use% Mounted on
/dev/mapper/vg0-data         2.2T  1.7T  433G  80%  /data

Out of the available *433G* I wanted to reduce *100G* in vg0 so that I
could use it for a new partition and this is what I did ..

* e2fsck -f /dev/vg0/data
resize2fs /dev/vg0/data 100G
lvreduce -L -100G -n /dev/vg0/data*

lvs
  LV   VG   Attr   LSize Origin Snap%  Move Log Copy%  Convert
  data vg0  -wi-ao 2.08T

after the lvreduce it did what I intended to as you can see in

vgs
  VG   #PV #LV #SN Attr   VSize VFree
  vg0    1   1   0 wz--n- 2.18T *100.00G*   ( it did allocate the 100.00G
as free space )

after I mounted /data back , I could even touch a file , however when we
start the app (mysql) and when it tries to write into the existing data in
/data , the drive goes into *read only mode repeatedly* ..

in order to fix it i unmounted /data and ran

*e2fsck -f /dev/vg0/data -n*
*
*
after the fsck completed it would prompt to fix superblock/inodes which I
replied with 'yes' however the problem still persists that if i mount /data
it goes into read-only mode .

dmsetup table
vg0-data: 0 4477255680 linear 104:17 384

Red Hat Enterprise Linux Server release 5.7
2.6.18-274.17.1.el5 #1 SMP  x86_64
lvm2-2.02.84-6.el5_7.1

I have reduced lvm's with those  sequence of commands in the past but i
just dont understand why it seems to have failed this time although i did
get 100G free space in vg0 but the partition /data seems useless ..

* I would greatly appreciate any help/insights .. i notice lvm has created
a backup file in /etc/lvm/archive as   vg0_00008-1147866134.vg , does
restoring from that file actually work ? will it get the drive into
original state ? and how can i actually free some space from the volume
group if i want to ?*


########
some errors spewed in dmesg

attempt to access beyond end of device
dm-0: rw=0, want=4654102632, limit=4477255680
EXT3-fs error (device dm-0): read_block_bitmap: Cannot read block bitmap -
block_group = 17145, block_bitmap = 561807360
Aborting journal on device dm-0.
attempt to access beyond end of device
dm-0: rw=0, want=4565762056, limit=4477255680
EXT3-fs error (device dm-0): read_block_bitmap: <2>ext3_abort called.
EXT3-fs error (device dm-0): ext3_journal_start_sb: Detected aborted journal

Cannot read block bitmap - block_group = 17417, block_bitmap = 570720256
EXT3-fs error (device dm-0): read_block_bitmap: Cannot read block bitmap -
block_group = 17417, block_bitmap = 570720256
dm-0: rw=0, want=4683202568, limit=4477255680
EXT3-fs error (device dm-0): read_block_bitmap: Cannot read block bitmap -
block_group = 17865, block_bitmap = 585400320

EXT3-fs error (device dm-0) in ext3_free_blocks_sb: Journal has aborted
EXT3-fs error (device dm-0) in ext3_orphan_del: Journal has aborted
__journal_remove_journal_head: freeing b_committed_data


ext3_abort called.
EXT3-fs error (device dm-0): ext3_put_super: Couldn't clean up the journal
kjournald starting.  Commit interval 5 seconds
EXT3-fs warning (device dm-0): ext3_clear_journal_err: Filesystem error
recorded from previous mount: IO failure
EXT3-fs warning (device dm-0): ext3_clear_journal_err: Marking fs in need
of filesystem check.
EXT3-fs warning: mounting fs with errors, running e2fsck is recommended
attempt to access beyond end of device
dm-0: rw=0, want=4654102632, limit=4477255680

EXT3-fs error (device dm-0): read_block_bitmap: Cannot read block bitmap -
block_group = 17145, block_bitmap = 561807360
Aborting journal on device dm-0.






-- 
*Tariq Wali.*

--0016e6de037237cd6204c02941e9
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi,</div><div><br></div><div>=A0I tried to reduc=
e the VG and this is
    what it looked like before I tried to reduce it <br>
    <br>
    Filesystem=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 Size=A0 Used Avail=A0=A0 Use% Mounted on<br>
    /dev/mapper/vg0-data =A0 =A0 =A0 =A0 2.2T=A0 1.7T=A0 433G=A0 80%=A0 /da=
ta</div><div><br></div><div>Out of the available <b>433G</b> I wanted to re=
duce <b>100G</b> in vg0 so that I
    could use it for a new partition and this is what I did ..<br>
    <br><b>
    e2fsck -f /dev/vg0/data<br>
    resize2fs /dev/vg0/data 100G<br>
    lvreduce -L -100G -n /dev/vg0/data</b></div><div><br></div><div>lvs</di=
v><div>=A0 LV =A0 VG =A0 Attr =A0 LSize Origin Snap% =A0Move Log Copy% =A0C=
onvert</div><div>=A0 data vg0 =A0-wi-ao 2.08T =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0</div>
</div><div><br></div><div>after the lvreduce it did what I intended to as y=
ou can see in <br>
    <br>
    vgs<br>
    =A0 VG=A0=A0 #PV #LV #SN Attr=A0=A0 VSize VFree=A0 <br>
    =A0 vg0=A0=A0=A0 1=A0=A0 1=A0=A0 0 wz--n- 2.18T <b>100.00G</b>=A0=A0 ( =
it did allocate the
    100.00G as free space )</div><div><div><div><br></div></div><div>after =
I mounted /data back , I could even touch a file , however
    when we start the app (mysql) and when it tries to write into the
    existing data in /data , the drive goes into <b>read only mode repeated=
ly</b> ..</div><div><br></div><div>in order to fix it i unmounted /data and=
 ran=A0</div><div><br></div><div><b>e2fsck -f /dev/vg0/data -n</b></div>
<div><b><br></b></div><div>after the fsck completed it would prompt to fix =
superblock/inodes which I replied with &#39;yes&#39; however the problem st=
ill persists that if i mount /data it goes into read-only mode .</div><div>
<div><br></div><div>dmsetup table</div><div>vg0-data: 0 4477255680 linear 1=
04:17 384</div></div><div><br></div><div>Red Hat Enterprise Linux Server re=
lease 5.7</div><div>2.6.18-274.17.1.el5 #1 SMP =A0x86_64</div><div>lvm2-2.0=
2.84-6.el5_7.1</div>
<div><br></div><div>I have reduced lvm&#39;s with those =A0sequence of comm=
ands in the past but i just dont understand why it seems to have failed thi=
s time although i did get 100G free space in vg0 but the partition /data se=
ems useless ..</div>
<div><br></div><div><b>=A0I would greatly appreciate any help/insights .. i=
 notice lvm has created a backup file in=A0/etc/lvm/archive as=A0=A0=A0<a h=
ref=3D"http://vg0_00008-1147866134.vg">vg0_00008-1147866134.vg</a> , does r=
estoring from that file actually work ? will it get the drive into original=
 state ? and how can i actually free some space from the volume group if i =
want to ?</b></div>
<div><br></div><div><br></div><div>########</div><div>some errors spewed in=
 dmesg</div><div><br></div><div><div>attempt to access beyond end of device=
</div><div>dm-0: rw=3D0, want=3D4654102632, limit=3D4477255680</div><div>EX=
T3-fs error (device dm-0): read_block_bitmap: Cannot read block bitmap - bl=
ock_group =3D 17145, block_bitmap =3D 561807360</div>
<div>Aborting journal on device dm-0.</div><div>attempt to access beyond en=
d of device</div><div>dm-0: rw=3D0, want=3D4565762056, limit=3D4477255680</=
div><div>EXT3-fs error (device dm-0): read_block_bitmap: &lt;2&gt;ext3_abor=
t called.</div>
<div>EXT3-fs error (device dm-0): ext3_journal_start_sb: Detected aborted j=
ournal</div><div><br></div><div>Cannot read block bitmap - block_group =3D =
17417, block_bitmap =3D 570720256</div><div>EXT3-fs error (device dm-0): re=
ad_block_bitmap: Cannot read block bitmap - block_group =3D 17417, block_bi=
tmap =3D 570720256</div>
<div>dm-0: rw=3D0, want=3D4683202568, limit=3D4477255680</div><div>EXT3-fs =
error (device dm-0): read_block_bitmap: Cannot read block bitmap - block_gr=
oup =3D 17865, block_bitmap =3D 585400320</div><div><br></div><div>EXT3-fs =
error (device dm-0) in ext3_free_blocks_sb: Journal has aborted</div>
<div>EXT3-fs error (device dm-0) in ext3_orphan_del: Journal has aborted</d=
iv><div>__journal_remove_journal_head: freeing b_committed_data</div><div><=
br></div><div><br></div><div>ext3_abort called.</div><div>EXT3-fs error (de=
vice dm-0): ext3_put_super: Couldn&#39;t clean up the journal</div>
<div>kjournald starting. =A0Commit interval 5 seconds</div><div>EXT3-fs war=
ning (device dm-0): ext3_clear_journal_err: Filesystem error recorded from =
previous mount: IO failure</div><div>EXT3-fs warning (device dm-0): ext3_cl=
ear_journal_err: Marking fs in need of filesystem check.</div>
<div>EXT3-fs warning: mounting fs with errors, running e2fsck is recommende=
d</div><div>attempt to access beyond end of device</div><div>dm-0: rw=3D0, =
want=3D4654102632, limit=3D4477255680</div><div><br></div><div>EXT3-fs erro=
r (device dm-0): read_block_bitmap: Cannot read block bitmap - block_group =
=3D 17145, block_bitmap =3D 561807360</div>
<div>Aborting journal on device dm-0.</div></div><div><br></div><div><br></=
div><div><br></div><div><br></div><div><br></div><div><br></div>-- <br><div=
 dir=3D"ltr"><i style=3D"background-color:rgb(255,0,0);color:rgb(0,102,0)">=
Tariq Wali.</i><span><span style=3D"background-color:rgb(255,255,153)"></sp=
an></span><br>
</div><br>
</div></div>

--0016e6de037237cd6204c02941e9--
