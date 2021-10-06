Return-Path: <SRS0=KaPp=O3=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81BDAC433EF
	for <linux-lvm@archiver.kernel.org>; Thu,  7 Oct 2021 07:56:25 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F8FD61029
	for <linux-lvm@archiver.kernel.org>; Thu,  7 Oct 2021 07:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0F8FD61029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-wAVMKfFTMe6g82Eivd12xQ-1; Thu, 07 Oct 2021 03:56:22 -0400
X-MC-Unique: wAVMKfFTMe6g82Eivd12xQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C386100C661;
	Thu,  7 Oct 2021 07:56:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CA954180;
	Thu,  7 Oct 2021 07:56:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B75C54EA2A;
	Thu,  7 Oct 2021 07:55:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1968RPSl015229 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 6 Oct 2021 04:27:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 964CF2166B3F; Wed,  6 Oct 2021 08:27:25 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 89C6C2166B44
	for <linux-lvm@redhat.com>; Wed,  6 Oct 2021 08:27:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2276899ED4
	for <linux-lvm@redhat.com>; Wed,  6 Oct 2021 08:27:21 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
	[209.85.166.54]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-477-yZVMfDmEPmO9rQ1ls8-9ng-1; Wed, 06 Oct 2021 04:27:19 -0400
X-MC-Unique: yZVMfDmEPmO9rQ1ls8-9ng-1
Received: by mail-io1-f54.google.com with SMTP id q205so1899002iod.8
	for <linux-lvm@redhat.com>; Wed, 06 Oct 2021 01:27:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=6IoNkaafT9UySJBkM2GYVXuj/v1BU2S+h13txuevRwc=;
	b=WTz1f4rhbfQ+/TCYjiZAdYgefkhcsx6COwk5m78XkKdr59oEA9775o8FCjx/vE8s/G
	5kaiPVLgaD8lGSkQqkXzJcuQ2OmW3yg0A4GdfkVtIolZhZHt7CvXvtf3VgWFY9OKXSiY
	iEyYi6Yrze8XVSPMt3hbIBrB2vJxkP7tMytvoKqI59ZWYAtr15whSlFlRuBbubux3hk8
	Z2iK7Smhtr5usiYCynvp2AaxXwXsnUIjVVPNVOgoywkEfxff+bKkTpu7ZQnnH7qKfMB6
	cAbm5x6lFzy7u5xYyddUgQ/9Ib/ytwviZHauK56xk4GMBZ38j1UB9EQ52CW5dZjsPc1S
	X0LA==
X-Gm-Message-State: AOAM532T3WroZ4+VdiyMxSGRmv3j0cM78IJqi/0oYZcBxRyexoreSapl
	N8OqyzcTor7LAja1ZDFzceh4SCW8brScU/K607ueUh6Xqec=
X-Google-Smtp-Source: ABdhPJyDLKfc30mOu1AmK0TJ9axwCowxqufqoyAqlb3yT4WoZDyU/1aqoc0pyXWiw9nHRCFGAXyqdDyoBw0GU9glCW8=
X-Received: by 2002:a05:6638:1030:: with SMTP id
	n16mr6243717jan.36.1633508839287; 
	Wed, 06 Oct 2021 01:27:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAPWGHt1MCzPbEHrF-5SRDavHqOfhMSqhkfAUQDMYT=HJ7TRfuQ@mail.gmail.com>
	<CAPWGHt3bB4QiM6RZkC_58X8jev+mVwpkuCY==45Gr4j5jOYHBA@mail.gmail.com>
	<b9e10482-e508-63fa-5518-94cccc007e81@redhat.com>
	<CALjSBEsb9gSMt7yNHNdYyFgG-Z_Yd3d0X-er24gvCUF1ZjrWog@mail.gmail.com>
