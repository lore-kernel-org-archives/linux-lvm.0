Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B6BC433EF
	for <linux-lvm@archiver.kernel.org>; Wed,  2 Feb 2022 06:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643782778;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=ziuYjTp6k7U2++S65UVQVco/Vg5BrVolJ8Tc1L/vO2A=;
	b=jHEE3nuME14SvB7mmtsQyyhfy4eR0xyc7Vi0XsFSp34DBEHh3HXyUh9xIpYVZpjojD79vs
	Nvh7SWeOWN24xeg7FpbsFuvJTs2jO5gUc8S+Q39B3p2k4mUijV+k5skCsrp/+3rOjgevjG
	0kN7CXsMegmcjdXUuKPc1l6hWiA1sV4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-CmFdAmQ8NoWG0IPt5o_VPg-1; Wed, 02 Feb 2022 01:19:35 -0500
X-MC-Unique: CmFdAmQ8NoWG0IPt5o_VPg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 421681006AA0;
	Wed,  2 Feb 2022 06:19:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D1113ADD6;
	Wed,  2 Feb 2022 06:19:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9BA4F4A7CD;
	Wed,  2 Feb 2022 06:19:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
	[10.11.54.10])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20VLTJuG010228 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 31 Jan 2022 16:29:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F293C401E50; Mon, 31 Jan 2022 21:29:18 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE87C401E3A
	for <linux-lvm@redhat.com>; Mon, 31 Jan 2022 21:29:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D2A35803C9F
	for <linux-lvm@redhat.com>; Mon, 31 Jan 2022 21:29:18 +0000 (UTC)
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
	[209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-407-m2UkwZeCNVeZkZQ3dMi6OQ-1; Mon, 31 Jan 2022 16:29:17 -0500
X-MC-Unique: m2UkwZeCNVeZkZQ3dMi6OQ-1
Received: by mail-lf1-f71.google.com with SMTP id
	n6-20020ac242c6000000b00439ec721d28so4966026lfl.6
	for <linux-lvm@redhat.com>; Mon, 31 Jan 2022 13:29:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=8dFIer43RGFVNdfVntGlYcM2INOtvRqUDf4TELff5JI=;
	b=POrYVQbiQjiCswyHQZSXwTQ85zYYkmYvcJnLmsa0n1oH6kHQr+/AThplx/rzIGX05w
	BGZR0l/2IYyNzSnGpsl64GkqlnE+SUMMC30xNPZtI+hbq+GY1PjxmisYwwZeOWdvbIsH
	dHDlYHzM8qDzYbtdU/Rs949mUdr63UMHi/Ko/YVEEEOh0vxT4idxS0LhJECHZ6dr4g/R
	66WaRTxiiIpKO35HGmKWkZBh39kOFRv/xUtq4H/6mbW4KRSetckH+hfmiMt3sMKroAnd
	OSNR1SdR0OX0joUmPos2QY11w/sSkOv5K/wHgmVcU71XcuorWE/0Fo+igkJ+4OOLslAJ
	b18g==
X-Gm-Message-State: AOAM530nkVWdxK7Y/MCKUd8P2OY3vhp1HrRDbm62s4lE5pk+7SWU4Wu1
	8gMkhyKlVEjVa11QvwtW+DW0NdaBnBgoL4zkY+9kR0CmpSx1zOagB8ErrhCbq9kb593UdYMihzM
	oVlaN9RtosGe/GJ8zoi0M3zQFhV9c/88d
X-Received: by 2002:a05:6512:33d1:: with SMTP id
	d17mr9267401lfg.455.1643664555228; 
	Mon, 31 Jan 2022 13:29:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxN1Ukt7VT/yqd0+jaeDqPGJYr/J1NNzXUh6N0DLU8Umj2pe/Z+TgbMtUvH5Lig/NpbkTUSVK02Wn/fl1QmxJ4=
X-Received: by 2002:a05:6512:33d1:: with SMTP id
	d17mr9267382lfg.455.1643664554938; 
	Mon, 31 Jan 2022 13:29:14 -0800 (PST)
MIME-Version: 1.0
References: <YfWkwtOTFYxDyYrW@itl-email>
	<6da8a7fc-4ca4-9c1d-c547-dcba827c5c99@gmail.com>
	<YfXcxHenCZw4+EFX@itl-email>
	<4bb347f0-b63b-d6f6-d501-1318053d0e56@gmail.com>
	<YfbApm+9ac6iBbbg@itl-email>
	<30ba3f0683afb9c3b60d96ac0019ced4ce9bb5b8.camel@gathman.org>
	<YfcN6KHxLe3/krTX@itl-email>
In-Reply-To: <YfcN6KHxLe3/krTX@itl-email>
From: Marian Csontos <mcsontos@redhat.com>
Date: Mon, 31 Jan 2022 22:29:04 +0100
Message-ID: <CAJNi=XrO3+N63W1zxVhP0_y7CrHB=mmKpA2_MrVRSRX_e2u53A@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Wed, 02 Feb 2022 01:19:05 -0500
Subject: Re: [linux-lvm] LVM performance vs direct dm-thin
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
Content-Type: multipart/mixed; boundary="===============4649356610872046868=="

--===============4649356610872046868==
Content-Type: multipart/alternative; boundary="000000000000ed689d05d6e7793c"

--000000000000ed689d05d6e7793c
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 30, 2022 at 11:17 PM Demi Marie Obenour <
demi@invisiblethingslab.com> wrote:

> On Sun, Jan 30, 2022 at 04:39:30PM -0500, Stuart D. Gathman wrote:
> > Your VM usage is different from ours - you seem to need to clone and
> > activate a VM quickly (like a vps provider might need to do).  We
> > generally have to buy more RAM to add a new VM :-), so performance of
> > creating a new LV is the least of our worries.
>
> To put it mildly, yes :).  Ideally we could get VM boot time down to
> 100ms or lower.
>

