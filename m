Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r62GO5Zx026608
	for <linux-lvm@redhat.com>; Tue, 2 Jul 2013 12:24:05 -0400
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r62GO3UT009484
	for <linux-lvm@redhat.com>; Tue, 2 Jul 2013 12:24:03 -0400
Received: by mail-la0-f49.google.com with SMTP id ea20so5688106lab.22
	for <linux-lvm@redhat.com>; Tue, 02 Jul 2013 09:24:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAFrGbuXHzzYwgB88bhOyjFUL7dokFbSsHWdJ1P8Pc88Wp2EdoQ@mail.gmail.com>
References: <CAFrGbuW1NDnsZfm7S5f=wsTbZ4rcb6huPX7MMv_AiZF95xDYSQ@mail.gmail.com>
	<CAFrGbuXHzzYwgB88bhOyjFUL7dokFbSsHWdJ1P8Pc88Wp2EdoQ@mail.gmail.com>
Date: Tue, 2 Jul 2013 18:24:02 +0200
Message-ID: <CAFrGbuXJ54EgwA7pnzRMLtTnkjsgep=h2RvVZMN01fTXn+1hQw@mail.gmail.com>
From: Alessandro MACUZ <alessandro.macuz@gmail.com>
Content-Type: multipart/alternative; boundary=089e0141aab0ecf22b04e089c51a
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

--089e0141aab0ecf22b04e089c51a
Content-Type: text/plain; charset=ISO-8859-1

> Same result if done from a Debian LiveCD. If there are a lot of PEs why
> LVM complains it is not suitable, in my case it needs just 1 PE.
>
> I used --alloc anywherebut it noticed the two mirror-logs were on the same
> disk, thing that I don't want of course...
>

Here's the proof fro the test --alloc anywhere

root@debian:/home/user# lvs -a -o+devices
  LV                   VG           Attr     LSize Pool Origin Data%  Move
Log       Copy%  Convert Devices
  root                 lvgrptstnlvm mwi-a-m- 6.00g
root_mlog 100.00         root_mimage_0(0),root_mimage_1(0)
  [root_mimage_0]      lvgrptstnlvm iwi-aom- 6.00g
                         /dev/sda1(0)
  [root_mimage_1]      lvgrptstnlvm iwi-aom- 6.00g
                         /dev/sdb1(0)
  [root_mlog]          lvgrptstnlvm mwa-aom- 4.00m
          100.00         root_mlog_mimage_0(0),root_mlog_mimage_1(0)
  [root_mlog_mimage_0] lvgrptstnlvm iwi-aom- 4.00m
                         /dev/sdb1(1536)
  [root_mlog_mimage_1] lvgrptstnlvm iwi-aom- 4.00m
                         /dev/sdb1(1537)

root@debian:/home/user# pvs -a -o+devices,pv_pe_count,pv_pe_alloc_count
  PV                     VG           Fmt  Attr PSize PFree Devices
PE   Alloc
  /dev/loop0                               ---     0     0
    0     0
  /dev/lvgrptstnlvm/root                   ---     0     0
    0     0
  /dev/sda1              lvgrptstnlvm lvm2 a--  9.00g 3.00g /dev/sda1(0)
 2303  1536
  /dev/sda1              lvgrptstnlvm lvm2 a--  9.00g 3.00g
2303  1536
  /dev/sdb1              lvgrptstnlvm lvm2 a--  7.07g 1.06g /dev/sdb1(0)
 1809  1538
  /dev/sdb1              lvgrptstnlvm lvm2 a--  7.07g 1.06g /dev/sdb1(1536)
1809  1538
  /dev/sdb1              lvgrptstnlvm lvm2 a--  7.07g 1.06g /dev/sdb1(1537)
1809  1538
  /dev/sdb1              lvgrptstnlvm lvm2 a--  7.07g 1.06g
1809  1538

Might this be for devs' attention?

Alex

