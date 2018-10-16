Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F5DB79B33
	for <linux-lvm@redhat.com>; Tue, 16 Oct 2018 20:59:58 +0000 (UTC)
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
	[209.85.217.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F2A2D307D856
	for <linux-lvm@redhat.com>; Tue, 16 Oct 2018 20:59:57 +0000 (UTC)
Received: by mail-vs1-f72.google.com with SMTP id w20so11153894vsc.5
	for <linux-lvm@redhat.com>; Tue, 16 Oct 2018 13:59:57 -0700 (PDT)
MIME-Version: 1.0
References: <5AB52B8D020000F9000B14B9@prv-mh.provo.novell.com>
In-Reply-To: <5AB52B8D020000F9000B14B9@prv-mh.provo.novell.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Tue, 16 Oct 2018 23:59:45 +0300
Message-ID: <CAMRbyyuSO+LdfnESO_56GDKqGDAOXah0PXbfV0s3b3GOP0XJug@mail.gmail.com>
Content-Type: multipart/alternative; boundary="00000000000005cce805785ed6a4"
Subject: Re: [linux-lvm] [lvm-devel] Can't work normally after attaching
 disk volumes originally in a VG on another machine
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
To: lvm-devel <lvm-devel@redhat.com>
Cc: linux-lvm@redhat.com

--00000000000005cce805785ed6a4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 23, 2018 at 11:30 AM Gang He <ghe@suse.com> wrote:

> Hello List,
>
> Since I am new to LVM area, but I got a problem about LVM can't work
> normally after attaching disk volumes originally in a VG on another machi=
ne.
> Then, I sent this problem to the list, to see if we can get a fix or ther=
e
> has been a fix.
> The problem is very easy to reproduce,
> 1) create two virtual machines(tb0307-nd1, tb0307-nd2), create two virtua=
l
> disks.
>

Do you mean 2 logical volumes on the host?


> 2) attach two virtual disks to VM1(tb0307-nd1).
>

Are you attaching the logical volumes created on the host to the VM?


> tb0307-nd1:/# lsblk
> NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
> sr0     11:0    1  4.3G  0 rom
> vda    254:0    0   40G  0 disk
> =E2=94=9C=E2=94=80vda1 254:1    0    4G  0 part [SWAP]
> =E2=94=9C=E2=94=80vda2 254:2    0 23.6G  0 part /
> =E2=94=94=E2=94=80vda3 254:3    0 12.4G  0 part /home
> vdb    254:16   0   40G  0 disk
> vdc    254:32   0   20G  0 disk <<=3D disk1
> vdd    254:48   0   20G  0 disk <<=3D disk2
> 3) pvcreate two virtual disks, and add them to vg1.
> tb0307-nd1:/# pvcreate /dev/vdc
>   Physical volume "/dev/vdc" successfully created.
> tb0307-nd1:/# pvcreate /dev/vdd
>   Physical volume "/dev/vdd" successfully created.
> tb0307-nd1:/# pvs
>   PV         VG Fmt  Attr PSize  PFree
>   /dev/vdc      lvm2 ---  20.00g 20.00g
>   /dev/vdd      lvm2 ---  20.00g 20.00g
> tb0307-nd1:/# vgcreate vg1 /dev/vdc /dev/vdd
> 4) disconnect two virtual disks from VM1, and attach disk1 to
> VM2(tb0307-nd2).
>

If /dev/vdc and /dev/vdd are logical volumes on the host, lvm on the host
just scanned these lvs and discovered the metadata created within the VM.


