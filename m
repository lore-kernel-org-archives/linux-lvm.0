Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCBA0C43334
	for <linux-lvm@archiver.kernel.org>; Wed, 29 Jun 2022 07:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656487887;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=MRX/Wc8fMFQ9KgeymTOTdjy2PnQQMHKPY5tFvqwh5PM=;
	b=e0wTJsfYgkM1ar5nWBRFsYOlLiA28DqnL2OnvTs8C/yNmPlExJBx0JHtKMOT4G4VEEJWXP
	4lucGLa7UkbGZ9Hkl3xc8fuy5nf4hbUUGZmJH7NevdTxXveEwD8kaH5Mhist6M5oIglGAZ
	kX6pKaJ1tuX00OzRyuzfCBP4rUxoDk0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-DldYaplMNE-IwTbOflPAGw-1; Wed, 29 Jun 2022 03:31:26 -0400
X-MC-Unique: DldYaplMNE-IwTbOflPAGw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 912721035345;
	Wed, 29 Jun 2022 07:31:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CBFCD415F5E;
	Wed, 29 Jun 2022 07:31:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 263451947068;
	Wed, 29 Jun 2022 07:31:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9753819466DF
 for <linux-lvm@listman.corp.redhat.com>; Tue, 28 Jun 2022 18:12:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 83DB8492C3B; Tue, 28 Jun 2022 18:12:54 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F85B492CA4
 for <linux-lvm@redhat.com>; Tue, 28 Jun 2022 18:12:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F78B3C0E217
 for <linux-lvm@redhat.com>; Tue, 28 Jun 2022 18:12:54 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-153-EkeIu_33PWipb5H_1kPLeQ-1; Tue, 28 Jun 2022 14:12:52 -0400
X-MC-Unique: EkeIu_33PWipb5H_1kPLeQ-1
Received: by mail-qv1-f48.google.com with SMTP id o43so21276438qvo.4
 for <linux-lvm@redhat.com>; Tue, 28 Jun 2022 11:12:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=MwoQFPS4yFUiX/5GN+dpJqjTyNP8Vt47vgoEdT27m2Q=;
 b=CiKlHew5REnBv9VpGYtmUb8fR4lxXXPJuddHjDglfVWiYH1Zmq3i7ctNPOynpJ0YEh
 yb/eGDw5uzijyOsBswZ/FDEOl63LKNTueW6kOZdPBMHEquiIyTpC/BBaSie0aBzLxm6J
 6lrUeUjrSoOZnIknl7rxgGNWOFNrjSDwbgZcG7ZIryAyDRflzOYoekQQCDu6R0dHn4G7
 TGbTP0IVhyZsIIDm4K1z7RzLV7uBAUYqK/N6SO+78nrWOj2Ma8J3LIVGPIZZ7K8y4F2z
 EjeK6HrIGtDTmzgrHn6d/eHTagxSGzQk3cwodGfjb9VGgZRg2mU10wpLsj/lqg7LHm7d
 6Fgw==
X-Gm-Message-State: AJIora/jCGij/JrKMhWIwzk8QG+3QCK7YGcLoCYeqmTRwRhFV6780Laf
 dGPhohBjl8K/4nogm7gVKYgeeWnqaGWQPFwoyyzk56xV
X-Google-Smtp-Source: AGRyM1uifbQw1f7sYABZsBF9PmQ2/ptteIBNe/Urt+/sjCE1AkhctRI5i9AgLhfr/eRMb75q1V9KD+x7I+TyTT3a+nw=
X-Received: by 2002:a05:622a:14d:b0:31b:ef3b:9632 with SMTP id
 v13-20020a05622a014d00b0031bef3b9632mr4132496qtw.128.1656439971521; Tue, 28
 Jun 2022 11:12:51 -0700 (PDT)
