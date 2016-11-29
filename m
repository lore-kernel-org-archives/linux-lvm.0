Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uATF7dOD002156
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 29 Nov 2016 10:07:39 -0500
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 10D504E4F6
	for <linux-lvm@redhat.com>; Tue, 29 Nov 2016 15:07:38 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id f82so191140514wmf.1
	for <linux-lvm@redhat.com>; Tue, 29 Nov 2016 07:07:37 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAFQqb_GcXvCKAXgGGJvb03MiKyzQWP4RRjyRYurMMynPdgBGXA@mail.gmail.com>
References: <CAFQqb_GcXvCKAXgGGJvb03MiKyzQWP4RRjyRYurMMynPdgBGXA@mail.gmail.com>
From: Lorenzo Dalrio <lorenzo.dalrio@gmail.com>
Date: Tue, 29 Nov 2016 16:07:15 +0100
Message-ID: <CAFQqb_HSYLxA_KHaiWqxKyBZ-bZbKkSYe8iHJxMiwYVy8rdU=Q@mail.gmail.com>
Content-Type: multipart/alternative; boundary=001a11470694d6de47054271f2ef
Subject: Re: [linux-lvm] pvmove launched on inactive vg
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

--001a11470694d6de47054271f2ef
Content-Type: text/plain; charset=UTF-8

The problem has been solved by relocating the cluster resources to the
inactive node. pvmove has finished the job once the vg were active on the
node where the command was launched.

Thank you,
-- 
Lorenzo Dalrio

2016-11-09 13:16 GMT+01:00 Lorenzo Dalrio <lorenzo.dalrio@gmail.com>:

