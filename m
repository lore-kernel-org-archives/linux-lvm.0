Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r62G8QF5010948
	for <linux-lvm@redhat.com>; Tue, 2 Jul 2013 12:08:26 -0400
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r62G8NGV013595
	for <linux-lvm@redhat.com>; Tue, 2 Jul 2013 12:08:24 -0400
Received: by mail-lb0-f182.google.com with SMTP id r11so3572960lbv.27
	for <linux-lvm@redhat.com>; Tue, 02 Jul 2013 09:08:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAFrGbuW1NDnsZfm7S5f=wsTbZ4rcb6huPX7MMv_AiZF95xDYSQ@mail.gmail.com>
References: <CAFrGbuW1NDnsZfm7S5f=wsTbZ4rcb6huPX7MMv_AiZF95xDYSQ@mail.gmail.com>
Date: Tue, 2 Jul 2013 18:08:22 +0200
Message-ID: <CAFrGbuXHzzYwgB88bhOyjFUL7dokFbSsHWdJ1P8Pc88Wp2EdoQ@mail.gmail.com>
From: Alessandro MACUZ <alessandro.macuz@gmail.com>
Content-Type: multipart/alternative; boundary=001a11c34da0e5e32204e0898de8
Subject: Re: [linux-lvm] I can't have the mirror_log mirrored,
 LVM complains "there is no suitable space"
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

--001a11c34da0e5e32204e0898de8
Content-Type: text/plain; charset=ISO-8859-1

2013/7/2 Alessandro MACUZ <alessandro.macuz@gmail.com>

