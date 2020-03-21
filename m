Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DB31D95F3
	for <linux-lvm@redhat.com>; Sat, 21 Mar 2020 03:22:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 841D4101A55A
	for <linux-lvm@redhat.com>; Sat, 21 Mar 2020 03:22:19 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id z8so6917346qto.12
	for <linux-lvm@redhat.com>; Fri, 20 Mar 2020 20:22:16 -0700 (PDT)
MIME-Version: 1.0
From: Andrew Falgout <digitalw00t@gmail.com>
Date: Fri, 20 Mar 2020 22:22:04 -0500
Message-ID: <CAHRMh5Wkp79vCyjczL7JuLqg15Hq2YoQUQjEc1-BgddCY3HEEw@mail.gmail.com>
Content-Type: multipart/alternative; boundary="0000000000009b919105a154e854"
Subject: [linux-lvm] lvm raid5 : drives all present but vg/lvm will not
	assemble
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

--0000000000009b919105a154e854
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This started on a Raspberry PI 4 running raspbian.  I moved the disks to my
Fedora 31 system, that is running the latest updates and kernel.  When I
had the same issues there I knew it wasn't raspbian.

I've reached the end of my rope on this. The disks are there, all three are
accounted for, and the LVM data on them can be seen.  But it refuses to
activate stating I/O errors.

[root@hypervisor01 ~]# pvs
  PV         VG                Fmt  Attr PSize    PFree
  /dev/sda1  local_storage01   lvm2 a--  <931.51g       0
  /dev/sdb1  local_storage01   lvm2 a--  <931.51g       0
  /dev/sdc1  local_storage01   lvm2 a--  <931.51g       0
  /dev/sdd1  local_storage01   lvm2 a--  <931.51g       0
  /dev/sde1  local_storage01   lvm2 a--  <931.51g       0
  /dev/sdf1  local_storage01   lvm2 a--  <931.51g <931.51g
  /dev/sdg1  local_storage01   lvm2 a--  <931.51g <931.51g
  /dev/sdh1  local_storage01   lvm2 a--  <931.51g <931.51g
  /dev/sdi3  fedora_hypervisor lvm2 a--    27.33g   <9.44g
  /dev/sdk1  vg1               lvm2 a--    <7.28t       0
  /dev/sdl1  vg1               lvm2 a--    <7.28t       0
  /dev/sdm1  vg1               lvm2 a--    <7.28t       0
[root@hypervisor01 ~]# vgs
  VG                #PV #LV #SN Attr   VSize  VFree
  fedora_hypervisor   1   2   0 wz--n- 27.33g <9.44g
  local_storage01     8   1   0 wz--n- <7.28t <2.73t
  vg1                 3   1   0 wz--n- 21.83t     0
[root@hypervisor01 ~]# lvs
  LV        VG                Attr       LSize  Pool Origin Data%  Meta%
 Move Log Cpy%Sync Convert
  root      fedora_hypervisor -wi-ao---- 15.00g

  swap      fedora_hypervisor -wi-ao----  2.89g

  libvirt   local_storage01   rwi-aor--- <2.73t
       100.00
  gluster02 vg1               Rwi---r--- 14.55t


The one in question is the vg1/gluster02 lvm group.

I try to activate the VG:
[root@hypervisor01 ~]# vgchange -ay vg1
  device-mapper: reload ioctl on  (253:19) failed: Input/output error
  0 logical volume(s) in volume group "vg1" now active

I've got the debugging output from :
vgchange -ay vg1 -vvvv -dddd
lvchange -ay --partial vg1/gluster02 -vvvv -dddd

Just not sure where I should dump the data for people to look at.  Is there
a way to tell the md system to ignore the metadata since there wasn't an
actual disk failure, and rebuild the metadata off what is in the lvm?  Or
can I even get the LV to mount, so I can pull the data off.

Any help is appreciated.  If I can save the data great.  I'm tossing this
to the community to see if anyone else has an idea of what I can do.
./digitalw00t

--0000000000009b919105a154e854
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div>This started on a Raspberry PI 4 runni=
ng raspbian.=C2=A0 I moved the disks to my Fedora 31 system, that is runnin=
g the latest updates and kernel.=C2=A0 When I had the same issues there I k=
new it wasn&#39;t raspbian.</div><div><br></div><div>I&#39;ve reached the e=
nd of my rope on this. The disks are there, all three are accounted for, an=
d the LVM data on them can be seen.=C2=A0 But it refuses to activate statin=
g I/O errors.</div><div><br></div><div>[root@hypervisor01 ~]# pvs<br>=C2=A0=
 PV =C2=A0 =C2=A0 =C2=A0 =C2=A0 VG =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0Fmt =C2=A0Attr PSize =C2=A0 =C2=A0PFree =C2=A0 <br>=C2=A0 =
