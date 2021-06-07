Return-Path: <SRS0=kfxi=LC=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E409C47082
	for <linux-lvm@archiver.kernel.org>; Tue,  8 Jun 2021 06:29:57 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C7A7611BD
	for <linux-lvm@archiver.kernel.org>; Tue,  8 Jun 2021 06:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C7A7611BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-W0e0ZZ3cPVOEQUDULLvK1A-1; Tue, 08 Jun 2021 02:29:54 -0400
X-MC-Unique: W0e0ZZ3cPVOEQUDULLvK1A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1CD36D585;
	Tue,  8 Jun 2021 06:29:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E3FD60917;
	Tue,  8 Jun 2021 06:29:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0218444A58;
	Tue,  8 Jun 2021 06:29:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 157Kr7o8011322 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 7 Jun 2021 16:53:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 74521205D6D6; Mon,  7 Jun 2021 20:53:07 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F5B8205D6DB
	for <linux-lvm@redhat.com>; Mon,  7 Jun 2021 20:53:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E02880B915
	for <linux-lvm@redhat.com>; Mon,  7 Jun 2021 20:53:04 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
	[209.85.222.169]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-332-N0aAhtSWMbmflNPtCr0Y5Q-1; Mon, 07 Jun 2021 16:52:59 -0400
X-MC-Unique: N0aAhtSWMbmflNPtCr0Y5Q-1
Received: by mail-qk1-f169.google.com with SMTP id k11so16489518qkk.1;
	Mon, 07 Jun 2021 13:52:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tbNMJ4f55C1226AhhvVip9ozyDKe437g79ZIQKlRVno=;
	b=thL2webuxPd+SwzEv1U62EtK96M1TRwAfU7WbVtb3hzjLQIf3OMV8T9tZtFfrXCSsV
	FlCZDDYiLC/dogFfbQBTwaajuIy5tj1h6+3LM6pY+6SKGU5d3CBHFGxj0KiDkNKWrwfJ
	Mx4Xbn/GoyVeSn/8yySzarpSuVCZDYQuHnhyeFSgz9MHLELZak9uMFC8Ih+S+0ShoCZU
	8EpkM5KR3Dsx0bf/zD0CxWlH8iTQDVSwlgRbV/7By+QY35AzJpaPISB18uvHcCPFE4iA
	nJg7LRFpssFCsAJcMFVW8HNlt40bIJYKkloyaLvhjO0wrvHdS3p/AdegdEJHU/n1yF+V
	gG/w==
X-Gm-Message-State: AOAM531falFM75CTpIdPZGig3wx51U+6y5eDzGoSZlIZLuha6J4WcPw9
	W67nXGag2E0jBOYdDWMVku/Xb5/2uwNCMPCUgkV42x+wDhUu9g==
X-Google-Smtp-Source: ABdhPJx1J1PwheiJF9J3moM88VwBIK6iRPoQ56XjBD+jImSxsRkrJnP9ChLb3Zpx7OUgIntqjXcfKoiRYm1gJa+X4Bs=
X-Received: by 2002:a05:620a:150a:: with SMTP id
	i10mr10869896qkk.84.1623099178369; 
	Mon, 07 Jun 2021 13:52:58 -0700 (PDT)
MIME-Version: 1.0
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<CAAMCDef6sSy5X2+-WLR3wx5m7dx9bhmN3EKWyPa31SebS=wRGQ@mail.gmail.com>
	<dd395e820a4cf9b5e807e8de1e456786eebd2044.camel@suse.com>
	<7522886d-bfba-6dd6-882a-703d5776e71f@suse.com>
In-Reply-To: <7522886d-bfba-6dd6-882a-703d5776e71f@suse.com>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Mon, 7 Jun 2021 15:52:24 -0500
Message-ID: <CAAMCDecgq3QZh16VXbvKWQf7iH54XJ3r7i9=38K-00vqAVCJqw@mail.gmail.com>
To: "heming.zhao@suse.com" <heming.zhao@suse.com>
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
X-Mailman-Approved-At: Tue, 08 Jun 2021 02:29:10 -0400
Cc: "zkabelac@redhat.com" <zkabelac@redhat.com>,
	"linux-lvm@redhat.com" <linux-lvm@redhat.com>,
	"teigland@redhat.com" <teigland@redhat.com>,
	Martin Wilck <martin.wilck@suse.com>
