Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77E6E743EF
	for <linux-lvm@archiver.kernel.org>; Fri, 29 Sep 2023 07:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695971492;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=CWpyYEGSt42nqhZZi03jASNg/jA3CfxYAKDZV5O6Pek=;
	b=ece8Nu1aoTgiJo9TbBWFr60C1tHHqzoSswJjvMFCWN6DKvAuPHQs0nzIT0x+mPat7HRRwa
	tEAKVm86pMWJcfeEjcFNCW1y9ErHJV+/TZozgaJM+ucO6QuFS5qYiUmEU1WybjPrJzRWc2
	aWWQqEnbxZVGU7iSfMqLdsYXhCPDgdo=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-185-56WGwGzXM0CpIV9AiENCDA-1; Fri, 29 Sep 2023 03:11:30 -0400
X-MC-Unique: 56WGwGzXM0CpIV9AiENCDA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A8761C06ECE;
	Fri, 29 Sep 2023 07:11:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6E2662026D4B;
	Fri, 29 Sep 2023 07:11:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 15D031946589;
	Fri, 29 Sep 2023 07:11:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1B6AC1946588
 for <linux-lvm@listman.corp.redhat.com>; Wed, 27 Sep 2023 13:26:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F25AC401408; Wed, 27 Sep 2023 13:26:44 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B3771400E89
 for <linux-lvm@redhat.com>; Wed, 27 Sep 2023 13:26:44 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-inbound-delivery-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E39D1DD35C5
 for <linux-lvm@redhat.com>; Wed, 27 Sep 2023 13:26:44 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-368-hsnG3SMQOe20VrsagGwWCw-1; Wed, 27 Sep 2023 09:26:38 -0400
X-MC-Unique: hsnG3SMQOe20VrsagGwWCw-1
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-405524e6740so91082565e9.1
 for <linux-lvm@redhat.com>; Wed, 27 Sep 2023 06:26:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695821197; x=1696425997;
 h=message-id:cc:to:date:from:subject:content-transfer-encoding
 :mime-version:user-agent:thread-topic:references:in-reply-to
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gjl2hqVASokuEU4ld9kIQ/u7vsfYeyGNd//cOiM+cmc=;
 b=X/Sibbsq2rHL3nScbAPsofOcDh33GPmRBIJFNUfJgqltbbwasEEVyoEOaR86epPK3v
 PpP+GGvyxtxutLF8gAetR9FBB7vinAk4pe3XwjCHCRjLDLEpmBH1NXLOjQJJ7K0HTBz0
 iOhh8KnvgBHjFhvbKucrAt6Q0vOHP4JOjbrGib2u30SwrPwce4L01iq+zDYfbNhxVJLj
 6FSCIAk0j7IXUXBj8lq3n4hQC1VhrV3vIvxQndykrMArdzZj3zXFzXZ1LtAdqM34mHLX
 txQ0kKaRwSHA6PxDxXh+OPg+hyQmr5gsGquTgx4nDY3vf4OpJgvfiylhm8UpHkJjp4dd
 nKCw==
X-Gm-Message-State: AOJu0YxO8hmZu+3nb7GirLAXBE0epjt/63vI9xaDfodVk39ryC8I4g14
 aiEYAoPj2RhUdJ3KKuGBv3lifqbt3sWNlQ==
X-Google-Smtp-Source: AGHT+IEMdM3Rt4lLMQWYk8jjr7HM+4Uo0yufOD+b4GbfyIjO8IpWf1zCob4vGq2AUfaj4eSaw533Bg==
X-Received: by 2002:a05:600c:2205:b0:3fe:5501:d293 with SMTP id
 z5-20020a05600c220500b003fe5501d293mr1952675wml.30.1695821196460; 
 Wed, 27 Sep 2023 06:26:36 -0700 (PDT)
Received: from [192.168.178.56] ([109.52.205.73])
 by smtp.gmail.com with ESMTPSA id
 n26-20020a7bcbda000000b004063977eccesm4936482wmi.42.2023.09.27.06.26.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Sep 2023 06:26:35 -0700 (PDT)