/dev/sda1 =C2=A0local_storage01 =C2=A0 lvm2 a-- =C2=A0&lt;931.51g =C2=A0 =
=C2=A0 =C2=A0 0 <br>=C2=A0 /dev/sdb1 =C2=A0local_storage01 =C2=A0 lvm2 a-- =
=C2=A0&lt;931.51g =C2=A0 =C2=A0 =C2=A0 0 <br>=C2=A0 /dev/sdc1 =C2=A0local_s=
torage01 =C2=A0 lvm2 a-- =C2=A0&lt;931.51g =C2=A0 =C2=A0 =C2=A0 0 <br>=C2=
=A0 /dev/sdd1 =C2=A0local_storage01 =C2=A0 lvm2 a-- =C2=A0&lt;931.51g =C2=
=A0 =C2=A0 =C2=A0 0 <br>=C2=A0 /dev/sde1 =C2=A0local_storage01 =C2=A0 lvm2 =
a-- =C2=A0&lt;931.51g =C2=A0 =C2=A0 =C2=A0 0 <br>=C2=A0 /dev/sdf1 =C2=A0loc=
al_storage01 =C2=A0 lvm2 a-- =C2=A0&lt;931.51g &lt;931.51g<br>=C2=A0 /dev/s=
dg1 =C2=A0local_storage01 =C2=A0 lvm2 a-- =C2=A0&lt;931.51g &lt;931.51g<br>=
=C2=A0 /dev/sdh1 =C2=A0local_storage01 =C2=A0 lvm2 a-- =C2=A0&lt;931.51g &l=
t;931.51g<br>=C2=A0 /dev/sdi3 =C2=A0fedora_hypervisor lvm2 a-- =C2=A0 =C2=
=A027.33g =C2=A0 &lt;9.44g<br>=C2=A0 /dev/sdk1 =C2=A0vg1 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lvm2 a-- =C2=A0 =C2=A0&lt;7.28t =C2=A0 =C2=
=A0 =C2=A0 0 <br>=C2=A0 /dev/sdl1 =C2=A0vg1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 lvm2 a-- =C2=A0 =C2=A0&lt;7.28t =C2=A0 =C2=A0 =C2=A0 0 <b=
r>=C2=A0 /dev/sdm1 =C2=A0vg1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 lvm2 a-- =C2=A0 =C2=A0&lt;7.28t =C2=A0 =C2=A0 =C2=A0 0 <br>[root@hyperv=
isor01 ~]# vgs<br>=C2=A0 VG =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0#PV #LV #SN Attr =C2=A0 VSize =C2=A0VFree <br>=C2=A0 fedora_hyper=
visor =C2=A0 1 =C2=A0 2 =C2=A0 0 wz--n- 27.33g &lt;9.44g<br>=C2=A0 local_st=
orage01 =C2=A0 =C2=A0 8 =C2=A0 1 =C2=A0 0 wz--n- &lt;7.28t &lt;2.73t<br>=C2=
=A0 vg1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3 =C2=A0 1 =
=C2=A0 0 wz--n- 21.83t =C2=A0 =C2=A0 0 <br>[root@hypervisor01 ~]# lvs<br>=
=C2=A0 LV =C2=A0 =C2=A0 =C2=A0 =C2=A0VG =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0Attr =C2=A0 =C2=A0 =C2=A0 LSize =C2=A0Pool Origin Data%=
 =C2=A0Meta% =C2=A0Move Log Cpy%Sync Convert<br>=C2=A0 root =C2=A0 =C2=A0 =
=C2=A0fedora_hypervisor -wi-ao---- 15.00g =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0<br>=C2=A0 swap =C2=A0 =C2=A0 =C2=A0fedora_hypervisor -wi-ao---- =C2=A02=
.89g =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>=C2=A0 libvirt =C2=A0 local_stora=
ge01 =C2=A0 rwi-aor--- &lt;2.73t =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0100.00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>=C2=A0 gluster02 vg1=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Rwi---r--- 14.55t=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0<br></div><div><br></div><div>The one in q=
uestion is the vg1/gluster02 lvm group.=C2=A0=C2=A0</div><div><br></div><di=
v>I try to activate the VG:<br>[root@hypervisor01 ~]# vgchange -ay vg1 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>=C2=A0 device-mapper: reload ioctl on =
=C2=A0(253:19) failed: Input/output error<br>=C2=A0 0 logical volume(s) in =
volume group &quot;vg1&quot; now active<br></div><div><br></div><div>I&#39;=
ve got the debugging output from :<br>vgchange -ay vg1 -vvvv -dddd<br>lvcha=
nge -ay --partial vg1/gluster02 -vvvv -dddd<br><br>Just not sure where I sh=
ould dump the data for people to look at.=C2=A0 Is there a way to tell the =
md system to ignore the metadata since there wasn&#39;t an actual disk fail=
ure, and rebuild the metadata off what is in the lvm?=C2=A0 Or can I even g=
et the LV to mount, so I can pull the data off.</div><div><br></div>Any hel=
p is appreciated.=C2=A0 If I can save the data great.=C2=A0 I&#39;m tossing=
 this to the community to see if anyone else has an idea of what I can do.<=
br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smart=
mail=3D"gmail_signature">./digitalw00t</div></div></div>

--0000000000009b919105a154e854--
