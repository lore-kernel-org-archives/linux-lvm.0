Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 206F81004C49
	for <linux-lvm@redhat.com>; Tue, 24 Mar 2020 16:09:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C846185A791
	for <linux-lvm@redhat.com>; Tue, 24 Mar 2020 16:09:31 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id l25so14922708qki.7
	for <linux-lvm@redhat.com>; Tue, 24 Mar 2020 09:09:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAHRMh5Wkp79vCyjczL7JuLqg15Hq2YoQUQjEc1-BgddCY3HEEw@mail.gmail.com>
	<AM6PR03MB4389713EAF839D54B4A6D95CFFF00@AM6PR03MB4389.eurprd03.prod.outlook.com>
In-Reply-To: <AM6PR03MB4389713EAF839D54B4A6D95CFFF00@AM6PR03MB4389.eurprd03.prod.outlook.com>
From: Andrew Falgout <digitalw00t@gmail.com>
Date: Tue, 24 Mar 2020 11:09:15 -0500
Message-ID: <CAHRMh5X9c=5jKP6-ixX8GBeQSBRXcicFiHGLFzx3V8+zc3Z3mg@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000d5fe0605a19bf9d0"
Subject: Re: [linux-lvm] lvm raid5 : drives all present but vg/lvm will not
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--000000000000d5fe0605a19bf9d0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

The disks are seen, the volume groups are seen.  When I try to activate the
VG I get this:

vgchange -ay vg1
  device-mapper: reload ioctl on  (253:19) failed: Input/output error
  0 logical volume(s) in volume group "vg1" now active

I executed 'vgchange -ay vg1 -vvvv -dddd' and this is the only time an
error was thrown.
20:53:16.552602 vgchange[10795] device_mapper/libdm-deptree.c:2921  Adding
target to (253:19): 0 31256068096 raid raid5_ls 3 128 region_size 32768 3
253:13 253:14 253:15 253:16 253:17 253:18
20:53:16.552609 vgchange[10795] device_mapper/ioctl/libdm-iface.c:1853  dm
table   (253:19) [ opencount flush ]   [16384] (*1)
20:53:16.552619 vgchange[10795] device_mapper/ioctl/libdm-iface.c:1853  dm
reload   (253:19) [ noopencount flush ]   [16384] (*1)
20:53:16.572481 vgchange[10795] device_mapper/ioctl/libdm-iface.c:1903
 device-mapper: reload ioctl on  (253:19) failed: Input/output error

I've uploaded two very verbose and debug ridden.
https://pastebin.com/bw5eQBa8
https://pastebin.com/qV5yft05

Ignore the naming.  It's not a gluster.  I was planning on making two and
mirroring them in a gluster.

./drae


On Mon, Mar 23, 2020 at 5:14 AM Bernd Eckenfels <ecki@zusammenkunft.net>
wrote:

> Do you see any dmesg kernel errors when you try to activate the LVs?
>
> Gruss
> Bernd
>
>
> --
> http://bernd.eckenfels.net
> ------------------------------
> *Von:* linux-lvm-bounces@redhat.com <linux-lvm-bounces@redhat.com> im
> Auftrag von Andrew Falgout <digitalw00t@gmail.com>
> *Gesendet:* Saturday, March 21, 2020 4:22:04 AM
> *An:* linux-lvm@redhat.com <linux-lvm@redhat.com>
> *Betreff:* [linux-lvm] lvm raid5 : drives all present but vg/lvm will not
> assemble
>
>
> This started on a Raspberry PI 4 running raspbian.  I moved the disks to
> my Fedora 31 system, that is running the latest updates and kernel.  When=
 I
