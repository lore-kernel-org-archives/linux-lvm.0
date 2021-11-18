Return-Path: <SRS0=rCee=QG=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64FDDC433F5
	for <linux-lvm@archiver.kernel.org>; Fri, 19 Nov 2021 07:25:51 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04CFD6187F
	for <linux-lvm@archiver.kernel.org>; Fri, 19 Nov 2021 07:25:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 04CFD6187F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1637306750;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=w3NIH0lcM5Do1+Ckp65/ZBW8h15o8qDXCtjJLSlCIfE=;
	b=hSShdjGmeGHDCdCyxfLSk6MtbZSXj/2qiE0V+P0INFP4D77FuaYefxItyN0NiFy5b9LXF1
	hhTjDHCZKXHusaEPJkjRDVaF/IXX1hwJCeUgGmMtUxehN7L/8IGrZUKHoJt4SzSHZV47Mf
	lpQ2suPtQHr9qXuG+Cr3FdyX/RaYUIg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-93-griE5-mRO7iqz3Xc4096eA-1; Fri, 19 Nov 2021 02:25:47 -0500
X-MC-Unique: griE5-mRO7iqz3Xc4096eA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AC351006AA1;
	Fri, 19 Nov 2021 07:25:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 65BC619E7E;
	Fri, 19 Nov 2021 07:25:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8A7C2181A1D0;
	Fri, 19 Nov 2021 07:25:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AIL1mS4019683 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 18 Nov 2021 16:01:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C0CC6404727A; Thu, 18 Nov 2021 21:01:48 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD00B4047279
	for <linux-lvm@redhat.com>; Thu, 18 Nov 2021 21:01:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2B741066558
	for <linux-lvm@redhat.com>; Thu, 18 Nov 2021 21:01:48 +0000 (UTC)
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
	[209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-135-iwI1vg-ANFqQtq6Gsqe5-w-1; Thu, 18 Nov 2021 16:01:47 -0500
X-MC-Unique: iwI1vg-ANFqQtq6Gsqe5-w-1
Received: by mail-yb1-f199.google.com with SMTP id
	u12-20020a25f80c000000b005dd97d128f7so11688079ybd.6
	for <linux-lvm@redhat.com>; Thu, 18 Nov 2021 13:01:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=4+NrUMLGDLIwTuB9tQD6/pRsWMg8BlwFvkewtLI2b+w=;
	b=HnHrum9D0NxJ2BJmyUbQaqHdIuwfCaY9/qjKNZlDniX9KsA8Nxr6ulAHffbR0ew6v4
	p/M6BWH5Wifnj9HSzBmWHgFJ84ZV1wvIlCoyBE7c7M5/ykEDs1DW3inPCQMjLqyYkVRw
	XDXvLGewvtX52gQYDhdQuAYWm4fJX2TZwvhVHIwLv92GZqsRdfAo4RLwFd2DOqLvRYRI
	fUV/MCC1Ni5yCb1VW32Bj76aJ1uDqc1FLChrs964eC/1AYX5TznBna4J2EDar7wkWijq
	K6Z2s4fWyg2Us6FgBZeDy3/GOyda8eFgC7PGW5gxB3Hu975u5221gCtt37sTyzn3FZbx
	LCHQ==
X-Gm-Message-State: AOAM531msBCjYBjJFi+8nsF6QYyapatjU6HN2Y4PxicVO4qpUqc3fChH
	t1Qe8mIDksiR6/Tj785unmFA6E/eOc+GzEBzeYzmI5OQ48xUMytMZrmr9ZnudDAV/L/oTEaC989
	4GH5Ougn59lluelm6mMUIFqIBKlsry7tY
X-Received: by 2002:a25:1344:: with SMTP id 65mr30230154ybt.468.1637269305698; 
	Thu, 18 Nov 2021 13:01:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz1KMIPZVypuuG0B/q59E+eqK2fHXp3Q8Jgs8afzulymERwJRrYV+BeVtWP/imExD98yeDxMhVC2I+kKMJz3/U=
X-Received: by 2002:a25:1344:: with SMTP id 65mr30230084ybt.468.1637269305090; 
	Thu, 18 Nov 2021 13:01:45 -0800 (PST)
MIME-Version: 1.0
References: <82721064-e346-9256-3f29-c5df310553ac@werft22.com>
	<8829a805-f55d-695a-4192-65d1386feac9@werft22.com>
In-Reply-To: <8829a805-f55d-695a-4192-65d1386feac9@werft22.com>
From: Heinz Mauelshagen <heinzm@redhat.com>
Date: Thu, 18 Nov 2021 22:01:34 +0100
Message-ID: <CAM23VxogkbxYVKbE4R6Gk0V7B3wc8cqPDgRBUpysj=f_se7utg@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Fri, 19 Nov 2021 02:25:22 -0500
Subject: Re: [linux-lvm] "md/raid:mdX: cannot start dirty degraded array."
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============1050578377023709377=="

--===============1050578377023709377==
Content-Type: multipart/alternative; boundary="00000000000055014705d1167732"

--00000000000055014705d1167732
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Andreas,

LVM RAID and MD RAID have different, hence incompatible superblock formats
so you can't switch to MD in this case.

Try activating your RaidLV with 'lvchange -ay --activationmode=3Ddegraded
/dev/vg_ssds_0/host-home', add a replacement PV of adequate size if none
available and run 'lvconvert --repair /dev/vg_ssds_0/host-home'.

Best,
Heinz

On Fri, Oct 29, 2021 at 1:07 PM Andreas Trottmann <
andreas.trottmann@werft22.com> wrote:

> Am 11.10.21 um 16:08 schrieb Andreas Trottmann:
>
> > I am running a server that runs a number of virtual machines and manage=
s
> their virtual disks as logical volumes using lvmraid (...)
>
> > After a restart, all of the logical volumes came back, except one.
>
> > When I'm trying to activate it, I get:
> >
> > # lvchange -a y /dev/vg_ssds_0/host-home
> >    Couldn't find device with uuid 8iz0p5-vh1c-kaxK-cTRC-1ryd-eQd1-wX1Yq=
9.
> >    device-mapper: reload ioctl on  (253:245) failed: Input/output error
>
>
> I am replying to my own e-mail here in order to document how I got the
> data back, in case someone in a similar situation finds this mail when
> searching for the symptoms.
>
> First: I did *not* succeeed in activating the lvmraid volume. No matter
> how I tried to modify the _rmeta volumes, I always got "reload ioctl
> (...) failed: Input/output error" from "lvchange", and "cannot start
> dirty degraded array" in dmesg.
>
> So, I used "lvchange -a y /dev/vg_ssds_0/host-home_rimage_0" (and
> _rimage_2 and _rimage_3, as those were the ones that were *not* on the
> failed PV) to get access to the indivdual RAID SubLVs. I then used "dd
> if=3D/dev/vg_ssds_0/host-home_rimage_0 of=3D/mnt/space/rimage_0" to copy =
the
> data to a file on a filesystem with enough space. I repeated this with 2
> and 3 as well. I then used losetup to access /mnt/space/rimage_0 as
> /dev/loop0, rimage_2 as loop2, and rimage_3 as loop3.
>
> Now I wanted to use mdadm to "build" the RAID in the "array that doesn't
> have per-device metadata (superblocks)" case:
>
> # mdadm --build /dev/md0 -n 4 -c 128 -l 5 --assume-clean --readonly
> /dev/loop0 missing /dev/loop2 /dev/loop3
>
> However, this failed with "mdadm: Raid level 5 not permitted with --build=
".
>
> ("-c 128" was the chunk size used when creating the lvmraid, "-n 4" and
> "-l 5" refer to the number of devices and the raid level)
>
> I then read the man page about the "superblocks", and found out that the
> "1.0" style of RAID metadata (selected with an mdadm "-e 1.0" option)
> places a superblock at the end of the device. Some experimenting on
> unused devices showed that the size used for actual data was the size of
> the block device minus 144 KiB (possibly 144 KiB =3D 128 KiB (chunksize) =
+
> 8 KiB (size of superblock) + 8 KiB (size of bitmap). So I added 147456
> zero bytes at the end of each file:
>
> # for i in 0 2 3; do head -c 147456 /dev/zero >> /mnt/space/rimage_$i; do=
ne
>
> After detaching and re-attaching the loop devices, I ran
>
> # mdadm --create /dev/md0 -n 4 -c 128 -l 5 -e 1.0 --assume-clean
> /dev/loop0 missing /dev/loop2 /dev/loop3
>
> (substituting "missing" in the place where the missing RAID SubLV would
> have been)
>
> And, voil=C3=A0: /dev/md0 was perfectly readable, fsck showed no errors, =
and
> it could be mounted correctly, with all data intact.
>
>
>
> Kind regards
>
> --
> Andreas Trottmann
> Werft22 AG
> Tel    +41 (0)56 210 91 32
> Fax    +41 (0)56 210 91 34
> Mobile +41 (0)79 229 88 55
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--00000000000055014705d1167732
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Andreas,<div><br></div><div>LVM RAID and MD RAID have diff=
erent, hence incompatible superblock formats so you can&#39;t switch to MD =
in this case.</div><div><br></div><div>Try activating your RaidLV with &#39=
;lvchange -ay --activationmode=3Ddegraded /dev/vg_ssds_0/host-home&#39;, ad=
d a replacement PV of adequate size if none available and run &#39;lvconver=
t --repair /dev/vg_ssds_0/host-home&#39;.</div><div><br></div><div>Best,<br=
>Heinz</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Fri, Oct 29, 2021 at 1:07 PM Andreas Trottmann &lt;<a href=
=3D"mailto:andreas.trottmann@werft22.com">andreas.trottmann@werft22.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Am 1=
1.10.21 um 16:08 schrieb Andreas Trottmann:<br>
<br>
&gt; I am running a server that runs a number of virtual machines and manag=
es their virtual disks as logical volumes using lvmraid (...)<br>
<br>
&gt; After a restart, all of the logical volumes came back, except one.<br>
<br>
&gt; When I&#39;m trying to activate it, I get:<br>
&gt;<br>
&gt; # lvchange -a y /dev/vg_ssds_0/host-home<br>
&gt;=C2=A0 =C2=A0 Couldn&#39;t find device with uuid 8iz0p5-vh1c-kaxK-cTRC-=
1ryd-eQd1-wX1Yq9.<br>
&gt;=C2=A0 =C2=A0 device-mapper: reload ioctl on=C2=A0 (253:245) failed: In=
put/output error<br>
<br>
<br>
I am replying to my own e-mail here in order to document how I got the <br>
data back, in case someone in a similar situation finds this mail when <br>
searching for the symptoms.<br>
<br>
First: I did *not* succeeed in activating the lvmraid volume. No matter <br=
>
how I tried to modify the _rmeta volumes, I always got &quot;reload ioctl <=
br>
(...) failed: Input/output error&quot; from &quot;lvchange&quot;, and &quot=
;cannot start <br>
dirty degraded array&quot; in dmesg.<br>
<br>
So, I used &quot;lvchange -a y /dev/vg_ssds_0/host-home_rimage_0&quot; (and=
 <br>
_rimage_2 and _rimage_3, as those were the ones that were *not* on the <br>
failed PV) to get access to the indivdual RAID SubLVs. I then used &quot;dd=
 <br>
if=3D/dev/vg_ssds_0/host-home_rimage_0 of=3D/mnt/space/rimage_0&quot; to co=
py the <br>
data to a file on a filesystem with enough space. I repeated this with 2 <b=
r>
and 3 as well. I then used losetup to access /mnt/space/rimage_0 as <br>
/dev/loop0, rimage_2 as loop2, and rimage_3 as loop3.<br>
<br>
Now I wanted to use mdadm to &quot;build&quot; the RAID in the &quot;array =
that doesn&#39;t <br>
have per-device metadata (superblocks)&quot; case:<br>
<br>
# mdadm --build /dev/md0 -n 4 -c 128 -l 5 --assume-clean --readonly <br>
/dev/loop0 missing /dev/loop2 /dev/loop3<br>
<br>
However, this failed with &quot;mdadm: Raid level 5 not permitted with --bu=
ild&quot;.<br>
<br>
(&quot;-c 128&quot; was the chunk size used when creating the lvmraid, &quo=
t;-n 4&quot; and <br>
&quot;-l 5&quot; refer to the number of devices and the raid level)<br>
<br>
I then read the man page about the &quot;superblocks&quot;, and found out t=
hat the <br>
&quot;1.0&quot; style of RAID metadata (selected with an mdadm &quot;-e 1.0=
&quot; option) <br>
places a superblock at the end of the device. Some experimenting on <br>
unused devices showed that the size used for actual data was the size of <b=
r>
the block device minus 144 KiB (possibly 144 KiB =3D 128 KiB (chunksize) + =
<br>
8 KiB (size of superblock) + 8 KiB (size of bitmap). So I added 147456 <br>
zero bytes at the end of each file:<br>
<br>
# for i in 0 2 3; do head -c 147456 /dev/zero &gt;&gt; /mnt/space/rimage_$i=
; done<br>
<br>
After detaching and re-attaching the loop devices, I ran<br>
<br>
# mdadm --create /dev/md0 -n 4 -c 128 -l 5 -e 1.0 --assume-clean <br>
/dev/loop0 missing /dev/loop2 /dev/loop3<br>
<br>
(substituting &quot;missing&quot; in the place where the missing RAID SubLV=
 would <br>
have been)<br>
<br>
And, voil=C3=A0: /dev/md0 was perfectly readable, fsck showed no errors, an=
d <br>
it could be mounted correctly, with all data intact.<br>
<br>
<br>
<br>
Kind regards<br>
<br>
-- <br>
Andreas Trottmann<br>
Werft22 AG<br>
Tel=C2=A0 =C2=A0 +41 (0)56 210 91 32<br>
Fax=C2=A0 =C2=A0 +41 (0)56 210 91 34<br>
Mobile +41 (0)79 229 88 55<br>
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
ote></div>

--00000000000055014705d1167732--

--===============1050578377023709377==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============1050578377023709377==--