In-Reply-To: <90d9a21d-f748-4ca1-b327-6c38f4440298@gmail.com>
References: <CAM5YWZfo5q5rP+E2JFudGaHJLQ-2bk2UfpR=En5eDF37JKq2rw@mail.gmail.com>
 <6e0faedf-f450-4454-a86b-6448a1b4747b@gmail.com>
 <CAM5YWZfL8zf9=re+VU2MiAQcYvXodqDV-08Zu5RkKUMfkDJ7Tg@mail.gmail.com>
 <90d9a21d-f748-4ca1-b327-6c38f4440298@gmail.com>
X-Referenced-Uid: 73617
Thread-Topic: Re: [linux-lvm] Can I combine LUKS and LVM to achieve encryption
 and snapshots?
User-Agent: Android
X-Is-Generated-Message-Id: true
MIME-Version: 1.0
X-Local-Message-Id: <dc311492-ec67-43f8-a809-6ee7729af703@gmail.com>
From: Roberto Fastec <roberto.fastec@gmail.com>
Date: Wed, 27 Sep 2023 15:26:32 +0200
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <dc311492-ec67-43f8-a809-6ee7729af703@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mailman-Approved-At: Fri, 29 Sep 2023 06:57:04 +0000
Subject: Re: [linux-lvm] Can I combine LUKS and LVM to achieve encryption
 and snapshots?
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
 <mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-lvm/>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
 <mailto:linux-lvm-request@redhat.com?subject=subscribe>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Jean-Marc Saffroy <saffroy+redhat@gmail.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: multipart/mixed; boundary="===============0236329631174697771=="

--===============0236329631174697771==
Content-Type: multipart/alternative; boundary="----XYZELNRXXNT0QLBQCRSZTEE9MTRCL6"

------XYZELNRXXNT0QLBQCRSZTEE9MTRCL6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
 charset=UTF-8

What an awful idea to encrypt data on an hardware accelerator

SSD is everything but an affordable storage for keeping safely your data

and as soon some cells will fail , and with LVM , the first ones will be wh=
ere LVM tables are sitting (and being heavily modified) .. you'll loose ALL=
 the data, because of the extents mechanism

Nevertheless, if you got damaged just the cells where encryption keys are w=
ritten, again you loose everything=20

Remember that the data must seat on the affordable hard disk drive.

SSD is just an hardware accelerator, if of high quality (enterprise class) =
it can be good as cache for RAID systems

Man that has been advised, is half saved

Kind regards

R.

=E2=81=A3Ottieni BlueMail per Android =E2=80=8B

Il giorno 27 set 2023, 11:58, alle ore 11:58, Zdenek Kabelac <zdenek.kabela=
c@gmail.com> ha scritto:
>Dne 27. 09. 23 v 1:10 Jean-Marc Saffroy napsal(a):
>> Hi,
>>=20
>> On Tue, Sep 26, 2023 at 10:00=E2=80=AFPM Zdenek Kabelac
>> <zdenek.kabelac@gmail.com> wrote:
>>> Yep typical usage is to encrypt underlying PV - and then create LVs
>and its
>>> snapshots on encrypted device.
>>=20
>> Sure, I'd do that in other circumstances.
>>=20
>> But in my case it would just be a waste: I am replacing several disks
>> on a desktop computer with a single 2TB NVME SSD for everything. Only
>> /home needs to be encrypted, and it's tiny, like 100-200GB. Going
>> through encryption for most application I/Os would use CPU time and
>> increase latency with no benefit.
>>=20
>> So I prefer to manage available raw (un-encrypted) space with LVM.
>>=20
>> Now, I also need to do backups of /home, and that's why I want
>> snapshots. But that first layer of LVM would only show a snapshot of
>> an encrypted volume, and the backup job shouldn't have the passphrase
>> to decrypt the volume.
>>=20
>> Which is why I'm trying to find a way of doing snaphots of an
>"opened"
>> LUKS volume: this way, the backup job can do its job without
>requiring
>> a passphrase.
>
>well that's where you will considerably 'complicate' your life :)
>As you would need to 'orchestrace' this yourself with 'dmsetup' usage.
>
>running 'dmsetup suspend' on your home device,
>that taking a snapshot of your underlying  LV.
>
>Here the usage of 'thin-pool' would possibly help a little bit - as you
>get a=20
>control over when a snapshot LV appears in your system.
>
>Once you have the snapshot created you 'resume'  the top-level
>decrypted volume.
>
>Then if you want to access your snapshot - you create another 'crypto'
>device=20
>- unlock it again with your key - and it should work.
>
>But the level of complexity here is rather  high - this it might be
>actually
>way easier to just 'partition' your device for  'encrypted'  and
>unecrypted'=20
>parts and use 2 PVs for 2 VGs....
>
>> But my tests don't tell me if there are other people doing similar
>> things on production systems, or if they are happy with the results.
>> Unusual setups tend to exhibit unusual bugs, and I am not super fond
>> of bugs in my storage systems. :-)
>
>Yep - people prefer simple rock solid solutions....
>That's why the above describe scenarios is not really used....
>As solving then all individual errors that may appear is far from being
>simple.
>
>
>> Just the one /home in my case, so no worse than prompting for the
>> passphrase for an entire disk.
>
>Every access to a snapshot needs then a new separate  'unlock'..
>
>>> Speaking about snapshots - you should consider switching to
>'thin-pools'  for
>>> far better performance...
>>=20
>> I only need snapshots for backups: once a day, create a snapshot,
>> mount it, do a file-level incremental backup, unmount it, delete it.
>>=20
>> Would the thin-pools make a difference in this case?
>
>Well there are many ways how to skin a cat...
>I.e. check  blk-archive  https://github.com/jthornber/blk-archive
>
>Regards
>
>Zdenek
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://listman.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