Subject: Re: [linux-lvm] Discussion: performance issue on event activation
	mode
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============6485464717866252251=="

--===============6485464717866252251==
Content-Type: multipart/alternative; boundary="000000000000f64ba505c4333945"

--000000000000f64ba505c4333945
Content-Type: text/plain; charset="UTF-8"

The case we had is large physical machines with around 1000 disks.   We did
not see the issue on the smaller cpu/disked physicals and/or vm's.  It
seemed like both high cpu counts and high disk counts were needed, but in
our environment both of those are usually together.    The smallest
machines that had the issues had 72 threads (36 actual cores).   And the
disk devices were all SSD SAN luns so I would expect all of the devices to
respond to and return IO requests in under .3ms under normal conditions.
They were also all partitioned and multipath'ed.  90% of the disk would not
have had any LVM on them at all but would have been at least initial
scanned by something, but the systemd LVM parts where what was timing out,
and based on the time udev was getting in the 90-120 seconds (90 minutes of
time) it very much seemed to be having serious cpu time issues doing
something.

I have done some simple tests forking a bunch of tests forking off a bunch
of  /usr/sbin/lvm pvscan --cache major:minor in the background and in
parallel rapidly and cannot get it to really act badly except with numbers
that are >20000.

And if I am reading the direct case pvscan that is fast about the only
thing that differs is that it does not spawn off lots of processes and
events and just does the pvscan once.  Between udev and systemd I am not
clear on how many different events have to be handled and how many of those
events need to spawn new threads and/or fork new processes off.
Something doing one of those 2 things or both would seem to have been the
cause of the issue I saw in the past.

When it has difficult booting up like this what does ps axuS | grep udev
look like time wise?


On Mon, Jun 7, 2021 at 10:30 AM heming.zhao@suse.com <heming.zhao@suse.com>
wrote:

> On 6/7/21 6:27 PM, Martin Wilck wrote:
> > On So, 2021-06-06 at 11:35 -0500, Roger Heflin wrote:
> >> This might be a simpler way to control the number of threads at the
> >> same time.
> >>
> >> On large machines (cpu wise, memory wise and disk wise).   I have
> >> only seen lvm timeout when udev_children is set to default.   The
> >> default seems to be set wrong, and the default seemed to be tuned for
> >> a case where a large number of the disks on the machine were going to
> >> be timing out (or otherwise really really slow), so to support this
> >> case a huge number of threads was required..    I found that with it
> >> set to default on a close to 100 core machine that udev got about 87
> >> minutes of time during the boot up (about 2 minutes).  Changing the
> >> number of children to =4 resulted in udev getting around 2-3 minutes
> >> in the same window, and actually resulted in a much faster boot up
> >> and a much more reliable boot up (no timeouts).
> >
> > Wow, setting the number of children to 4 is pretty radical. We decrease
> > this parameter often on large machines, but we never went all the way
> > down to a single-digit number. If that's really necessary under
> > whatever circumstances, it's clear evidence of udev's deficiencies.
> >
> > I am not sure if it's better than Heming's suggestion though. It would
> > affect every device in the system. It wouldn't even be possible to
> > process more than 4 totally different events at the same time.
> >
>
> hello
>
> I tested udev.children_max with value 1, 2 & 4. The results showed it
> didn't take effect, and the booting time even longer than before.
> This solution may suite for some special cases.
>
> (my env: kvm-qemu vm, 6vpu, 22G mem, 1015 disks)
>
> Regards
> heming
>
>

--000000000000f64ba505c4333945
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The case we had is large physical machines with aroun=
d 1000 disks.=C2=A0=C2=A0 We did not see the issue on the smaller cpu/diske=
d physicals and/or vm&#39;s.=C2=A0 It seemed like both high cpu counts and =
high disk counts were needed, but in our environment both of those are usua=
lly together. =C2=A0=C2=A0 The smallest machines that had the issues had 72=
 threads (36 actual cores).=C2=A0=C2=A0 And the disk devices were all SSD S=
