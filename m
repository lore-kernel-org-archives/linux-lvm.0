Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s2EC5cMT021877
	for <linux-lvm@redhat.com>; Fri, 14 Mar 2014 08:05:38 -0400
Received: from mail-yk0-f194.google.com (mail-yk0-f194.google.com
	[209.85.160.194])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2EC5YX2001119
	for <linux-lvm@redhat.com>; Fri, 14 Mar 2014 08:05:35 -0400
Received: by mail-yk0-f194.google.com with SMTP id 9so1238624ykp.1
	for <linux-lvm@redhat.com>; Fri, 14 Mar 2014 05:05:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5322AE1A.4010505@gdp-group.com>
References: <CADPXwZP_wSC_C5ZFXR0igwbVqULKPJ2PYhpU_eH2vgNs5MqTWw@mail.gmail.com>
	<5322AE1A.4010505@gdp-group.com>
Date: Fri, 14 Mar 2014 08:05:34 -0400
Message-ID: <CADPXwZOd7e9M=QDtN6wn2DMJ2=znL89=0tiXsniMehQmyeL07A@mail.gmail.com>
From: Ogal Finklestein-Birl <ogal.finklestein@gmail.com>
Content-Type: multipart/alternative; boundary=20cf301b5fe715166b04f48fe38e
Subject: Re: [linux-lvm] Expanded virtual disk for LVM: missing space? or
 free space? or no space?
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

--20cf301b5fe715166b04f48fe38e
Content-Type: text/plain; charset=ISO-8859-1

Thank you for catching this Andreas!  I even had the + in my notes, and I
still forgot it!  Such a noob.



On Fri, Mar 14, 2014 at 3:22 AM, andreas nastke <nastke@gdp-group.com>wrote:

> you have 'set' the size to 229.99G
>
> -L 229.99G
>
> you want to 'increase' by 229.99G
>
> -L +229.99G
>
>
> Ogal Finklestein-Birl schrieb:
>
>> Greetings gurus:
>>
>> I do not deal with LVM on a daily basis, and I think my note-taking of
>> previous LVM commands needs to be polished.
>>
>> == Background ==
>> Have a VM with 2 virtual disks, 30G (LVM only on 3rd partition) and 65G
>> (all LVM) respectively.
>>
>> A single VG on the server: VolGroup00; four LV's: LogVol00 to 03
>>
>>
>> == Problem ==
>> The 71G /usr/local (VolGroup00-LogVol02) hit 100%
>>
>> I shut the server down and increased the 65G virtual disk up to 295G
>> (+230G)  -- the thought process: take /usr/local from 71G to ~300G.
>>
>> Booted into single and fdisk'ed a new /dev/sdb2
>>
>> /dev/sda3            4298       30720    27057152   8e  Linux LVM
>> /dev/sdb1               1        8485    68155731   83  Linux
>> /dev/sdb2            8486       38509   241167780   83  Linux
>>
>>
>> Consulted my notes and did the following:
>>
>> pvcreate /dev/sdb2
>> umount -vv /usr/local
>> vgextend VolGroup00 /dev/sdb2
>> lvextend -L 229.99G /dev/mapper/VolGroup00-LogVol02
>> e2fsck -f /dev/mapper/VolGroup00-LogVol02
>> resize2fs /dev/mapper/VolGroup00-LogVol02
>> mount -vv /usr/local
>> df -h
>>
>> /dev/mapper/VolGroup00-LogVol02  227G   68G  148G  32% /usr/local
>>
>> My confusion came in when I saw 227G total and not 300G.
>> My suspicion was confirmed with pvdisplay -s (and pvs)
>>
>>   Device "/dev/sda3" has a capacity of 0
>>   Device "/dev/sdb1" has a capacity of 0
>>   Device "/dev/sdb2" has a capacity of 71.83 GiB
>>
>>  But I am confused even further; I thought pvdisplay was referring to the
>> physical disks, but fdisk does not show a missing 71G for /dev/sdb2
>>
>> pvs
>>   PV         VG         Fmt  Attr PSize   PFree
>>   /dev/sda3  VolGroup00 lvm2 a--   25.80g     0
>>   /dev/sdb1  VolGroup00 lvm2 a--   65.00g     0
>>   /dev/sdb2  VolGroup00 lvm2 a--  229.99g 71.83g
>>
>> vgs
>>   VG         #PV #LV #SN Attr   VSize   VFree
>>   VolGroup00   3   4   0 wz--n- 320.79g 71.83g
>>
>>
>> == Questions ==
>> Where did I go wrong, or did I go wrong?
>>
>> It obviously seems like I am missing 71G, but am I missing it and how do I
>> go about reclaiming it?
>>
>>
>> == Additional data ==
>> pvdisplay
>>   --- Physical volume ---
>>   PV Name               /dev/sda3
>>   VG Name               VolGroup00
>>   PV Size               25.80 GiB / not usable 3.00 MiB
>>   Allocatable           yes (but full)
>>   PE Size               4.00 MiB
>>   Total PE              6605
>>   Free PE               0
>>   Allocated PE          6605
>>
>>   --- Physical volume ---
>>   PV Name               /dev/sdb1
>>   VG Name               VolGroup00
>>   PV Size               65.00 GiB / not usable 2.33 MiB
>>   Allocatable           yes (but full)
>>   PE Size               4.00 MiB
>>   Total PE              16639
>>   Free PE               0
>>   Allocated PE          16639
>>
>>   --- Physical volume ---
>>   PV Name               /dev/sdb2
>>   VG Name               VolGroup00
>>   PV Size               230.00 GiB / not usable 3.41 MiB
>>   Allocatable           yes
>>   PE Size               4.00 MiB
>>   Total PE              58878
>>   Free PE               18389
>>   Allocated PE          40489
>>
>>
>>
>> vgdisplay -v
>>     Finding all volume groups
>>     Finding volume group "VolGroup00"
>>   --- Volume group ---
>>   VG Name               VolGroup00
>>   System ID
>>   Format                lvm2
>>   Metadata Areas        3
>>   Metadata Sequence No  9
>>   VG Access             read/write
>>   VG Status             resizable
>>   MAX LV                0
>>   Cur LV                4
>>   Open LV               4
>>   Max PV                0
>>   Cur PV                3
>>   Act PV                3
>>   VG Size               320.79 GiB
>>   PE Size               4.00 MiB
>>   Total PE              82122
>>   Alloc PE / Size       63733 / 248.96 GiB
>>   Free  PE / Size       18389 / 71.83 GiB
>>
>>   --- Logical volume ---
>>   LV Path                /dev/VolGroup00/LogVol01
>>   LV Name                LogVol01
>>   VG Name                VolGroup00
>>   LV Write Access        read/write
>>   LV Creation host, time ,
>>   LV Status              available
>>   # open                 1
>>   LV Size                5.86 GiB
>>   Current LE             1500
>>   Segments               1
>>   Allocation             inherit
>>   Read ahead sectors     auto
>>   - currently set to     256
>>   Block device           253:1
>>
>>   --- Logical volume ---
>>   LV Path                /dev/VolGroup00/LogVol00
>>   LV Name                LogVol00
>>   VG Name                VolGroup00
>>   LV Write Access        read/write
>>   LV Creation host, time ,
>>   LV Status              available
>>   # open                 1
>>   LV Size                7.32 GiB
>>   Current LE             1875
>>   Segments               1
>>   Allocation             inherit
>>   Read ahead sectors     auto
>>   - currently set to     256
>>   Block device           253:0
>>
>>   --- Logical volume ---
>>   LV Path                /dev/VolGroup00/LogVol03
>>   LV Name                LogVol03
>>   VG Name                VolGroup00
>>   LV Write Access        read/write
>>   LV Creation host, time ,
>>   LV Status              available
>>   # open                 1
>>   LV Size                5.78 GiB
>>   Current LE             1480
>>   Segments               1
>>   Allocation             inherit
>>   Read ahead sectors     auto
>>   - currently set to     256
>>   Block device           253:2
>>
>>   --- Logical volume ---
>>   LV Path                /dev/VolGroup00/LogVol02
>>   LV Name                LogVol02
>>   VG Name                VolGroup00
>>   LV Write Access        read/write
>>   LV Creation host, time ,
>>   LV Status              available
>>   # open                 1
>>   LV Size                229.99 GiB
>>   Current LE             58878
>>   Segments               3
>>   Allocation             inherit
>>   Read ahead sectors     auto
>>   - currently set to     256
>>   Block device           253:3
>>
>>   --- Physical volumes ---
>>   PV Name               /dev/sda3
>>   PV Status             allocatable
>>   Total PE / Free PE    6605 / 0
>>
>>   PV Name               /dev/sdb1
>>   PV Status             allocatable
>>   Total PE / Free PE    16639 / 0
>>
>>   PV Name               /dev/sdb2
>>   PV Status             allocatable
>>   Total PE / Free PE    58878 / 18389
>>
>>
>>
>> lvdisplay -m
>>   --- Logical volume ---
>>   LV Path                /dev/VolGroup00/LogVol01
>>   LV Name                LogVol01
>>   VG Name                VolGroup00
>>   LV Write Access        read/write
>>   LV Creation host, time ,
>>   LV Status              available
>>   # open                 1
>>   LV Size                5.86 GiB
>>   Current LE             1500
>>   Segments               1
>>   Allocation             inherit
>>   Read ahead sectors     auto
>>   - currently set to     256
>>   Block device           253:1
>>
>>   --- Segments ---
>>   Logical extent 0 to 1499:
>>     Type                linear
>>     Physical volume     /dev/sda3
>>     Physical extents    0 to 1499
>>
>>
>>   --- Logical volume ---
>>   LV Path                /dev/VolGroup00/LogVol00
>>   LV Name                LogVol00
>>   VG Name                VolGroup00
>>   LV Write Access        read/write
>>   LV Creation host, time ,
>>   LV Status              available
>>   # open                 1
>>   LV Size                7.32 GiB
>>   Current LE             1875
>>   Segments               1
>>   Allocation             inherit
>>   Read ahead sectors     auto
>>   - currently set to     256
>>   Block device           253:0
>>
>>   --- Segments ---
>>   Logical extent 0 to 1874:
>>     Type                linear
>>     Physical volume     /dev/sda3
>>     Physical extents    1500 to 3374
>>
>>
>>   --- Logical volume ---
>>   LV Path                /dev/VolGroup00/LogVol03
>>   LV Name                LogVol03
>>   VG Name                VolGroup00
>>   LV Write Access        read/write
>>   LV Creation host, time ,
>>   LV Status              available
>>   # open                 1
>>   LV Size                5.78 GiB
>>   Current LE             1480
>>   Segments               1
>>   Allocation             inherit
>>   Read ahead sectors     auto
>>   - currently set to     256
>>   Block device           253:2
>>
>>   --- Segments ---
>>   Logical extent 0 to 1479:
>>     Type                linear
>>     Physical volume     /dev/sda3
>>     Physical extents    3375 to 4854
>>
>>
>>   --- Logical volume ---
>>   LV Path                /dev/VolGroup00/LogVol02
>>   LV Name                LogVol02
>>   VG Name                VolGroup00
>>   LV Write Access        read/write
>>   LV Creation host, time ,
>>   LV Status              available
>>   # open                 1
>>   LV Size                229.99 GiB
>>   Current LE             58878
>>   Segments               3
>>   Allocation             inherit
>>   Read ahead sectors     auto
>>   - currently set to     256
>>   Block device           253:3
>>
>>   --- Segments ---
>>   Logical extent 0 to 1749:
>>     Type                linear
>>     Physical volume     /dev/sda3
>>     Physical extents    4855 to 6604
>>
>>   Logical extent 1750 to 18388:
>>     Type                linear
>>     Physical volume     /dev/sdb1
>>     Physical extents    0 to 16638
>>
>>   Logical extent 18389 to 58877:
>>     Type                linear
>>     Physical volume     /dev/sdb2
>>     Physical extents    0 to 40488
>>
>>
>> Many thanks in advance!
>> Ogal
>>
>>
>>
>> ------------------------------------------------------------------------
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>