------XYZELNRXXNT0QLBQCRSZTEE9MTRCL6
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body style=3D"zoom: 0%;"><div dir=3D"auto">What an awfu=
l idea to encrypt data on an hardware accelerator<br><br></div>
<div dir=3D"auto">SSD is everything but an affordable storage for keeping s=
afely your data<br><br></div>
<div dir=3D"auto">and as soon some cells will fail , and with LVM , the fir=
st ones will be where LVM tables are sitting (and being heavily modified) .=
. you'll loose ALL the data, because of the extents mechanism<br><br></div>
<div dir=3D"auto">Nevertheless, if you got damaged just the cells where enc=
ryption keys are written, again you loose everything <br><br></div>
<div dir=3D"auto">Remember that the data must seat on the affordable hard d=
isk drive.<br><br></div>
<div dir=3D"auto">SSD is just an hardware accelerator, if of high quality (=
enterprise class) it can be good as cache for RAID systems<br><br></div>
<div dir=3D"auto">Man that has been advised, is half saved<br><br></div>
<div dir=3D"auto">Kind regards<br><br></div>
<div dir=3D"auto">R.<br><br></div>
<div dir=3D"auto"><!-- tmjah_g_1299s -->Ottieni <!-- tmjah_g_1299e --><a hr=
ef=3D"https://bluemail.me"><!-- tmjah_g_1299s -->BlueMail per Android<!-- t=
mjah_g_1299e --></a><!-- tmjah_g_1299s --> <!-- tmjah_g_1299e --></div>
<div class=3D"gmail_quote" >Il giorno 27 set 2023, alle ore 11:58, Zdenek K=
abelac &lt;<a href=3D"mailto:zdenek.kabelac@gmail.com" target=3D"_blank">zd=
enek.kabelac@gmail.com</a>&gt; ha scritto:<blockquote class=3D"gmail_quote"=
 style=3D"margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 2=
04); padding-left: 1ex;">
<pre class=3D"blue">Dne 27. 09. 23 v 1:10 Jean-Marc Saffroy napsal(a):<br><=
blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 1ex 0.8ex; border=
-left: 1px solid #729fcf; padding-left: 1ex;"> Hi,<br> <br> On Tue, Sep 26,=
 2023 at 10:00=E2=80=AFPM Zdenek Kabelac<br> &lt;zdenek.kabelac@gmail.com&g=
t; wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 1ex=
 0.8ex; border-left: 1px solid #ad7fa8; padding-left: 1ex;"> Yep typical us=
age is to encrypt underlying PV - and then create LVs and its<br> snapshots=
 on encrypted device.<br></blockquote> <br> Sure, I'd do that in other circ=
umstances.<br> <br> But in my case it would just be a waste: I am replacing=
 several disks<br> on a desktop computer with a single 2TB NVME SSD for eve=