Out of curiosity, is snapshot creation the main culprit to boot a VM in
under 100ms? Does Qubes OS use tweaked linux distributions, to achieve the
desired boot time?

Back to business. Perhaps I missed an answer to this question: Are the
Qubes OS VMs throw away?  Throw away in the sense like many containers are
- it's just a runtime which can be "easily" reconstructed. If so, you can
ignore the safety belts and try to squeeze more performance by sacrificing
(meta)data integrity.

And the answer to that question seems to be both Yes and No. Classical pets
vs cattle.

As I understand it, except of the system VMs, there are at least two kinds
of user domains and these have different requirements:

1. few permanent pet VMs (Work, Personal, Banking, ...), in Qubes OS called
AppVMs,
2. and many transient cattle VMs (e.g. for opening an attachment from
email, or browsing web, or batch processing of received files) called
Disposable VMs.

For AppVMs, there are only "few" of those and these are running most of the
time so start time may be less important than data safety. Certainly
creation time is only once in a while operation so I would say use LVM for
these. And where snapshots are not required, use plain linear LVs, one less
thing which could go wrong. However, AppVMs are created from Template VMs,
so snapshots seem to be part of the system. But data may be on linear LVs
anyway as these are not shared and these are the most important part of the
system. And you can still use old style snapshots for backing up the data
(and by backup I mean snapshot, copy, delete snapshot. Not a long term
snapshot. And definitely not multiple snapshots).

Now I realized there is the third kind of user domains - Template VMs.
Similarly to App VM, there are only few of those, and creating them
requires downloading an image, upgrading system on an existing template, or
even installation of the system, so any LVM overhead is insignificant for
these. Use thin volumes.

For the Disposable VMs it is the creation + startup time which matters. Use
whatever is the fastest method. These are created from template VMs too.
What LVM/DM has to offer here is external origin. So the templates
themselves could be managed by LVM, and Qubes OS could use them as external
origin for Disposable VMs using device mapper directly. These could be held
in a disposable thin pool which can be reinitialized from scratch on host
reboot, after a crash, or on a problem with the pool. As a bonus this would
also address the absence of thin pool shrinking.

I wonder if a pool of ready to be used VMs could solve some of the startup
time issues - keep $POOL_SIZE VMs (all using LVM) ready and just inject the
data to one of the VMs when needed and prepare a new one asynchronously. So
you could have to some extent both the quick start and data safety as a
solution for the hypothetical third kind of domains requiring them - e.g. a
Disposable VM spawn to edit a file from a third party - you want to keep
the state on a reboot or a system crash.

