Return-Path: <SRS0=Y+sl=OR=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9593C433EF
	for <linux-lvm@archiver.kernel.org>; Mon, 27 Sep 2021 05:36:43 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7011960EB4
	for <linux-lvm@archiver.kernel.org>; Mon, 27 Sep 2021 05:36:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7011960EB4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-4wb-TZgHMTyu8ZNEo-0VAw-1; Mon, 27 Sep 2021 01:36:40 -0400
X-MC-Unique: 4wb-TZgHMTyu8ZNEo-0VAw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38279802935;
	Mon, 27 Sep 2021 05:36:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 22D5C4F0BA;
	Mon, 27 Sep 2021 05:36:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 454651801241;
	Mon, 27 Sep 2021 05:36:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18QEMbtY031149 for <linux-lvm@listman.util.phx.redhat.com>;
	Sun, 26 Sep 2021 10:22:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 060291134306; Sun, 26 Sep 2021 14:22:37 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 004691112841
	for <linux-lvm@redhat.com>; Sun, 26 Sep 2021 14:22:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 19D4E80B91D
	for <linux-lvm@redhat.com>; Sun, 26 Sep 2021 14:22:32 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
	[209.85.222.48]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-517-D-7wDBwOMX-O2TMeUuqczg-1; Sun, 26 Sep 2021 10:22:30 -0400
X-MC-Unique: D-7wDBwOMX-O2TMeUuqczg-1
Received: by mail-ua1-f48.google.com with SMTP id b34so308070uad.8
	for <linux-lvm@redhat.com>; Sun, 26 Sep 2021 07:22:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9QS6BzJLwNnjctmL1YE5NZXGKZBCPuo6ep0IFq0wYDo=;
	b=AZ4aoDcWlOB4UBZhwgwYUYNXkeeLlJ2QnDITaLNNeYA63oTC/7mBfP9crZuj7SzDTs
	kOzvedf1eH2yXsXwnpArD3VCmBiUUCPXyZ1YAdDTpV7j+cUEeYKZA+i3N/K82mD6rZLw
	YDPHlp2JpXapiuZ4GPylbLNVxtmiDYi13nclssZXRZypYT6BFQrEIRjw1tkQQwqZ1AbP
	z/WMbftQdsT3cwhL7W8Gy916TWJaLagLb6gI4pnYEvaARH4bjQZ+gAiCn19/d1/4gycr
	sjPpvekS3qKJWTIEtImrc+aMEShKjmdrYVUXNE1ZhXvsApIhY1dxu+JwQ2QrZBfDc/da
	xryA==
X-Gm-Message-State: AOAM533CXpx4nBZSEZ8HN7AbM2iyg8U2h7xQRn1AazFCZwrCg0sUt5PB
	AsaTtPooCRlLad8itImYrDRK4MWsPljjy9smsy8=
X-Google-Smtp-Source: ABdhPJxkX1Vvobjj+N/PGR2EnQJW1BI8xRTOEsypyYtOir1gIy3gppXp2y635QEvHSc0TYDqsqGuOdfTRFw+9oytc7I=
X-Received: by 2002:a05:6130:31b:: with SMTP id
	ay27mr16723250uab.135.1632666149346; 
	Sun, 26 Sep 2021 07:22:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAFrGbuU63mCLDc47aiY6PuEf4C1B=CL3Dh1=GB+p_rRWkV8S4g@mail.gmail.com>
	<CAFrGbuWKxbB=2Q6QygfN5mLh1MU7ztwXOouiRF2ynP-BcjhfXA@mail.gmail.com>
	<bd2ffcd6-e067-8152-fd2f-6d5036cb2ec6@redhat.com>
	<CAAMCDecFLoJ6ait9uUP0nQkYXZnMoPNre6v_1uBj=tGE_APtvg@mail.gmail.com>
In-Reply-To: <CAAMCDecFLoJ6ait9uUP0nQkYXZnMoPNre6v_1uBj=tGE_APtvg@mail.gmail.com>
From: alessandro macuz <alessandro.macuz@gmail.com>
Date: Sun, 26 Sep 2021 16:22:17 +0200
Message-ID: <CAFrGbuVR70RB8x=JYNK=qTtCc_UGnrhtXLNjDZuwai1MAF-eCg@mail.gmail.com>
To: Roger Heflin <rogerheflin@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Mon, 27 Sep 2021 01:35:53 -0400
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: [linux-lvm] " Failed to find physical volume <ZFS block device"
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
Content-Type: multipart/mixed; boundary="===============1032919498101777322=="

--===============1032919498101777322==
Content-Type: multipart/alternative; boundary="000000000000de5fb105cce6b5cc"

--000000000000de5fb105cce6b5cc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Roger, Zdenek,

I have my ZVOL on my NAS exposed as LUNs. The initiator were switched off
and for unknown reason I found my NAS switched off as well.
It had run for long and I feared the worst (CPU/motherboard/etc). Instead
once powered up everything started to work again but the LUNs that seemed
to jeopardized.
I have many ZVOLs used by ESXi in which I have EVE-NG who uses LVM and such
ZVOLs have the same size so I wanted to inspect them to check the hostname.