> 5) delete vg1, create vg2, and add disk1 to vg2.
> tb0307-nd2:~ # pvs
>   WARNING: Device for PV t6gjHU-dtY4-th5O-A0mr-5OEC-R1ZK-TPQgIh not found
> or rejected by a filter.
>   PV         VG  Fmt  Attr PSize  PFree
>   /dev/vdc   vg1 lvm2 a--  20.00g 20.00g
>   [unknown]  vg1 lvm2 a-m  20.00g 20.00g
> tb0307-nd2:~ # pvremove /dev/vdc
>   WARNING: Device for PV t6gjHU-dtY4-th5O-A0mr-5OEC-R1ZK-TPQgIh not found
> or rejected by a filter.
>   PV /dev/vdc is used by VG vg1 so please use vgreduce first.
>   (If you are certain you need pvremove, then confirm by using --force
> twice.)
>   /dev/vdc: physical volume label not removed.
> tb0307-nd2:~ # vgreduce --removemissing vg1
>   WARNING: Device for PV t6gjHU-dtY4-th5O-A0mr-5OEC-R1ZK-TPQgIh not found
> or rejected by a filter.
>   Wrote out consistent volume group vg1.
> tb0307-nd2:~ # pvs
>   PV         VG  Fmt  Attr PSize  PFree
>   /dev/vdc   vg1 lvm2 a--  20.00g 20.00g
> tb0307-nd2:~ # vgremove vg1
>   Volume group "vg1" successfully removed
> tb0307-nd2:~ # vgcreate vg2 /dev/vdc
>   Volume group "vg2" successfully created
> tb0307-nd2:~ # vgs
>   VG  #PV #LV #SN Attr   VSize  VFree
>   vg2   1   0   0 wz--n- 20.00g 20.00g
> tb0307-nd2:~ # pvs
>   PV         VG  Fmt  Attr PSize  PFree
>   /dev/vdc   vg2 lvm2 a--  20.00g 20.00g
>
> 6) attach disk2 to VM2(tb0307-nd2), the vg on VM2 looks abnormal.
> tb0307-nd2:~ # pvs
>   WARNING: Device for PV JJOL4H-kc0j-jyTD-LDwl-71FZ-dHKM-YoFtNV not found
> or rejected by a filter.
>   PV         VG  Fmt  Attr PSize  PFree
>   /dev/vdc   vg2 lvm2 a--  20.00g 20.00g
>   /dev/vdd   vg1 lvm2 a--  20.00g 20.00g
>   [unknown]  vg1 lvm2 a-m  20.00g 20.00g
> tb0307-nd2:~ # vgs
>   WARNING: Device for PV JJOL4H-kc0j-jyTD-LDwl-71FZ-dHKM-YoFtNV not found
> or rejected by a filter.
>   VG  #PV #LV #SN Attr   VSize  VFree
>   vg1   2   0   0 wz-pn- 39.99g 39.99g
>   vg2   1   0   0 wz--n- 20.00g 20.00g
>
> 7) reboot VM2, the result looks worse (vdc disk belongs to two vg).
> tb0307-nd2:/mnt/shared # pvs
>   PV         VG  Fmt  Attr PSize  PFree
>   /dev/vdc   vg1 lvm2 a--  20.00g     0
>   /dev/vdc   vg2 lvm2 a--  20.00g 10.00g
>   /dev/vdd   vg1 lvm2 a--  20.00g  9.99g
>
>
> It looks like LVM2 meta consistency problem? please help to take a look.
>

If you want to attach logical volumes to VMs, you must make sure that these
volumes are not accessible to LVM on the host. A good way to achieve this i=
s
to setup devices:filter in lvm.conf so LVM can access only the disks
required
by the host (e.g. /dev/sda2).

Check this for more info on this problem:
https://ovirt.org/blog/2017/12/lvm-configuration-the-easy-way/

Nir

--00000000000005cce805785ed6a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"lt=
r">On Fri, Mar 23, 2018 at 11:30 AM Gang He &lt;<a href=3D"mailto:ghe@suse.=
com">ghe@suse.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Hello List,<br>
<br>
Since I am new to LVM area, but I got a problem about LVM can&#39;t work no=
rmally after attaching disk volumes originally in a VG on another machine.<=
br>
Then, I sent this problem to the list, to see if we can get a fix or there =
has been a fix.<br>
The problem is very easy to reproduce,<br>
1) create two virtual machines(tb0307-nd1, tb0307-nd2), create two virtual =
disks.<br></blockquote><div><br></div><div>Do you mean 2 logical volumes on=
 the host?</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
