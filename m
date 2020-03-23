Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B21912455D
	for <linux-lvm@redhat.com>; Mon, 23 Mar 2020 07:46:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 986A4185A78E
	for <linux-lvm@redhat.com>; Mon, 23 Mar 2020 07:46:12 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id j17so12213421wru.13
	for <linux-lvm@redhat.com>; Mon, 23 Mar 2020 00:46:08 -0700 (PDT)
Received: from AM6PR03MB4389.eurprd03.prod.outlook.com
	([2603:1026:c03:280f::5]) by smtp.gmail.com with ESMTPSA id
	k3sm20512931wmf.16.2020.03.23.00.46.06 for <linux-lvm@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Mar 2020 00:46:06 -0700 (PDT)
From: Bernd Eckenfels <ecki@zusammenkunft.net>
Date: Mon, 23 Mar 2020 07:46:05 +0000
Message-ID: <AM6PR03MB4389713EAF839D54B4A6D95CFFF00@AM6PR03MB4389.eurprd03.prod.outlook.com>
References: <CAHRMh5Wkp79vCyjczL7JuLqg15Hq2YoQUQjEc1-BgddCY3HEEw@mail.gmail.com>
In-Reply-To: <CAHRMh5Wkp79vCyjczL7JuLqg15Hq2YoQUQjEc1-BgddCY3HEEw@mail.gmail.com>
Content-Language: de-DE
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="_000_AM6PR03MB4389713EAF839D54B4A6D95CFFF00AM6PR03MB4389eurp_"
Subject: Re: [linux-lvm] lvm raid5 : drives all present but vg/lvm will
	not	assemble
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

--_000_AM6PR03MB4389713EAF839D54B4A6D95CFFF00AM6PR03MB4389eurp_
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Do you see any dmesg kernel errors when you try to activate the LVs?

Gruss
Bernd


--
http://bernd.eckenfels.net
________________________________
Von: linux-lvm-bounces@redhat.com <linux-lvm-bounces@redhat.com> im Auftrag=
 von Andrew Falgout <digitalw00t@gmail.com>
Gesendet: Saturday, March 21, 2020 4:22:04 AM
An: linux-lvm@redhat.com <linux-lvm@redhat.com>
Betreff: [linux-lvm] lvm raid5 : drives all present but vg/lvm will not ass=
emble


This started on a Raspberry PI 4 running raspbian.  I moved the disks to my=
 Fedora 31 system, that is running the latest updates and kernel.  When I h=
ad the same issues there I knew it wasn't raspbian.

I've reached the end of my rope on this. The disks are there, all three are=
 accounted for, and the LVM data on them can be seen.  But it refuses to ac=
tivate stating I/O errors.

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
  LV        VG                Attr       LSize  Pool Origin Data%  Meta%  M=
ove Log Cpy%Sync Convert
  root      fedora_hypervisor -wi-ao---- 15.00g
  swap      fedora_hypervisor -wi-ao----  2.89g
  libvirt   local_storage01   rwi-aor--- <2.73t                            =
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

Just not sure where I should dump the data for people to look at.  Is there=
 a way to tell the md system to ignore the metadata since there wasn't an a=
ctual disk failure, and rebuild the metadata off what is in the lvm?  Or ca=
n I even get the LV to mount, so I can pull the data off.

Any help is appreciated.  If I can save the data great.  I'm tossing this t=
o the community to see if anyone else has an idea of what I can do.
./digitalw00t