-- 
Ogal Finklestein aka S.A. Birl

--20cf301b5fe715166b04f48fe38e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you for catching this Andreas! =A0I even had the + i=
n my notes, and I still forgot it! =A0Such a noob.<div><br></div></div><div=
 class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Fri, Mar 14, 2=
014 at 3:22 AM, andreas nastke <span dir=3D"ltr">&lt;<a href=3D"mailto:nast=
ke@gdp-group.com" target=3D"_blank">nastke@gdp-group.com</a>&gt;</span> wro=
te:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">you have &#39;set&#39; the size to 229.99G<b=
r>
<br>
-L 229.99G<br>
<br>
you want to &#39;increase&#39; by 229.99G<br>
<br>
-L +229.99G<br>
<br>
<br>
Ogal Finklestein-Birl schrieb:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div><div class=3D"h5">
Greetings gurus:<br>
<br>
I do not deal with LVM on a daily basis, and I think my note-taking of<br>
previous LVM commands needs to be polished.<br>
<br>
=3D=3D Background =3D=3D<br>
Have a VM with 2 virtual disks, 30G (LVM only on 3rd partition) and 65G<br>
(all LVM) respectively.<br>
<br>
A single VG on the server: VolGroup00; four LV&#39;s: LogVol00 to 03<br>
<br>
<br>
=3D=3D Problem =3D=3D<br>
The 71G /usr/local (VolGroup00-LogVol02) hit 100%<br>
<br>
I shut the server down and increased the 65G virtual disk up to 295G<br>
(+230G) =A0-- the thought process: take /usr/local from 71G to ~300G.<br>
<br>
Booted into single and fdisk&#39;ed a new /dev/sdb2<br>
<br>
/dev/sda3 =A0 =A0 =A0 =A0 =A0 =A04298 =A0 =A0 =A0 30720 =A0 =A027057152 =A0=
 8e =A0Linux LVM<br>