2) attach two virtual disks to VM1(tb0307-nd1).<br></blockquote><div><br></=
div><div>Are you attaching the logical volumes created on the host to the V=
M?</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
tb0307-nd1:/# lsblk<br>
NAME=C2=A0 =C2=A0MAJ:MIN RM=C2=A0 SIZE RO TYPE MOUNTPOINT<br>
sr0=C2=A0 =C2=A0 =C2=A011:0=C2=A0 =C2=A0 1=C2=A0 4.3G=C2=A0 0 rom<br>
vda=C2=A0 =C2=A0 254:0=C2=A0 =C2=A0 0=C2=A0 =C2=A040G=C2=A0 0 disk<br>
=E2=94=9C=E2=94=80vda1 254:1=C2=A0 =C2=A0 0=C2=A0 =C2=A0 4G=C2=A0 0 part [S=
WAP]<br>
=E2=94=9C=E2=94=80vda2 254:2=C2=A0 =C2=A0 0 23.6G=C2=A0 0 part /<br>
=E2=94=94=E2=94=80vda3 254:3=C2=A0 =C2=A0 0 12.4G=C2=A0 0 part /home<br>
vdb=C2=A0 =C2=A0 254:16=C2=A0 =C2=A00=C2=A0 =C2=A040G=C2=A0 0 disk<br>
vdc=C2=A0 =C2=A0 254:32=C2=A0 =C2=A00=C2=A0 =C2=A020G=C2=A0 0 disk &lt;&lt;=
=3D disk1<br>
vdd=C2=A0 =C2=A0 254:48=C2=A0 =C2=A00=C2=A0 =C2=A020G=C2=A0 0 disk &lt;&lt;=
=3D disk2<br>
3) pvcreate two virtual disks, and add them to vg1.<br>
tb0307-nd1:/# pvcreate /dev/vdc<br>
=C2=A0 Physical volume &quot;/dev/vdc&quot; successfully created.<br>
tb0307-nd1:/# pvcreate /dev/vdd<br>
=C2=A0 Physical volume &quot;/dev/vdd&quot; successfully created.<br>
tb0307-nd1:/# pvs<br>
=C2=A0 PV=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VG Fmt=C2=A0 Attr PSize=C2=A0 PF=
ree<br>
=C2=A0 /dev/vdc=C2=A0 =C2=A0 =C2=A0 lvm2 ---=C2=A0 20.00g 20.00g<br>
=C2=A0 /dev/vdd=C2=A0 =C2=A0 =C2=A0 lvm2 ---=C2=A0 20.00g 20.00g<br>
tb0307-nd1:/# vgcreate vg1 /dev/vdc /dev/vdd<br>
4) disconnect two virtual disks from VM1, and attach disk1 to VM2(tb0307-nd=
2).<br></blockquote><div><br></div><div>If /dev/vdc and /dev/vdd are logica=
l volumes on the host, lvm on the host</div><div>just scanned these lvs and=
 discovered the metadata created within the VM.</div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
5) delete vg1, create vg2, and add disk1 to vg2.<br>
tb0307-nd2:~ # pvs<br>
=C2=A0 WARNING: Device for PV t6gjHU-dtY4-th5O-A0mr-5OEC-R1ZK-TPQgIh not fo=
und or rejected by a filter.<br>
=C2=A0 PV=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VG=C2=A0 Fmt=C2=A0 Attr PSize=C2=
=A0 PFree<br>
=C2=A0 /dev/vdc=C2=A0 =C2=A0vg1 lvm2 a--=C2=A0 20.00g 20.00g<br>
=C2=A0 [unknown]=C2=A0 vg1 lvm2 a-m=C2=A0 20.00g 20.00g<br>
tb0307-nd2:~ # pvremove /dev/vdc<br>
=C2=A0 WARNING: Device for PV t6gjHU-dtY4-th5O-A0mr-5OEC-R1ZK-TPQgIh not fo=
und or rejected by a filter.<br>
=C2=A0 PV /dev/vdc is used by VG vg1 so please use vgreduce first.<br>
=C2=A0 (If you are certain you need pvremove, then confirm by using --force=
 twice.)<br>
