Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3145B60BA3
	for <linux-lvm@redhat.com>; Tue, 29 May 2018 07:55:42 +0000 (UTC)
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7BB63311583C
	for <linux-lvm@redhat.com>; Tue, 29 May 2018 07:55:30 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id l19-v6so6761399ioj.5
	for <linux-lvm@redhat.com>; Tue, 29 May 2018 00:55:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAE7pJ3B-SkTihF=fvXvwW7sBZ=y8O4saGmLj+odY0ZeRx_5fvQ@mail.gmail.com>
References: <CAMuNeAvGqc3Hdt3bk1i1YuW7Y0SRd-ckJGKryfcSUW8EEQQzhw@mail.gmail.com>
	<CAE7pJ3B-SkTihF=fvXvwW7sBZ=y8O4saGmLj+odY0ZeRx_5fvQ@mail.gmail.com>
From: kAja Ziegler <ziegleka@gmail.com>
Date: Tue, 29 May 2018 09:55:29 +0200
Message-ID: <CAMuNeAu1OnQC0KZf=YTVPYy0QaX43=JEXa08GPx2rod7qmD61A@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000d66a6f056d538e0b"
Subject: Re: [linux-lvm] Move LV with GFS to new LUN (pvmove) in the cluster
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

--000000000000d66a6f056d538e0b
Content-Type: text/plain; charset="UTF-8"

On Thu, May 24, 2018 at 10:13 AM, emmanuel segura <emi2fast@gmail.com>
wrote:

> I used this procedure to archive what you need to do.
>
> 1: active cmirror on every cluster nodes
> 2: lvconvert -m 1 vg00/lvdata /dev/mapper/mapth1 --corelog #where mpath1
> is the new lun
>
> When the lvdata lv is in sync, now you can the dettach the old lun with
>
> lvconvert -m 0 vg00/lvdata /dev/mapper/mapth0
>
>
> 2018-05-23 14:31 GMT+02:00 kAja Ziegler <ziegleka@gmail.com>:
>
>> Hi all,
>>
>>  I want to ask if it is possible and safe to move online the clustered LV
>> with GFS on the one PV (multipathed LUN from the old storage) to an other
>> one (multipathed LUN on the new storage)?
>>
>> I found these articles in Red Hat knowledgebase:
>>
>> - Can I perform a pvmove on a clustered logical volume? -
>> https://access.redhat.com/solutions/39894
>> - How to migrate SAN LUNs which has Clustered LVM configured on it? -
>> https://access.redhat.com/solutions/466533
>>
>> With regard to the mentioned articles it can be done, it is only needed
>> to install and run the cmirror service. Should I expect any problems or
>> other prerequisites?
>>
>>
>> My clustered environment:
>>
>> - 8 nodes - CentOS 6.9
>> - LVM version:     2.02.143(2)-RHEL6 (2016-12-13)
>>   Library version: 1.02.117-RHEL6 (2016-12-13)
>>   Driver version:  4.33.1
>> - 7 clustered VGs overall
>> - 1 LV with GFS mounted on all nodes
>>
>>
>> - 1 clustered VG with 1 PV and 1 LV on which it is GFS:
>>
>> [root@...]# pvdisplay /dev/mapper/35001b4d01b1da512
>>   --- Physical volume ---
>>   PV Name               /dev/mapper/35001b4d01b1da512
>>   VG Name               vg_1
>>   PV Size               4.55 TiB / not usable 2.00 MiB
>>   Allocatable           yes
>>   PE Size               4.00 MiB
>>   Total PE              1192092
>>   Free PE               1115292
>>   Allocated PE          76800
>>   PV UUID               jH1ubM-ElJv-632D-NG8x-jzgJ-mwtA-pxxL90
>>
>> [root@...]# lvdisplay vg_1/lv_gfs
>>   --- Logical volume ---
>>   LV Path                /dev/vg_1/lv_gfs
>>   LV Name                lv_gfs
>>   VG Name                vg_1
>>   LV UUID                OsJ8hM-sH9k-KNs1-B1UD-3qe2-6vja-hLsrYY
>>   LV Write Access        read/write
>>   LV Creation host, time ,
>>   LV Status              available
>>   # open                 1
>>   LV Size                300.00 GiB
>>   Current LE             76800
>>   Segments               1
>>   Allocation             inherit
>>   Read ahead sectors     auto
>>   - currently set to     256
>>   Block device           253:418
>>
>> [root@...]# vgdisplay vg_1
>>   --- Volume group ---
>>   VG Name               vg_1
>>   System ID
>>   Format                lvm2
>>   Metadata Areas        1
>>   Metadata Sequence No  3898
>>   VG Access             read/write
>>   VG Status             resizable
>>   Clustered             yes
>>   Shared                no
>>   MAX LV                0
>>   Cur LV                1
>>   Open LV               1
>>   Max PV                0
>>   Cur PV                1
>>   Act PV                1
>>   VG Size               4.55 TiB
>>   PE Size               4.00 MiB
>>   Total PE              1192092
>>   Alloc PE / Size       76800 / 300.00 GiB
>>   Free  PE / Size       1115292 / 4.25 TiB
>>   VG UUID               PtMo7F-XIbC-YSA0-rCQQ-R1oE-g8B7-PiAeIR
>>
>>
>> - IO activity on the PV (LUN) is very low - from iostat and average per
>> node: 2.5 tps , 20.03 Blk_read/s and 0 Blk_wrtn/s in 1 minute.
>>
>>
>> Thank you for your opinions and experience.
>>
>> Have a great day and with best regards,
>> --
>> Karel Ziegler
>>
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>
>
>
> --
>   .~.
>   /V\
>  //  \\
> /(   )\
> ^`~'^
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>


Hi Emmanuel and the others,

 so it is better to perform lvconvert or pvmove (if it is supported) on a
clustered logical volume?

With best regards,
-- 
Karel Ziegler

--000000000000d66a6f056d538e0b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote">On Thu, May 24, 2018 at 10:13 A=
M, emmanuel segura <span dir=3D"ltr">&lt;<a href=3D"mailto:emi2fast@gmail.c=
om" target=3D"_blank">emi2fast@gmail.com</a>&gt;</span> wrote:<br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex"><div dir=3D"ltr"><div><div>I used this procedure to a=
rchive what you need to do.<br><br></div>1: active cmirror on every cluster=
 nodes<br>2: <code>lvconvert -m 1 vg00/lvdata /dev/mapper/mapth1 --corelog =
#where mpath1 is the new lun<br><br></code></div><code>When the lvdata lv i=
s in sync, now you can the dettach the old lun with<br><br><code>lvconvert =
-m 0 vg00/lvdata /dev/mapper/mapth0</code><br></code><div><br></div></div><=
div class=3D"gmail_extra"><br><div class=3D"gmail_quote">2018-05-23 14:31 G=
MT+02:00 kAja Ziegler <span dir=3D"ltr">&lt;<a href=3D"mailto:ziegleka@gmai=
l.com" target=3D"_blank">ziegleka@gmail.com</a>&gt;</span>:<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><div dir=3D"ltr"><div>Hi all,<br></div><div><br></div><d=
iv>=C2=A0I want to ask if it is possible and safe to move online the cluste=
red LV with GFS on the one PV (multipathed LUN from the old storage) to an =
other one (multipathed LUN on the new storage)?</div><div><br></div><div>I =
found these articles in Red Hat knowledgebase:</div><br>- Can I perform a p=
vmove on a clustered logical volume? - <a href=3D"https://access.redhat.com=
/solutions/39894" target=3D"_blank">https://access.redhat.com/solu<wbr>tion=
s/39894</a><br>- How to migrate SAN LUNs which has Clustered LVM configured=
 on it? - <a href=3D"https://access.redhat.com/solutions/466533" target=3D"=
_blank">https://access.redhat.com/solu<wbr>tions/466533</a><br><div><br></d=
iv><div>With regard to the mentioned articles it can be done, i<span id=3D"=
m_2233255349758682097m_-4398757846952401978gmail-result_box" class=3D"m_223=
3255349758682097m_-4398757846952401978gmail-" lang=3D"en"><span class=3D"m_=
2233255349758682097m_-4398757846952401978gmail-">t is only needed to instal=
l and run the cmirror service. Should I expect any problems or other prereq=
uisites?<br></span></span></div><div><span id=3D"m_2233255349758682097m_-43=
98757846952401978gmail-result_box" class=3D"m_2233255349758682097m_-4398757=
846952401978gmail-" lang=3D"en"><span class=3D"m_2233255349758682097m_-4398=
757846952401978gmail-"><br></span></span></div><div><span id=3D"m_223325534=
9758682097m_-4398757846952401978gmail-result_box" class=3D"m_22332553497586=
82097m_-4398757846952401978gmail-" lang=3D"en"><span class=3D"m_22332553497=
58682097m_-4398757846952401978gmail-"><br></span></span></div><div><span id=
=3D"m_2233255349758682097m_-4398757846952401978gmail-result_box" class=3D"m=
_2233255349758682097m_-4398757846952401978gmail-" lang=3D"en"><span class=
=3D"m_2233255349758682097m_-4398757846952401978gmail-">My clustered environ=
ment:</span></span></div><div><span id=3D"m_2233255349758682097m_-439875784=
6952401978gmail-result_box" class=3D"m_2233255349758682097m_-43987578469524=
01978gmail-" lang=3D"en"><span class=3D"m_2233255349758682097m_-43987578469=
52401978gmail-"><br></span></span></div><div><span id=3D"m_2233255349758682=
097m_-4398757846952401978gmail-result_box" class=3D"m_2233255349758682097m_=
-4398757846952401978gmail-" lang=3D"en"><span class=3D"m_223325534975868209=
7m_-4398757846952401978gmail-">- 8 nodes - CentOS 6.9</span></span></div><d=
iv><span id=3D"m_2233255349758682097m_-4398757846952401978gmail-result_box"=
 class=3D"m_2233255349758682097m_-4398757846952401978gmail-" lang=3D"en"><s=
pan class=3D"m_2233255349758682097m_-4398757846952401978gmail-">- </span></=
span><span id=3D"m_2233255349758682097m_-4398757846952401978gmail-result_bo=
x" class=3D"m_2233255349758682097m_-4398757846952401978gmail-" lang=3D"en">=
<span class=3D"m_2233255349758682097m_-4398757846952401978gmail-">LVM versi=
on:=C2=A0=C2=A0=C2=A0=C2=A0 2.02.143(2)-RHEL6 (2016-12-13)<br>=C2=A0 Librar=
y version: 1.02.117-RHEL6 (2016-12-13)</span></span><br></div><div>=C2=A0 D=
river version: =C2=A04.33.1<br>- 7 clustered VGs overall<br></div><div>- 1 =
LV with GFS mounted on all nodes<br></div><div><br></div><div><br></div><di=
v><span id=3D"m_2233255349758682097m_-4398757846952401978gmail-result_box" =
class=3D"m_2233255349758682097m_-4398757846952401978gmail-" lang=3D"en"><sp=
an class=3D"m_2233255349758682097m_-4398757846952401978gmail-">- 1 clustere=
d VG with 1 PV and 1 LV on which it is GFS:</span></span></div><div><span i=
d=3D"m_2233255349758682097m_-4398757846952401978gmail-result_box" class=3D"=
m_2233255349758682097m_-4398757846952401978gmail-" lang=3D"en"><span class=
=3D"m_2233255349758682097m_-4398757846952401978gmail-"><br></span></span></=
div><div><span id=3D"m_2233255349758682097m_-4398757846952401978gmail-resul=
t_box" class=3D"m_2233255349758682097m_-4398757846952401978gmail-" lang=3D"=
en"><span class=3D"m_2233255349758682097m_-4398757846952401978gmail-">[root=
@...]# pvdisplay /dev/mapper/35001b4d01b1da512<br>=C2=A0 --- Physical volum=
e ---<br>=C2=A0 PV Name=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /dev/mapper/35001b4d01b1da512<br>=C2=A0 V=
G Name=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 vg_1<br>=C2=A0 PV Size=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.55 TiB / not usable 2.00=
 MiB<br>=C2=A0 Allocatable=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 yes<br>=C2=A0 PE Size=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.00 MiB<br>=C2=A0 Total PE=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 1192092<br>=C2=A0 Free PE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1115292<br>=C2=A0 Allocated PE=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 76800<br>=C2=A0 PV UUID=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 jH1ubM-ElJv-632D-NG8x-jzgJ-mwt<wbr>A-pxxL90<br></span></span></di=
v><div><span id=3D"m_2233255349758682097m_-4398757846952401978gmail-result_=
box" class=3D"m_2233255349758682097m_-4398757846952401978gmail-" lang=3D"en=
"><span class=3D"m_2233255349758682097m_-4398757846952401978gmail-"><br></s=
pan></span></div><div><span id=3D"m_2233255349758682097m_-43987578469524019=
78gmail-result_box" class=3D"m_2233255349758682097m_-4398757846952401978gma=
il-" lang=3D"en"><span class=3D"m_2233255349758682097m_-4398757846952401978=
gmail-">[root@...]# lvdisplay vg_1/lv_gfs<br>=C2=A0 --- Logical volume ---<=
br>=C2=A0 LV Path=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /dev/vg_1/lv_gfs<br>=C2=A0 LV Name=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 lv_gfs<br>=C2=A0 VG Name=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vg_1<br>=C2=A0 LV UUID=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 OsJ8hM-sH9k-KNs1-B1UD-3qe2-6vj<wbr>a-hLsrYY<br>=C2=A0 LV Wr=
ite Access=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 read/write<br>=C2=A0 L=
V Creation host, time ,<br>=C2=A0 LV Status=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 available<br>=C2=A0 # open=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 1<br>=C2=A0 LV Size=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 300.00 GiB<br>=C2=
=A0 Current LE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 76800<br>=C2=A0 Segments=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1<br>=C2=A0 Allocation=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inher=
it<br>=C2=A0 Read ahead sectors=C2=A0=C2=A0=C2=A0=C2=A0 auto<br>=C2=A0 - cu=
rrently set to=C2=A0=C2=A0=C2=A0=C2=A0 256<br>=C2=A0 Block device=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 253:418<br></span></spa=
n></div><div><span id=3D"m_2233255349758682097m_-4398757846952401978gmail-r=
esult_box" class=3D"m_2233255349758682097m_-4398757846952401978gmail-" lang=
=3D"en"><span class=3D"m_2233255349758682097m_-4398757846952401978gmail-"><=
br></span></span></div><div><span id=3D"m_2233255349758682097m_-43987578469=
52401978gmail-result_box" class=3D"m_2233255349758682097m_-4398757846952401=
978gmail-" lang=3D"en"><span class=3D"m_2233255349758682097m_-4398757846952=
401978gmail-">[root@...]# vgdisplay vg_1<br>=C2=A0 --- Volume group ---<br>=
=C2=A0 VG Name=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 vg_1<br>=C2=A0 System ID<br>=C2=A0 Format=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 lvm2<br>=C2=A0 Metadata Areas=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 1<br>=C2=A0 Metadata Sequence No=C2=A0 3898<br>=C2=A0 VG Access=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 read/wri=
te<br>=C2=A0 VG Status=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 resizable<br>=C2=A0 Clustered=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 yes<br>=C2=A0 Shared=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 no<br>=C2=A0 MAX LV=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0<br>=C2=A0 Cur LV=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 1<br>=C2=A0 Open LV=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1<br>=C2=A0 Max PV=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0<=
br>=C2=A0 Cur PV=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1<br>=C2=A0 Act PV=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1<br>=
=C2=A0 VG Size=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 4.55 TiB<br>=C2=A0 PE Size=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.00 MiB<br>=
=C2=A0 Total PE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 1192092<br>=C2=A0 Alloc PE / Size=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 76800 / 300.00 GiB<br>=C2=A0 Free=C2=A0 PE / Size=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 1115292 / 4.25 TiB<br>=C2=A0 VG UUID=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 PtMo7F-XIbC-YSA0-rCQQ-R1oE-g8B<wbr>7-PiAeIR<br></span></span></div><div><s=
pan id=3D"m_2233255349758682097m_-4398757846952401978gmail-result_box" clas=
s=3D"m_2233255349758682097m_-4398757846952401978gmail-" lang=3D"en"><span c=
lass=3D"m_2233255349758682097m_-4398757846952401978gmail-"><span id=3D"m_22=
33255349758682097m_-4398757846952401978gmail-result_box" class=3D"m_2233255=
349758682097m_-4398757846952401978gmail-" lang=3D"en"><span class=3D"m_2233=
255349758682097m_-4398757846952401978gmail-"></span></span><br></span></spa=
n></div><div><span id=3D"m_2233255349758682097m_-4398757846952401978gmail-r=
esult_box" class=3D"m_2233255349758682097m_-4398757846952401978gmail-" lang=
=3D"en"><span class=3D"m_2233255349758682097m_-4398757846952401978gmail-"><=
br></span></span></div><div>- IO activity on the PV (LUN) is very low - fro=
m iostat and average per node: 2.5 tps , 20.03 Blk_read/s and 0 Blk_wrtn/s =
in 1 minute.<br></div><div><br></div><div><br></div><div><span id=3D"m_2233=
255349758682097m_-4398757846952401978gmail-result_box" class=3D"m_223325534=
9758682097m_-4398757846952401978gmail-short_text" lang=3D"en"><span class=
=3D"m_2233255349758682097m_-4398757846952401978gmail-">Thank you for your o=
pinions and experience.</span></span></div><div><span id=3D"m_2233255349758=
682097m_-4398757846952401978gmail-result_box" class=3D"m_223325534975868209=
7m_-4398757846952401978gmail-short_text" lang=3D"en"><span class=3D"m_22332=
55349758682097m_-4398757846952401978gmail-"><br></span></span></div><div><s=
pan id=3D"m_2233255349758682097m_-4398757846952401978gmail-result_box" clas=
s=3D"m_2233255349758682097m_-4398757846952401978gmail-short_text" lang=3D"e=
n"><span class=3D"m_2233255349758682097m_-4398757846952401978gmail-">Have a=
 great day and with best regards,</span></span><span class=3D"HOEnZb"><font=
 color=3D"#888888"><span class=3D"m_2233255349758682097HOEnZb"><font color=
=3D"#888888"><br></font></span></font></span></div><span class=3D"HOEnZb"><=
font color=3D"#888888"><span class=3D"m_2233255349758682097HOEnZb"><font co=
lor=3D"#888888"><div><div><div><div class=3D"m_2233255349758682097m_-439875=
7846952401978gmail-m_5684586875341332126gmail_signature">-- <br>Karel Ziegl=
er<br><br></div></div>
</div></div></font></span></font></span></div><span class=3D"HOEnZb"><font =
color=3D"#888888">
<br>______________________________<wbr>_________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" rel=3D"norefe=
rrer" target=3D"_blank">https://www.redhat.com/mailman<wbr>/listinfo/linux-=
lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"=
noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWT<wbr>O/</a><br>=
</font></span></blockquote></div><span class=3D"HOEnZb"><font color=3D"#888=
888"><br><br clear=3D"all"><br>-- <br><div class=3D"m_2233255349758682097gm=
ail_signature" data-smartmail=3D"gmail_signature">=C2=A0 .~.<br>=C2=A0 /V\<=
br>=C2=A0// =C2=A0\\<br>/( =C2=A0 )\<br>^`~&#39;^</div>
</font></span></div>
<br>______________________________<wbr>_________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" rel=3D"norefe=
rrer" target=3D"_blank">https://www.redhat.com/<wbr>mailman/listinfo/linux-=
lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"=
noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-<wbr>HOWTO/</a><br>=
</blockquote></div><div class=3D"gmail_extra"><br></div><div class=3D"gmail=
_extra"><br></div><div class=3D"gmail_extra">Hi Emmanuel and the others,</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=C2=A0so=
 it is better to perform lvconvert or pvmove (if it is supported) on a clus=
tered logical volume?<br><div class=3D"gmail_extra"><br></div><div class=3D=
"gmail_extra">With best regards,<br clear=3D"all"></div><div class=3D"gmail=
_extra"><div><div class=3D"gmail_signature">-- <br>Karel Ziegler</div></div=
></div><br></div></div>

--000000000000d66a6f056d538e0b--