> had the same issues there I knew it wasn't raspbian.
>
> I've reached the end of my rope on this. The disks are there, all three
> are accounted for, and the LVM data on them can be seen.  But it refuses =
to
> activate stating I/O errors.
>
> [root@hypervisor01 ~]# pvs
>   PV         VG                Fmt  Attr PSize    PFree
>   /dev/sda1  local_storage01   lvm2 a--  <931.51g       0
>   /dev/sdb1  local_storage01   lvm2 a--  <931.51g       0
>   /dev/sdc1  local_storage01   lvm2 a--  <931.51g       0
>   /dev/sdd1  local_storage01   lvm2 a--  <931.51g       0
>   /dev/sde1  local_storage01   lvm2 a--  <931.51g       0
>   /dev/sdf1  local_storage01   lvm2 a--  <931.51g <931.51g
>   /dev/sdg1  local_storage01   lvm2 a--  <931.51g <931.51g
>   /dev/sdh1  local_storage01   lvm2 a--  <931.51g <931.51g
>   /dev/sdi3  fedora_hypervisor lvm2 a--    27.33g   <9.44g
>   /dev/sdk1  vg1               lvm2 a--    <7.28t       0
>   /dev/sdl1  vg1               lvm2 a--    <7.28t       0
>   /dev/sdm1  vg1               lvm2 a--    <7.28t       0
> [root@hypervisor01 ~]# vgs
>   VG                #PV #LV #SN Attr   VSize  VFree
>   fedora_hypervisor   1   2   0 wz--n- 27.33g <9.44g
>   local_storage01     8   1   0 wz--n- <7.28t <2.73t
>   vg1                 3   1   0 wz--n- 21.83t     0
> [root@hypervisor01 ~]# lvs
>   LV        VG                Attr       LSize  Pool Origin Data%  Meta%
>  Move Log Cpy%Sync Convert
>   root      fedora_hypervisor -wi-ao---- 15.00g
>
>   swap      fedora_hypervisor -wi-ao----  2.89g
>
>   libvirt   local_storage01   rwi-aor--- <2.73t
>          100.00
>   gluster02 vg1               Rwi---r--- 14.55t
>
>
> The one in question is the vg1/gluster02 lvm group.
>
> I try to activate the VG:
> [root@hypervisor01 ~]# vgchange -ay vg1
>   device-mapper: reload ioctl on  (253:19) failed: Input/output error
>   0 logical volume(s) in volume group "vg1" now active
>
> I've got the debugging output from :
> vgchange -ay vg1 -vvvv -dddd
> lvchange -ay --partial vg1/gluster02 -vvvv -dddd
>
> Just not sure where I should dump the data for people to look at.  Is
> there a way to tell the md system to ignore the metadata since there wasn=
't
> an actual disk failure, and rebuild the metadata off what is in the lvm?
> Or can I even get the LV to mount, so I can pull the data off.
>
> Any help is appreciated.  If I can save the data great.  I'm tossing this
> to the community to see if anyone else has an idea of what I can do.
> ./digitalw00t
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--000000000000d5fe0605a19bf9d0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The disks are seen, the volume groups are seen.=C2=A0 When=
 I try to activate the VG I get this:<div><br>vgchange -ay vg1<br>=C2=A0 de=
vice-mapper: reload ioctl on =C2=A0(253:19) failed: Input/output error<br>=
=C2=A0 0 logical volume(s) in volume group &quot;vg1&quot; now active<div><=
br></div><div>I executed &#39;vgchange -ay vg1 -vvvv -dddd&#39; and this is=
 the only time an error was thrown.<br>20:53:16.552602 vgchange[10795] devi=
ce_mapper/libdm-deptree.c:2921 =C2=A0Adding target to (253:19): 0 312560680=
96 raid raid5_ls 3 128 region_size 32768 3 253:13 253:14 253:15 253:16 253:=
17 253:18<br>20:53:16.552609 vgchange[10795] device_mapper/ioctl/libdm-ifac=
e.c:1853 =C2=A0dm table =C2=A0 (253:19) [ opencount flush ] =C2=A0 [16384] =
(*1)<br>20:53:16.552619 vgchange[10795] device_mapper/ioctl/libdm-iface.c:1=
853 =C2=A0dm reload =C2=A0 (253:19) [ noopencount flush ] =C2=A0 [16384] (*=
1)<br>20:53:16.572481 vgchange[10795] device_mapper/ioctl/libdm-iface.c:190=
3 =C2=A0device-mapper: reload ioctl on =C2=A0(253:19) failed: Input/output =
error<br></div><div><br></div><div>I&#39;ve uploaded two very verbose and d=
ebug ridden.</div><div><a href=3D"https://pastebin.com/bw5eQBa8">https://pa=
stebin.com/bw5eQBa8</a>=C2=A0</div><div><a href=3D"https://pastebin.com/qV5=
yft05">https://pastebin.com/qV5yft05</a></div><div><br></div><div>Ignore th=
e naming.=C2=A0 It&#39;s not a gluster.=C2=A0 I was planning on making two =
and mirroring them in a gluster.=C2=A0<br></div><div><br></div><div><div><d=
iv dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"=
>./drae</div></div><br></div></div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 23, 2020 at 5:14 AM Bernd Ec=
kenfels &lt;<a href=3D"mailto:ecki@zusammenkunft.net">ecki@zusammenkunft.ne=
t</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>