> The process here below is self-explanatory of what happens.
>
>
> Starting with one volume (on /dev/sda1) I'd like to mirror it on /dev/sdb1
> and having the mirror_log mirrored as well.
>
>
> Though I think there is plenty of PE I get the error message
>
>
>   Insufficient suitable allocatable extents for logical volume : 1536 more
> required
>
>   Unable to allocate extents for mirror(s).
>
>
> I mean the mirror_log is one PE, i.e. 4 Megabytes...
>
>
> Why "*lvconvert -i 5 -m1 --mirrorlog mirrored /dev/lvgrptstnlvm/root
> /dev/sdb1*" doesn't work whereas
>
> "*lvconvert -m1 /dev/lvgrptstnlvm/root /dev/sdb1*" does? The space to be
> allocated differs by just one PE.
>
>
> I'm using Knoppix to fix a system due to other problems, I have noticed
> there was a (human) design problem with LVM and I want to achieve the goal
> of one volume mirrored in 2 parts and 2 mirrors logs each on one disk.
>
>
> Thanks,
>
>
> Alex
>
>
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
>
> *root@Microknoppix:/home/knoppix# lvs -a -o +devices,lv_size*
>
>   LV              VG           Attr     LSize Pool Origin Data%  Move
> Log       Copy%  Convert Devices                           LSize
>
>   root            lvgrptstnlvm mwi-aom- 6.00g
> root_mlog 100.00         root_mimage_0(0),root_mimage_1(0) 6.00g
>
>   [root_mimage_0] lvgrptstnlvm iwi-aom-
> 6.00g
> /dev/sda1(0)                      6.00g
>
>   [root_mimage_1] lvgrptstnlvm iwi-aom-
> 6.00g
> /dev/sdb1(0)                      6.00g
>
>   [root_mlog]     lvgrptstnlvm lwi-aom-
> 4.00m
> /dev/sdb1(1536)                   4.00m
>
> *
> *
>
> *root@Microknoppix:/home/knoppix# pvs -v -o +pv_pe_count,pv_pe_alloc_count
> *
>
>     Scanning for physical volume names
>
>   PV         VG           Fmt  Attr PSize PFree DevSize PV
> UUID                                PE   Alloc
>
>   /dev/sda1  lvgrptstnlvm lvm2 a--  9.00g 3.00g   9.00g
> 5h4peZ-7SVd-MKrH-IQNJ-UACQ-mM7Q-6CVeo5 2303  1536
>
>   /dev/sdb1  lvgrptstnlvm lvm2 a--  7.07g 1.06g   9.00g
> VlGEw0-JaqC-THbz-G4mv-yHq5-9Y80-N5ANNQ 1809  1537
>
> *
> *
>
> *root@Microknoppix:/home/knoppix# lvs -a -o +devices,lv_size*
>
>   LV              VG           Attr     LSize Pool Origin Data%  Move
> Log       Copy%  Convert Devices                           LSize
>
>   root            lvgrptstnlvm mwi-aom- 6.00g
> root_mlog 100.00         root_mimage_0(0),root_mimage_1(0) 6.00g
>
>   [root_mimage_0] lvgrptstnlvm iwi-aom-
> 6.00g
> /dev/sda1(0)                      6.00g
>
>   [root_mimage_1] lvgrptstnlvm iwi-aom-
> 6.00g
> /dev/sdb1(0)                      6.00g
>
>   [root_mlog]     lvgrptstnlvm lwi-aom-
> 4.00m
> /dev/sdb1(1536)                   4.00m
>
> *
> *
>
> *root@Microknoppix:/home/knoppix# lvconvert -m0 /dev/lvgrptstnlvm/root
> /dev/sdb1*
>
>   /sbin/dmeventd: stat failed: No such file or directory
>
>   Logical volume root converted.
>
> *
> *
>
> *root@Microknoppix:/home/knoppix# lvconvert -i 5 -m1 --mirrorlog mirrored
> /dev/lvgrptstnlvm/root /dev/sdb1*
>
>   Insufficient suitable allocatable extents for logical volume : 1536 more
> required
>
>   Unable to allocate extents for mirror(s).
>
> *
> *
>
> *root@Microknoppix:/home/knoppix# lvconvert -m1 /dev/lvgrptstnlvm/root
> /dev/sdb1*
>
>   lvgrptstnlvm/root: Converted: 0.5%
>
> [...SKIP...]
>   lvgrptstnlvm/root: Converted: 100.0%
>
> *
> *
>
> *root@Microknoppix:/home/knoppix# lvs -a -o +devices,lv_size*
>
>   LV              VG           Attr     LSize Pool Origin Data%  Move
> Log       Copy%  Convert Devices                           LSize
>
>   root            lvgrptstnlvm mwi-aom- 6.00g
> root_mlog 100.00         root_mimage_0(0),root_mimage_1(0) 6.00g
>
>   [root_mimage_0] lvgrptstnlvm iwi-aom-
> 6.00g
> /dev/sda1(0)                      6.00g
>
>   [root_mimage_1] lvgrptstnlvm iwi-aom-
> 6.00g
> /dev/sdb1(0)                      6.00g
>
>   [root_mlog]     lvgrptstnlvm lwi-aom-
> 4.00m
> /dev/sdb1(1536)                   4.00m
>
> *
> *
>
> *root@Microknoppix:/home/knoppix# pvs -v -o +pv_pe_count,pv_pe_alloc_count
> *
>
>     Scanning for physical volume names
>
>   PV         VG           Fmt  Attr PSize PFree DevSize PV
> UUID                                PE   Alloc
>
>   /dev/sda1  lvgrptstnlvm lvm2 a--  9.00g 3.00g   9.00g
> 5h4peZ-7SVd-MKrH-IQNJ-UACQ-mM7Q-6CVeo5 2303  1536
>
>   /dev/sdb1  lvgrptstnlvm lvm2 a--  7.07g 1.06g   9.00g
> VlGEw0-JaqC-THbz-G4mv-yHq5-9Y80-N5ANNQ 1809  1537
>
> *
> *
>
> *root@Microknoppix:/home/knoppix#*
>


Same result if done from a Debian LiveCD. If there are a lot of PEs why LVM
complains it is not suitable, in my case it needs just 1 PE.

I used --alloc anywherebut it noticed the two mirror-logs were on the same
disk, thing that I don't want of course...

--001a11c34da0e5e32204e0898de8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2013/7/2 Alessandro MACUZ <span dir=3D"ltr">&lt;<a href=3D"mailto:alessandr=
o.macuz@gmail.com" target=3D"_blank">alessandro.macuz@gmail.com</a>&gt;</sp=
an><br><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div><p class=3D"MsoNormal"><span lang=3D"EN-GB">The process here below is =
self-explanatory of what happens.</span></p><p class=3D"MsoNormal"><br><spa=
n lang=3D"EN-GB"></span></p><p class=3D"MsoNormal"><span lang=3D"EN-GB">Sta=
rting with one volume (on /dev/sda1) I&#39;d like to mirror it on /dev/sdb1=
 and having the mirror_log mirrored as well.</span></p>

