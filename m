Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D831C433EF
	for <linux-lvm@archiver.kernel.org>; Wed,  5 Jan 2022 09:21:05 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-580-CHnbFAftNnCNNGEUjLZPhg-1; Wed, 05 Jan 2022 04:21:02 -0500
X-MC-Unique: CHnbFAftNnCNNGEUjLZPhg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95CF6593AE;
	Wed,  5 Jan 2022 09:20:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A1D06F9CE;
	Wed,  5 Jan 2022 09:20:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7A35A4BB7C;
	Wed,  5 Jan 2022 09:20:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 2058DL4F030431 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 5 Jan 2022 03:13:22 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CC8872028CE7; Wed,  5 Jan 2022 08:13:21 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C3FC02026990
	for <linux-lvm@redhat.com>; Wed,  5 Jan 2022 08:13:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C010B10184A0
	for <linux-lvm@redhat.com>; Wed,  5 Jan 2022 08:13:13 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
	[209.85.219.170]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-630-r0eyYrdVMfSbaYNz6tvNTA-1; Wed, 05 Jan 2022 03:13:11 -0500
X-MC-Unique: r0eyYrdVMfSbaYNz6tvNTA-1
Received: by mail-yb1-f170.google.com with SMTP id w13so81824613ybs.13
	for <linux-lvm@redhat.com>; Wed, 05 Jan 2022 00:13:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=VlKUsYsy785nFZJ6ItEs7NedXZEVwISpMgFPU3CPJfU=;
	b=qK+Nc1Vxtyn1/OCDZEmNE2XtfShFu5hii2Du54nzHoxbLW+UYro2CzAsw9yCgdSlfm
	H4of+9Wy/Fa0bZXU0Wbvf2CnNzlGN6GMxTcxsFDV/fTdY0+Zx5vn/JTNilVbH89gBPg6
	0EqaSeZCTieQwhR9H9bpmhywc/r5t9PP2d0tffpUdSF2N/TvNSYauFRdQo6gmUsGqgPf
	cWqJKE4eurZTmS9Mptp8WWdbAB9dviPSZsqnMAOLyUztLr9aS7udGRUb7AYJWsCoxLg/
	kBz9ZRMsGVmJnH8iJcSwTjHLwVaQ3D6zlA9a1qEdcj8AqIqupJjmzJ5cm24eWFy+tvUv
	ITsw==
X-Gm-Message-State: AOAM5322hlopLC5zAotBMDC8Vsd8wIpsg/GXCixQ5TbE6Ao1SmL9EUiE
	psSEnUAsTig8sLSyi8t94cbAH5xzmMKYt53m2pz5B2fl
X-Google-Smtp-Source: ABdhPJxWMOZi8VyYwgeLcSnA2+McencX2l9Bl6Kny/6SI+2AUS/A42sFC68hydB9UOo4X8NhdkMHS9g8RcZZcoaebNU=
X-Received: by 2002:a5b:881:: with SMTP id e1mr55964196ybq.15.1641370380134;
	Wed, 05 Jan 2022 00:13:00 -0800 (PST)
MIME-Version: 1.0
References: <CACrcyf+mJY9NJ8pgkZUg00kaHpVN96pZ94n7ZF0E4xkS2=yJcA@mail.gmail.com>
	<CAAkhNO3NOZPHc5SoRGOQBcg=hC14hAx69diwMVqss5W6UWA8SA@mail.gmail.com>
In-Reply-To: <CAAkhNO3NOZPHc5SoRGOQBcg=hC14hAx69diwMVqss5W6UWA8SA@mail.gmail.com>
From: =?UTF-8?Q?Tomas_Dalebj=C3=B6rk?= <tomas.dalebjork@gmail.com>
Date: Wed, 5 Jan 2022 09:12:49 +0100
Message-ID: <CACrcyfKk5BVL2WzreghutF7OwH3zHguMOMM9D6viMVF7PqTGmA@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Wed, 05 Jan 2022 04:20:32 -0500
Subject: Re: [linux-lvm] Can't get merge in background using blockdev api to
	work
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============6637933962627503906=="

--===============6637933962627503906==
Content-Type: multipart/alternative; boundary="00000000000073eb1b05d4d152bd"

--00000000000073eb1b05d4d152bd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vojtech,

Thanks for looking it up.
It looks like the merging started in the background after all.

But here is the issue..

Merge initiates at 2022-01-04 17:40:31
2022-01-04.17:40:31 MERGELV