rything. Only<br> /home needs to be encrypted, and it's tiny, like 100-200G=
B. Going<br> through encryption for most application I/Os would use CPU tim=
e and<br> increase latency with no benefit.<br> <br> So I prefer to manage =
available raw (un-encrypted) space with LVM.<br> <br> Now, I also need to d=
o backups of /home, and that's why I want<br> snapshots. But that first lay=
er of LVM would only show a snapshot of<br> an encrypted volume, and the ba=
ckup job shouldn't have the passphrase<br> to decrypt the volume.<br> <br> =
Which is why I'm trying to find a way of doing snaphots of an "opened"<br> =
LUKS volume: this way, the backup job can do its job without requiring<br> =
a passphrase.<br></blockquote><br>well that's where you will considerably '=
complicate' your life :)<br>As you would need to 'orchestrace' this yoursel=
f with 'dmsetup' usage.<br><br>running 'dmsetup suspend' on your home devic=
e,<br>that taking a snapshot of your underlying  LV.<br><br>Here the usage =
of 'thin-pool' would possibly help a little bit - as you get a <br>control =
over when a snapshot LV appears in your system.<br><br>Once you have the sn=
apshot created you 'resume'  the top-level<br>decrypted volume.<br><br>Then=
 if you want to access your snapshot - you create another 'crypto' device <=
br>- unlock it again with your key - and it should work.<br><br>But the lev=
el of complexity here is rather  high - this it might be actually<br>way ea=
sier to just 'partition' your device for  'encrypted'  and unecrypted' <br>=
parts and use 2 PVs for 2 VGs....<br><br><blockquote class=3D"gmail_quote" =
style=3D"margin: 0pt 0pt 1ex 0.8ex; border-left: 1px solid #729fcf; padding=
-left: 1ex;"> But my tests don't tell me if there are other people doing si=
milar<br> things on production systems, or if they are happy with the resul=
ts.<br> Unusual setups tend to exhibit unusual bugs, and I am not super fon=
d<br> of bugs in my storage systems. :-)<br></blockquote><br>Yep - people p=
refer simple rock solid solutions....<br>That's why the above describe scen=
arios is not really used....<br>As solving then all individual errors that =
may appear is far from being simple.<br><br><br><blockquote class=3D"gmail_=
quote" style=3D"margin: 0pt 0pt 1ex 0.8ex; border-left: 1px solid #729fcf; =
padding-left: 1ex;"> Just the one /home in my case, so no worse than prompt=
ing for the<br> passphrase for an entire disk.<br></blockquote><br>Every ac=
cess to a snapshot needs then a new separate  'unlock'..<br><br><blockquote=
 class=3D"gmail_quote" style=3D"margin: 0pt 0pt 1ex 0.8ex; border-left: 1px=
 solid #729fcf; padding-left: 1ex;"><blockquote class=3D"gmail_quote" style=
=3D"margin: 0pt 0pt 1ex 0.8ex; border-left: 1px solid #ad7fa8; padding-left=
: 1ex;"> Speaking about snapshots - you should consider switching to 'thin-=
pools'  for<br> far better performance...<br></blockquote> <br> I only need=
 snapshots for backups: once a day, create a snapshot,<br> mount it, do a f=
ile-level incremental backup, unmount it, delete it.<br> <br> Would the thi=
n-pools make a difference in this case?<br></blockquote><br>Well there are =
many ways how to skin a cat...<br>I.e. check  blk-archive  <a href=3D"https=
://github.com/jthornber/blk-archive">https://github.com/jthornber/blk-archi=
ve</a><br><br>Regards<br><br>Zdenek<br><br><hr><br>linux-lvm mailing list<b=
r>linux-lvm@redhat.com<br><a href=3D"https://listman.redhat.com/mailman/lis=
tinfo/linux-lvm">https://listman.redhat.com/mailman/listinfo/linux-lvm</a><=
br>read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO">http:=
//tldp.org/HOWTO/LVM-HOWTO</a>/<br></pre></blockquote></div></body></html>
------XYZELNRXXNT0QLBQCRSZTEE9MTRCL6--

--===============0236329631174697771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============0236329631174697771==--