<p class=3D"MsoNormal"><br><span lang=3D"EN-GB"></span></p><p class=3D"MsoN=
ormal"><span lang=3D"EN-GB">Though I think there is plenty of PE I get the =
error message<br></span></p><p class=3D"MsoNormal"><br><span lang=3D"EN-GB"=
></span></p>

<p class=3D"MsoNormal"><span lang=3D"EN-GB">=A0 Insufficient suitable alloc=
atable extents for logical volume : 1536 more required</span></p><p class=
=3D"MsoNormal"><span lang=3D"EN-GB">=A0 Unable to allocate extents for mirr=
or(s).</span></p>

<p class=3D"MsoNormal"><br><span lang=3D"EN-GB"></span></p><p class=3D"MsoN=
ormal"><span lang=3D"EN-GB">I mean the mirror_log is one PE, i.e. 4 Megabyt=
es...<br></span></p><span lang=3D"EN-GB"></span><p class=3D"MsoNormal"><br>=
</p><p class=3D"MsoNormal">

Why &quot;<b><span lang=3D"EN-GB">lvconvert -i 5 -m1 --mirrorlog mirrored /=
dev/lvgrptstnlvm/root /dev/sdb1</span></b>&quot; doesn&#39;t work whereas <=
br></p><p class=3D"MsoNormal">&quot;<b><span lang=3D"EN-GB">lvconvert -m1 /=
dev/lvgrptstnlvm/root /dev/sdb1</span></b>&quot; does? The space to be allo=
cated differs by just one PE.<br>

</p><p class=3D"MsoNormal"><br></p><p class=3D"MsoNormal">I&#39;m using Kno=
ppix to fix a system due to other problems, I have noticed there was a (hum=
an) design problem with LVM and I want to achieve the goal of one volume mi=
rrored in 2 parts and 2 mirrors logs each on one disk.</p>

<p class=3D"MsoNormal"><br></p><p class=3D"MsoNormal">Thanks,</p><p class=
=3D"MsoNormal"><br></p><p class=3D"MsoNormal">Alex<br></p><p class=3D"MsoNo=
rmal"><br><span lang=3D"EN-GB"></span></p><p class=3D"MsoNormal">~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>

<span lang=3D"EN-GB"></span></p><p class=3D"MsoNormal"><span lang=3D"EN-GB"=
><br></span></p><p class=3D"MsoNormal"><b><span lang=3D"EN-GB">root@Microkn=
oppix:/home/knoppix# lvs -a -o +devices,lv_size</span></b></p><p class=3D"M=
soNormal">

<span lang=3D"EN-GB">=A0
 LV=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 VG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 Attr=A0=A0=A0=A0 LSize Pool Origin Data%=A0 Move=20
Log=A0=A0=A0=A0=A0=A0 Copy%=A0 Convert Devices=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 LSize</span></p><p clas=
s=3D"MsoNormal"><span lang=3D"EN-GB">=A0
 root=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 lvgrptstnlvm mwi-aom- 6.00g=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=20
root_mlog 100.00=A0=A0=A0=A0=A0=A0=A0=A0 root_mimage_0(0),root_mimage_1(0) =
6.00g</span></p><p class=3D"MsoNormal"><span lang=3D"EN-GB">=A0
 [root_mimage_0] lvgrptstnlvm iwi-aom-=20
6.00g=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=20
/dev/sda1(0)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 6.00g</span></p><p class=3D"MsoNormal"><span lang=3D"EN-GB">=A0
 [root_mimage_1] lvgrptstnlvm iwi-aom-=20
6.00g=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=20
/dev/sdb1(0)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 6.00g</span></p><p class=3D"MsoNormal"><span lang=3D"EN-GB">=A0
 [root_mlog]=A0=A0=A0=A0 lvgrptstnlvm lwi-aom-=20
4.00m=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=20
/dev/sdb1(1536)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 4.00m=
</span></p><p class=3D"MsoNormal"><b><span lang=3D"EN-GB"><br></span></b></=
p><p class=3D"MsoNormal"><b><span lang=3D"EN-GB">root@Microknoppix:/home/kn=
oppix# pvs -v -o +pv_pe_count,pv_pe_alloc_count</span></b></p>