AN luns so I would expect all of the devices to respond to and return IO re=
quests in under .3ms under normal conditions.=C2=A0=C2=A0 They were also al=
l partitioned and multipath&#39;ed.=C2=A0 90% of the disk would not have ha=
d any LVM on them at all but would have been at least initial scanned by so=
mething, but the systemd LVM parts where what was timing out, and based on =
the time udev was getting in the 90-120 seconds (90 minutes of time) it ver=
y much seemed to be having serious cpu time issues doing something.<br></di=
v><div><br></div><div>I have done some simple tests forking a bunch of test=
s forking off a bunch of=C2=A0 /usr/sbin/lvm pvscan --cache major:minor in =
the background and in parallel rapidly and cannot get it to really act badl=
y except with numbers that are &gt;20000.<br></div><div><br></div><div>And =
if I am reading the direct case pvscan that is fast about the only thing th=
at differs is that it does not spawn off lots of processes and events and j=
ust does the pvscan once.=C2=A0 Between udev and systemd I am not clear on =
how many different events have to be handled and how many of those events n=
eed to spawn new threads and/or fork new processes off.=C2=A0=C2=A0=C2=A0 S=
omething doing one of those 2 things or both would seem to have been the ca=
use of the issue I saw in the past.</div><div><br></div><div>When it has di=
fficult booting up like this what does ps axuS | grep udev look like time w=
ise?<br></div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Jun 7, 2021 at 10:30 AM <a href=3D"ma=
ilto:heming.zhao@suse.com">heming.zhao@suse.com</a> &lt;<a href=3D"mailto:h=
eming.zhao@suse.com">heming.zhao@suse.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On 6/7/21 6:27 PM, Martin Wilck wr=
ote:<br>
&gt; On So, 2021-06-06 at 11:35 -0500, Roger Heflin wrote:<br>
&gt;&gt; This might be a simpler way to control the number of threads at th=
e<br>
&gt;&gt; same time.<br>
&gt;&gt;<br>
&gt;&gt; On large machines (cpu wise, memory wise and disk wise).=C2=A0=C2=
=A0 I have<br>
&gt;&gt; only seen lvm timeout when udev_children is set to default. =C2=A0=
 The<br>
&gt;&gt; default seems to be set wrong, and the default seemed to be tuned =
for<br>
&gt;&gt; a case where a large number of the disks on the machine were going=
 to<br>
&gt;&gt; be timing out (or otherwise really really slow), so to support thi=
s<br>
&gt;&gt; case a huge number of threads was required..=C2=A0 =C2=A0 I found =
that with it<br>
&gt;&gt; set to default on a close to 100 core machine that udev got about =
87<br>
&gt;&gt; minutes of time during the boot up (about 2 minutes).=C2=A0 Changi=
ng the<br>
&gt;&gt; number of children to =3D4 resulted in udev getting around 2-3 min=
utes<br>
&gt;&gt; in the same window, and actually resulted in a much faster boot up=
<br>
&gt;&gt; and a much more reliable boot up (no timeouts).<br>
&gt; <br>
&gt; Wow, setting the number of children to 4 is pretty radical. We decreas=
e<br>
&gt; this parameter often on large machines, but we never went all the way<=
br>
&gt; down to a single-digit number. If that&#39;s really necessary under<br=
>
&gt; whatever circumstances, it&#39;s clear evidence of udev&#39;s deficien=
cies.<br>
&gt; <br>
&gt; I am not sure if it&#39;s better than Heming&#39;s suggestion though. =
It would<br>
&gt; affect every device in the system. It wouldn&#39;t even be possible to=
<br>
&gt; process more than 4 totally different events at the same time.<br>
&gt; <br>
<br>
hello<br>
<br>
I tested udev.children_max with value 1, 2 &amp; 4. The results showed it<b=
r>
didn&#39;t take effect, and the booting time even longer than before.<br>
This solution may suite for some special cases.<br>
<br>
(my env: kvm-qemu vm, 6vpu, 22G mem, 1015 disks)<br>
<br>
Regards<br>
heming<br>
<br>
</blockquote></div>

--000000000000f64ba505c4333945--

--===============6485464717866252251==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============6485464717866252251==--