> Hi,
> we have a 2-node cluster with some ha-lvm resources on it. Storage
> folks asked us to migrate the lun where those vgs are. They provided
> us with new luns of the same size.
> We followed a standard procedure of
>
> pvcreate /dev/mapper/new_lun
> vgextend vg /dev/mapper/new_lun
> pvmove /dev/mapper/old_lun /dev/mapper/new_lun
>
> Here is the problem: some vgs were active on a node and some other vgs
> where active on the other node. We have run pvmove for all the vgs on
> the first node that completed its active vgs without problem, but left
> the other in a intermediate state where pvmove detects the move in
> progress but doesn't seem to proceed.
>
> here is the output of lvs -av:
>
>     Found same device /dev/mapper/vPLONE07 with same pvid
> WH6unuymepW89nwmSLqweMPTUoeypLlW
>     Found same device /dev/mapper/vPLONE06 with same pvid
> mnK6EtFiLH2G5yMLSZ0179zKGdERxQI1
>     Found same device /dev/mapper/vPLONE07 with same pvid
> WH6unuymepW89nwmSLqweMPTUoeypLlW
>     Found same device /dev/mapper/vd_PLONE_05 with same pvid
> gsfXREbuaXiTj96U72Mia9UPJOGwuvxo
>     Found same device /dev/mapper/vPLONE05 with same pvid
> QXEsmAhzG2iFa05LfFE5kl40H8UoV6UG
>     Found same device /dev/mapper/vPLONE06 with same pvid
> mnK6EtFiLH2G5yMLSZ0179zKGdERxQI1
>     Found same device /dev/mapper/vd_PLONE_04 with same pvid
> Jkc3DYEbNAkQwvfH8HBar0BfMy56p68U
>     Found same device /dev/mapper/vPLONE04 with same pvid
> C0bLL0ka1j0a8msqs6h9RKOgxWfWAVtj
>     Found same device /dev/mapper/vPLONE05 with same pvid
> QXEsmAhzG2iFa05LfFE5kl40H8UoV6UG
>     Found same device /dev/mapper/vd_PLONE_05 with same pvid
> gsfXREbuaXiTj96U72Mia9UPJOGwuvxo
>     Found same device /dev/mapper/vd_PLONE_03 with same pvid
> cMoQ7J4qkihBUwWSPB13Wd7QkcXQlN7J
>     Found same device /dev/mapper/vPLONE03 with same pvid
> spC75FaZhB5l5cx1CoMtB8MO0gkSqb2r
>     Found same device /dev/mapper/vd_PLONE_04 with same pvid
> Jkc3DYEbNAkQwvfH8HBar0BfMy56p68U
>     Found same device /dev/mapper/vPLONE04 with same pvid
> C0bLL0ka1j0a8msqs6h9RKOgxWfWAVtj
>     Found same device /dev/mapper/vd_PLONE_02 with same pvid
> odB8kFMhlcP8UdPc7aLBsUPqM4eKRZ2H
>     Found same device /dev/mapper/vPLONE02 with same pvid
> bzttEe6Z0YGLfZzdvvDFUozk7MsM1mmn
>     Found same device /dev/mapper/vPLONE03 with same pvid
> spC75FaZhB5l5cx1CoMtB8MO0gkSqb2r
>     Found same device /dev/mapper/vd_PLONE_03 with same pvid
> cMoQ7J4qkihBUwWSPB13Wd7QkcXQlN7J
>     Found same device /dev/mapper/vd_PLONE_01 with same pvid
> LQ5X7UYOAW3ILCBH5Yv7np32zQrxd1cd
>     Found same device /dev/mapper/vPLONE01 with same pvid
> 2V2lLklWhZDSh1hdYzPsfqs9kEp9pVfR
>     Found same device /dev/mapper/vd_PLONE_02 with same pvid
> odB8kFMhlcP8UdPc7aLBsUPqM4eKRZ2H
>     Found same device /dev/mapper/vPLONE02 with same pvid
> bzttEe6Z0YGLfZzdvvDFUozk7MsM1mmn
>     Found same device /dev/sda2 with same pvid
> JYCsWcY7TjLh0UbDjjnwm2kU70itCLia
>     Found same device /dev/mapper/vd_PLONE_01 with same pvid
> LQ5X7UYOAW3ILCBH5Yv7np32zQrxd1cd
>     Found same device /dev/mapper/vPLONE01 with same pvid
> 2V2lLklWhZDSh1hdYzPsfqs9kEp9pVfR
>   LV            VG            #Seg Attr       LSize   Maj Min KMaj
> KMin Pool Origin Data%  Meta%  Move                    Cpy%Sync Log
> Convert LV UUID                                LProfile
>   root          centos           1 -wi-ao----  40.54g  -1  -1  253
> 0
>   BCGuH9-3669-xwV1-o541-XfyY-m2hI-Ulde9F
>   swap          centos           1 -wi-ao----   4.56g  -1  -1  253
> 1
>   0MKiBs-XuBd-3yUw-eXpr-7Ofj-Cva8-o0c6JY
>   lv_assemblea  vg_assemblea     1 -wi-ao----  50.00g  -1  -1  253
> 10
>    NxHrKd-RbGz-bnXW-7LQE-A4kS-2mIB-JZU2hk
>   lv_bur        vg_bur           1 -wI-------  40.00g  -1  -1   -1
> -1
>    Mg67Sx-ke62-n3Q9-CWqO-e7Zo-R9pc-BQMhRE
>   [pvmove0]     vg_bur           1 p-C---m---  40.00g  -1  -1   -1
> -1                           /dev/mapper/vd_PLONE_01
>    ILbHqP-IOlz-e4e9-eThD-QwGd-D7Z4-KOzsmL
>   lv_ermes      vg_ermes         1 -wI-------  40.00g  -1  -1   -1
> -1
>    DZTKAk-X047-eOai-rpDp-Uciw-CxUr-uCgOZC
>   [pvmove0]     vg_ermes         1 p-C---m---  40.00g  -1  -1   -1
> -1                           /dev/mapper/vd_PLONE_03
>    NOV7rE-rWbI-msda-53LT-d9tk-cutV-K2ok6s
>   lv_geoportale vg_geoportale    1 -wi-ao----  10.00g  -1  -1  253
> 9
>   I1YWt5-sHZu-fEl6-qeW2-JDlw-NHWB-jAHp0m
>   lv_groupware  vg_groupware     1 -wI-------  10.00g  -1  -1   -1
> -1
>    a10Lpj-2Ni7-RzNA-Nf8p-3LnT-4mYh-spTIyj
>   [pvmove0]     vg_groupware     1 p-C---m---  10.00g  -1  -1   -1
> -1                           /dev/mapper/vd_PLONE_05
>    0MVtil-lIF2-p4lu-2ZhZ-FYb8-ojdq-PmygpF
>   lv_internos   vg_internos      1 -wI-------  40.00g  -1  -1   -1
> -1
>    cZEwfL-kZ4G-vKLy-92aX-KKOW-IFkj-Ne0VdR
>   [pvmove0]     vg_internos      1 p-C---m---  40.00g  -1  -1   -1
> -1                           /dev/mapper/vd_PLONE_02
>    Yh9UrO-BF42-ETkw-mFxr-VDHE-s6He-dLfX1l
>   lv_portali    vg_portali       1 -wI------- 300.00g  -1  -1   -1
> -1
>    IvfQsy-8XAF-qT7D-X52j-cR11-egyL-3WHlMf
>   [pvmove0]     vg_portali       1 p-C---m--- 300.00g  -1  -1   -1
> -1                           /dev/mapper/vd_PLONE_04
>    cGkqJx-0R7h-at97-E8yt-BCwA-ljCm-p8rcRj
>
>
>
> Any advice on how to proceed?
>
> Thank you,
>
> --
> Lorenzo Dalrio
>