And I do get a return code of that it starting in background, as the next
command is executed, that tries to mount the filesystem
2022-01-04.17:40:37 MOUNTFS

But, in the kernel log I can see these errors from mountfs, which I looping
with a retry every 1s until it can get mounted

Jan  4 17:40:38 debian10 kernel: [42138.075811] XFS (dm-6): device supports
1024 byte sectors (not 512)
Jan  4 17:40:39 debian10 kernel: [42139.522164] XFS (dm-6): device supports
1024 byte sectors (not 512)
Jan  4 17:40:41 debian10 kernel: [42140.877383] XFS (dm-6): device supports
1024 byte sectors (not 512)
Jan  4 17:40:42 debian10 kernel: [42142.337237] XFS (dm-6): device supports
1024 byte sectors (not 512)
Jan  4 17:40:43 debian10 kernel: [42143.757615] XFS (dm-6): device supports
1024 byte sectors (not 512)
Jan  4 17:40:45 debian10 kernel: [42145.155576] XFS (dm-6): device supports
1024 byte sectors (not 512)
Jan  4 17:40:46 debian10 kernel: [42146.277236] XFS (dm-6): device supports
1024 byte sectors (not 512)
Jan  4 17:40:47 debian10 kernel: [42147.287412] XFS (dm-6): device supports
1024 byte sectors (not 512)
Jan  4 17:40:48 debian10 kernel: [42148.317816] XFS (dm-6): device supports
1024 byte sectors (not 512)
Jan  4 17:40:49 debian10 kernel: [42149.322470] XFS (dm-6): device supports
1024 byte sectors (not 512)
Jan  4 17:40:50 debian10 kernel: [42150.332581] XFS (dm-6): device supports
1024 byte sectors (not 512)
Jan  4 17:40:51 debian10 kernel: [42151.334976] XFS (dm-6): device supports
1024 byte sectors (not 512)
Jan  4 17:40:52 debian10 kernel: [42152.337999] XFS (dm-6): device supports
1024 byte sectors (not 512)

And the mountfs loop only ends when the merge has completed, hence the
question of if it really works in the background?

The merge ends when the next command is about to be executed, where I am
trying to reduce the disk from the volume group

2022-01-04.17:40:53  VGREDUCE

And there are no indication of any file system errors either

Jan  4 17:40:53 debian10 kernel: [42153.374758] XFS (dm-6): Mounting V5
Filesystem
Jan  4 17:40:53 debian10 kernel: [42153.378430] XFS (dm-6): Starting
recovery (logdev: internal)
Jan  4 17:40:53 debian10 kernel: [42153.378741] XFS (dm-6): Ending recovery
(logdev: internal)
Jan  4 17:41:53 debian10 kernel: [42213.622453] block nbd3: NBD_DISCONNECT

I have not analyzed into this more deeply, but could it be that LVM merge
has a pre-phase  step, where it has to scan all the blocks first before
actually starting a merge?
Because that can explain why, as our disks are emulated block device coming
from the nmd devices

Or do you have any tips that can lead us into the right track?

Regards Tomas

Den tis 4 jan. 2022 kl 09:09 skrev Vojtech Trefny <vtrefny@redhat.com>:

> Hi, libblockdev maintainer here, libblockdev is a separate project from
> LVM so it's better to ask on our GitHub[1], but I'm reading this ML too s=
o
> I can answer here.
>
> I did a quick test and the background merge works for me, so I think the
> problem is somewhere in LVM or with your setup, not in libblockdev -- all
> we do is run the "lvm lvconvert --merge <vg>/<snap> --background" command
> so there isn't a big room for a bug in our code (but I'm not saying there
> isn't one). I've modified your code a little bit[2], can you try running =
it
> again? I've just added logging so we can see what we actually tell LVM to
> run and also enabled LVM logging and saved the log to /tmp/lvm.log.
>
> [1] https://github.com/storaged-project/libblockdev
> [2] https://gist.github.com/vojtechtrefny/7f379596958a0c4cd4c287c3f7a7ddd=
d
>
> On Mon, Jan 3, 2022 at 9:06 AM Tomas Dalebj=C3=B6rk <tomas.dalebjork@gmai=
l.com>
> wrote:
>
>> Hi,
>>
>> I am trying to start a merge to the previous snapshot to be started with
>> the "-b" flag (background). But it seems to be that the merging has not
>> started in the background at all.
>>
>>         BDExtraArg      lv_arg =3D {"--background",""};
>>         const BDExtraArg        *extra_args[2] =3D {&lv_arg, NULL};
>>
>>         BDPluginSpec lvm_plugin =3D {BD_PLUGIN_LVM, "libbd_lvm.so.2"};
>>         BDPluginSpec *plugins[] =3D {&lvm_plugin,NULL};
>>
>>         bd_switch_init_checks (FALSE, &error);
>>         bd_ensure_init (plugins, NULL, &error);
>>         bd_lvm_lvsnapshotmerge(vg_name,lv_snap,extra_args,&error);
>>
>> Couldn't find any details about how to do this using the libblockdev api=
,
>> but according to the documentation, it should be possible to add the sam=
e
>> flags as for the normal LVM commands.
>>
>> Could you please give me a hint of what I am doing wrong?
>>
>> Regards Tomas
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://listman.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--00000000000073eb1b05d4d152bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Vojtech,</div><div><br></div><div>Thanks for looki=
ng it up.</div><div>It looks like the merging started in the background aft=
er all.</div><div><br></div><div>But here is the issue..</div><div><br></di=
v><div>Merge initiates at 2022-01-04 17:40:31<br></div><div><span style=3D"=
font-family:monospace">2022-01-04.17:40:31 MERGELV</span></div><div><br></d=
iv><div>And I do get a return code of that it starting in background, as th=
e next command is executed, that tries to mount the filesystem<br></div><di=
v><span style=3D"font-family:monospace">2022-01-04.17:40:37 MOUNTFS</span><=
/div><div><br></div><div>But, in the kernel log I can see these errors from=
 mountfs, which I looping with a retry every 1s until it can get mounted<br=
></div><div><br></div><div><div><span style=3D"font-family:monospace">Jan =
=C2=A04 17:40:38 debian10 kernel: [42138.075811] XFS (dm-6): device support=
s 1024 byte sectors (not 512)<br>Jan =C2=A04 17:40:39 debian10 kernel: [421=
39.522164] XFS (dm-6): device supports 1024 byte sectors (not 512)<br>Jan =
=C2=A04 17:40:41 debian10 kernel: [42140.877383] XFS (dm-6): device support=
s 1024 byte sectors (not 512)<br>Jan =C2=A04 17:40:42 debian10 kernel: [421=
42.337237] XFS (dm-6): device supports 1024 byte sectors (not 512)<br>Jan =
=C2=A04 17:40:43 debian10 kernel: [42143.757615] XFS (dm-6): device support=
s 1024 byte sectors (not 512)<br>Jan =C2=A04 17:40:45 debian10 kernel: [421=
45.155576] XFS (dm-6): device supports 1024 byte sectors (not 512)<br>Jan =
=C2=A04 17:40:46 debian10 kernel: [42146.277236] XFS (dm-6): device support=
s 1024 byte sectors (not 512)<br>Jan =C2=A04 17:40:47 debian10 kernel: [421=
47.287412] XFS (dm-6): device supports 1024 byte sectors (not 512)<br>Jan =
=C2=A04 17:40:48 debian10 kernel: [42148.317816] XFS (dm-6): device support=
s 1024 byte sectors (not 512)<br>Jan =C2=A04 17:40:49 debian10 kernel: [421=
49.322470] XFS (dm-6): device supports 1024 byte sectors (not 512)<br>Jan =
=C2=A04 17:40:50 debian10 kernel: [42150.332581] XFS (dm-6): device support=
s 1024 byte sectors (not 512)<br>Jan =C2=A04 17:40:51 debian10 kernel: [421=
51.334976] XFS (dm-6): device supports 1024 byte sectors (not 512)<br>Jan =
=C2=A04 17:40:52 debian10 kernel: [42152.337999] XFS (dm-6): device support=
s 1024 byte sectors (not 512)</span></div><div><br></div><div>And the mount=
fs loop only ends when the merge has completed, hence the question of if it=
 really works in the background?</div><div><br></div><div>The merge ends wh=
en the next command is about to be executed, where I am trying to reduce th=
e disk from the volume group</div><div><br></div><div>2022-01-04.17:40:53=
=C2=A0 VGREDUCE<br></div><div><br></div><div>And there are no indication of=
 any file system errors either</div><div><br></div><div>Jan =C2=A04 17:40:5=
3 debian10 kernel: [42153.374758] XFS (dm-6): Mounting V5 Filesystem<br>Jan=
 =C2=A04 17:40:53 debian10 kernel: [42153.378430] XFS (dm-6): Starting reco=
