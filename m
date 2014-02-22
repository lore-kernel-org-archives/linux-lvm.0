Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s1MACT5U019293
	for <linux-lvm@redhat.com>; Sat, 22 Feb 2014 05:12:29 -0500
Received: from mail-oa0-f42.google.com (mail-oa0-f42.google.com
	[209.85.219.42])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s1MACSV4012985
	for <linux-lvm@redhat.com>; Sat, 22 Feb 2014 05:12:28 -0500
Received: by mail-oa0-f42.google.com with SMTP id j17so3302772oag.15
	for <linux-lvm@redhat.com>; Sat, 22 Feb 2014 02:12:27 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20140222071408.GA10598@localhost.localdomain>
References: <20140222071408.GA10598@localhost.localdomain>
Date: Sat, 22 Feb 2014 11:12:27 +0100
Message-ID: <CAE7pJ3ASKEJ0ExqVn7w9pDhv-SRC7HX-60CFJcswROVOmdWBNA@mail.gmail.com>
From: emmanuel segura <emi2fast@gmail.com>
Content-Type: multipart/alternative; boundary=001a11369726c3412404f2fbf95a
Subject: Re: [linux-lvm] LV mirror extents on same physical device
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

--001a11369726c3412404f2fbf95a
Content-Type: text/plain; charset=ISO-8859-1

i don't understand why you are using two mirror technologies together, i'm
using in lvm mirror without mdadm and never found problems


2014-02-22 8:14 GMT+01:00 Julie Ashworth <ashworth@berkeley.edu>:

> hi all,
>
> just some background...
> I installed a CentOS5 server in 2010 with a mdadm RAID1 containing 2
> partitions (/dev/sda1 and /dev/sdb1). /dev/sda1 failed, and unfortuately,
> the mirror failed to sync with a new drive.
>
> On this RAID1, I have one VG (VolGroup00) with 5 LVs.
>
> I contacted the folks on the mdadm mailing list. The data on /dev/sdb is
> good, so they recommended that I convert the linear LVs to mirrors (to copy
> the data to a new drive).
>
> I formatted a new drive (/dev/sde) identical to /dev/sd[ab], added it to a
> mdadm device (/dev/md2), which I then added to my VG:
> mdadm --create --level=1 -n 2 /dev/md2 /dev/sde2 missing
> pvcreate /dev/md2
> vgextend VolGroup00 /dev/md2
>
> I then converted all my volumes to mirrors:
> lvconvert -m1 --mirrorlog=mirrored --alloc=anywhere /dev/VolGroup00/srvlv
> lvconvert -m1 --mirrorlog=mirrored --alloc=anywhere /dev/VolGroup00/rootlv
> lvconvert -m1 --mirrorlog=mirrored --alloc=anywhere /dev/VolGroup00/swaplv
> lvconvert -m1 --mirrorlog=mirrored --alloc=anywhere /dev/VolGroup00/varlv
> lvconvert -m1 --mirrorlog=mirrored --alloc=anywhere /dev/VolGroup00/tmplv
>
> (in case you're wondering, when this completed, I added /dev/sda1 to
> /dev/md2, so /dev/md2 is a fuctional mdadm RAID1).
>
> Now... the problem ;)....
>
> When I run 'lvs' I see that the LV mirror extents were created on the same
> device (/dev/md1):
>
> # lvs -a -o +devices
> LV                     VG         Attr   LSize  Origin Snap%  Move Log
>     Copy%  Convert Devices
> rootlv                 VolGroup00 mwi-ao 10.00G
>  rootlv_mlog 100.00         rootlv_mimage_0(0),rootlv_mimage_1(0)
> [rootlv_mimage_0]      VolGroup00 iwi-ao 10.00G
>                     /dev/md1(0)
> [rootlv_mimage_1]      VolGroup00 iwi-ao 10.00G
>                     /dev/md1(4036)
> [rootlv_mlog]          VolGroup00 mwa-ao 32.00M
>      100.00         rootlv_mlog_mimage_0(0),rootlv_mlog_mimage_1(0)
> [rootlv_mlog_mimage_0] VolGroup00 iwi-ao 32.00M
>                     /dev/md2(4)
> [rootlv_mlog_mimage_1] VolGroup00 iwi-ao 32.00M
>                     /dev/md1(4356)
>
>
> My long-term goal is to convert the mirror back to a linear volume using
> just /dev/md2, i.e.
> lvconvert -m0 /dev/VolGroup00/rootlv /dev/md1
> lvconvert -m0 /dev/VolGroup00/swaplv /dev/md1
> lvconvert -m0 /dev/VolGroup00/srvlv /dev/md1
> lvconvert -m0 /dev/VolGroup00/varlv /dev/md1
> lvconvert -m0 /dev/VolGroup00/tmplv /dev/md1
>
> ... so it seems problematic that both extents are on /dev/md1.
>
> I thought lvm was supposed to use both physical devices. Do you know why
> both extents were created on the same physical device?
> Should I create another extent on /dev/md2 before I remove the /dev/md1
> extent(s)? If so, can you give me an example of how to use lvconvert in
> this case?
>
> Thanks in advance!
> best,
> Julie
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>