--_000_AM6PR03MB4389713EAF839D54B4A6D95CFFF00AM6PR03MB4389eurp_
Content-Type: text/html; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div dir=3D"ltr">
<div dir=3D"ltr" style=3D"color: rgb(0, 0, 0); background-color: rgb(255, 2=
55, 255);">
<meta content=3D"text/html; charset=3Dus-ascii">
</div>
<div>
<div>
<div style=3D"direction:ltr">Do you see any dmesg kernel errors when you tr=
y to activate the LVs?</div>
</div>
<div style=3D"direction:ltr" dir=3D"ltr"><br>
</div>
<div style=3D"direction:ltr" dir=3D"ltr">Gruss</div>
<div style=3D"direction:ltr" dir=3D"ltr">Bernd</div>
<div><br>
</div>
<div class=3D"ms-outlook-ios-signature">
<div><br>
</div>
<div style=3D"direction:ltr">-- </div>
<div style=3D"direction:ltr">http://bernd.eckenfels.net</div>
</div>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>Von:</b> linux-lvm-bounces@redh=
at.com &lt;linux-lvm-bounces@redhat.com&gt; im Auftrag von Andrew Falgout &=
lt;digitalw00t@gmail.com&gt;<br>
<b>Gesendet:</b> Saturday, March 21, 2020 4:22:04 AM<br>
<b>An:</b> linux-lvm@redhat.com &lt;linux-lvm@redhat.com&gt;<br>
<b>Betreff:</b> [linux-lvm] lvm raid5 : drives all present but vg/lvm will =
not assemble</font>
<div>&nbsp;</div>
</div>
<div>
<div dir=3D"ltr">
<div><br>
</div>
<div>This started on a Raspberry PI 4 running raspbian.&nbsp; I moved the d=
isks to my Fedora 31 system, that is running the latest updates and kernel.=
&nbsp; When I had the same issues there I knew it wasn't raspbian.</div>
<div><br>
</div>
<div>I've reached the end of my rope on this. The disks are there, all thre=
e are accounted for, and the LVM data on them can be seen.&nbsp; But it ref=
uses to activate stating I/O errors.</div>
<div><br>
</div>
<div>[root@hypervisor01 ~]# pvs<br>
&nbsp; PV &nbsp; &nbsp; &nbsp; &nbsp; VG &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;Fmt &nbsp;Attr PSize &nbsp; &nbsp;PFree &nbsp; <br>
&nbsp; /dev/sda1 &nbsp;local_storage01 &nbsp; lvm2 a-- &nbsp;&lt;931.51g &n=
bsp; &nbsp; &nbsp; 0 <br>
&nbsp; /dev/sdb1 &nbsp;local_storage01 &nbsp; lvm2 a-- &nbsp;&lt;931.51g &n=
bsp; &nbsp; &nbsp; 0 <br>
&nbsp; /dev/sdc1 &nbsp;local_storage01 &nbsp; lvm2 a-- &nbsp;&lt;931.51g &n=
bsp; &nbsp; &nbsp; 0 <br>
&nbsp; /dev/sdd1 &nbsp;local_storage01 &nbsp; lvm2 a-- &nbsp;&lt;931.51g &n=
bsp; &nbsp; &nbsp; 0 <br>
&nbsp; /dev/sde1 &nbsp;local_storage01 &nbsp; lvm2 a-- &nbsp;&lt;931.51g &n=
bsp; &nbsp; &nbsp; 0 <br>
&nbsp; /dev/sdf1 &nbsp;local_storage01 &nbsp; lvm2 a-- &nbsp;&lt;931.51g &l=
t;931.51g<br>
&nbsp; /dev/sdg1 &nbsp;local_storage01 &nbsp; lvm2 a-- &nbsp;&lt;931.51g &l=
t;931.51g<br>
&nbsp; /dev/sdh1 &nbsp;local_storage01 &nbsp; lvm2 a-- &nbsp;&lt;931.51g &l=
t;931.51g<br>
&nbsp; /dev/sdi3 &nbsp;fedora_hypervisor lvm2 a-- &nbsp; &nbsp;27.33g &nbsp=
; &lt;9.44g<br>
&nbsp; /dev/sdk1 &nbsp;vg1 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 lvm2 a-- &nbsp; &nbsp;&lt;7.28t &nbsp; &nbsp; &nbsp; 0 <br>
&nbsp; /dev/sdl1 &nbsp;vg1 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 lvm2 a-- &nbsp; &nbsp;&lt;7.28t &nbsp; &nbsp; &nbsp; 0 <br>
&nbsp; /dev/sdm1 &nbsp;vg1 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 lvm2 a-- &nbsp; &nbsp;&lt;7.28t &nbsp; &nbsp; &nbsp; 0 <br>
[root@hypervisor01 ~]# vgs<br>
&nbsp; VG &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;#PV #LV #S=
N Attr &nbsp; VSize &nbsp;VFree <br>
&nbsp; fedora_hypervisor &nbsp; 1 &nbsp; 2 &nbsp; 0 wz--n- 27.33g &lt;9.44g=
<br>
&nbsp; local_storage01 &nbsp; &nbsp; 8 &nbsp; 1 &nbsp; 0 wz--n- &lt;7.28t &=
lt;2.73t<br>
&nbsp; vg1 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 3 &nbsp;=
 1 &nbsp; 0 wz--n- 21.83t &nbsp; &nbsp; 0 <br>
[root@hypervisor01 ~]# lvs<br>
&nbsp; LV &nbsp; &nbsp; &nbsp; &nbsp;VG &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;Attr &nbsp; &nbsp; &nbsp; LSize &nbsp;Pool Origin Data%=
 &nbsp;Meta% &nbsp;Move Log Cpy%Sync Convert<br>
&nbsp; root &nbsp; &nbsp; &nbsp;fedora_hypervisor -wi-ao---- 15.00g &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;<br>
&nbsp; swap &nbsp; &nbsp; &nbsp;fedora_hypervisor -wi-ao---- &nbsp;2.89g &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;<br>
&nbsp; libvirt &nbsp; local_storage01 &nbsp; rwi-aor--- &lt;2.73t &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;100.00 &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;<br>
&nbsp; gluster02 vg1 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Rwi--=
-r--- 14.55t&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br>
</div>
<div><br>
</div>
<div>The one in question is the vg1/gluster02 lvm group.&nbsp;&nbsp;</div>
<div><br>
</div>
<div>I try to activate the VG:<br>
[root@hypervisor01 ~]# vgchange -ay vg1 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<=
br>
&nbsp; device-mapper: reload ioctl on &nbsp;(253:19) failed: Input/output e=
rror<br>
&nbsp; 0 logical volume(s) in volume group &quot;vg1&quot; now active<br>
</div>
<div><br>
</div>
<div>I've got the debugging output from :<br>
vgchange -ay vg1 -vvvv -dddd<br>
lvchange -ay --partial vg1/gluster02 -vvvv -dddd<br>
<br>
Just not sure where I should dump the data for people to look at.&nbsp; Is =
there a way to tell the md system to ignore the metadata since there wasn't=
 an actual disk failure, and rebuild the metadata off what is in the lvm?&n=
bsp; Or can I even get the LV to mount, so
 I can pull the data off.</div>
<div><br>
</div>
Any help is appreciated.&nbsp; If I can save the data great.&nbsp; I'm toss=
ing this to the community to see if anyone else has an idea of what I can d=
o.<br clear=3D"all">
<div>
<div dir=3D"ltr" class=3D"x_gmail_signature">./digitalw00t</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_AM6PR03MB4389713EAF839D54B4A6D95CFFF00AM6PR03MB4389eurp_--