In-Reply-To: <CALjSBEsb9gSMt7yNHNdYyFgG-Z_Yd3d0X-er24gvCUF1ZjrWog@mail.gmail.com>
From: Krzysztof Chojnowski <frirajder@gmail.com>
Date: Wed, 6 Oct 2021 10:27:07 +0200
Message-ID: <CAPWGHt11L-ZGtLbZ08UVga7WP5fq6pY7gUS9HYtnVWvB11zj7Q@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
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
X-Mailman-Approved-At: Thu, 07 Oct 2021 03:43:22 -0400
Subject: Re: [linux-lvm] LVM cachepool inconsistency after power event
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
Content-Type: multipart/mixed; boundary="===============8635060299536434433=="

--===============8635060299536434433==
Content-Type: multipart/alternative; boundary="0000000000001a72f305cdaaeaec"

--0000000000001a72f305cdaaeaec
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 5, 2021 at 6:57 PM Ming Hung Tsai <mtsai@redhat.com> wrote:

> On Tue, Oct 5, 2021 at 11:54 PM Zdenek Kabelac <zkabelac@redhat.com>
> wrote:
> > But before continuing with advices - what is the version of kernel lvm2
> & your
> > device-mapper-persistent-data package (aka  'cache_check -V)
> >
>
These are the software versions:
$ /usr/sbin/cache_check -V
0.9.0
$ /usr/sbin/lvm version
  LVM version:     2.03.11(2) (2021-01-08)
  Library version: 1.02.175 (2021-01-08)
/dev/mapper/control: open failed: Permission denied
Failure to communicate with kernel device-mapper driver.
Incompatible libdevmapper 1.02.175 (2021-01-08) and kernel driver (unknown
version).
  Configuration:   ./configure --build=x86_64-linux-gnu --prefix=/usr
--includedir=${prefix}/include --mandir=${prefix}/share/man
--infodir=${prefix}/share/info --sysconfdir=/etc --localstatedir=/var
--disable-option-checking --disable-silent-rules
--libdir=${prefix}/lib/x86_64-linux-gnu --runstatedir=/run
--disable-maintainer-mode --disable-dependency-tracking
--libdir=/lib/x86_64-linux-gnu --sbindir=/sbin
--with-usrlibdir=/usr/lib/x86_64-linux-gnu --with-optimisation=-O2
--with-cache=internal --with-device-uid=0 --with-device-gid=6
--with-device-mode=0660 --with-default-pid-dir=/run
--with-default-run-dir=/run/lvm --with-default-locking-dir=/run/lock/lvm
--with-thin=internal --with-thin-check=/usr/sbin/thin_check
--with-thin-dump=/usr/sbin/thin_dump
--with-thin-repair=/usr/sbin/thin_repair --with-udev-prefix=/
--enable-applib --enable-blkid_wiping --enable-cmdlib --enable-dmeventd
--enable-editline --enable-lvmlockd-dlm --enable-lvmlockd-sanlock
--enable-lvmpolld --enable-notify-dbus --enable-pkgconfig
--enable-udev_rules --enable-udev_sync --disable-readline
$ uname -a
Linux archer 5.14.0-1-amd64 #1 SMP Debian 5.14.6-3 (2021-09-28) x86_64
GNU/Linux


> > lvconvert --repair should be able to handle this case - although likely
> > without 'smart' placement' of fixed metadata (pvmove needed after
> metadata fix)
>
I tried running lvconvert --repair earlier (please see the 1st of my mails)
and even trough the operation finished successfully (as in the $? == 0) I
couldn't activate the volume afterwards.


> cache_repair might not handle this case perfectly. If possible, you
> could upload the "original" metadata somewhere for me to take a look,
> by dd it into a binary file.
>
Unfortunately I deleted the original metadata volume when I was trying to
remove the cached volume.

So right now, I guess, the question is how do I remove the cached volume,
as the repair doesn't seem to be possible.

Regards,
Krzysztof Chojnowski