=C2=A0 /dev/vdc: physical volume label not removed.<br>
tb0307-nd2:~ # vgreduce --removemissing vg1<br>
=C2=A0 WARNING: Device for PV t6gjHU-dtY4-th5O-A0mr-5OEC-R1ZK-TPQgIh not fo=
und or rejected by a filter.<br>
=C2=A0 Wrote out consistent volume group vg1.<br>
tb0307-nd2:~ # pvs<br>
=C2=A0 PV=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VG=C2=A0 Fmt=C2=A0 Attr PSize=C2=
=A0 PFree<br>
=C2=A0 /dev/vdc=C2=A0 =C2=A0vg1 lvm2 a--=C2=A0 20.00g 20.00g<br>
tb0307-nd2:~ # vgremove vg1<br>
=C2=A0 Volume group &quot;vg1&quot; successfully removed<br>
tb0307-nd2:~ # vgcreate vg2 /dev/vdc<br>
=C2=A0 Volume group &quot;vg2&quot; successfully created<br>
tb0307-nd2:~ # vgs<br>
=C2=A0 VG=C2=A0 #PV #LV #SN Attr=C2=A0 =C2=A0VSize=C2=A0 VFree<br>
=C2=A0 vg2=C2=A0 =C2=A01=C2=A0 =C2=A00=C2=A0 =C2=A00 wz--n- 20.00g 20.00g<b=
r>
tb0307-nd2:~ # pvs<br>
=C2=A0 PV=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VG=C2=A0 Fmt=C2=A0 Attr PSize=C2=
=A0 PFree<br>
=C2=A0 /dev/vdc=C2=A0 =C2=A0vg2 lvm2 a--=C2=A0 20.00g 20.00g<br>
<br>
6) attach disk2 to VM2(tb0307-nd2), the vg on VM2 looks abnormal.<br>
tb0307-nd2:~ # pvs<br>
=C2=A0 WARNING: Device for PV JJOL4H-kc0j-jyTD-LDwl-71FZ-dHKM-YoFtNV not fo=
und or rejected by a filter.<br>
=C2=A0 PV=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VG=C2=A0 Fmt=C2=A0 Attr PSize=C2=
=A0 PFree<br>
=C2=A0 /dev/vdc=C2=A0 =C2=A0vg2 lvm2 a--=C2=A0 20.00g 20.00g<br>
=C2=A0 /dev/vdd=C2=A0 =C2=A0vg1 lvm2 a--=C2=A0 20.00g 20.00g<br>
=C2=A0 [unknown]=C2=A0 vg1 lvm2 a-m=C2=A0 20.00g 20.00g<br>
tb0307-nd2:~ # vgs<br>
=C2=A0 WARNING: Device for PV JJOL4H-kc0j-jyTD-LDwl-71FZ-dHKM-YoFtNV not fo=
und or rejected by a filter.<br>
=C2=A0 VG=C2=A0 #PV #LV #SN Attr=C2=A0 =C2=A0VSize=C2=A0 VFree<br>
=C2=A0 vg1=C2=A0 =C2=A02=C2=A0 =C2=A00=C2=A0 =C2=A00 wz-pn- 39.99g 39.99g<b=
r>
=C2=A0 vg2=C2=A0 =C2=A01=C2=A0 =C2=A00=C2=A0 =C2=A00 wz--n- 20.00g 20.00g<b=
r>
<br>
7) reboot VM2, the result looks worse (vdc disk belongs to two vg).<br>
tb0307-nd2:/mnt/shared # pvs<br>
=C2=A0 PV=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VG=C2=A0 Fmt=C2=A0 Attr PSize=C2=
=A0 PFree<br>
=C2=A0 /dev/vdc=C2=A0 =C2=A0vg1 lvm2 a--=C2=A0 20.00g=C2=A0 =C2=A0 =C2=A00<=
br>
=C2=A0 /dev/vdc=C2=A0 =C2=A0vg2 lvm2 a--=C2=A0 20.00g 10.00g<br>
=C2=A0 /dev/vdd=C2=A0 =C2=A0vg1 lvm2 a--=C2=A0 20.00g=C2=A0 9.99g<br>
<br>
<br>
It looks like LVM2 meta consistency problem? please help to take a look.<br=
></blockquote><div><br></div><div>If you want to attach logical volumes to =
VMs, you must make sure that these</div><div>volumes are not accessible to =
LVM on the host. A good way to achieve this is</div><div>to setup devices:f=
ilter in lvm.conf so LVM can access only the disks required</div><div>by th=
e host (e.g. /dev/sda2).</div><div><br></div><div>Check this for more info =
on this problem:</div><div><a href=3D"https://ovirt.org/blog/2017/12/lvm-co=
nfiguration-the-easy-way/">https://ovirt.org/blog/2017/12/lvm-configuration=
-the-easy-way/</a><br></div><div><br></div><div>Nir</div></div></div></div>

--00000000000005cce805785ed6a4--