/dev/sdb1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1 =A0 =A0 =A0 =A08485 =A0 =A068155731=
 =A0 83 =A0Linux<br>
/dev/sdb2 =A0 =A0 =A0 =A0 =A0 =A08486 =A0 =A0 =A0 38509 =A0 241167780 =A0 8=
3 =A0Linux<br>
<br>
<br>
Consulted my notes and did the following:<br>
<br>
pvcreate /dev/sdb2<br>
umount -vv /usr/local<br>
vgextend VolGroup00 /dev/sdb2<br>
lvextend -L 229.99G /dev/mapper/VolGroup00-<u></u>LogVol02<br>
e2fsck -f /dev/mapper/VolGroup00-<u></u>LogVol02<br>
resize2fs /dev/mapper/VolGroup00-<u></u>LogVol02<br>
mount -vv /usr/local<br>
df -h<br>
<br>
/dev/mapper/VolGroup00-<u></u>LogVol02 =A0227G =A0 68G =A0148G =A032% /usr/=
local<br>
<br>
My confusion came in when I saw 227G total and not 300G.<br>
My suspicion was confirmed with pvdisplay -s (and pvs)<br>
<br>
=A0 Device &quot;/dev/sda3&quot; has a capacity of 0<br>
=A0 Device &quot;/dev/sdb1&quot; has a capacity of 0<br>
=A0 Device &quot;/dev/sdb2&quot; has a capacity of 71.83 GiB<br>
<br>
=A0But I am confused even further; I thought pvdisplay was referring to the=
<br>
physical disks, but fdisk does not show a missing 71G for /dev/sdb2<br>
<br>
pvs<br>
=A0 PV =A0 =A0 =A0 =A0 VG =A0 =A0 =A0 =A0 Fmt =A0Attr PSize =A0 PFree<br>
=A0 /dev/sda3 =A0VolGroup00 lvm2 a-- =A0 25.80g =A0 =A0 0<br>
=A0 /dev/sdb1 =A0VolGroup00 lvm2 a-- =A0 65.00g =A0 =A0 0<br>
=A0 /dev/sdb2 =A0VolGroup00 lvm2 a-- =A0229.99g 71.83g<br>
<br>
vgs<br>
=A0 VG =A0 =A0 =A0 =A0 #PV #LV #SN Attr =A0 VSize =A0 VFree<br>
=A0 VolGroup00 =A0 3 =A0 4 =A0 0 wz--n- 320.79g 71.83g<br>
<br>
<br>
=3D=3D Questions =3D=3D<br>
Where did I go wrong, or did I go wrong?<br>
<br>
It obviously seems like I am missing 71G, but am I missing it and how do I<=
br>
go about reclaiming it?<br>
<br>
<br>
=3D=3D Additional data =3D=3D<br>
pvdisplay<br>
=A0 --- Physical volume ---<br>
=A0 PV Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 /dev/sda3<br>
=A0 VG Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 VolGroup00<br>
=A0 PV Size =A0 =A0 =A0 =A0 =A0 =A0 =A0 25.80 GiB / not usable 3.00 MiB<br>
=A0 Allocatable =A0 =A0 =A0 =A0 =A0 yes (but full)<br>
=A0 PE Size =A0 =A0 =A0 =A0 =A0 =A0 =A0 4.00 MiB<br>
=A0 Total PE =A0 =A0 =A0 =A0 =A0 =A0 =A06605<br>
=A0 Free PE =A0 =A0 =A0 =A0 =A0 =A0 =A0 0<br>
=A0 Allocated PE =A0 =A0 =A0 =A0 =A06605<br>
<br>
=A0 --- Physical volume ---<br>
=A0 PV Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 /dev/sdb1<br>
=A0 VG Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 VolGroup00<br>
=A0 PV Size =A0 =A0 =A0 =A0 =A0 =A0 =A0 65.00 GiB / not usable 2.33 MiB<br>
=A0 Allocatable =A0 =A0 =A0 =A0 =A0 yes (but full)<br>
=A0 PE Size =A0 =A0 =A0 =A0 =A0 =A0 =A0 4.00 MiB<br>
=A0 Total PE =A0 =A0 =A0 =A0 =A0 =A0 =A016639<br>
=A0 Free PE =A0 =A0 =A0 =A0 =A0 =A0 =A0 0<br>
=A0 Allocated PE =A0 =A0 =A0 =A0 =A016639<br>
<br>
=A0 --- Physical volume ---<br>
=A0 PV Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 /dev/sdb2<br>
=A0 VG Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 VolGroup00<br>
=A0 PV Size =A0 =A0 =A0 =A0 =A0 =A0 =A0 230.00 GiB / not usable 3.41 MiB<br=
>
=A0 Allocatable =A0 =A0 =A0 =A0 =A0 yes<br>
=A0 PE Size =A0 =A0 =A0 =A0 =A0 =A0 =A0 4.00 MiB<br>
=A0 Total PE =A0 =A0 =A0 =A0 =A0 =A0 =A058878<br>
=A0 Free PE =A0 =A0 =A0 =A0 =A0 =A0 =A0 18389<br>
=A0 Allocated PE =A0 =A0 =A0 =A0 =A040489<br>
<br>
<br>
<br>
vgdisplay -v<br>
=A0 =A0 Finding all volume groups<br>
=A0 =A0 Finding volume group &quot;VolGroup00&quot;<br>
=A0 --- Volume group ---<br>
=A0 VG Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 VolGroup00<br>
=A0 System ID<br>
=A0 Format =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0lvm2<br>
=A0 Metadata Areas =A0 =A0 =A0 =A03<br>
=A0 Metadata Sequence No =A09<br>
=A0 VG Access =A0 =A0 =A0 =A0 =A0 =A0 read/write<br>
=A0 VG Status =A0 =A0 =A0 =A0 =A0 =A0 resizable<br>
=A0 MAX LV =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00<br>
=A0 Cur LV =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A04<br>
=A0 Open LV =A0 =A0 =A0 =A0 =A0 =A0 =A0 4<br>
=A0 Max PV =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00<br>
=A0 Cur PV =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A03<br>
=A0 Act PV =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A03<br>
=A0 VG Size =A0 =A0 =A0 =A0 =A0 =A0 =A0 320.79 GiB<br>
=A0 PE Size =A0 =A0 =A0 =A0 =A0 =A0 =A0 4.00 MiB<br>
=A0 Total PE =A0 =A0 =A0 =A0 =A0 =A0 =A082122<br>
=A0 Alloc PE / Size =A0 =A0 =A0 63733 / 248.96 GiB<br>
=A0 Free =A0PE / Size =A0 =A0 =A0 18389 / 71.83 GiB<br>
<br>
=A0 --- Logical volume ---<br>
=A0 LV Path =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/dev/VolGroup00/LogVol01<br>
=A0 LV Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0LogVol01<br>
=A0 VG Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0VolGroup00<br>
=A0 LV Write Access =A0 =A0 =A0 =A0read/write<br>
=A0 LV Creation host, time ,<br>
=A0 LV Status =A0 =A0 =A0 =A0 =A0 =A0 =A0available<br>
=A0 # open =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1<br>
=A0 LV Size =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A05.86 GiB<br>
=A0 Current LE =A0 =A0 =A0 =A0 =A0 =A0 1500<br>
=A0 Segments =A0 =A0 =A0 =A0 =A0 =A0 =A0 1<br>
=A0 Allocation =A0 =A0 =A0 =A0 =A0 =A0 inherit<br>
=A0 Read ahead sectors =A0 =A0 auto<br>
=A0 - currently set to =A0 =A0 256<br>
=A0 Block device =A0 =A0 =A0 =A0 =A0 253:1<br>
<br>
=A0 --- Logical volume ---<br>
=A0 LV Path =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/dev/VolGroup00/LogVol00<br>
=A0 LV Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0LogVol00<br>
=A0 VG Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0VolGroup00<br>
=A0 LV Write Access =A0 =A0 =A0 =A0read/write<br>
=A0 LV Creation host, time ,<br>
=A0 LV Status =A0 =A0 =A0 =A0 =A0 =A0 =A0available<br>
=A0 # open =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1<br>
=A0 LV Size =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A07.32 GiB<br>
=A0 Current LE =A0 =A0 =A0 =A0 =A0 =A0 1875<br>
=A0 Segments =A0 =A0 =A0 =A0 =A0 =A0 =A0 1<br>
=A0 Allocation =A0 =A0 =A0 =A0 =A0 =A0 inherit<br>
=A0 Read ahead sectors =A0 =A0 auto<br>
=A0 - currently set to =A0 =A0 256<br>
=A0 Block device =A0 =A0 =A0 =A0 =A0 253:0<br>
<br>
=A0 --- Logical volume ---<br>
=A0 LV Path =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/dev/VolGroup00/LogVol03<br>
=A0 LV Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0LogVol03<br>
=A0 VG Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0VolGroup00<br>
=A0 LV Write Access =A0 =A0 =A0 =A0read/write<br>
=A0 LV Creation host, time ,<br>
=A0 LV Status =A0 =A0 =A0 =A0 =A0 =A0 =A0available<br>
=A0 # open =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1<br>
=A0 LV Size =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A05.78 GiB<br>
=A0 Current LE =A0 =A0 =A0 =A0 =A0 =A0 1480<br>
=A0 Segments =A0 =A0 =A0 =A0 =A0 =A0 =A0 1<br>
=A0 Allocation =A0 =A0 =A0 =A0 =A0 =A0 inherit<br>
=A0 Read ahead sectors =A0 =A0 auto<br>
=A0 - currently set to =A0 =A0 256<br>
=A0 Block device =A0 =A0 =A0 =A0 =A0 253:2<br>
<br>
=A0 --- Logical volume ---<br>
=A0 LV Path =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/dev/VolGroup00/LogVol02<br>
=A0 LV Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0LogVol02<br>
=A0 VG Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0VolGroup00<br>
=A0 LV Write Access =A0 =A0 =A0 =A0read/write<br>
=A0 LV Creation host, time ,<br>
=A0 LV Status =A0 =A0 =A0 =A0 =A0 =A0 =A0available<br>
=A0 # open =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1<br>
=A0 LV Size =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0229.99 GiB<br>
=A0 Current LE =A0 =A0 =A0 =A0 =A0 =A0 58878<br>
=A0 Segments =A0 =A0 =A0 =A0 =A0 =A0 =A0 3<br>
=A0 Allocation =A0 =A0 =A0 =A0 =A0 =A0 inherit<br>
=A0 Read ahead sectors =A0 =A0 auto<br>
=A0 - currently set to =A0 =A0 256<br>
=A0 Block device =A0 =A0 =A0 =A0 =A0 253:3<br>
<br>
=A0 --- Physical volumes ---<br>
=A0 PV Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 /dev/sda3<br>
=A0 PV Status =A0 =A0 =A0 =A0 =A0 =A0 allocatable<br>
=A0 Total PE / Free PE =A0 =A06605 / 0<br>
<br>
=A0 PV Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 /dev/sdb1<br>
=A0 PV Status =A0 =A0 =A0 =A0 =A0 =A0 allocatable<br>
=A0 Total PE / Free PE =A0 =A016639 / 0<br>
<br>
=A0 PV Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 /dev/sdb2<br>
=A0 PV Status =A0 =A0 =A0 =A0 =A0 =A0 allocatable<br>
=A0 Total PE / Free PE =A0 =A058878 / 18389<br>
<br>
<br>
<br>
lvdisplay -m<br>
=A0 --- Logical volume ---<br>
=A0 LV Path =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/dev/VolGroup00/LogVol01<br>
=A0 LV Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0LogVol01<br>
=A0 VG Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0VolGroup00<br>
=A0 LV Write Access =A0 =A0 =A0 =A0read/write<br>
=A0 LV Creation host, time ,<br>
=A0 LV Status =A0 =A0 =A0 =A0 =A0 =A0 =A0available<br>
=A0 # open =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1<br>
=A0 LV Size =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A05.86 GiB<br>
=A0 Current LE =A0 =A0 =A0 =A0 =A0 =A0 1500<br>
=A0 Segments =A0 =A0 =A0 =A0 =A0 =A0 =A0 1<br>
=A0 Allocation =A0 =A0 =A0 =A0 =A0 =A0 inherit<br>
=A0 Read ahead sectors =A0 =A0 auto<br>
=A0 - currently set to =A0 =A0 256<br>
=A0 Block device =A0 =A0 =A0 =A0 =A0 253:1<br>
<br>
=A0 --- Segments ---<br>
=A0 Logical extent 0 to 1499:<br>
=A0 =A0 Type =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0linear<br>
=A0 =A0 Physical volume =A0 =A0 /dev/sda3<br>
=A0 =A0 Physical extents =A0 =A00 to 1499<br>
<br>
<br>
=A0 --- Logical volume ---<br>
=A0 LV Path =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/dev/VolGroup00/LogVol00<br>
=A0 LV Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0LogVol00<br>
=A0 VG Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0VolGroup00<br>
=A0 LV Write Access =A0 =A0 =A0 =A0read/write<br>
=A0 LV Creation host, time ,<br>
=A0 LV Status =A0 =A0 =A0 =A0 =A0 =A0 =A0available<br>
=A0 # open =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1<br>
=A0 LV Size =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A07.32 GiB<br>
=A0 Current LE =A0 =A0 =A0 =A0 =A0 =A0 1875<br>
=A0 Segments =A0 =A0 =A0 =A0 =A0 =A0 =A0 1<br>
=A0 Allocation =A0 =A0 =A0 =A0 =A0 =A0 inherit<br>
=A0 Read ahead sectors =A0 =A0 auto<br>
=A0 - currently set to =A0 =A0 256<br>
=A0 Block device =A0 =A0 =A0 =A0 =A0 253:0<br>
<br>
=A0 --- Segments ---<br>
=A0 Logical extent 0 to 1874:<br>
=A0 =A0 Type =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0linear<br>
=A0 =A0 Physical volume =A0 =A0 /dev/sda3<br>
=A0 =A0 Physical extents =A0 =A01500 to 3374<br>
<br>
<br>
=A0 --- Logical volume ---<br>
=A0 LV Path =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/dev/VolGroup00/LogVol03<br>
=A0 LV Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0LogVol03<br>
=A0 VG Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0VolGroup00<br>
=A0 LV Write Access =A0 =A0 =A0 =A0read/write<br>
=A0 LV Creation host, time ,<br>
=A0 LV Status =A0 =A0 =A0 =A0 =A0 =A0 =A0available<br>
=A0 # open =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1<br>
=A0 LV Size =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A05.78 GiB<br>
=A0 Current LE =A0 =A0 =A0 =A0 =A0 =A0 1480<br>
=A0 Segments =A0 =A0 =A0 =A0 =A0 =A0 =A0 1<br>
=A0 Allocation =A0 =A0 =A0 =A0 =A0 =A0 inherit<br>
=A0 Read ahead sectors =A0 =A0 auto<br>
=A0 - currently set to =A0 =A0 256<br>
=A0 Block device =A0 =A0 =A0 =A0 =A0 253:2<br>
<br>
=A0 --- Segments ---<br>
=A0 Logical extent 0 to 1479:<br>
=A0 =A0 Type =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0linear<br>
=A0 =A0 Physical volume =A0 =A0 /dev/sda3<br>
=A0 =A0 Physical extents =A0 =A03375 to 4854<br>
<br>
<br>
=A0 --- Logical volume ---<br>
=A0 LV Path =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/dev/VolGroup00/LogVol02<br>
=A0 LV Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0LogVol02<br>
=A0 VG Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0VolGroup00<br>
=A0 LV Write Access =A0 =A0 =A0 =A0read/write<br>
=A0 LV Creation host, time ,<br>
=A0 LV Status =A0 =A0 =A0 =A0 =A0 =A0 =A0available<br>
=A0 # open =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1<br>
=A0 LV Size =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0229.99 GiB<br>
=A0 Current LE =A0 =A0 =A0 =A0 =A0 =A0 58878<br>
=A0 Segments =A0 =A0 =A0 =A0 =A0 =A0 =A0 3<br>
=A0 Allocation =A0 =A0 =A0 =A0 =A0 =A0 inherit<br>
=A0 Read ahead sectors =A0 =A0 auto<br>
=A0 - currently set to =A0 =A0 256<br>
=A0 Block device =A0 =A0 =A0 =A0 =A0 253:3<br>
<br>
=A0 --- Segments ---<br>
=A0 Logical extent 0 to 1749:<br>
=A0 =A0 Type =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0linear<br>
=A0 =A0 Physical volume =A0 =A0 /dev/sda3<br>
=A0 =A0 Physical extents =A0 =A04855 to 6604<br>
<br>
=A0 Logical extent 1750 to 18388:<br>
=A0 =A0 Type =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0linear<br>
=A0 =A0 Physical volume =A0 =A0 /dev/sdb1<br>
=A0 =A0 Physical extents =A0 =A00 to 16638<br>
<br>
=A0 Logical extent 18389 to 58877:<br>
=A0 =A0 Type =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0linear<br>
=A0 =A0 Physical volume =A0 =A0 /dev/sdb2<br>
=A0 =A0 Physical extents =A0 =A00 to 40488<br>
<br>
<br>
Many thanks in advance!<br>
Ogal<br>
<br>
<br>
<br></div></div>
------------------------------<u></u>------------------------------<u></u>-=
-----------<br>
<br>
______________________________<u></u>_________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/<u></u>mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-<u></u>HOWTO/</a><br>
</blockquote>
<br>
______________________________<u></u>_________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/<u></u>mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-<u></u>HOWTO/</a><br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>Ogal Finkles=
tein aka S.A. Birl<br><br>
</div>

--20cf301b5fe715166b04f48fe38e--