-- 
esta es mi vida e me la vivo hasta que dios quiera

--001a11369726c3412404f2fbf95a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">i don&#39;t understand why you are using two mirror techno=
logies together, i&#39;m using in lvm mirror without mdadm and never found =
problems<br></div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_qu=
ote">
2014-02-22 8:14 GMT+01:00 Julie Ashworth <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:ashworth@berkeley.edu" target=3D"_blank">ashworth@berkeley.edu</a>&gt=
;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">
hi all,<br>
<br>
just some background...<br>
I installed a CentOS5 server in 2010 with a mdadm RAID1 containing 2 partit=
ions (/dev/sda1 and /dev/sdb1). /dev/sda1 failed, and unfortuately, the mir=
ror failed to sync with a new drive.<br>
<br>
On this RAID1, I have one VG (VolGroup00) with 5 LVs.<br>
<br>
I contacted the folks on the mdadm mailing list. The data on /dev/sdb is go=
od, so they recommended that I convert the linear LVs to mirrors (to copy t=
he data to a new drive).<br>
<br>
I formatted a new drive (/dev/sde) identical to /dev/sd[ab], added it to a =
mdadm device (/dev/md2), which I then added to my VG:<br>
mdadm --create --level=3D1 -n 2 /dev/md2 /dev/sde2 missing<br>
pvcreate /dev/md2<br>
vgextend VolGroup00 /dev/md2<br>
<br>
I then converted all my volumes to mirrors:<br>
lvconvert -m1 --mirrorlog=3Dmirrored --alloc=3Danywhere /dev/VolGroup00/srv=
lv<br>
lvconvert -m1 --mirrorlog=3Dmirrored --alloc=3Danywhere /dev/VolGroup00/roo=
tlv<br>
lvconvert -m1 --mirrorlog=3Dmirrored --alloc=3Danywhere /dev/VolGroup00/swa=
plv<br>
lvconvert -m1 --mirrorlog=3Dmirrored --alloc=3Danywhere /dev/VolGroup00/var=
lv<br>
lvconvert -m1 --mirrorlog=3Dmirrored --alloc=3Danywhere /dev/VolGroup00/tmp=
lv<br>
<br>
(in case you&#39;re wondering, when this completed, I added /dev/sda1 to /d=
ev/md2, so /dev/md2 is a fuctional mdadm RAID1).<br>
<br>
Now... the problem ;)....<br>
<br>
When I run &#39;lvs&#39; I see that the LV mirror extents were created on t=
he same device (/dev/md1):<br>
<br>
# lvs -a -o +devices<br>
LV =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 VG =A0 =A0 =A0 =A0 Attr =A0 LSiz=
e =A0Origin Snap% =A0Move Log =A0 =A0 =A0 =A0 Copy% =A0Convert Devices<br>
rootlv =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 VolGroup00 mwi-ao 10.00G =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0rootlv_mlog 100.00 =A0 =A0 =A0 =A0 rootlv_mimag=
e_0(0),rootlv_mimage_1(0)<br>
[rootlv_mimage_0] =A0 =A0 =A0VolGroup00 iwi-ao 10.00G =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /de=
v/md1(0)<br>
[rootlv_mimage_1] =A0 =A0 =A0VolGroup00 iwi-ao 10.00G =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /de=
v/md1(4036)<br>
[rootlv_mlog] =A0 =A0 =A0 =A0 =A0VolGroup00 mwa-ao 32.00M =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0100.00 =A0 =A0 =A0 =A0 rootl=
v_mlog_mimage_0(0),rootlv_mlog_mimage_1(0)<br>
[rootlv_mlog_mimage_0] VolGroup00 iwi-ao 32.00M =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /dev/md2(4=
)<br>
[rootlv_mlog_mimage_1] VolGroup00 iwi-ao 32.00M =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /dev/md1(4=
356)<br>
<br>
<br>
My long-term goal is to convert the mirror back to a linear volume using ju=
st /dev/md2, i.e.<br>
lvconvert -m0 /dev/VolGroup00/rootlv /dev/md1<br>
lvconvert -m0 /dev/VolGroup00/swaplv /dev/md1<br>
lvconvert -m0 /dev/VolGroup00/srvlv /dev/md1<br>
lvconvert -m0 /dev/VolGroup00/varlv /dev/md1<br>
lvconvert -m0 /dev/VolGroup00/tmplv /dev/md1<br>
<br>
... so it seems problematic that both extents are on /dev/md1.<br>
<br>
I thought lvm was supposed to use both physical devices. Do you know why bo=
th extents were created on the same physical device?<br>
Should I create another extent on /dev/md2 before I remove the /dev/md1 ext=
ent(s)? If so, can you give me an example of how to use lvconvert in this c=
ase?<br>
<br>
Thanks in advance!<br>
best,<br>
Julie<br>
<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote></div><br><br clear=3D"all"><br>-- <br>esta es mi vida e me la=
 vivo hasta que dios quiera
</div>

--001a11369726c3412404f2fbf95a--