<p class=3D"MsoNormal"><span lang=3D"EN-GB">=A0=A0=A0 Scanning for physical=
 volume names</span></p><p class=3D"MsoNormal"><span lang=3D"EN-GB">=A0 PV=
=A0=A0=A0=A0=A0=A0=A0=A0 VG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Fmt=A0 Attr PSize=
 PFree DevSize PV UUID=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 PE=A0=A0 Alloc</span></p>

<p class=3D"MsoNormal"><span lang=3D"EN-GB">=A0 /dev/sda1=A0 lvgrptstnlvm l=
vm2 a-- =A09.00g 3.00g=A0=A0 9.00g 5h4peZ-7SVd-MKrH-IQNJ-UACQ-mM7Q-6CVeo5 2=
303=A0 1536</span></p><p class=3D"MsoNormal"><span lang=3D"EN-GB">=A0 /dev/=
sdb1=A0 lvgrptstnlvm lvm2 a--=A0 7.07g 1.06g=A0=A0 9.00g VlGEw0-JaqC-THbz-G=
4mv-yHq5-9Y80-N5ANNQ 1809=A0 1537</span></p>

<p class=3D"MsoNormal"><b><span lang=3D"EN-GB"><br></span></b></p><p class=
=3D"MsoNormal"><b><span lang=3D"EN-GB">root@Microknoppix:/home/knoppix# lvs=
 -a -o +devices,lv_size</span></b></p><p class=3D"MsoNormal"><span lang=3D"=
EN-GB">=A0
 LV=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 VG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 Attr=A0=A0=A0=A0 LSize Pool Origin Data%=A0 Move=20
Log=A0=A0=A0=A0=A0=A0 Copy%=A0 Convert Devices=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 LSize</span></p><p clas=
s=3D"MsoNormal"><span lang=3D"EN-GB">=A0
 root=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 lvgrptstnlvm mwi-aom- 6.00g=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=20
root_mlog 100.00=A0=A0=A0=A0=A0=A0=A0=A0 root_mimage_0(0),root_mimage_1(0) =
6.00g</span></p><p class=3D"MsoNormal"><span lang=3D"EN-GB">=A0
 [root_mimage_0] lvgrptstnlvm iwi-aom-=20
6.00g=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=20
/dev/sda1(0)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 6.00g</span></p><p class=3D"MsoNormal"><span lang=3D"EN-GB">=A0
 [root_mimage_1] lvgrptstnlvm iwi-aom-=20
6.00g=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=20
/dev/sdb1(0)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 6.00g</span></p><p class=3D"MsoNormal"><span lang=3D"EN-GB">=A0
 [root_mlog]=A0=A0=A0=A0 lvgrptstnlvm lwi-aom-=20
4.00m=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=20
/dev/sdb1(1536)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 4.00m=
</span></p><p class=3D"MsoNormal"><b><span lang=3D"EN-GB"><br></span></b></=
p><p class=3D"MsoNormal"><b><span lang=3D"EN-GB">root@Microknoppix:/home/kn=
oppix# lvconvert -m0 /dev/lvgrptstnlvm/root /dev/sdb1</span></b></p>

<p class=3D"MsoNormal"><span lang=3D"EN-GB">=A0 /sbin/dmeventd: stat failed=
: No such file or directory</span></p><p class=3D"MsoNormal"><span lang=3D"=
EN-GB">=A0 Logical volume root converted.</span></p><p class=3D"MsoNormal">=
<b><span lang=3D"EN-GB"><br>

</span></b></p><p class=3D"MsoNormal"><b><span lang=3D"EN-GB">root@Microkno=
ppix:/home/knoppix# lvconvert -i 5 -m1 --mirrorlog mirrored /dev/lvgrptstnl=
vm/root /dev/sdb1</span></b></p><p class=3D"MsoNormal"><span lang=3D"EN-GB"=
>=A0 Insufficient suitable allocatable extents for logical volume : 1536 mo=
re required</span></p>

<p class=3D"MsoNormal"><span lang=3D"EN-GB">=A0 Unable to allocate extents =
for mirror(s).</span></p><p class=3D"MsoNormal"><b><span lang=3D"EN-GB"><br=
></span></b></p><p class=3D"MsoNormal"><b><span lang=3D"EN-GB">root@Microkn=
oppix:/home/knoppix# lvconvert -m1 /dev/lvgrptstnlvm/root /dev/sdb1</span><=
/b></p>