Now some LUNs started to work normally, some others still behave weirdly. I
will run pvs on them with extra debugs to see what's going on.

Many thanks,

Alex

Le jeu. 23 sept. 2021 =C3=A0 23:48, Roger Heflin <rogerheflin@gmail.com> a
=C3=A9crit :

> If you have lvmetad running and in use then the lvm commands ask it
> what the system has on it.
>
> I have seen on random boots fairly separated systems (rhel7 versions,
> and many years newer fedora systems) at random fail to find one or
> more pv.s
>
> I have disabled it at home, and in my day job we have also disabled
> (across 20k+ systems) as we confirmed it had inconsistency issues
> several times on a variety of our newest installs.
>
> Stopping lvmetad and/or restarting it would generally fix it.    But
> it was a source of enough random issues(often failure to mount on a
> boot, so often issues that resulted in page-outs to debug)  and did
> not speed things up much enough to be worth it even on devices with
> >2000 SAN volumes.
>
> On Thu, Sep 23, 2021 at 8:52 AM Zdenek Kabelac <zkabelac@redhat.com>
> wrote:
> >
> > Dne 22. 09. 21 v 18:48 alessandro macuz napsal(a):
> > > fdisk correctly identifies the extended partition as 8e.
> > > I wonder which kind of data lvmdiskscan and pvs use in order to list
> LVM
> > > physical volumes.
> > > Does PVS check some specific metadata within the partition without ju=
st
> > > relying on the type of partition displayed by fdisk?
> > >
> > >
> >
> > Hi
> >
> > Yes - PVs do have header signature keeping information about PV
> attributes
> > and also has the storage area to keep lvm2 metadata.
> >
> > Partition flags known to fdisk are irrelevant.
> >
> >
> > Regards
> >
> > Zdenek
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://listman.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >
>

--000000000000de5fb105cce6b5cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks Roger, Zdenek,</div><div><br></div><div>I have=
 my ZVOL on my NAS exposed as LUNs. The initiator were switched off and for=
 unknown reason I found my NAS switched off as well.</div><div>It had run f=
or long and I feared the worst (CPU/motherboard/etc). Instead once powered =
up everything started to work again but the LUNs that seemed to jeopardized=
.</div><div>I have many ZVOLs used by ESXi in which I have EVE-NG who uses =
LVM and such ZVOLs have the same size so I wanted to inspect them to check =
the hostname.</div><div><br></div><div>Now some LUNs started to work normal=
ly, some others still behave weirdly. I will run pvs on them with extra deb=
ugs to see what&#39;s going on.<br><br></div><div>Many thanks,</div><div><b=
r></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 23 sept. 2021 =C3=A0=C2=A023:48, Ro=
ger Heflin &lt;<a href=3D"mailto:rogerheflin@gmail.com">rogerheflin@gmail.c=
om</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">If you have lvmetad running and in use then the lvm commands=
 ask it<br>
what the system has on it.<br>
<br>
I have seen on random boots fairly separated systems (rhel7 versions,<br>
and many years newer fedora systems) at random fail to find one or<br>
more pv.s<br>
<br>
I have disabled it at home, and in my day job we have also disabled<br>
(across 20k+ systems) as we confirmed it had inconsistency issues<br>
several times on a variety of our newest installs.<br>
<br>
Stopping lvmetad and/or restarting it would generally fix it.=C2=A0 =C2=A0 =
But<br>
it was a source of enough random issues(often failure to mount on a<br>
boot, so often issues that resulted in page-outs to debug)=C2=A0 and did<br=
>
not speed things up much enough to be worth it even on devices with<br>
&gt;2000 SAN volumes.<br>
<br>
On Thu, Sep 23, 2021 at 8:52 AM Zdenek Kabelac &lt;<a href=3D"mailto:zkabel=
ac@redhat.com" target=3D"_blank">zkabelac@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Dne 22. 09. 21 v 18:48 alessandro macuz napsal(a):<br>
&gt; &gt; fdisk correctly identifies the extended partition as 8e.<br>
&gt; &gt; I wonder which kind of data lvmdiskscan and pvs use in order to l=
ist LVM<br>
&gt; &gt; physical volumes.<br>
&gt; &gt; Does PVS check some specific metadata within the partition withou=
t just<br>
&gt; &gt; relying on the type of partition displayed by fdisk?<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt;<br>
&gt; Hi<br>
&gt;<br>
&gt; Yes - PVs do have header signature keeping information about PV attrib=
utes<br>
&gt; and also has the storage area to keep lvm2 metadata.<br>
&gt;<br>
&gt; Partition flags known to fdisk are irrelevant.<br>
&gt;<br>
&gt;<br>
&gt; Regards<br>
&gt;<br>
&gt; Zdenek<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; linux-lvm mailing list<br>
&gt; <a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@re=
dhat.com</a><br>
&gt; <a href=3D"https://listman.redhat.com/mailman/listinfo/linux-lvm" rel=
=3D"noreferrer" target=3D"_blank">https://listman.redhat.com/mailman/listin=
fo/linux-lvm</a><br>
&gt; read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" re=
l=3D"noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
&gt;<br>
</blockquote></div>

--000000000000de5fb105cce6b5cc--

--===============1032919498101777322==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============1032919498101777322==--

