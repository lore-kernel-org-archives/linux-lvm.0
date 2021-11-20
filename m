Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D660DC433F5
	for <linux-lvm@archiver.kernel.org>; Mon, 22 Nov 2021 07:10:00 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-233-t5aI9wJ9OoWYbfdbhktKBA-1; Mon, 22 Nov 2021 02:09:56 -0500
X-MC-Unique: t5aI9wJ9OoWYbfdbhktKBA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F173A40C1;
	Mon, 22 Nov 2021 07:09:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C1071000324;
	Mon, 22 Nov 2021 07:09:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 42F1A4A703;
	Mon, 22 Nov 2021 07:09:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AK7FZSE030088 for <linux-lvm@listman.util.phx.redhat.com>;
	Sat, 20 Nov 2021 02:15:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DFDBD2166B2D; Sat, 20 Nov 2021 07:15:34 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D917D2166B26
	for <linux-lvm@redhat.com>; Sat, 20 Nov 2021 07:15:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D4880800C00
	for <linux-lvm@redhat.com>; Sat, 20 Nov 2021 07:15:31 +0000 (UTC)
Received: from ms11p00im-qufo17281601.me.com (ms11p00im-qufo17281601.me.com
	[17.58.38.53]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-243-S5DtsM-XM0yP8-ZQ_z5caA-1; Sat, 20 Nov 2021 02:15:27 -0500
X-MC-Unique: S5DtsM-XM0yP8-ZQ_z5caA-1
Received: from adams-mbp-old.lan (ip68-104-215-250.ph.ph.cox.net
	[68.104.215.250])
	by ms11p00im-qufo17281601.me.com (Postfix) with ESMTPSA id B4E29BE028D
	for <linux-lvm@redhat.com>; Sat, 20 Nov 2021 07:15:25 +0000 (UTC)
From: Adam Puleo <adam.puleo@icloud.com>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Date: Sat, 20 Nov 2021 00:15:24 -0700
References: <1495660C-B6EF-4315-8599-F79F7B6CCF73@icloud.com>
	<20211103152558.7670fa10@desk>
	<530F35A9-87FD-4850-BB9E-0E22857F178C@icloud.com>
	<446C99D5-736F-405A-A75C-7F37F746CE51@icloud.com>
	<CAM23VxrzaV6KULRM3CqrZxXvHKPc08wsyRvPJ7Pf_xOT13pwqg@mail.gmail.com>
	<CAM23VxqiXiFWsumkemwbfd8jRRdNCeOQaY4ut2G44e7wqEGu3Q@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
In-Reply-To: <CAM23VxqiXiFWsumkemwbfd8jRRdNCeOQaY4ut2G44e7wqEGu3Q@mail.gmail.com>
Message-Id: <05B60877-3BB2-46F3-8296-E6484735E484@icloud.com>
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
	=?UTF-8?Q?2903e8d5c8f:6.0.425, 18.0.790,
	17.0.607.475.0000000_definitions?=
	=?UTF-8?Q?=3D2021-11-20=5F02:2021-11-17=5F01, 2021-11-20=5F02,
	2020-04-07?= =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=0
	clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0
	mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1
	engine=8.12.0-2009150000 definitions=main-2111200045
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Mon, 22 Nov 2021 02:07:08 -0500
Subject: Re: [linux-lvm] Replace Drive in RAID6
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============4920111571861626595=="

--===============4920111571861626595==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_469A98F5-DF42-4BDD-9E96-7A3A0410F20C"

--Apple-Mail=_469A98F5-DF42-4BDD-9E96-7A3A0410F20C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hello Heinz,

This was CenOS 7.x using a 5.x kernel.

I could not get the LV activated until I mapped lv_data_rmeta_0 & lv_data_r=
image_0 volumes to a PV.

I did the mapping by creating a copy of the current VG config file from /et=
c/lvm/backup and manually adding the missing PV to each of the LVs (lv_data=
_rmeta_0 & lv_data_rimage_0). After I edited the file I ran vgcfgrestore.

At this point I was able to activate the LV and sync the RAID. After the sy=
nchronization was done I mounted the file system (XFS) but it was corrupted=
. It was missing most of my newer files. I had a backup so I restored from =
that.

-adam


> On Nov 16, 2021, at 10:46 AM, Heinz Mauelshagen <heinzm@redhat.com> wrote=
:
>=20
> Erm, s/lvchange --repair/lvconvert --repair/
>=20
> On Tue, Nov 16, 2021 at 6:41 PM Heinz Mauelshagen <heinzm@redhat.com <mai=
lto:heinzm@redhat.com>> wrote:
> On Mon, Nov 8, 2021 at 8:08 AM Adam Puleo <adam.puleo@icloud.com <mailto:=
adam.puleo@icloud.com>> wrote:
> Hello Everyone,
>=20
> Hi,
> for starters, which kernel/distro is this?
>=20
> Also, all layout changes on RaidLVs require activated ones.
>=20
> =20
>=20
> Since the sub-LV #0 has errored, LVM will not let me activate the logical=
 volume.
>=20
> Is there a way to remap the #0 sub-LV to the replaced disk or resizing th=
e RAID6 to one less disk?
>=20
> Each of the RAID6 SubLV pairs has an internal id and all data and parity =
(P+Q syndromes) have been stored in a rotating pattern  >  no to the remapp=
ing part.
>=20
> Also no to the resize, as it'd need a fully operational radi6, thus repai=
ring the RaidLV is needed.
>=20
> As mentioned, '"lvchange --rebuild ..." is inadequate to repair RaidLVs w=
ith broken/lost PVs, "lvchange --repair $RaidLV" is.
>=20
> In order to diagnose why your raid6 LV now fails to activate via "lvchang=
e -ay --activationmode degraded $RaidLV" which is the proper way to go abou=
t it,
> can you please describe any/all updating steps you took after the drive f=
ailed rendering your raid6 LV degraded?  Please don't change anything until=
 you made
> that transparent so that we keep chances to fix this...=20
>=20
> FYI:
> "lvconvert --(repair|replace) ..." difference is the former repairing Rai=
dLVs with failed PVs by allocating space on different, accessible PVs hence=
 causing the RaidLV to become fully operational after rebuilding all missin=
g block content by using parity stored on the remaining rimage SubLVs vs. t=
he latter allowing to replace mappings to intact PVs by remapping the RAID =
SubLV pair to different ones (e.g. faster or less contended PVs).
>=20
> Thanks,
> Heinz
>=20
> =20
>=20
> Thank you,
> -Adam
>=20
>=20
> On Nov 4, 2021, at 7:21 PM, Adam Puleo <adam.puleo@icloud.com <mailto:ada=
m.puleo@icloud.com>> wrote:
>=20
> Hello Andreas,
>=20
> After deactivating each of the individual rmage and rmeta volumes I recei=
ve this error:
> # lvchange -a y --activationmode degraded vg_data/lv_data
>  device-mapper: reload ioctl on  (253:12) failed: Invalid argument
>=20
> In messages I see the following errors:
> Nov  4 19:19:43 nas kernel: device-mapper: raid: Failed to read superbloc=
k of device at position 0
> Nov  4 19:19:43 nas kernel: device-mapper: raid: New device injected into=
 existing raid set without 'delta_disks' or 'rebuild' parameter specified
> Nov  4 19:19:43 nas kernel: device-mapper: table: 253:12: raid: Unable to=
 assemble array: Invalid superblocks
> Nov  4 19:19:43 nas kernel: device-mapper: ioctl: error adding target to =
table
>=20
> Am I not adding the new drive to the RAID correctly? I first did a pvcrea=
te and then a vgextend.
>=20
> I was using the =E2=80=94rebuild option because I know which physical dri=
ve is bad. In the lvmraid man page it says =E2=80=94repair might not know w=
hich is the correct block to use so to use =E2=80=94rebuild.
>=20
> Thank you,
> -Adam
>=20
>=20
>=20
> On Nov 3, 2021, at 7:25 AM, Andreas Schr=C3=A4gle <linux-lvm@ajs124.de <m=
ailto:linux-lvm@ajs124.de>> wrote:
>=20
> On Tue, 2 Nov 2021 22:56:18 -0700
> Adam Puleo <adam.puleo@icloud.com <mailto:adam.puleo@icloud.com>> wrote:
>=20
> > Hello,
> >=20
> > One of my drives failed in my RAID6 and I=E2=80=99m trying to replace i=
t without success.
> >=20
> > I=E2=80=99m trying to rebuild the failed drive (/dev/sda): lvchange --r=
ebuild /dev/sda vg_data
> >=20
> > But I=E2=80=99m receiving the error: vg_data/lv_data must be active to =
perform this operation.
> >=20
> > I have tried to activate the logical volume without success.
> >=20
> > How do I go about activating the volume so that I can rebuild the faile=
d drive?
> >=20
> > Thanks,
> > -Adam
> >=20
> > # lvs -a -o name,segtype,devices
> > LV                       Type   Devices                                =
                                                           =20
> > lv_data                  raid6  lv_data_rimage_0(0),lv_data_rimage_1(0)=
,lv_data_rimage_2(0),lv_data_rimage_3(0),lv_data_rimage_4(0)
> > [lv_data_rimage_0]       error                                         =
                                                           =20
> > [lv_data_rimage_1]       linear /dev/sdc1(1)                           =
                                                           =20
> > [lv_data_rimage_2]       linear /dev/sdb1(1)                           =
                                                           =20
> > [lv_data_rimage_3]       linear /dev/sdf1(1)                           =
                                                           =20
> > [lv_data_rimage_4]       linear /dev/sde1(2)                           =
                                                           =20
> > [lv_data_rmeta_0]        error                                         =
                                                           =20
> > [lv_data_rmeta_1]        linear /dev/sdc1(0)                           =
                                                           =20
> > [lv_data_rmeta_2]        linear /dev/sdb1(0)                           =
                                                           =20
> > [lv_data_rmeta_3]        linear /dev/sdf1(0)                           =
                                                           =20
> > [lv_data_rmeta_4]        linear /dev/sde1(0)                           =
                                                           =20
> >=20
> > # lvs -a
> > LV                       VG            Attr       LSize   Pool Origin D=
ata%  Meta%  Move Log Cpy%Sync Convert
> > lv_data                  vg_data       rwi---r--- 990.00g              =
                                     =20
> > [lv_data_rimage_0]       vg_data       vwi-a-r-r- 330.00g              =
                                     =20
> > [lv_data_rimage_1]       vg_data       Iwi-a-r-r- 330.00g              =
                                     =20
> > [lv_data_rimage_2]       vg_data       Iwi-a-r-r- 330.00g              =
                                     =20
> > [lv_data_rimage_3]       vg_data       Iwi-a-r-r- 330.00g              =
                                     =20
> > [lv_data_rimage_4]       vg_data       Iwi-a-r-r- 330.00g              =
                                     =20
> > [lv_data_rmeta_0]        vg_data       ewi-a-r-r-   4.00m              =
                                     =20
> > [lv_data_rmeta_1]        vg_data       ewi-a-r-r-   4.00m              =
                                     =20
> > [lv_data_rmeta_2]        vg_data       ewi-a-r-r-   4.00m              =
                                     =20
> > [lv_data_rmeta_3]        vg_data       ewi-a-r-r-   4.00m              =
                                     =20
> > [lv_data_rmeta_4]        vg_data       ewi-a-r-r-   4.00m              =
                                     =20
> >=20
> >=20
> >=20
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com <mailto:linux-lvm@redhat.com>
> > https://listman.redhat.com/mailman/listinfo/linux-lvm <https://listman.=
redhat.com/mailman/listinfo/linux-lvm>
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/ <http://tldp.or=
g/HOWTO/LVM-HOWTO/>
>=20
> Hello Adam,
>=20
> how exactly have you tried to activate the LV so far?
>=20
> lvchange with --activationmode degraded should work, no?
>=20
> Also, are you sure that --rebuild is the correct operation?
>=20
> man 7 lvmraid suggest you might want --repair or --replace instead.
>=20
> Best Regards
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com <mailto:linux-lvm@redhat.com>
> https://listman.redhat.com/mailman/listinfo/linux-lvm <https://listman.re=
dhat.com/mailman/listinfo/linux-lvm>
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/ <http://tldp.org/=
HOWTO/LVM-HOWTO/>
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com <mailto:linux-lvm@redhat.com>
> https://listman.redhat.com/mailman/listinfo/linux-lvm <https://listman.re=
dhat.com/mailman/listinfo/linux-lvm>
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/ <http://tldp.org/=
HOWTO/LVM-HOWTO/>
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com <mailto:linux-lvm@redhat.com>
> https://listman.redhat.com/mailman/listinfo/linux-lvm <https://listman.re=
dhat.com/mailman/listinfo/linux-lvm>
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/ <http://tldp.org/=
HOWTO/LVM-HOWTO/>_______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


--Apple-Mail=_469A98F5-DF42-4BDD-9E96-7A3A0410F20C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8"></head><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: s=
pace; line-break: after-white-space;" class=3D"">Hello Heinz,<div class=3D"=
"><br class=3D""></div><div class=3D"">This was CenOS 7.x using a 5.x kerne=
l.</div><div class=3D""><br class=3D""></div><div class=3D"">I could not ge=
t the LV activated until I mapped&nbsp;lv_data_rmeta_0 &amp;&nbsp;lv_data_r=
image_0 volumes to a PV.</div><div class=3D""><br class=3D""></div><div cla=
ss=3D"">I did the mapping by creating a copy of the current VG config file =
from /etc/lvm/backup and manually adding the missing PV to each of the LVs =
(lv_data_rmeta_0 &amp;&nbsp;lv_data_rimage_0). After I edited the file I ra=
n&nbsp;vgcfgrestore.</div><div class=3D""><br class=3D""></div><div class=
=3D"">At this point I was able to activate the LV and sync the RAID. After =
the synchronization was done I mounted the file system (XFS) but it was cor=
rupted. It was missing most of my newer files. I had a backup so I restored=
 from that.</div><div class=3D""><br class=3D""></div><div class=3D"">-adam=
</div><div class=3D""><br class=3D""></div><div class=3D""><div><br class=
=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">On Nov 16, 2021,=
 at 10:46 AM, Heinz Mauelshagen &lt;<a href=3D"mailto:heinzm@redhat.com" cl=
ass=3D"">heinzm@redhat.com</a>&gt; wrote:</div><br class=3D"Apple-interchan=
ge-newline"><div class=3D""><div dir=3D"ltr" class=3D"">Erm, s/lvchange --r=
epair/lvconvert --repair/</div><br class=3D""><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 16, 2021 at 6:41 PM Heinz M=
auelshagen &lt;<a href=3D"mailto:heinzm@redhat.com" class=3D"">heinzm@redha=
t.com</a>&gt; wrote:<br class=3D""></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div dir=3D"ltr" class=3D""><div dir=3D"ltr" class=3D"">On =
Mon, Nov 8, 2021 at 8:08 AM Adam Puleo &lt;<a href=3D"mailto:adam.puleo@icl=
oud.com" target=3D"_blank" class=3D"">adam.puleo@icloud.com</a>&gt; wrote:<=
br class=3D""></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Hello Everyone,<br class=3D""></blockquote><div class=
=3D""><br class=3D""></div><div class=3D"">Hi,</div><div class=3D"">for sta=
rters, which&nbsp;kernel/distro is this?</div><div class=3D""><br class=3D"=
"></div><div class=3D"">Also, all layout changes&nbsp;on RaidLVs require ac=
tivated ones.</div><div class=3D""><br class=3D""></div><div class=3D"">&nb=
sp;</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br class=3D"">
Since the sub-LV #0 has errored, LVM will not let me activate the logical v=
olume.<br class=3D"">
<br class=3D"">
Is there a way to remap the #0 sub-LV to the replaced disk or resizing the =
RAID6 to one less disk?<br class=3D""></blockquote><div class=3D""><br clas=
s=3D""></div><div class=3D"">Each of the RAID6 SubLV pairs&nbsp;has an inte=
rnal id and all data and parity (P+Q syndromes) have been stored in a rotat=
ing pattern&nbsp; &gt;&nbsp; no to the remapping part.<br class=3D""><br cl=
ass=3D"">Also no to&nbsp;the resize, as it'd need a fully operational radi6=
, thus repairing the RaidLV is needed.</div><div class=3D""><br class=3D"">=
</div><div class=3D"">As mentioned, '"lvchange --rebuild ..." is inadequate=
 to repair RaidLVs with broken/lost PVs, "lvchange --repair $RaidLV" is.</d=
iv><div class=3D""><br class=3D""></div><div class=3D"">In order to diagnos=
e&nbsp;why your raid6 LV now fails to activate via "lvchange -ay --activati=
onmode degraded $RaidLV" which is the proper way to go about it,<br class=
=3D"">can you please describe any/all updating steps you took after the dri=
ve failed rendering your raid6 LV degraded?&nbsp; Please don't change anyth=
ing until you made<br class=3D"">that transparent&nbsp;so that we keep chan=
ces to fix this...&nbsp;</div><div class=3D""><br class=3D""></div><div cla=
ss=3D"">FYI:<br class=3D"">"lvconvert --(repair|replace) ..." difference is=
 the former repairing RaidLVs with failed PVs by allocating space on differ=
ent, accessible PVs hence causing the RaidLV to become fully operational af=
ter rebuilding all missing block content by using parity stored on the rema=
ining rimage SubLVs vs. the latter allowing to replace mappings to intact P=
Vs by remapping the RAID SubLV pair to different ones (e.g. faster or less =
contended PVs).</div><div class=3D""><br class=3D""></div><div class=3D"">T=
hanks,</div><div class=3D"">Heinz</div><div class=3D""><br class=3D""></div=
><div class=3D"">&nbsp;</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
<br class=3D"">
Thank you,<br class=3D"">
-Adam<br class=3D"">
<br class=3D"">
<br class=3D"">
On Nov 4, 2021, at 7:21 PM, Adam Puleo &lt;<a href=3D"mailto:adam.puleo@icl=
oud.com" target=3D"_blank" class=3D"">adam.puleo@icloud.com</a>&gt; wrote:<=
br class=3D"">
<br class=3D"">
Hello Andreas,<br class=3D"">
<br class=3D"">
After deactivating each of the individual rmage and rmeta volumes I receive=
 this error:<br class=3D"">
# lvchange -a y --activationmode degraded vg_data/lv_data<br class=3D"">
&nbsp;device-mapper: reload ioctl on&nbsp; (253:12) failed: Invalid argumen=
t<br class=3D"">
<br class=3D"">
In messages I see the following errors:<br class=3D"">
Nov&nbsp; 4 19:19:43 nas kernel: device-mapper: raid: Failed to read superb=
lock of device at position 0<br class=3D"">
Nov&nbsp; 4 19:19:43 nas kernel: device-mapper: raid: New device injected i=
nto existing raid set without 'delta_disks' or 'rebuild' parameter specifie=
d<br class=3D"">
Nov&nbsp; 4 19:19:43 nas kernel: device-mapper: table: 253:12: raid: Unable=
 to assemble array: Invalid superblocks<br class=3D"">
Nov&nbsp; 4 19:19:43 nas kernel: device-mapper: ioctl: error adding target =
to table<br class=3D"">
<br class=3D"">
Am I not adding the new drive to the RAID correctly? I first did a pvcreate=
 and then a vgextend.<br class=3D"">
<br class=3D"">
I was using the =E2=80=94rebuild option because I know which physical drive=
 is bad. In the lvmraid man page it says =E2=80=94repair might not know whi=
ch is the correct block to use so to use =E2=80=94rebuild.<br class=3D"">
<br class=3D"">
Thank you,<br class=3D"">
-Adam<br class=3D"">
<br class=3D"">
<br class=3D"">
<br class=3D"">
On Nov 3, 2021, at 7:25 AM, Andreas Schr=C3=A4gle &lt;<a href=3D"mailto:lin=
ux-lvm@ajs124.de" target=3D"_blank" class=3D"">linux-lvm@ajs124.de</a>&gt; =
wrote:<br class=3D"">
<br class=3D"">
On Tue, 2 Nov 2021 22:56:18 -0700<br class=3D"">
Adam Puleo &lt;<a href=3D"mailto:adam.puleo@icloud.com" target=3D"_blank" c=
lass=3D"">adam.puleo@icloud.com</a>&gt; wrote:<br class=3D"">
<br class=3D"">
&gt; Hello,<br class=3D"">
&gt; <br class=3D"">
&gt; One of my drives failed in my RAID6 and I=E2=80=99m trying to replace =
it without success.<br class=3D"">
&gt; <br class=3D"">
&gt; I=E2=80=99m trying to rebuild the failed drive (/dev/sda): lvchange --=
rebuild /dev/sda vg_data<br class=3D"">
&gt; <br class=3D"">
&gt; But I=E2=80=99m receiving the error: vg_data/lv_data must be active to=
 perform this operation.<br class=3D"">
&gt; <br class=3D"">
&gt; I have tried to activate the logical volume without success.<br class=
=3D"">
&gt; <br class=3D"">
&gt; How do I go about activating the volume so that I can rebuild the fail=
ed drive?<br class=3D"">
&gt; <br class=3D"">
&gt; Thanks,<br class=3D"">
&gt; -Adam<br class=3D"">
&gt; <br class=3D"">
&gt; # lvs -a -o name,segtype,devices<br class=3D"">
&gt; LV&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;Type&nbsp; &nbsp;Devices&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <br class=3D""=
>
&gt; lv_data&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
raid6&nbsp; lv_data_rimage_0(0),lv_data_rimage_1(0),lv_data_rimage_2(0),lv_=
data_rimage_3(0),lv_data_rimage_4(0)<br class=3D"">
&gt; [lv_data_rimage_0]&nbsp; &nbsp; &nbsp; &nbsp;error&nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br class=3D"">
&gt; [lv_data_rimage_1]&nbsp; &nbsp; &nbsp; &nbsp;linear /dev/sdc1(1)&nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;<br class=3D"">
&gt; [lv_data_rimage_2]&nbsp; &nbsp; &nbsp; &nbsp;linear /dev/sdb1(1)&nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;<br class=3D"">
&gt; [lv_data_rimage_3]&nbsp; &nbsp; &nbsp; &nbsp;linear /dev/sdf1(1)&nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;<br class=3D"">
&gt; [lv_data_rimage_4]&nbsp; &nbsp; &nbsp; &nbsp;linear /dev/sde1(2)&nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;<br class=3D"">
&gt; [lv_data_rmeta_0]&nbsp; &nbsp; &nbsp; &nbsp; error&nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br class=3D"">
&gt; [lv_data_rmeta_1]&nbsp; &nbsp; &nbsp; &nbsp; linear /dev/sdc1(0)&nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;<br class=3D"">
&gt; [lv_data_rmeta_2]&nbsp; &nbsp; &nbsp; &nbsp; linear /dev/sdb1(0)&nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;<br class=3D"">
&gt; [lv_data_rmeta_3]&nbsp; &nbsp; &nbsp; &nbsp; linear /dev/sdf1(0)&nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;<br class=3D"">
&gt; [lv_data_rmeta_4]&nbsp; &nbsp; &nbsp; &nbsp; linear /dev/sde1(0)&nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;<br class=3D"">
&gt; <br class=3D"">
&gt; # lvs -a<br class=3D"">
&gt; LV&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;VG&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Attr&nbsp; &nbsp=
; &nbsp; &nbsp;LSize&nbsp; &nbsp;Pool Origin Data%&nbsp; Meta%&nbsp; Move L=
og Cpy%Sync Convert<br class=3D"">
&gt; lv_data&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
vg_data&nbsp; &nbsp; &nbsp; &nbsp;rwi---r--- 990.00g&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; <br class=3D"">
&gt; [lv_data_rimage_0]&nbsp; &nbsp; &nbsp; &nbsp;vg_data&nbsp; &nbsp; &nbs=
p; &nbsp;vwi-a-r-r- 330.00g&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <br class=3D"">
&gt; [lv_data_rimage_1]&nbsp; &nbsp; &nbsp; &nbsp;vg_data&nbsp; &nbsp; &nbs=
p; &nbsp;Iwi-a-r-r- 330.00g&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <br class=3D"">
&gt; [lv_data_rimage_2]&nbsp; &nbsp; &nbsp; &nbsp;vg_data&nbsp; &nbsp; &nbs=
p; &nbsp;Iwi-a-r-r- 330.00g&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <br class=3D"">
&gt; [lv_data_rimage_3]&nbsp; &nbsp; &nbsp; &nbsp;vg_data&nbsp; &nbsp; &nbs=
p; &nbsp;Iwi-a-r-r- 330.00g&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <br class=3D"">
&gt; [lv_data_rimage_4]&nbsp; &nbsp; &nbsp; &nbsp;vg_data&nbsp; &nbsp; &nbs=
p; &nbsp;Iwi-a-r-r- 330.00g&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <br class=3D"">
&gt; [lv_data_rmeta_0]&nbsp; &nbsp; &nbsp; &nbsp; vg_data&nbsp; &nbsp; &nbs=
p; &nbsp;ewi-a-r-r-&nbsp; &nbsp;4.00m&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <br cl=
ass=3D"">
&gt; [lv_data_rmeta_1]&nbsp; &nbsp; &nbsp; &nbsp; vg_data&nbsp; &nbsp; &nbs=
p; &nbsp;ewi-a-r-r-&nbsp; &nbsp;4.00m&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <br cl=
ass=3D"">
&gt; [lv_data_rmeta_2]&nbsp; &nbsp; &nbsp; &nbsp; vg_data&nbsp; &nbsp; &nbs=
p; &nbsp;ewi-a-r-r-&nbsp; &nbsp;4.00m&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <br cl=
ass=3D"">
&gt; [lv_data_rmeta_3]&nbsp; &nbsp; &nbsp; &nbsp; vg_data&nbsp; &nbsp; &nbs=
p; &nbsp;ewi-a-r-r-&nbsp; &nbsp;4.00m&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <br cl=
ass=3D"">
&gt; [lv_data_rmeta_4]&nbsp; &nbsp; &nbsp; &nbsp; vg_data&nbsp; &nbsp; &nbs=
p; &nbsp;ewi-a-r-r-&nbsp; &nbsp;4.00m&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <br cl=
ass=3D"">
&gt; <br class=3D"">
&gt; <br class=3D"">
&gt; <br class=3D"">
&gt; _______________________________________________<br class=3D"">
&gt; linux-lvm mailing list<br class=3D"">
&gt; <a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank" class=3D"">l=
inux-lvm@redhat.com</a><br class=3D"">
&gt; <a href=3D"https://listman.redhat.com/mailman/listinfo/linux-lvm" rel=
=3D"noreferrer" target=3D"_blank" class=3D"">https://listman.redhat.com/mai=
lman/listinfo/linux-lvm</a><br class=3D"">
&gt; read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" re=
l=3D"noreferrer" target=3D"_blank" class=3D"">http://tldp.org/HOWTO/LVM-HOW=
TO/</a><br class=3D"">
<br class=3D"">
Hello Adam,<br class=3D"">
<br class=3D"">
how exactly have you tried to activate the LV so far?<br class=3D"">
<br class=3D"">
lvchange with --activationmode degraded should work, no?<br class=3D"">
<br class=3D"">
Also, are you sure that --rebuild is the correct operation?<br class=3D"">
<br class=3D"">
man 7 lvmraid suggest you might want --repair or --replace instead.<br clas=
s=3D"">
<br class=3D"">
Best Regards<br class=3D"">
<br class=3D"">
<br class=3D"">
_______________________________________________<br class=3D"">
linux-lvm mailing list<br class=3D"">
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank" class=3D"">linux-=
lvm@redhat.com</a><br class=3D"">
<a href=3D"https://listman.redhat.com/mailman/listinfo/linux-lvm" rel=3D"no=
referrer" target=3D"_blank" class=3D"">https://listman.redhat.com/mailman/l=
istinfo/linux-lvm</a><br class=3D"">
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"=
noreferrer" target=3D"_blank" class=3D"">http://tldp.org/HOWTO/LVM-HOWTO/</=
a><br class=3D"">
<br class=3D"">
<br class=3D"">
_______________________________________________<br class=3D"">
linux-lvm mailing list<br class=3D"">
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank" class=3D"">linux-=
lvm@redhat.com</a><br class=3D"">
<a href=3D"https://listman.redhat.com/mailman/listinfo/linux-lvm" rel=3D"no=
referrer" target=3D"_blank" class=3D"">https://listman.redhat.com/mailman/l=
istinfo/linux-lvm</a><br class=3D"">
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"=
noreferrer" target=3D"_blank" class=3D"">http://tldp.org/HOWTO/LVM-HOWTO/</=
a><br class=3D"">
<br class=3D"">
<br class=3D"">
_______________________________________________<br class=3D"">
linux-lvm mailing list<br class=3D"">
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank" class=3D"">linux-=
lvm@redhat.com</a><br class=3D"">
<a href=3D"https://listman.redhat.com/mailman/listinfo/linux-lvm" rel=3D"no=
referrer" target=3D"_blank" class=3D"">https://listman.redhat.com/mailman/l=
istinfo/linux-lvm</a><br class=3D"">
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"=
noreferrer" target=3D"_blank" class=3D"">http://tldp.org/HOWTO/LVM-HOWTO/</=
a></blockquote></div></div>
</blockquote></div>
_______________________________________________<br class=3D"">linux-lvm mai=
ling list<br class=3D""><a href=3D"mailto:linux-lvm@redhat.com" class=3D"">=
linux-lvm@redhat.com</a><br class=3D"">https://listman.redhat.com/mailman/l=
istinfo/linux-lvm<br class=3D"">read the LVM HOW-TO at http://tldp.org/HOWT=
O/LVM-HOWTO/</div></blockquote></div><br class=3D""></div></body></html>
--Apple-Mail=_469A98F5-DF42-4BDD-9E96-7A3A0410F20C--

--===============4920111571861626595==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============4920111571861626595==--