--089e0141aab0ecf22b04e089c51a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>Same res=
ult if done from a Debian LiveCD. If there are a lot of PEs why LVM complai=
ns it is not suitable, in my case it needs just 1 PE.</div>
<div><br></div><div>I used --alloc anywherebut it noticed the two mirror-lo=
gs were on the same disk, thing that I don&#39;t want of course...</div>
</blockquote></div><br><div>Here&#39;s the proof fro the test --alloc anywh=
ere</div><div><br></div><div><div>root@debian:/home/user# lvs -a -o+devices=
</div><div>=A0 LV =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 VG =A0 =A0 =A0 =A0 =
=A0 Attr =A0 =A0 LSize Pool Origin Data% =A0Move Log =A0 =A0 =A0 Copy% =A0C=
onvert Devices</div>
<div>=A0 root =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 lvgrptstnlvm mwi-a-m- 6.00g =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 root_mlog 100.00 =A0 =A0 =
=A0 =A0 root_mimage_0(0),root_mimage_1(0)</div><div>=A0 [root_mimage_0] =A0=
 =A0 =A0lvgrptstnlvm iwi-aom- 6.00g =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/dev/sda1(0)</d=
iv>
<div>=A0 [root_mimage_1] =A0 =A0 =A0lvgrptstnlvm iwi-aom- 6.00g =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0/dev/sdb1(0)</div><div>=A0 [root_mlog] =A0 =A0 =A0 =A0 =A0lv=
grptstnlvm mwa-aom- 4.00m =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 100.00 =A0 =A0 =A0 =A0 root_mlog_mimage_0(0),root_mlog_=
mimage_1(0)</div>
<div>=A0 [root_mlog_mimage_0] lvgrptstnlvm iwi-aom- 4.00m =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0/dev/sdb1(1536)</div><div>=A0 [root_mlog_mimage_1] lvgrptstnlvm iwi=
-aom- 4.00m =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/dev/sdb1(1537)</div>
</div><div><br></div><div><div>root@debian:/home/user# pvs -a -o+devices,pv=
_pe_count,pv_pe_alloc_count</div><div>=A0 PV =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 VG =A0 =A0 =A0 =A0 =A0 Fmt =A0Attr PSize PFree Devices =A0 =A0 =
=A0 =A0 PE =A0 Alloc</div><div>=A0 /dev/loop0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 --- =A0 =A0 0 =A0 =A0 0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 0 =A0 =A0 0</div>
<div>=A0 /dev/lvgrptstnlvm/root =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 --- =A0=
 =A0 0 =A0 =A0 0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0 =A0 =A0 0</div><=
div>=A0 /dev/sda1 =A0 =A0 =A0 =A0 =A0 =A0 =A0lvgrptstnlvm lvm2 a-- =A09.00g=
 3.00g /dev/sda1(0) =A0 =A02303 =A01536</div><div>=A0 /dev/sda1 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0lvgrptstnlvm lvm2 a-- =A09.00g 3.00g =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 2303 =A01536</div>
<div>=A0 /dev/sdb1 =A0 =A0 =A0 =A0 =A0 =A0 =A0lvgrptstnlvm lvm2 a-- =A07.07=
g 1.06g /dev/sdb1(0) =A0 =A01809 =A01538</div><div>=A0 /dev/sdb1 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0lvgrptstnlvm lvm2 a-- =A07.07g 1.06g /dev/sdb1(1536) 180=
9 =A01538</div><div>=A0 /dev/sdb1 =A0 =A0 =A0 =A0 =A0 =A0 =A0lvgrptstnlvm l=
vm2 a-- =A07.07g 1.06g /dev/sdb1(1537) 1809 =A01538</div>
<div>=A0 /dev/sdb1 =A0 =A0 =A0 =A0 =A0 =A0 =A0lvgrptstnlvm lvm2 a-- =A07.07=
g 1.06g =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1809 =A01538</div></div><div><br></=
div><div>Might this be for devs&#39; attention?</div><div><br></div><div>Al=
ex</div>

--089e0141aab0ecf22b04e089c51a--