MIME-Version: 1.0
References: <181a3eed7e0.27a5.d4b3b9aee17a85f6bc878c68b3925db6@beardandsandals.co.uk>
In-Reply-To: <181a3eed7e0.27a5.d4b3b9aee17a85f6bc878c68b3925db6@beardandsandals.co.uk>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Tue, 28 Jun 2022 13:12:41 -0500
Message-ID: <CAAMCDedTDVMqDANXLYGwWSWg_hncAGoBeS_yqz6tti_shjHZBA@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Mailman-Approved-At: Wed, 29 Jun 2022 07:31:17 +0000
Subject: Re: [linux-lvm] Recovering from a failed pvmove
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
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============2578351585341003571=="

--===============2578351585341003571==
Content-Type: multipart/alternative; boundary="0000000000001828be05e285fcbf"

--0000000000001828be05e285fcbf
Content-Type: text/plain; charset="UTF-8"

For a case like this vgcfgrestore is probably the best option.  man
vgcfgrestore.

You need to see if you have archived vg copies that you can revert to
before the "add" of the pv that went bad.

The archives are typically  in /etc/lvm/archiive/<vgname>* on RedHat
derivative OSes, not sure if they are different(and/or configured to exist)
on other distributions.

grep -i before /etc/lvm/archive/<vgname>* and see which archive was made
before the initial pv addition.  vgcfgrestore -f <goodconfig> should work
but I usually have to adjust command line options to get it work when I
have used it to revert configs.  I think in that case it will find the vg
and pvid correctly.  No cleanup should need to be done so long as the other
device is completely gone.

And you will probably need to answer some prompts and warnings, and then
reboot the machine, and/or do this all under a livecd rescue boot.

What kind of cheap ssd were you using?  I have had really bad luck with
ones without RAM.  I RMA'ed one that failed in under a week and the new one
also failed in a very similar way in under a week.

On Tue, Jun 28, 2022 at 1:38 AM Roger James <roger@beardandsandals.co.uk>
wrote:

> Hi,
>
> I am struggling to recover from a failed pvmove. Unfortunately I only have
> a limited knowledge of lvm. I setup my lvm configuration many years ago.
>
> I was trying to move a lv to a SSD using pvmove. Unfortunately my brand
> new SSD choose that moment to fail (never buy cheap SSDs, lesson learnt!").
>
> This is the current status.
>
> roger@dragon:~$ sudo pvs
>   WARNING: Couldn't find device with uuid
> uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.
>   WARNING: VG wd is missing PV uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ
> (last written to [unknown]).
>   PV VG Fmt Attr PSize PFree
>   /dev/sda1 wd lvm2 a-- <465.76g 0
>   /dev/sdb1 wd lvm2 a-- <465.76g <80.45g
>   /dev/sdc2 wd lvm2 a-- 778.74g 278.74g
>   /dev/sdd1 wd lvm2 a-- <465.76g 0
>   [unknown] wd lvm2 a-m <784.49g 685.66g
> roger@dragon:~$ sudo lvs
>   WARNING: Couldn't find device with uuid
> uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.
>   WARNING: VG wd is missing PV uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ
> (last written to [unknown]).
>   LV VG Attr LSize Pool Origin Data% Meta% Move Log Cpy%Sync Convert
>   home wd -wi------- 1.46t
>   root wd -wI-----p- <108.83g
>
>   swap wd -wi------- 8.00g
>   work wd -wi------- 200.00g
> roger@dragon:~$ sudo vgs
>   WARNING: Couldn't find device with uuid
> uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.
>   WARNING: VG wd is missing PV uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ
> (last written to [unknown]).
>   VG #PV #LV #SN Attr VSize VFree
>   wd 5 4 0 wz-pn- 2.89t 1.02t
>
> This is a recap of what I have tried so far.
>
> roger@dragon:~$ sudo pvmove --abort
>   WARNING: Couldn't find device with uuid
> uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.
>   WARNING: VG wd is missing PV uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ
> (last written to [unknown]).
>   LVM command executed by lvmpolld failed.
>   For more information see lvmpolld messages in syslog or lvmpolld log
> file.
> roger@dragon:~$ sudo vgreduce --removemissing wd
>   WARNING: Couldn't find device with uuid
> uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.
>   WARNING: VG wd is missing PV uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ
> (last written to [unknown]).
>   WARNING: Couldn't find device with uuid
> uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.
>   WARNING: Partial LV root needs to be repaired or removed.
>   WARNING: Partial LV pvmove0 needs to be repaired or removed.
>   There are still partial LVs in VG wd.
>   To remove them unconditionally use: vgreduce --removemissing --force.
>   To remove them unconditionally from mirror LVs use: vgreduce
> --removemissing --mirrorsonly --force.
>   WARNING: Proceeding to remove empty missing PVs.
>   WARNING: Couldn't find device with uuid
> uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.
> roger@dragon:~$ sudo lvchange -an wd/root
>   WARNING: Couldn't find device with uuid
> uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.
>   WARNING: VG wd is missing PV uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ
> (last written to [unknown]).
> roger@dragon:~$ sudo vgreduce --removemissing wd
>   WARNING: Couldn't find device with uuid
> uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.
>   WARNING: VG wd is missing PV uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ
> (last written to [unknown]).
>   WARNING: Couldn't find device with uuid
> uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.
>   WARNING: Partial LV root needs to be repaired or removed.
>   WARNING: Partial LV pvmove0 needs to be repaired or removed.
>   There are still partial LVs in VG wd.
>   To remove them unconditionally use: vgreduce --removemissing --force.
>   To remove them unconditionally from mirror LVs use: vgreduce
> --removemissing --mirrorsonly --force.
>   WARNING: Proceeding to remove empty missing PVs.
>   WARNING: Couldn't find device with uuid
> uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.
> roger@dragon:~$ sudo lvremove wd/pvmove0
>   WARNING: Couldn't find device with uuid
> uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.
>   WARNING: VG wd is missing PV uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ
> (last written to [unknown]).
>   WARNING: Couldn't find device with uuid
> uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.
>   Can't remove locked logical volume wd/pvmove0.
>
> I am quite happy to loose the root lv, I just need the home and work lvs.
> What am I missing?
>
> Help!
>
> Roger
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--0000000000001828be05e285fcbf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>For a case like this vgcfgrestore is probably the bes=
t option.=C2=A0 man vgcfgrestore.<br></div><div><br></div><div>You need to =
see if you have archived vg copies that you can revert to before the &quot;=
add&quot; of the pv that went bad.</div><div><br></div><div>The archives ar=
e typically=C2=A0 in /etc/lvm/archiive/&lt;vgname&gt;* on RedHat derivative=
 OSes, not sure if they are different(and/or configured to exist) on other =
distributions.<br></div><div><br></div><div>grep -i before /etc/lvm/archive=
/&lt;vgname&gt;* and see which archive was made before the initial pv addit=
ion.=C2=A0 vgcfgrestore -f &lt;goodconfig&gt; should work but I usually hav=
e to adjust command line options to get it work when I have used it to reve=
rt configs.=C2=A0 I think in that case it will find the vg and pvid correct=
ly.=C2=A0 No cleanup should need to be done so long as the other device is =
completely gone.<br></div><div><br></div><div>And you will probably need to=
 answer some prompts and warnings, and then reboot the machine, and/or do t=
his all under a livecd rescue boot.</div><div><br></div><div>What kind of c=
heap ssd were you using?=C2=A0 I have had really bad luck with ones without=
 RAM.=C2=A0 I RMA&#39;ed one that failed in under a week and the new one al=
so failed in a very similar way in under a week.<br></div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 28, 2=
022 at 1:38 AM Roger James &lt;<a href=3D"mailto:roger@beardandsandals.co.u=
k">roger@beardandsandals.co.uk</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><u></u>

<div>
<div dir=3D"auto">
Hi,<div dir=3D"auto"><br></div><div dir=3D"auto">I am struggling to recover=
 from a failed pvmove. Unfortunately I only have a limited knowledge of lvm=
. I setup my lvm configuration many years ago.</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">I was trying to move a lv to a SSD using pvmove. Unf=
ortunately my brand new SSD choose that moment to fail (never buy cheap SSD=
s, lesson learnt!&quot;).</div><div dir=3D"auto"><br></div><div dir=3D"auto=
">This is the current status.</div><div dir=3D"auto"><br></div><div dir=3D"=
auto">roger@dragon:~$ sudo pvs</div><div dir=3D"auto">=C2=A0 WARNING: Could=
n&#39;t find device with uuid uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.</div>=
<div dir=3D"auto">=C2=A0 WARNING: VG wd is missing PV uMtjop-PmMT-603f-GWWQ=
-fR4f-s4Sw-XSKNXZ (last written to [unknown]).</div><div dir=3D"auto">=C2=
=A0 PV         VG Fmt  Attr PSize    PFree</div><div dir=3D"auto">=C2=A0 /d=
ev/sda1  wd lvm2 a--  &lt;465.76g      0</div><div dir=3D"auto">=C2=A0 /dev=
/sdb1  wd lvm2 a--  &lt;465.76g &lt;80.45g</div><div dir=3D"auto">=C2=A0 /d=
ev/sdc2  wd lvm2 a--   778.74g 278.74g</div><div dir=3D"auto">=C2=A0 /dev/s=
dd1  wd lvm2 a--  &lt;465.76g      0</div><div dir=3D"auto">=C2=A0 [unknown=
]  wd lvm2 a-m  &lt;784.49g 685.66g</div><div dir=3D"auto">roger@dragon:~$ =
sudo lvs</div><div dir=3D"auto">=C2=A0 WARNING: Couldn&#39;t find device wi=
th uuid uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.</div><div dir=3D"auto">=C2=
=A0 WARNING: VG wd is missing PV uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ (la=
st written to [unknown]).</div><div dir=3D"auto">=C2=A0 LV   VG Attr       =
LSize    Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert</div><div dir=
=3D"auto">=C2=A0 home wd -wi-------    1.46t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</div><div di=
r=3D"auto">=C2=A0 root wd -wI-----p- &lt;108.83g=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</div><di=
v dir=3D"auto">=C2=A0 swap wd -wi-------    8.00g=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</div>=
<div dir=3D"auto">=C2=A0 work wd -wi-------  200.00g=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</=
div><div dir=3D"auto">roger@dragon:~$ sudo vgs</div><div dir=3D"auto">=C2=
=A0 WARNING: Couldn&#39;t find device with uuid uMtjop-PmMT-603f-GWWQ-fR4f-=
s4Sw-XSKNXZ.</div><div dir=3D"auto">=C2=A0 WARNING: VG wd is missing PV uMt=
jop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ (last written to [unknown]).</div><div =
dir=3D"auto">=C2=A0 VG #PV #LV #SN Attr   VSize VFree</div><div dir=3D"auto=
">=C2=A0 wd   5   4   0 wz-pn- 2.89t 1.02t</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">This is a recap of what I have tried so far.</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">roger@dragon:~$ sudo pvmove --abort=
</div><div dir=3D"auto">=C2=A0 WARNING: Couldn&#39;t find device with uuid =
uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.</div><div dir=3D"auto">=C2=A0 WARNI=
NG: VG wd is missing PV uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ (last writte=
n to [unknown]).</div><div dir=3D"auto">=C2=A0 LVM command executed by lvmp=
olld failed.</div><div dir=3D"auto">=C2=A0 For more information see lvmpoll=
d messages in syslog or lvmpolld log file.</div><div dir=3D"auto">roger@dra=
gon:~$ sudo vgreduce --removemissing wd</div><div dir=3D"auto">=C2=A0 WARNI=
NG: Couldn&#39;t find device with uuid uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKN=
XZ.</div><div dir=3D"auto">=C2=A0 WARNING: VG wd is missing PV uMtjop-PmMT-=
603f-GWWQ-fR4f-s4Sw-XSKNXZ (last written to [unknown]).</div><div dir=3D"au=
to">=C2=A0 WARNING: Couldn&#39;t find device with uuid uMtjop-PmMT-603f-GWW=
Q-fR4f-s4Sw-XSKNXZ.</div><div dir=3D"auto">=C2=A0 WARNING: Partial LV root =
needs to be repaired or removed.</div><div dir=3D"auto">=C2=A0 WARNING: Par=
tial LV pvmove0 needs to be repaired or removed.</div><div dir=3D"auto">=C2=
=A0 There are still partial LVs in VG wd.</div><div dir=3D"auto">=C2=A0 To =
remove them unconditionally use: vgreduce --removemissing --force.</div><di=
v dir=3D"auto">=C2=A0 To remove them unconditionally from mirror LVs use: v=
greduce --removemissing --mirrorsonly --force.</div><div dir=3D"auto">=C2=
=A0 WARNING: Proceeding to remove empty missing PVs.</div><div dir=3D"auto"=
>=C2=A0 WARNING: Couldn&#39;t find device with uuid uMtjop-PmMT-603f-GWWQ-f=
R4f-s4Sw-XSKNXZ.</div><div dir=3D"auto">roger@dragon:~$ sudo lvchange -an w=
d/root</div><div dir=3D"auto">=C2=A0 WARNING: Couldn&#39;t find device with=
 uuid uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.</div><div dir=3D"auto">=C2=A0=
 WARNING: VG wd is missing PV uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ (last =
written to [unknown]).</div><div dir=3D"auto">roger@dragon:~$ sudo vgreduce=
 --removemissing wd</div><div dir=3D"auto">=C2=A0 WARNING: Couldn&#39;t fin=
d device with uuid uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.</div><div dir=3D=
"auto">=C2=A0 WARNING: VG wd is missing PV uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-=
XSKNXZ (last written to [unknown]).</div><div dir=3D"auto">=C2=A0 WARNING: =
Couldn&#39;t find device with uuid uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.<=
/div><div dir=3D"auto">=C2=A0 WARNING: Partial LV root needs to be repaired=
 or removed.</div><div dir=3D"auto">=C2=A0 WARNING: Partial LV pvmove0 need=
s to be repaired or removed.</div><div dir=3D"auto">=C2=A0 There are still =
partial LVs in VG wd.</div><div dir=3D"auto">=C2=A0 To remove them uncondit=
ionally use: vgreduce --removemissing --force.</div><div dir=3D"auto">=C2=
=A0 To remove them unconditionally from mirror LVs use: vgreduce --removemi=
ssing --mirrorsonly --force.</div><div dir=3D"auto">=C2=A0 WARNING: Proceed=
ing to remove empty missing PVs.</div><div dir=3D"auto">=C2=A0 WARNING: Cou=
ldn&#39;t find device with uuid uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.</di=
v><div dir=3D"auto">roger@dragon:~$ sudo lvremove wd/pvmove0</div><div dir=
=3D"auto">=C2=A0 WARNING: Couldn&#39;t find device with uuid uMtjop-PmMT-60=
3f-GWWQ-fR4f-s4Sw-XSKNXZ.</div><div dir=3D"auto">=C2=A0 WARNING: VG wd is m=
issing PV uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ (last written to [unknown]=
).</div><div dir=3D"auto">=C2=A0 WARNING: Couldn&#39;t find device with uui=
d uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.</div><div dir=3D"auto">=C2=A0 Can=
&#39;t remove locked logical volume wd/pvmove0.</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">I am quite happy to loose the root lv, I just need =
the home and work lvs. What am I missing?</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">Help!</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
Roger</div><div dir=3D"auto"><br></div>
</div></div>

_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://listman.redhat.com/mailman/listinfo/linux-lvm" rel=3D"no=
referrer" target=3D"_blank">https://listman.redhat.com/mailman/listinfo/lin=
ux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"=
noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote></div>

--0000000000001828be05e285fcbf--

--===============2578351585341003571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============2578351585341003571==--