<p class=3D"MsoNormal"><span lang=3D"EN-GB">=A0 lvgrptstnlvm/root: Converte=
d: 0.5%</span></p><p class=3D"MsoNormal"><span lang=3D"EN-GB">[...SKIP...]<=
br></span></p><span lang=3D"EN-GB">=A0 lvgrptstnlvm/root: Converted: 100.0%=
</span><p class=3D"MsoNormal">

<b><span lang=3D"EN-GB"><br></span></b></p><p class=3D"MsoNormal"><b><span =
lang=3D"EN-GB">root@Microknoppix:/home/knoppix# lvs -a -o +devices,lv_size<=
/span></b></p><p class=3D"MsoNormal"><span lang=3D"EN-GB">=A0
 LV=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 VG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 Attr=A0=A0=A0=A0 LSize Pool Origin Data%=A0 Move=20
Log=A0=A0=A0=A0=A0=A0 Copy%=A0 Convert Devices=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 LSize</span></p><p clas=
s=3D"MsoNormal"><span lang=3D"EN-GB">=A0
 root=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 lvgrptstnlvm mwi-aom- 6.00g=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=20
root_mlog 100.00=A0=A0=A0=A0=A0=A0=A0=A0 root_mimage_0(0),root_mimage_1(0) =
6.00g</span></p><p class=3D"MsoNormal"><span lang=3D"EN-GB">=A0
 [root_mimage_0] lvgrptstnlvm iwi-aom-=20
6.00g=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=20
/dev/sda1(0)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 6.00g</span></p><p class=3D"MsoNormal"><span lang=3D"EN-GB">=A0
 [root_mimage_1] lvgrptstnlvm iwi-aom-=20
6.00g=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=20
/dev/sdb1(0)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 6.00g</span></p><p class=3D"MsoNormal"><span lang=3D"EN-GB">=A0
 [root_mlog]=A0=A0=A0=A0 lvgrptstnlvm lwi-aom-=20
4.00m=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=20
/dev/sdb1(1536)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0=A04.00m=
</span></p><p class=3D"MsoNormal"><b><span lang=3D"EN-GB"><br></span></b></=
p><p class=3D"MsoNormal"><b><span lang=3D"EN-GB">root@Microknoppix:/home/kn=
oppix# pvs -v -o +pv_pe_count,pv_pe_alloc_count</span></b></p>

<p class=3D"MsoNormal"><span lang=3D"EN-GB">=A0=A0=A0 Scanning for physical=
 volume names</span></p><p class=3D"MsoNormal"><span lang=3D"EN-GB">=A0 PV=
=A0=A0=A0=A0=A0=A0=A0=A0 VG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Fmt=A0 Attr PSize=
 PFree DevSize PV UUID=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 PE=A0=A0 Alloc</span></p>

<p class=3D"MsoNormal"><span lang=3D"EN-GB">=A0 /dev/sda1=A0 lvgrptstnlvm l=
vm2 a--=A0 9.00g 3.00g=A0=A0 9.00g 5h4peZ-7SVd-MKrH-IQNJ-UACQ-mM7Q-6CVeo5 2=
303=A0 1536</span></p><p class=3D"MsoNormal"><span lang=3D"EN-GB">=A0 /dev/=
sdb1=A0 lvgrptstnlvm lvm2 a--=A0 7.07g 1.06g=A0=A0 9.00g VlGEw0-JaqC-THbz-G=
4mv-yHq5-9Y80-N5ANNQ 1809=A0 1537</span></p>

<p class=3D"MsoNormal"><b><br></b></p><p class=3D"MsoNormal"><b>root@Microk=
noppix:/home/knoppix#</b></p></div>
</blockquote></div><br><div><br></div><div>Same result if done from a Debia=
n LiveCD. If there are a lot of PEs why LVM complains it is not suitable, i=
n my case it needs just 1 PE.</div><div><br></div><div>I used --alloc anywh=
erebut it noticed the two mirror-logs were on the same disk, thing that I d=
on&#39;t want of course...</div>

--001a11c34da0e5e32204e0898de8--
