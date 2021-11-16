Return-Path: <SRS0=Ks00=QF=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4736BC433EF
	for <linux-lvm@archiver.kernel.org>; Thu, 18 Nov 2021 07:30:53 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D63DB61269
	for <linux-lvm@archiver.kernel.org>; Thu, 18 Nov 2021 07:30:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D63DB61269
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1637220652;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=DF23q6dmEyP1JMrk1EJi4kPHb65zb99Ju1oIBtc11js=;
	b=iZHuUkVWMI70mORlX9SFNRwczLqp6/V2mScRws+2JdEOsQo7bkTXywMWWESVlDdhUuIIhy
	BSHRfX7HTgQSxgJJqHI1+sDqHTvwq8P0IE6Kji3YJWq9QxTdqQneJ7w9AvNkb+cmpc4Vl0
	mBJ8xGLlbjYORuZZc1v0LRTlLL7oAj8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-73KDEqVGOnSnr2hOzsgSaA-1; Thu, 18 Nov 2021 02:30:48 -0500
X-MC-Unique: 73KDEqVGOnSnr2hOzsgSaA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79A4A1023F4D;
	Thu, 18 Nov 2021 07:30:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD45060C25;
	Thu, 18 Nov 2021 07:30:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EF42C1832DD2;
	Thu, 18 Nov 2021 07:30:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AGHlGoZ026002 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 16 Nov 2021 12:47:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C0CFC2026D5D; Tue, 16 Nov 2021 17:47:16 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B7B48202696C
	for <linux-lvm@redhat.com>; Tue, 16 Nov 2021 17:47:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7E2F805F5C
	for <linux-lvm@redhat.com>; Tue, 16 Nov 2021 17:47:10 +0000 (UTC)
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
	[209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-456-jlQZ_A9ONiKnFYGkLj8guQ-1; Tue, 16 Nov 2021 12:47:09 -0500
X-MC-Unique: jlQZ_A9ONiKnFYGkLj8guQ-1
Received: by mail-yb1-f199.google.com with SMTP id
	x16-20020a25b910000000b005b6b7f2f91cso33504202ybj.1
	for <linux-lvm@redhat.com>; Tue, 16 Nov 2021 09:47:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=DdhGCfa3qW2AjGyAUEGFla7qYtU0kXPQKJO0d+ZywAc=;
	b=ZHP2RspEsw5ojjbRWommw6fbo4tqVAKA3Ld9FLS84h4zBIEp8s/jkJojUQLMZOiYNo
	3Y+CoeqdZXpFtjTs42zY42Fssu2nUuym/tiZUu6iPCqGzVcJ34yDT5a5v2RLZ7fd+e5X
	+DR4T1rUgGPq3pCKRAJTXrPtZEGLulJPD2AEi9AkINAS03zyW5wrBPwlXvTbClwnAXEP
	XSxkNdayRCxOvmrx9qxWSj8dxIWYFa4cRbyGiOpf2keMQn3GC7yckaDi4cuiNgmr9hZz
	E8MZsBx2IWJEdlKGBO70bKSD5v77pV7tMTj1gulO5kKYcSFZowPT24CS5KKI/gBRnQV6
	YO4Q==
X-Gm-Message-State: AOAM532dt5h3mmGB1Vryv3/QDC/efbQjjslSHwYeXLz7BwbkTTHOAEaV
	Xj2Z8+/jkt8tGtfzn/YQYuHsClzI3F+c5CxZqK/7ys0nQEqa5mOfFtI9fOqN76c+vROOFC+Noto
	sZJm1SnR8XTYhz6e+35Tm8hbhsqs5PBfN
X-Received: by 2002:a25:f443:: with SMTP id p3mr10524254ybe.162.1637084828097; 
	Tue, 16 Nov 2021 09:47:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy7E/Reb0ZiA3pblZOPSfHExbFGf7poNknz832WRXWbm5LRKWX43eJPcJlw6b/wf8EaTJulvFtnEW2k8zOfT5Y=
X-Received: by 2002:a25:f443:: with SMTP id p3mr10524211ybe.162.1637084827793; 
	Tue, 16 Nov 2021 09:47:07 -0800 (PST)
MIME-Version: 1.0
References: <1495660C-B6EF-4315-8599-F79F7B6CCF73@icloud.com>
	<20211103152558.7670fa10@desk>
	<530F35A9-87FD-4850-BB9E-0E22857F178C@icloud.com>
	<446C99D5-736F-405A-A75C-7F37F746CE51@icloud.com>
	<CAM23VxrzaV6KULRM3CqrZxXvHKPc08wsyRvPJ7Pf_xOT13pwqg@mail.gmail.com>
In-Reply-To: <CAM23VxrzaV6KULRM3CqrZxXvHKPc08wsyRvPJ7Pf_xOT13pwqg@mail.gmail.com>
From: Heinz Mauelshagen <heinzm@redhat.com>
Date: Tue, 16 Nov 2021 18:46:57 +0100
Message-ID: <CAM23VxqiXiFWsumkemwbfd8jRRdNCeOQaY4ut2G44e7wqEGu3Q@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Thu, 18 Nov 2021 02:28:37 -0500
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============5352149645801128087=="

--===============5352149645801128087==
Content-Type: multipart/alternative; boundary="000000000000a0cc8405d0eb83e5"

--000000000000a0cc8405d0eb83e5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Erm, s/lvchange --repair/lvconvert --repair/

On Tue, Nov 16, 2021 at 6:41 PM Heinz Mauelshagen <heinzm@redhat.com> wrote=
:

> On Mon, Nov 8, 2021 at 8:08 AM Adam Puleo <adam.puleo@icloud.com> wrote:
>
>> Hello Everyone,
>>
>
> Hi,
> for starters, which kernel/distro is this?
>
> Also, all layout changes on RaidLVs require activated ones.
>
>
>
>>
>> Since the sub-LV #0 has errored, LVM will not let me activate the logica=
l
>> volume.
>>
>> Is there a way to remap the #0 sub-LV to the replaced disk or resizing
>> the RAID6 to one less disk?
>>
>
> Each of the RAID6 SubLV pairs has an internal id and all data and parity
> (P+Q syndromes) have been stored in a rotating pattern  >  no to the
> remapping part.
>
> Also no to the resize, as it'd need a fully operational radi6, thus
> repairing the RaidLV is needed.
>
> As mentioned, '"lvchange --rebuild ..." is inadequate to repair RaidLVs
> with broken/lost PVs, "lvchange --repair $RaidLV" is.
>
> In order to diagnose why your raid6 LV now fails to activate via "lvchang=
e
> -ay --activationmode degraded $RaidLV" which is the proper way to go abou=
t
> it,
> can you please describe any/all updating steps you took after the drive
> failed rendering your raid6 LV degraded?  Please don't change anything
> until you made
> that transparent so that we keep chances to fix this...
>
> FYI:
> "lvconvert --(repair|replace) ..." difference is the former repairing
> RaidLVs with failed PVs by allocating space on different, accessible PVs
> hence causing the RaidLV to become fully operational after rebuilding all
> missing block content by using parity stored on the remaining rimage SubL=
Vs
> vs. the latter allowing to replace mappings to intact PVs by remapping th=
e
> RAID SubLV pair to different ones (e.g. faster or less contended PVs).
>
> Thanks,
> Heinz
>
>
>
>>
>> Thank you,
>> -Adam
>>
>>
>> On Nov 4, 2021, at 7:21 PM, Adam Puleo <adam.puleo@icloud.com> wrote:
>>
>> Hello Andreas,
>>
>> After deactivating each of the individual rmage and rmeta volumes I
>> receive this error:
>> # lvchange -a y --activationmode degraded vg_data/lv_data
>>  device-mapper: reload ioctl on  (253:12) failed: Invalid argument
>>
>> In messages I see the following errors:
>> Nov  4 19:19:43 nas kernel: device-mapper: raid: Failed to read
>> superblock of device at position 0
>> Nov  4 19:19:43 nas kernel: device-mapper: raid: New device injected int=
o
>> existing raid set without 'delta_disks' or 'rebuild' parameter specified
>> Nov  4 19:19:43 nas kernel: device-mapper: table: 253:12: raid: Unable t=
o
>> assemble array: Invalid superblocks
>> Nov  4 19:19:43 nas kernel: device-mapper: ioctl: error adding target to
>> table
>>
>> Am I not adding the new drive to the RAID correctly? I first did a
>> pvcreate and then a vgextend.
>>
>> I was using the =E2=80=94rebuild option because I know which physical dr=
ive is
>> bad. In the lvmraid man page it says =E2=80=94repair might not know whic=
h is the
>> correct block to use so to use =E2=80=94rebuild.
>>
>> Thank you,
>> -Adam
>>
>>
>>
>> On Nov 3, 2021, at 7:25 AM, Andreas Schr=C3=A4gle <linux-lvm@ajs124.de> =
wrote:
>>
>> On Tue, 2 Nov 2021 22:56:18 -0700
>> Adam Puleo <adam.puleo@icloud.com> wrote:
>>
>> > Hello,
>> >
>> > One of my drives failed in my RAID6 and I=E2=80=99m trying to replace =
it
>> without success.
>> >
>> > I=E2=80=99m trying to rebuild the failed drive (/dev/sda): lvchange --=
rebuild
>> /dev/sda vg_data
>> >
>> > But I=E2=80=99m receiving the error: vg_data/lv_data must be active to=
 perform
>> this operation.
>> >
>> > I have tried to activate the logical volume without success.
>> >
>> > How do I go about activating the volume so that I can rebuild the
>> failed drive?
>> >
>> > Thanks,
>> > -Adam
>> >
>> > # lvs -a -o name,segtype,devices
>> > LV                       Type   Devices
>>
>> > lv_data                  raid6
>> lv_data_rimage_0(0),lv_data_rimage_1(0),lv_data_rimage_2(0),lv_data_rima=
ge_3(0),lv_data_rimage_4(0)
>> > [lv_data_rimage_0]       error
>>
>> > [lv_data_rimage_1]       linear /dev/sdc1(1)
>>
>> > [lv_data_rimage_2]       linear /dev/sdb1(1)
>>
>> > [lv_data_rimage_3]       linear /dev/sdf1(1)
>>
>> > [lv_data_rimage_4]       linear /dev/sde1(2)
>>
>> > [lv_data_rmeta_0]        error
>>
>> > [lv_data_rmeta_1]        linear /dev/sdc1(0)
>>
>> > [lv_data_rmeta_2]        linear /dev/sdb1(0)
>>
>> > [lv_data_rmeta_3]        linear /dev/sdf1(0)
>>
>> > [lv_data_rmeta_4]        linear /dev/sde1(0)
>>
>> >
>> > # lvs -a
>> > LV                       VG            Attr       LSize   Pool Origin
>> Data%  Meta%  Move Log Cpy%Sync Convert
>> > lv_data                  vg_data       rwi---r--- 990.00g
>>
>> > [lv_data_rimage_0]       vg_data       vwi-a-r-r- 330.00g
>>
>> > [lv_data_rimage_1]       vg_data       Iwi-a-r-r- 330.00g
>>
>> > [lv_data_rimage_2]       vg_data       Iwi-a-r-r- 330.00g
>>
>> > [lv_data_rimage_3]       vg_data       Iwi-a-r-r- 330.00g
>>
>> > [lv_data_rimage_4]       vg_data       Iwi-a-r-r- 330.00g
>>
>> > [lv_data_rmeta_0]        vg_data       ewi-a-r-r-   4.00m
>>
>> > [lv_data_rmeta_1]        vg_data       ewi-a-r-r-   4.00m
>>
>> > [lv_data_rmeta_2]        vg_data       ewi-a-r-r-   4.00m
>>
>> > [lv_data_rmeta_3]        vg_data       ewi-a-r-r-   4.00m
>>
>> > [lv_data_rmeta_4]        vg_data       ewi-a-r-r-   4.00m
>>
>> >
>> >
>> >
>> > _______________________________________________
>> > linux-lvm mailing list
>> > linux-lvm@redhat.com
>> > https://listman.redhat.com/mailman/listinfo/linux-lvm
>> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>> Hello Adam,
>>
>> how exactly have you tried to activate the LV so far?
>>
>> lvchange with --activationmode degraded should work, no?
>>
>> Also, are you sure that --rebuild is the correct operation?
>>
>> man 7 lvmraid suggest you might want --repair or --replace instead.
>>
>> Best Regards
>>
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://listman.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://listman.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://listman.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>

--000000000000a0cc8405d0eb83e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Erm, s/lvchange --repair/lvconvert --repair/</div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 16=
, 2021 at 6:41 PM Heinz Mauelshagen &lt;<a href=3D"mailto:heinzm@redhat.com=
">heinzm@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">On Mon, Nov 8, 2021 at=
 8:08 AM Adam Puleo &lt;<a href=3D"mailto:adam.puleo@icloud.com" target=3D"=
_blank">adam.puleo@icloud.com</a>&gt; wrote:<br></div><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">Hello Everyone,<br>=
</blockquote><div><br></div><div>Hi,</div><div>for starters, which=C2=A0ker=
nel/distro is this?</div><div><br></div><div>Also, all layout changes=C2=A0=
on RaidLVs require activated ones.</div><div><br></div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Since the sub-LV #0 has errored, LVM will not let me activate the logical v=
olume.<br>
<br>
Is there a way to remap the #0 sub-LV to the replaced disk or resizing the =
RAID6 to one less disk?<br></blockquote><div><br></div><div>Each of the RAI=
D6 SubLV pairs=C2=A0has an internal id and all data and parity (P+Q syndrom=
es) have been stored in a rotating pattern=C2=A0 &gt;=C2=A0 no to the remap=
ping part.<br><br>Also no to=C2=A0the resize, as it&#39;d need a fully oper=
ational radi6, thus repairing the RaidLV is needed.</div><div><br></div><di=
v>As mentioned, &#39;&quot;lvchange --rebuild ...&quot; is inadequate to re=
pair RaidLVs with broken/lost PVs, &quot;lvchange --repair $RaidLV&quot; is=
.</div><div><br></div><div>In order to diagnose=C2=A0why your raid6 LV now =
fails to activate via &quot;lvchange -ay --activationmode degraded $RaidLV&=
quot; which is the proper way to go about it,<br>can you please describe an=
y/all updating steps you took after the drive failed rendering your raid6 L=
V degraded?=C2=A0 Please don&#39;t change anything until you made<br>that t=
ransparent=C2=A0so that we keep chances to fix this...=C2=A0</div><div><br>=
</div><div>FYI:<br>&quot;lvconvert --(repair|replace) ...&quot; difference =
is the former repairing RaidLVs with failed PVs by allocating space on diff=
erent, accessible PVs hence causing the RaidLV to become fully operational =
after rebuilding all missing block content by using parity stored on the re=
maining rimage SubLVs vs. the latter allowing to replace mappings to intact=
 PVs by remapping the RAID SubLV pair to different ones (e.g. faster or les=
s contended PVs).</div><div><br></div><div>Thanks,</div><div>Heinz</div><di=
v><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
<br>
Thank you,<br>
-Adam<br>
<br>
<br>
On Nov 4, 2021, at 7:21 PM, Adam Puleo &lt;<a href=3D"mailto:adam.puleo@icl=
oud.com" target=3D"_blank">adam.puleo@icloud.com</a>&gt; wrote:<br>
<br>
Hello Andreas,<br>
<br>
After deactivating each of the individual rmage and rmeta volumes I receive=
 this error:<br>
# lvchange -a y --activationmode degraded vg_data/lv_data<br>
=C2=A0device-mapper: reload ioctl on=C2=A0 (253:12) failed: Invalid argumen=
t<br>
<br>
In messages I see the following errors:<br>
Nov=C2=A0 4 19:19:43 nas kernel: device-mapper: raid: Failed to read superb=
lock of device at position 0<br>
Nov=C2=A0 4 19:19:43 nas kernel: device-mapper: raid: New device injected i=
nto existing raid set without &#39;delta_disks&#39; or &#39;rebuild&#39; pa=
rameter specified<br>
Nov=C2=A0 4 19:19:43 nas kernel: device-mapper: table: 253:12: raid: Unable=
 to assemble array: Invalid superblocks<br>
Nov=C2=A0 4 19:19:43 nas kernel: device-mapper: ioctl: error adding target =
to table<br>
<br>
Am I not adding the new drive to the RAID correctly? I first did a pvcreate=
 and then a vgextend.<br>
<br>
I was using the =E2=80=94rebuild option because I know which physical drive=
 is bad. In the lvmraid man page it says =E2=80=94repair might not know whi=
ch is the correct block to use so to use =E2=80=94rebuild.<br>
<br>
Thank you,<br>
-Adam<br>
<br>
<br>
<br>
On Nov 3, 2021, at 7:25 AM, Andreas Schr=C3=A4gle &lt;<a href=3D"mailto:lin=
ux-lvm@ajs124.de" target=3D"_blank">linux-lvm@ajs124.de</a>&gt; wrote:<br>
<br>
On Tue, 2 Nov 2021 22:56:18 -0700<br>
Adam Puleo &lt;<a href=3D"mailto:adam.puleo@icloud.com" target=3D"_blank">a=
dam.puleo@icloud.com</a>&gt; wrote:<br>
<br>
&gt; Hello,<br>
&gt; <br>
&gt; One of my drives failed in my RAID6 and I=E2=80=99m trying to replace =
it without success.<br>
&gt; <br>
&gt; I=E2=80=99m trying to rebuild the failed drive (/dev/sda): lvchange --=
rebuild /dev/sda vg_data<br>
&gt; <br>
&gt; But I=E2=80=99m receiving the error: vg_data/lv_data must be active to=
 perform this operation.<br>
&gt; <br>
&gt; I have tried to activate the logical volume without success.<br>
&gt; <br>
&gt; How do I go about activating the volume so that I can rebuild the fail=
ed drive?<br>
&gt; <br>
&gt; Thanks,<br>
&gt; -Adam<br>
&gt; <br>
&gt; # lvs -a -o name,segtype,devices<br>
&gt; LV=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0Type=C2=A0 =C2=A0Devices=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
&gt; lv_data=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
raid6=C2=A0 lv_data_rimage_0(0),lv_data_rimage_1(0),lv_data_rimage_2(0),lv_=
data_rimage_3(0),lv_data_rimage_4(0)<br>
&gt; [lv_data_rimage_0]=C2=A0 =C2=A0 =C2=A0 =C2=A0error=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt; [lv_data_rimage_1]=C2=A0 =C2=A0 =C2=A0 =C2=A0linear /dev/sdc1(1)=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0<br>
&gt; [lv_data_rimage_2]=C2=A0 =C2=A0 =C2=A0 =C2=A0linear /dev/sdb1(1)=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0<br>
&gt; [lv_data_rimage_3]=C2=A0 =C2=A0 =C2=A0 =C2=A0linear /dev/sdf1(1)=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0<br>
&gt; [lv_data_rimage_4]=C2=A0 =C2=A0 =C2=A0 =C2=A0linear /dev/sde1(2)=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0<br>
&gt; [lv_data_rmeta_0]=C2=A0 =C2=A0 =C2=A0 =C2=A0 error=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt; [lv_data_rmeta_1]=C2=A0 =C2=A0 =C2=A0 =C2=A0 linear /dev/sdc1(0)=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0<br>
&gt; [lv_data_rmeta_2]=C2=A0 =C2=A0 =C2=A0 =C2=A0 linear /dev/sdb1(0)=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0<br>
&gt; [lv_data_rmeta_3]=C2=A0 =C2=A0 =C2=A0 =C2=A0 linear /dev/sdf1(0)=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0<br>
&gt; [lv_data_rmeta_4]=C2=A0 =C2=A0 =C2=A0 =C2=A0 linear /dev/sde1(0)=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0<br>
&gt; <br>
&gt; # lvs -a<br>
&gt; LV=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0VG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Attr=C2=A0 =C2=
=A0 =C2=A0 =C2=A0LSize=C2=A0 =C2=A0Pool Origin Data%=C2=A0 Meta%=C2=A0 Move=
 Log Cpy%Sync Convert<br>
&gt; lv_data=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
vg_data=C2=A0 =C2=A0 =C2=A0 =C2=A0rwi---r--- 990.00g=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 <br>
&gt; [lv_data_rimage_0]=C2=A0 =C2=A0 =C2=A0 =C2=A0vg_data=C2=A0 =C2=A0 =C2=
=A0 =C2=A0vwi-a-r-r- 330.00g=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
&gt; [lv_data_rimage_1]=C2=A0 =C2=A0 =C2=A0 =C2=A0vg_data=C2=A0 =C2=A0 =C2=
=A0 =C2=A0Iwi-a-r-r- 330.00g=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
&gt; [lv_data_rimage_2]=C2=A0 =C2=A0 =C2=A0 =C2=A0vg_data=C2=A0 =C2=A0 =C2=
=A0 =C2=A0Iwi-a-r-r- 330.00g=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
&gt; [lv_data_rimage_3]=C2=A0 =C2=A0 =C2=A0 =C2=A0vg_data=C2=A0 =C2=A0 =C2=
=A0 =C2=A0Iwi-a-r-r- 330.00g=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
&gt; [lv_data_rimage_4]=C2=A0 =C2=A0 =C2=A0 =C2=A0vg_data=C2=A0 =C2=A0 =C2=
=A0 =C2=A0Iwi-a-r-r- 330.00g=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
&gt; [lv_data_rmeta_0]=C2=A0 =C2=A0 =C2=A0 =C2=A0 vg_data=C2=A0 =C2=A0 =C2=
=A0 =C2=A0ewi-a-r-r-=C2=A0 =C2=A04.00m=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <=
br>
&gt; [lv_data_rmeta_1]=C2=A0 =C2=A0 =C2=A0 =C2=A0 vg_data=C2=A0 =C2=A0 =C2=
=A0 =C2=A0ewi-a-r-r-=C2=A0 =C2=A04.00m=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <=
br>
&gt; [lv_data_rmeta_2]=C2=A0 =C2=A0 =C2=A0 =C2=A0 vg_data=C2=A0 =C2=A0 =C2=
=A0 =C2=A0ewi-a-r-r-=C2=A0 =C2=A04.00m=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <=
br>
&gt; [lv_data_rmeta_3]=C2=A0 =C2=A0 =C2=A0 =C2=A0 vg_data=C2=A0 =C2=A0 =C2=
=A0 =C2=A0ewi-a-r-r-=C2=A0 =C2=A04.00m=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <=
br>
&gt; [lv_data_rmeta_4]=C2=A0 =C2=A0 =C2=A0 =C2=A0 vg_data=C2=A0 =C2=A0 =C2=
=A0 =C2=A0ewi-a-r-r-=C2=A0 =C2=A04.00m=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <=
br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; linux-lvm mailing list<br>
&gt; <a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@re=
dhat.com</a><br>
&gt; <a href=3D"https://listman.redhat.com/mailman/listinfo/linux-lvm" rel=
=3D"noreferrer" target=3D"_blank">https://listman.redhat.com/mailman/listin=
fo/linux-lvm</a><br>
&gt; read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" re=
l=3D"noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
<br>
Hello Adam,<br>
<br>
how exactly have you tried to activate the LV so far?<br>
<br>
lvchange with --activationmode degraded should work, no?<br>
<br>
Also, are you sure that --rebuild is the correct operation?<br>
<br>
man 7 lvmraid suggest you might want --repair or --replace instead.<br>
<br>
Best Regards<br>
<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://listman.redhat.com/mailman/listinfo/linux-lvm" rel=3D"no=
referrer" target=3D"_blank">https://listman.redhat.com/mailman/listinfo/lin=
ux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"=
noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://listman.redhat.com/mailman/listinfo/linux-lvm" rel=3D"no=
referrer" target=3D"_blank">https://listman.redhat.com/mailman/listinfo/lin=
ux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"=
noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://listman.redhat.com/mailman/listinfo/linux-lvm" rel=3D"no=
referrer" target=3D"_blank">https://listman.redhat.com/mailman/listinfo/lin=
ux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"=
noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a></blockqu=
ote></div></div>
</blockquote></div>

--000000000000a0cc8405d0eb83e5--

--===============5352149645801128087==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============5352149645801128087==--