--001a11470694d6de47054271f2ef
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The problem has been solved by relocating the cluster=
 resources to the inactive node. pvmove has finished the job once the vg we=
re active on the node where the command was launched.<br><br></div>Thank yo=
u,<br clear=3D"all"><div class=3D"gmail_extra"><div><div class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=
=3D"ltr"><div>--=C2=A0<br>Lorenzo Dalrio</div></div></div></div></div></div=
>
<br><div class=3D"gmail_quote">2016-11-09 13:16 GMT+01:00 Lorenzo Dalrio <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:lorenzo.dalrio@gmail.com" target=3D"_=
blank">lorenzo.dalrio@gmail.com</a>&gt;</span>:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">Hi,<br>
we have a 2-node cluster with some ha-lvm resources on it. Storage<br>
folks asked us to migrate the lun where those vgs are. They provided<br>
us with new luns of the same size.<br>
We followed a standard procedure of<br>
<br>
pvcreate /dev/mapper/new_lun<br>
vgextend vg /dev/mapper/new_lun<br>
pvmove /dev/mapper/old_lun /dev/mapper/new_lun<br>
<br>
Here is the problem: some vgs were active on a node and some other vgs<br>
where active on the other node. We have run pvmove for all the vgs on<br>
the first node that completed its active vgs without problem, but left<br>
the other in a intermediate state where pvmove detects the move in<br>
progress but doesn&#39;t seem to proceed.<br>
<br>
here is the output of lvs -av:<br>
<br>
=C2=A0 =C2=A0 Found same device /dev/mapper/vPLONE07 with same pvid<br>
WH6unuymepW89nwmSLqweMPTUoeypL<wbr>lW<br>
=C2=A0 =C2=A0 Found same device /dev/mapper/vPLONE06 with same pvid<br>
mnK6EtFiLH2G5yMLSZ0179zKGdERxQ<wbr>I1<br>
=C2=A0 =C2=A0 Found same device /dev/mapper/vPLONE07 with same pvid<br>
WH6unuymepW89nwmSLqweMPTUoeypL<wbr>lW<br>
=C2=A0 =C2=A0 Found same device /dev/mapper/vd_PLONE_05 with same pvid<br>
gsfXREbuaXiTj96U72Mia9UPJOGwuv<wbr>xo<br>
=C2=A0 =C2=A0 Found same device /dev/mapper/vPLONE05 with same pvid<br>
QXEsmAhzG2iFa05LfFE5kl40H8UoV6<wbr>UG<br>
=C2=A0 =C2=A0 Found same device /dev/mapper/vPLONE06 with same pvid<br>
mnK6EtFiLH2G5yMLSZ0179zKGdERxQ<wbr>I1<br>
=C2=A0 =C2=A0 Found same device /dev/mapper/vd_PLONE_04 with same pvid<br>
Jkc3DYEbNAkQwvfH8HBar0BfMy56p6<wbr>8U<br>
=C2=A0 =C2=A0 Found same device /dev/mapper/vPLONE04 with same pvid<br>
C0bLL0ka1j0a8msqs6h9RKOgxWfWAV<wbr>tj<br>
=C2=A0 =C2=A0 Found same device /dev/mapper/vPLONE05 with same pvid<br>
QXEsmAhzG2iFa05LfFE5kl40H8UoV6<wbr>UG<br>
=C2=A0 =C2=A0 Found same device /dev/mapper/vd_PLONE_05 with same pvid<br>
gsfXREbuaXiTj96U72Mia9UPJOGwuv<wbr>xo<br>
=C2=A0 =C2=A0 Found same device /dev/mapper/vd_PLONE_03 with same pvid<br>
cMoQ7J4qkihBUwWSPB13Wd7QkcXQlN<wbr>7J<br>
=C2=A0 =C2=A0 Found same device /dev/mapper/vPLONE03 with same pvid<br>
spC75FaZhB5l5cx1CoMtB8MO0gkSqb<wbr>2r<br>
=C2=A0 =C2=A0 Found same device /dev/mapper/vd_PLONE_04 with same pvid<br>
Jkc3DYEbNAkQwvfH8HBar0BfMy56p6<wbr>8U<br>
=C2=A0 =C2=A0 Found same device /dev/mapper/vPLONE04 with same pvid<br>
C0bLL0ka1j0a8msqs6h9RKOgxWfWAV<wbr>tj<br>
=C2=A0 =C2=A0 Found same device /dev/mapper/vd_PLONE_02 with same pvid<br>
odB8kFMhlcP8UdPc7aLBsUPqM4eKRZ<wbr>2H<br>
=C2=A0 =C2=A0 Found same device /dev/mapper/vPLONE02 with same pvid<br>
bzttEe6Z0YGLfZzdvvDFUozk7MsM1m<wbr>mn<br>
=C2=A0 =C2=A0 Found same device /dev/mapper/vPLONE03 with same pvid<br>
spC75FaZhB5l5cx1CoMtB8MO0gkSqb<wbr>2r<br>
=C2=A0 =C2=A0 Found same device /dev/mapper/vd_PLONE_03 with same pvid<br>
cMoQ7J4qkihBUwWSPB13Wd7QkcXQlN<wbr>7J<br>
=C2=A0 =C2=A0 Found same device /dev/mapper/vd_PLONE_01 with same pvid<br>
LQ5X7UYOAW3ILCBH5Yv7np32zQrxd1<wbr>cd<br>
=C2=A0 =C2=A0 Found same device /dev/mapper/vPLONE01 with same pvid<br>
2V2lLklWhZDSh1hdYzPsfqs9kEp9pV<wbr>fR<br>
=C2=A0 =C2=A0 Found same device /dev/mapper/vd_PLONE_02 with same pvid<br>
odB8kFMhlcP8UdPc7aLBsUPqM4eKRZ<wbr>2H<br>
=C2=A0 =C2=A0 Found same device /dev/mapper/vPLONE02 with same pvid<br>
bzttEe6Z0YGLfZzdvvDFUozk7MsM1m<wbr>mn<br>
=C2=A0 =C2=A0 Found same device /dev/sda2 with same pvid JYCsWcY7TjLh0UbDjj=
nwm2kU70itCL<wbr>ia<br>
=C2=A0 =C2=A0 Found same device /dev/mapper/vd_PLONE_01 with same pvid<br>
LQ5X7UYOAW3ILCBH5Yv7np32zQrxd1<wbr>cd<br>
=C2=A0 =C2=A0 Found same device /dev/mapper/vPLONE01 with same pvid<br>
2V2lLklWhZDSh1hdYzPsfqs9kEp9pV<wbr>fR<br>
=C2=A0 LV=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VG=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 #Seg Attr=C2=A0 =C2=A0 =C2=A0 =C2=A0LSize=C2=A0 =C2=A0=
Maj Min KMaj<br>
KMin Pool Origin Data%=C2=A0 Meta%=C2=A0 Move=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Cpy%Sync Log<br>
Convert LV UUID=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LProfile<br>
=C2=A0 root=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 centos=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A01 -wi-ao----=C2=A0 40.54g=C2=A0 -1=C2=A0 -1=C2=A0 253<b=
r>
0<br>
=C2=A0 BCGuH9-3669-xwV1-o541-XfyY-<wbr>m2hI-Ulde9F<br>
=C2=A0 swap=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 centos=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A01 -wi-ao----=C2=A0 =C2=A04.56g=C2=A0 -1=C2=A0 -1=C2=A0 =
253<br>
1<br>
=C2=A0 0MKiBs-XuBd-3yUw-eXpr-7Ofj-<wbr>Cva8-o0c6JY<br>
=C2=A0 lv_assemblea=C2=A0 vg_assemblea=C2=A0 =C2=A0 =C2=A01 -wi-ao----=C2=
=A0 50.00g=C2=A0 -1=C2=A0 -1=C2=A0 253<br>
10<br>
=C2=A0 =C2=A0NxHrKd-RbGz-bnXW-7LQE-A4kS-<wbr>2mIB-JZU2hk<br>
=C2=A0 lv_bur=C2=A0 =C2=A0 =C2=A0 =C2=A0 vg_bur=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A01 -wI-------=C2=A0 40.00g=C2=A0 -1=C2=A0 -1=C2=A0 =C2=A0-1<br>
-1<br>
=C2=A0 =C2=A0Mg67Sx-ke62-n3Q9-CWqO-e7Zo-<wbr>R9pc-BQMhRE<br>
=C2=A0 [pvmove0]=C2=A0 =C2=A0 =C2=A0vg_bur=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A01 p-C---m---=C2=A0 40.00g=C2=A0 -1=C2=A0 -1=C2=A0 =C2=A0-1<br>
-1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0/dev/mapper/vd_PLONE_01<br>
=C2=A0 =C2=A0ILbHqP-IOlz-e4e9-eThD-QwGd-<wbr>D7Z4-KOzsmL<br>
=C2=A0 lv_ermes=C2=A0 =C2=A0 =C2=A0 vg_ermes=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A01 -wI-------=C2=A0 40.00g=C2=A0 -1=C2=A0 -1=C2=A0 =C2=A0-1<br>
-1<br>
=C2=A0 =C2=A0DZTKAk-X047-eOai-rpDp-Uciw-<wbr>CxUr-uCgOZC<br>
=C2=A0 [pvmove0]=C2=A0 =C2=A0 =C2=A0vg_ermes=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A01 p-C---m---=C2=A0 40.00g=C2=A0 -1=C2=A0 -1=C2=A0 =C2=A0-1<br>
-1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0/dev/mapper/vd_PLONE_03<br>
=C2=A0 =C2=A0NOV7rE-rWbI-msda-53LT-d9tk-<wbr>cutV-K2ok6s<br>
=C2=A0 lv_geoportale vg_geoportale=C2=A0 =C2=A0 1 -wi-ao----=C2=A0 10.00g=
=C2=A0 -1=C2=A0 -1=C2=A0 253<br>
9<br>
=C2=A0 I1YWt5-sHZu-fEl6-qeW2-JDlw-<wbr>NHWB-jAHp0m<br>
=C2=A0 lv_groupware=C2=A0 vg_groupware=C2=A0 =C2=A0 =C2=A01 -wI-------=C2=
=A0 10.00g=C2=A0 -1=C2=A0 -1=C2=A0 =C2=A0-1<br>
-1<br>
=C2=A0 =C2=A0a10Lpj-2Ni7-RzNA-Nf8p-3LnT-<wbr>4mYh-spTIyj<br>
=C2=A0 [pvmove0]=C2=A0 =C2=A0 =C2=A0vg_groupware=C2=A0 =C2=A0 =C2=A01 p-C--=
-m---=C2=A0 10.00g=C2=A0 -1=C2=A0 -1=C2=A0 =C2=A0-1<br>
-1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0/dev/mapper/vd_PLONE_05<br>
=C2=A0 =C2=A00MVtil-lIF2-p4lu-2ZhZ-FYb8-<wbr>ojdq-PmygpF<br>
=C2=A0 lv_internos=C2=A0 =C2=A0vg_internos=C2=A0 =C2=A0 =C2=A0 1 -wI-------=
=C2=A0 40.00g=C2=A0 -1=C2=A0 -1=C2=A0 =C2=A0-1<br>
-1<br>
=C2=A0 =C2=A0cZEwfL-kZ4G-vKLy-92aX-KKOW-<wbr>IFkj-Ne0VdR<br>
=C2=A0 [pvmove0]=C2=A0 =C2=A0 =C2=A0vg_internos=C2=A0 =C2=A0 =C2=A0 1 p-C--=
-m---=C2=A0 40.00g=C2=A0 -1=C2=A0 -1=C2=A0 =C2=A0-1<br>
-1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0/dev/mapper/vd_PLONE_02<br>
=C2=A0 =C2=A0Yh9UrO-BF42-ETkw-mFxr-VDHE-<wbr>s6He-dLfX1l<br>
=C2=A0 lv_portali=C2=A0 =C2=A0 vg_portali=C2=A0 =C2=A0 =C2=A0 =C2=A01 -wI--=
----- 300.00g=C2=A0 -1=C2=A0 -1=C2=A0 =C2=A0-1<br>
-1<br>
=C2=A0 =C2=A0IvfQsy-8XAF-qT7D-X52j-cR11-<wbr>egyL-3WHlMf<br>
=C2=A0 [pvmove0]=C2=A0 =C2=A0 =C2=A0vg_portali=C2=A0 =C2=A0 =C2=A0 =C2=A01 =
p-C---m--- 300.00g=C2=A0 -1=C2=A0 -1=C2=A0 =C2=A0-1<br>
-1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0/dev/mapper/vd_PLONE_04<br>
=C2=A0 =C2=A0cGkqJx-0R7h-at97-E8yt-BCwA-<wbr>ljCm-p8rcRj<br>
<br>
<br>
<br>
Any advice on how to proceed?<br>
<br>
Thank you,<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Lorenzo Dalrio<br>
</font></span></blockquote></div><br></div></div>

--001a11470694d6de47054271f2ef--