--0000000000001a72f305cdaaeaec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, Oct 5, 2021 at 6:57 PM Ming Hung Tsai &lt;<a href=3D"mailto:=
mtsai@redhat.com">mtsai@redhat.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On Tue, Oct 5, 2021 at 11:54 PM Zdenek Ka=
belac &lt;<a href=3D"mailto:zkabelac@redhat.com" target=3D"_blank">zkabelac=
@redhat.com</a>&gt; wrote:<br>&gt; But before continuing with advices - wha=
t is the version of kernel lvm2 &amp; your<br>
&gt; device-mapper-persistent-data package (aka=C2=A0 &#39;cache_check -V)<=
br>
&gt;<br></blockquote><div>These are the software versions:<br>$ /usr/sbin/c=
ache_check -V<br>0.9.0<br>$ /usr/sbin/lvm version<br>=C2=A0 LVM version: =
=C2=A0 =C2=A0 2.03.11(2) (2021-01-08)<br>=C2=A0 Library version: 1.02.175 (=
2021-01-08)<br>/dev/mapper/control: open failed: Permission denied<br>Failu=
re to communicate with kernel device-mapper driver.<br>Incompatible libdevm=
apper 1.02.175 (2021-01-08) and kernel driver (unknown version).<br>=C2=A0
 Configuration: =C2=A0 ./configure --build=3Dx86_64-linux-gnu --prefix=3D/u=
sr=20
--includedir=3D${prefix}/include --mandir=3D${prefix}/share/man=20
--infodir=3D${prefix}/share/info --sysconfdir=3D/etc --localstatedir=3D/var=
=20
--disable-option-checking --disable-silent-rules=20
--libdir=3D${prefix}/lib/x86_64-linux-gnu --runstatedir=3D/run=20
--disable-maintainer-mode --disable-dependency-tracking=20
--libdir=3D/lib/x86_64-linux-gnu --sbindir=3D/sbin=20
--with-usrlibdir=3D/usr/lib/x86_64-linux-gnu --with-optimisation=3D-O2=20
--with-cache=3Dinternal --with-device-uid=3D0 --with-device-gid=3D6=20
--with-device-mode=3D0660 --with-default-pid-dir=3D/run=20
--with-default-run-dir=3D/run/lvm --with-default-locking-dir=3D/run/lock/lv=
m
 --with-thin=3Dinternal --with-thin-check=3D/usr/sbin/thin_check=20
--with-thin-dump=3D/usr/sbin/thin_dump=20
--with-thin-repair=3D/usr/sbin/thin_repair --with-udev-prefix=3D/=20
--enable-applib --enable-blkid_wiping --enable-cmdlib --enable-dmeventd=20
--enable-editline --enable-lvmlockd-dlm --enable-lvmlockd-sanlock=20
--enable-lvmpolld --enable-notify-dbus --enable-pkgconfig=20
--enable-udev_rules --enable-udev_sync --disable-readline<br>$ uname -a<br>=
<div>Linux archer 5.14.0-1-amd64 #1 SMP Debian 5.14.6-3 (2021-09-28) x86_64=
 GNU/Linux</div><div>=C2=A0</div></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">&gt; lvconvert --repair should be able to handle this case - =
although likely<br>
&gt; without &#39;smart&#39; placement&#39; of fixed metadata (pvmove neede=
d after metadata fix)<br></blockquote><div>I tried running lvconvert --repa=
ir earlier (please see the 1st of my=20
mails) and even trough the operation finished successfully (as in the $?
 =3D=3D 0) I couldn&#39;t activate the volume afterwards.</div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">cache_repair might n=
ot handle this case perfectly. If possible, you<br>
could upload the &quot;original&quot; metadata somewhere for me to take a l=
ook,<br>
by dd it into a binary file.<br></blockquote><div><div>Unfortunately I dele=
ted the original metadata volume when I was trying to remove the cached vol=
ume.</div><div><br></div><div>So right now, I guess, the question is how do=
 I remove the cached volume, as the repair doesn&#39;t seem to be possible.=
</div><div><br></div><div>Regards,</div><div>Krzysztof Chojnowski<br></div>=
</div></div></div>

--0000000000001a72f305cdaaeaec--

--===============8635060299536434433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============8635060299536434433==--