--000000000000ed689d05d6e7793c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jan 30, 2022 at 11:17 PM Demi=
 Marie Obenour &lt;<a href=3D"mailto:demi@invisiblethingslab.com" target=3D=
"_blank">demi@invisiblethingslab.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On Sun, Jan 30, 2022 at 04:39:30PM -050=
0, Stuart D. Gathman wrote:<br>&gt; Your VM usage is different from ours - =
you seem to need to clone and<br>
&gt; activate a VM quickly (like a vps provider might need to do).=C2=A0 We=
<br>
&gt; generally have to buy more RAM to add a new VM :-), so performance of<=
br>
&gt; creating a new LV is the least of our worries.<br>
<br>
To put it mildly, yes :).=C2=A0 Ideally we could get VM boot time down to<b=
r>
100ms or lower.<br></blockquote><div><br></div><div><div>Out of curiosity, =
is snapshot creation the main culprit to boot a VM in under 100ms? Does Qub=
es OS use tweaked linux distributions, to achieve the desired boot time?</d=
iv><div><br></div></div><div>Back to business. Perhaps I missed an answer t=
o this question: Are the Qubes OS VMs=C2=A0throw away?=C2=A0 Throw away in =
the sense like many containers are - it&#39;s just a runtime which can be &=
quot;easily&quot;=C2=A0reconstructed. If so, you can ignore the safety belt=
s and try to squeeze more performance by sacrificing (meta)data integrity.<=
/div><div><br></div><div>And the answer to that question seems to be both Y=
es and No. Classical pets vs cattle.<br></div><div><br></div><div>As I unde=
rstand it, except of the system VMs, there are at least two kinds of user d=
omains and these have different requirements:</div><div><br></div><div>1. f=
ew permanent pet VMs=C2=A0(Work, Personal, Banking, ...), in Qubes OS calle=
d AppVMs,<br></div><div>2. and many transient cattle VMs=C2=A0(e.g. for ope=
ning=C2=A0an attachment from email, or browsing web, or batch processing of=
 received files) called Disposable VMs.</div><div><br></div><div>For AppVMs=
, there are only &quot;few&quot; of those and these are running most of the=
 time so start time may be less important than data safety. Certainly creat=
ion time is only once in a while operation so I would say use LVM for these=
. And where snapshots are not required, use plain linear LVs, one less thin=
g which could go wrong. However, AppVMs are created from Template VMs, so s=
napshots seem to be part of the system. But data may be on linear LVs anywa=
y as these are not shared and these are the most important part of the syst=
em. And you can still use old style snapshots for backing up the data (and =
by backup I mean snapshot, copy, delete snapshot. Not a long term snapshot.=
 And definitely not multiple snapshots).</div><div><br></div><div>Now I rea=
lized there is the third kind of user domains - Template VMs. Similarly to =
App VM, there are=C2=A0only few of those, and creating them requires downlo=
ading an image, upgrading system on an existing template, or even installat=
ion of the system, so any LVM overhead is insignificant for these. Use thin=
 volumes.</div><div><br></div><div>For the Disposable VMs it is the creatio=
n + startup time which matters. Use whatever is the fastest method. These a=
re created from template VMs too. What LVM/DM has to offer here is external=
 origin. So the templates themselves could be managed by LVM, and Qubes OS =
could use them as external origin for Disposable VMs using device mapper di=
rectly. These could be held in a disposable thin pool which can be reinitia=
lized from scratch on host reboot, after a crash, or on a problem with the =
pool. As a bonus this would also address the absence of thin pool shrinking=
.</div><div><br></div><div>I wonder if a pool of ready to be used VMs could=
 solve some of the startup time issues - keep $POOL_SIZE VMs (all using LVM=
) ready and just inject the data to one of the VMs when needed and prepare =
a new one asynchronously. So you could have to some extent both the quick s=
tart and data safety as a solution for the hypothetical third kind of domai=
ns requiring them - e.g. a Disposable VM spawn to edit a file from a third =
party - you want to keep the state on a reboot or a system crash.<br></div>=
<div><br></div></div></div>

--000000000000ed689d05d6e7793c--

--===============4649356610872046868==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============4649356610872046868==--