<div>
<div dir=3D"ltr">
<div dir=3D"ltr" style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)">

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
<div>
<div><br>
</div>
<div style=3D"direction:ltr">-- </div>
<div style=3D"direction:ltr"><a href=3D"http://bernd.eckenfels.net" target=
=3D"_blank">http://bernd.eckenfels.net</a></div>
</div>
</div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"gmail-m_-2745019350604347315divRplyFwdMsg" dir=3D"ltr"><font fac=
e=3D"Calibri, sans-serif" color=3D"#000000" style=3D"font-size:11pt"><b>Von=
:</b> <a href=3D"mailto:linux-lvm-bounces@redhat.com" target=3D"_blank">lin=
ux-lvm-bounces@redhat.com</a> &lt;<a href=3D"mailto:linux-lvm-bounces@redha=
t.com" target=3D"_blank">linux-lvm-bounces@redhat.com</a>&gt; im Auftrag vo=
n Andrew Falgout &lt;<a href=3D"mailto:digitalw00t@gmail.com" target=3D"_bl=
ank">digitalw00t@gmail.com</a>&gt;<br>
<b>Gesendet:</b> Saturday, March 21, 2020 4:22:04 AM<br>
<b>An:</b> <a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-=
lvm@redhat.com</a> &lt;<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_b=
lank">linux-lvm@redhat.com</a>&gt;<br>
<b>Betreff:</b> [linux-lvm] lvm raid5 : drives all present but vg/lvm will =
not assemble</font>
<div>=C2=A0</div>
</div>
<div>
<div dir=3D"ltr">
<div><br>
</div>
<div>This started on a Raspberry PI 4 running raspbian.=C2=A0 I moved the d=
isks to my Fedora 31 system, that is running the latest updates and kernel.=
=C2=A0 When I had the same issues there I knew it wasn&#39;t raspbian.</div=
>
<div><br>
</div>
<div>I&#39;ve reached the end of my rope on this. The disks are there, all =
three are accounted for, and the LVM data on them can be seen.=C2=A0 But it=
 refuses to activate stating I/O errors.</div>