very (logdev: internal)<br>Jan =C2=A04 17:40:53 debian10 kernel: [42153.378=
741] XFS (dm-6): Ending recovery (logdev: internal)<br>Jan =C2=A04 17:41:53=
 debian10 kernel: [42213.622453] block nbd3: NBD_DISCONNECT<br></div><div><=
br></div></div><div>I have not analyzed into this more deeply, but could it=
 be that LVM merge has a pre-phase=C2=A0 step, where it has to scan all the=
 blocks first before actually starting a merge?</div><div>Because that can =
explain why, as our disks are emulated block device coming from the nmd dev=
ices</div><div><br></div><div>Or do you have any tips that can lead us into=
 the right track?</div><div><br></div><div>Regards Tomas</div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Den tis 4 jan=
. 2022 kl 09:09 skrev Vojtech Trefny &lt;<a href=3D"mailto:vtrefny@redhat.c=
om" target=3D"_blank">vtrefny@redhat.com</a>&gt;:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Hi, libblockdev mai=
ntainer here, libblockdev is a separate project from LVM so it&#39;s better=
 to ask on our GitHub[1], but I&#39;m reading this ML too so I can answer h=
ere.<br><br></div>I did a quick test and the background merge works for me,=
 so I think the problem is somewhere in LVM or with your setup, not in libb=
lockdev -- all we do is run the &quot;lvm lvconvert --merge &lt;vg&gt;/&lt;=
snap&gt; --background&quot; command so there isn&#39;t a big room for a bug=
 in our code (but I&#39;m not saying there isn&#39;t one). I&#39;ve modifie=
d your code a little bit[2], can you try running it again? I&#39;ve just ad=
ded logging so we can see what we actually tell LVM to run and also enabled=
 LVM logging and saved the log to <span>/tmp/lvm.log.<br><br>[1] <a href=3D=
"https://github.com/storaged-project/libblockdev" target=3D"_blank">https:/=
/github.com/storaged-project/libblockdev</a><br>[2] <a href=3D"https://gist=
.github.com/vojtechtrefny/7f379596958a0c4cd4c287c3f7a7dddd" target=3D"_blan=
k">https://gist.github.com/vojtechtrefny/7f379596958a0c4cd4c287c3f7a7dddd</=
a></span></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Mon, Jan 3, 2022 at 9:06 AM Tomas Dalebj=C3=B6rk &lt;<a href=3D=
"mailto:tomas.dalebjork@gmail.com" target=3D"_blank">tomas.dalebjork@gmail.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr"><div>Hi,</div><div><br></div><div>I am trying to start =
a merge to the previous snapshot to be started with the &quot;-b&quot; flag=
 (background). But it seems to be that the merging has not started in the b=
ackground at all.</div><div><span style=3D"font-family:monospace"><br></spa=
n></div><div><span style=3D"font-family:monospace">=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 BDExtraArg =C2=A0 =C2=A0 =C2=A0lv_arg =3D {&quot;--background&quot;,&qu=
ot;&quot;};<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 const BDExtraArg =C2=A0 =C2=A0 =
=C2=A0 =C2=A0*extra_args[2] =3D {&amp;lv_arg, NULL};<br><br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 BDPluginSpec lvm_plugin =3D {BD_PLUGIN_LVM, &quot;libbd_lvm.s=
o.2&quot;};<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 BDPluginSpec *plugins[] =3D {&am=
p;lvm_plugin,NULL};<br><br>=09 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0 bd_switch_i=
nit_checks (FALSE, &amp;error);<br>=09 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 bd_ensure_init (plugins, NULL, &amp;error);<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 bd_lvm_lvsnapshotmerge(vg_name,lv_snap,extra_args,&amp;error);</span><b=
r>=09=09</div><div><br></div><div>Couldn&#39;t find any details about how t=
o do this using the libblockdev api, but according to the documentation, it=
 should be possible to add the same flags as for the normal LVM commands.</=
div><div><br></div><div>Could you please give me a hint of what I am doing =
wrong?</div><div><br></div><div>Regards Tomas<br></div><div><br>=09</div></=
div>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://listman.redhat.com/mailman/listinfo/linux-lvm" rel=3D"no=
referrer" target=3D"_blank">https://listman.redhat.com/mailman/listinfo/lin=
ux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"=
noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a></blockqu=
ote></div>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://listman.redhat.com/mailman/listinfo/linux-lvm" rel=3D"no=
referrer" target=3D"_blank">https://listman.redhat.com/mailman/listinfo/lin=
ux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"=
noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a></blockqu=
ote></div>

--00000000000073eb1b05d4d152bd--

--===============6637933962627503906==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============6637933962627503906==--