<div><br>
</div>
<div>[root@hypervisor01 ~]# pvs<br>
=C2=A0 PV =C2=A0 =C2=A0 =C2=A0 =C2=A0 VG =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0Fmt =C2=A0Attr PSize =C2=A0 =C2=A0PFree =C2=A0 <br>
=C2=A0 /dev/sda1 =C2=A0local_storage01 =C2=A0 lvm2 a-- =C2=A0&lt;931.51g =
=C2=A0 =C2=A0 =C2=A0 0 <br>
=C2=A0 /dev/sdb1 =C2=A0local_storage01 =C2=A0 lvm2 a-- =C2=A0&lt;931.51g =
=C2=A0 =C2=A0 =C2=A0 0 <br>
=C2=A0 /dev/sdc1 =C2=A0local_storage01 =C2=A0 lvm2 a-- =C2=A0&lt;931.51g =
=C2=A0 =C2=A0 =C2=A0 0 <br>
=C2=A0 /dev/sdd1 =C2=A0local_storage01 =C2=A0 lvm2 a-- =C2=A0&lt;931.51g =
=C2=A0 =C2=A0 =C2=A0 0 <br>
=C2=A0 /dev/sde1 =C2=A0local_storage01 =C2=A0 lvm2 a-- =C2=A0&lt;931.51g =
=C2=A0 =C2=A0 =C2=A0 0 <br>
=C2=A0 /dev/sdf1 =C2=A0local_storage01 =C2=A0 lvm2 a-- =C2=A0&lt;931.51g &l=
t;931.51g<br>
=C2=A0 /dev/sdg1 =C2=A0local_storage01 =C2=A0 lvm2 a-- =C2=A0&lt;931.51g &l=
t;931.51g<br>
=C2=A0 /dev/sdh1 =C2=A0local_storage01 =C2=A0 lvm2 a-- =C2=A0&lt;931.51g &l=
t;931.51g<br>
=C2=A0 /dev/sdi3 =C2=A0fedora_hypervisor lvm2 a-- =C2=A0 =C2=A027.33g =C2=
=A0 &lt;9.44g<br>
=C2=A0 /dev/sdk1 =C2=A0vg1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 lvm2 a-- =C2=A0 =C2=A0&lt;7.28t =C2=A0 =C2=A0 =C2=A0 0 <br>
=C2=A0 /dev/sdl1 =C2=A0vg1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 lvm2 a-- =C2=A0 =C2=A0&lt;7.28t =C2=A0 =C2=A0 =C2=A0 0 <br>
=C2=A0 /dev/sdm1 =C2=A0vg1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 lvm2 a-- =C2=A0 =C2=A0&lt;7.28t =C2=A0 =C2=A0 =C2=A0 0 <br>
[root@hypervisor01 ~]# vgs<br>
=C2=A0 VG =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#PV #LV #S=
N Attr =C2=A0 VSize =C2=A0VFree <br>
=C2=A0 fedora_hypervisor =C2=A0 1 =C2=A0 2 =C2=A0 0 wz--n- 27.33g &lt;9.44g=
<br>
=C2=A0 local_storage01 =C2=A0 =C2=A0 8 =C2=A0 1 =C2=A0 0 wz--n- &lt;7.28t &=
lt;2.73t<br>
=C2=A0 vg1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3 =C2=A0=
 1 =C2=A0 0 wz--n- 21.83t =C2=A0 =C2=A0 0 <br>
[root@hypervisor01 ~]# lvs<br>
=C2=A0 LV =C2=A0 =C2=A0 =C2=A0 =C2=A0VG =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0Attr =C2=A0 =C2=A0 =C2=A0 LSize =C2=A0Pool Origin Data%=
 =C2=A0Meta% =C2=A0Move Log Cpy%Sync Convert<br>
=C2=A0 root =C2=A0 =C2=A0 =C2=A0fedora_hypervisor -wi-ao---- 15.00g =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
=C2=A0 swap =C2=A0 =C2=A0 =C2=A0fedora_hypervisor -wi-ao---- =C2=A02.89g =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
=C2=A0 libvirt =C2=A0 local_storage01 =C2=A0 rwi-aor--- &lt;2.73t =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0100.00 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0<br>
=C2=A0 gluster02 vg1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Rwi--=
-r--- 14.55t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0<br>
</div>
<div><br>
</div>
<div>The one in question is the vg1/gluster02 lvm group.=C2=A0=C2=A0</div>
<div><br>
</div>
<div>I try to activate the VG:<br>
[root@hypervisor01 ~]# vgchange -ay vg1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<=
br>
=C2=A0 device-mapper: reload ioctl on =C2=A0(253:19) failed: Input/output e=
rror<br>
=C2=A0 0 logical volume(s) in volume group &quot;vg1&quot; now active<br>
</div>
<div><br>
</div>
<div>I&#39;ve got the debugging output from :<br>
vgchange -ay vg1 -vvvv -dddd<br>
lvchange -ay --partial vg1/gluster02 -vvvv -dddd<br>
<br>
Just not sure where I should dump the data for people to look at.=C2=A0 Is =
there a way to tell the md system to ignore the metadata since there wasn&#=
39;t an actual disk failure, and rebuild the metadata off what is in the lv=
m?=C2=A0 Or can I even get the LV to mount, so
 I can pull the data off.</div>
<div><br>
</div>
Any help is appreciated.=C2=A0 If I can save the data great.=C2=A0 I&#39;m =
tossing this to the community to see if anyone else has an idea of what I c=
an do.<br clear=3D"all">
<div>
<div dir=3D"ltr">./digitalw00t</div>
</div>
</div>
</div>
</div>
</div>

_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" rel=3D"norefe=
rrer" target=3D"_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</=
a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"=
noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a></blockqu=
ote></div>

--000000000000d5fe0605a19bf9d0--
