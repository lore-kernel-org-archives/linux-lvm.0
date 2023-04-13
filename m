Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEAC8C77B6E
	for <linux-lvm@archiver.kernel.org>; Fri, 14 Apr 2023 06:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681455141;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=BvezUvCkBrJd674APiTuqiG57GNhWpN4N4VhqMm+jFU=;
	b=iyKOwYlPTkmhn0uz9jZ8k8hxN7f9P68rCxk0a6HrXJLtQc29pkxlCj/H4eZGc2o7u22Yhy
	Iaf/SgaXXCW7FY2F1G7PL/J9qZt0gjWjVN7Wjz8lazrib0wrl8eChXh9DeeFSaLAIHIAFA
	ggLSyl9Klh+4NVP+G2RLtS1ALfPhoD0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-SuvQNkrvMIaWTS60RGllPg-1; Fri, 14 Apr 2023 02:52:18 -0400
X-MC-Unique: SuvQNkrvMIaWTS60RGllPg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D80D7886074;
	Fri, 14 Apr 2023 06:52:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 52A97492C13;
	Fri, 14 Apr 2023 06:52:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id ABA0719472C6;
	Fri, 14 Apr 2023 06:52:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F112719465B6
 for <linux-lvm@listman.corp.redhat.com>; Thu, 13 Apr 2023 10:54:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DD24E1402C08; Thu, 13 Apr 2023 10:54:53 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D4F2C14171BA
 for <linux-lvm@redhat.com>; Thu, 13 Apr 2023 10:54:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D5DF800B35
 for <linux-lvm@redhat.com>; Thu, 13 Apr 2023 10:54:53 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-oqsbCoF6PfuzEeHa1Oml9A-1; Thu, 13 Apr 2023 06:54:51 -0400
X-MC-Unique: oqsbCoF6PfuzEeHa1Oml9A-1
Received: by mail-oi1-f181.google.com with SMTP id e9so9598060oig.7
 for <linux-lvm@redhat.com>; Thu, 13 Apr 2023 03:54:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681383291; x=1683975291;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jBtOTvC9BybZ9NlNblKM5fFfugpbs7qSB75RX3hOeGw=;
 b=Bx92LKcJ/cKl9BOJ8tJ1WPIe2tQcMNC5ybn5kuSvAXxTaGGznPOc53jXnXSqbNHnGe
 /4xcQJQ9nMf7F8lggvBPWFFM4CVcUmNUz62RPNRUtJAoIzJXfWF1JZRC4aSuHDM1D0ja
 esS5+QU5Qy3CZF6rm/Dj5PSzE6EDMIkCm8L1icNfBCW3+GwQB2dZpPhDdrC0dhg+Ly2X
 4B44IAHqBl68oJgnyNFLwpX7lk8I2Pz7JKRk3HYAuwEw9b2uRict1KHBXF+PDswlBCbL
 1y/r5h9c8xLOBM/jqSHSeVHpRTuNmdpVRoGO36lxugW+yAM7PHBLQonwG4J2OYyxTCBw
 OYvw==
X-Gm-Message-State: AAQBX9cvi+ePgzsw74fWrkwvlmbKhIm/s96iiz5OKisVfbFDPfYOMQ7Q
 6XiU/yfUIfm/Wj+1kZCVelsy4piFFFvCzAQgXxkTuzWC19o=
X-Google-Smtp-Source: AKy350Z6vnamvuMfVa0w9a/BT4psTDGgmLVhs1YwtYH8I0wm9vrtQAmVQFZUAXFPPz+X4kr3qa6Xq4Aj0kaZqM/tb/U=
X-Received: by 2002:aca:180f:0:b0:384:2b09:45f7 with SMTP id
 h15-20020aca180f000000b003842b0945f7mr291947oih.4.1681383289259; Thu, 13 Apr
 2023 03:54:49 -0700 (PDT)
MIME-Version: 1.0
References: <ac0f39c8-932d-293a-b7aa-568532bda22a@bytedance.com>
 <20230411133147.GB27598@redhat.com>
 <e318740a-bb17-8e38-ed3f-f1776292b47c@bytedance.com>
In-Reply-To: <e318740a-bb17-8e38-ed3f-f1776292b47c@bytedance.com>
From: Giorgio Bersano <giorgio.bersano@gmail.com>
Date: Thu, 13 Apr 2023 12:54:37 +0200
Message-ID: <CA+ZC=DhNUKE53bpLcOvNoaf4oFikeFDYT6NrrG_Bo6K5m7fTqA@mail.gmail.com>
To: "yezhiyong@bytedance.com" <yezhiyong@bytedance.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mailman-Approved-At: Fri, 14 Apr 2023 06:52:11 +0000
Subject: Re: [linux-lvm] How to convert a single path to a multipath after
 using dm-multipath
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
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: multipart/mixed; boundary="===============3456474566743762975=="

--===============3456474566743762975==
Content-Type: multipart/alternative; boundary="000000000000b009d705f9358d21"

--000000000000b009d705f9358d21
Content-Type: text/plain; charset="UTF-8"

Hi Zhiyong,
did you filter out the device in lvm.conf ?

filter = [ ... , "r/sd.*/" , ... ]

         or  "r/sda/" if you want to only exclude  sda

Regards,
Giorgio.


Il giorno gio 13 apr 2023 alle ore 08:55 Zhiyong Ye <yezhiyong@bytedance.com>
ha scritto:

>
> Hi Dave,
>
> Thank you for your reply.
>
> Because I had not considered multi-pathing before, there is no way to
> configure mpath on sda alone on the current stock of machines. And I
> tested this in my environment using lvchange --refresh, but it doesn't
> switch the active LV to use mpatha.
>
> # lvchange --refresh is-he57e6mr4wemb19kgf8i
> WARNING: Not using device /dev/mapper/mpatha for PV
> HgL3xR-qTio-m75Q-nGAO-Un0U-8uHk-wHbH25.
> WARNING: PV HgL3xR-qTio-m75Q-nGAO-Un0U-8uHk-wHbH25 prefers device
> /dev/sda because device is used by LV.
>
> # pvs
> WARNING: Not using device /dev/mapper/mpatha for PV
> HgL3xR-qTio-m75Q-nGAO-Un0U-8uHk-wHbH25.
> WARNING: PV HgL3xR-qTio-m75Q-nGAO-Un0U-8uHk-wHbH25 prefers device
> /dev/sda because device is used by LV.
> PV           VG                      Fmt  Attr PSize  PFree
> /dev/sda     is-he57e6mr4wemb19kgf8i lvm2 a--  10.00t 9.98t
>
> This is because duplicate PVs are encountered during the disk discovery
> phase, but lvmcache tends to use sda because it is currently being used
> by LV and mpatha will be dropped.
>
> I debugged the _choose_duplicates function in lvmcache and printed the
> following log:
> lvm[3352450]: PV HgL3xRqTiom75QnGAOUn0U8uHkwHbH25 compare duplicates:
> /dev/mapper/mpatha 254:3. /dev/sda 8:16. device_hint /dev/sda.
> vm[3352450]: PV HgL3xRqTiom75QnGAOUn0U8uHkwHbH25: size 21474836480.
> /dev/mapper/mpatha is 21474836480. /dev/sda is 21474836480.
> lvm[3352450]: PV HgL3xRqTiom75QnGAOUn0U8uHkwHbH25: /dev/mapper/mpatha
> was prev <none>. /dev/sda was prev <none>.
> lvm[3352450]: PV HgL3xRqTiom75QnGAOUn0U8uHkwHbH25: /dev/mapper/mpatha is
> in subsystem. /dev/sda is not in subsystem.
> lvm[3352450]: PV HgL3xRqTiom75QnGAOUn0U8uHkwHbH25: /dev/mapper/mpatha is
> dm. /dev/sda is not dm.
> lvm[3352450]: PV HgL3xRqTiom75QnGAOUn0U8uHkwHbH25: /dev/mapper/mpatha
> has no mounted fs. /dev/sda has no mounted fs.
> lvm[3352450]: PV HgL3xRqTiom75QnGAOUn0U8uHkwHbH25: /dev/mapper/mpatha is
> not used for LV. /dev/sda is used for LV.
> lvm[3352450]: PV HgL3xRqTiom75QnGAOUn0U8uHkwHbH25 with duplicates will
> change from /dev/mapper/mpatha to /dev/sda.
> lvm[3352450]: Dropping unchosen duplicate /dev/mapper/mpatha
> lvm[3352450]: Adding chosen duplicate /dev/sda
>
> Is there any way to change the PV preference policy in _choose_duplicates?
>
>




> Regards
>
> Zhiyong
>
> On 4/11/23 9:31 PM, David Teigland wrote:
> > On Tue, Apr 11, 2023 at 01:29:42PM +0800, Zhiyong Ye wrote:
> >> and lv on it. I then turn on the multipath function and merge the two
> paths
> >> into a new device (/dev/mapper/matha), and I get the following error
> when I
> >> execute the lvm command.
> >>
> >> # pvs
> >> WARNING: Not using device /dev/mapper/matha for PV
> >> HgL3xR-qTio-m75Q-nGAO-Un0U-8uHk-wHbH25.
> >> WARNING: PV HgL3xR-qTio-m75Q-nGAO-Un0U-8uHk-wHbH25 prefers device
> /dev/sda
> >> because device is used by LV.
> >> PV           VG                      Fmt  Attr PSize  PFree
> >> /dev/sda     is-he57e6mr4wemb19kgf8i lvm2 a--  10.00t 9.98t
> >
> >> May you please advise how one can convert the pv used by vg from sda to
> >> matha without affecting the current lv usage.
> >
> > lvchange --refresh should refresh the active LV to use mpatha.  To avoid
> > this, you might configure mpath on sda alone prior to adding the second
> > path.
> >
> > Dave
> >
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>

--000000000000b009d705f9358d21
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Zhiyong,</div><div>did you filter out the device i=
n lvm.conf ?</div><div><br></div><div>filter =3D [ ... , &quot;r/sd.*/&quot=
; , ... ]=C2=A0=C2=A0</div><div><br></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0or=C2=A0 &quot;r/sda/&quot; if you want to only exclude=C2=A0 sda=C2=
=A0</div><div><br></div><div>Regards,</div><div>Giorgio.</div><div><br></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Il g=
iorno gio 13 apr 2023 alle ore 08:55 Zhiyong Ye &lt;<a href=3D"mailto:yezhi=
yong@bytedance.com">yezhiyong@bytedance.com</a>&gt; ha scritto:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><br>
Hi Dave,<br>
<br>
Thank you for your reply.<br>
<br>
Because I had not considered multi-pathing before, there is no way to <br>
configure mpath on sda alone on the current stock of machines. And I <br>
tested this in my environment using lvchange --refresh, but it doesn&#39;t =
<br>
switch the active LV to use mpatha.<br>
<br>
# lvchange --refresh is-he57e6mr4wemb19kgf8i<br>
WARNING: Not using device /dev/mapper/mpatha for PV <br>
HgL3xR-qTio-m75Q-nGAO-Un0U-8uHk-wHbH25.<br>
WARNING: PV HgL3xR-qTio-m75Q-nGAO-Un0U-8uHk-wHbH25 prefers device <br>
/dev/sda because device is used by LV.<br>
<br>
# pvs<br>
WARNING: Not using device /dev/mapper/mpatha for PV <br>
HgL3xR-qTio-m75Q-nGAO-Un0U-8uHk-wHbH25.<br>
WARNING: PV HgL3xR-qTio-m75Q-nGAO-Un0U-8uHk-wHbH25 prefers device <br>
/dev/sda because device is used by LV.<br>
PV=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Fmt=C2=A0 Attr PSize=C2=A0=
 PFree<br>
/dev/sda=C2=A0 =C2=A0 =C2=A0is-he57e6mr4wemb19kgf8i lvm2 a--=C2=A0 10.00t 9=
.98t<br>
<br>
This is because duplicate PVs are encountered during the disk discovery <br=
>
phase, but lvmcache tends to use sda because it is currently being used <br=
>
by LV and mpatha will be dropped.<br>
<br>
I debugged the _choose_duplicates function in lvmcache and printed the <br>
following log:<br>
lvm[3352450]: PV HgL3xRqTiom75QnGAOUn0U8uHkwHbH25 compare duplicates: <br>
/dev/mapper/mpatha 254:3. /dev/sda 8:16. device_hint /dev/sda.<br>
vm[3352450]: PV HgL3xRqTiom75QnGAOUn0U8uHkwHbH25: size 21474836480. <br>
/dev/mapper/mpatha is 21474836480. /dev/sda is 21474836480.<br>
lvm[3352450]: PV HgL3xRqTiom75QnGAOUn0U8uHkwHbH25: /dev/mapper/mpatha <br>
was prev &lt;none&gt;. /dev/sda was prev &lt;none&gt;.<br>
lvm[3352450]: PV HgL3xRqTiom75QnGAOUn0U8uHkwHbH25: /dev/mapper/mpatha is <b=
r>
in subsystem. /dev/sda is not in subsystem.<br>
lvm[3352450]: PV HgL3xRqTiom75QnGAOUn0U8uHkwHbH25: /dev/mapper/mpatha is <b=
r>
dm. /dev/sda is not dm.<br>
lvm[3352450]: PV HgL3xRqTiom75QnGAOUn0U8uHkwHbH25: /dev/mapper/mpatha <br>
has no mounted fs. /dev/sda has no mounted fs.<br>
lvm[3352450]: PV HgL3xRqTiom75QnGAOUn0U8uHkwHbH25: /dev/mapper/mpatha is <b=
r>
not used for LV. /dev/sda is used for LV.<br>
lvm[3352450]: PV HgL3xRqTiom75QnGAOUn0U8uHkwHbH25 with duplicates will <br>
change from /dev/mapper/mpatha to /dev/sda.<br>
lvm[3352450]: Dropping unchosen duplicate /dev/mapper/mpatha<br>
lvm[3352450]: Adding chosen duplicate /dev/sda<br>
<br>
Is there any way to change the PV preference policy in _choose_duplicates?<=
br>
<br></blockquote><div><br></div><div><br></div><div><br></div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
Regards<br>
<br>
Zhiyong<br>
<br>
On 4/11/23 9:31 PM, David Teigland wrote:<br>
&gt; On Tue, Apr 11, 2023 at 01:29:42PM +0800, Zhiyong Ye wrote:<br>
&gt;&gt; and lv on it. I then turn on the multipath function and merge the =
two paths<br>
&gt;&gt; into a new device (/dev/mapper/matha), and I get the following err=
or when I<br>
&gt;&gt; execute the lvm command.<br>
&gt;&gt;<br>
&gt;&gt; # pvs<br>
&gt;&gt; WARNING: Not using device /dev/mapper/matha for PV<br>
&gt;&gt; HgL3xR-qTio-m75Q-nGAO-Un0U-8uHk-wHbH25.<br>
&gt;&gt; WARNING: PV HgL3xR-qTio-m75Q-nGAO-Un0U-8uHk-wHbH25 prefers device =
/dev/sda<br>
&gt;&gt; because device is used by LV.<br>
&gt;&gt; PV=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VG=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Fmt=C2=A0 Attr PSiz=
e=C2=A0 PFree<br>
&gt;&gt; /dev/sda=C2=A0 =C2=A0 =C2=A0is-he57e6mr4wemb19kgf8i lvm2 a--=C2=A0=
 10.00t 9.98t<br>
&gt; <br>
&gt;&gt; May you please advise how one can convert the pv used by vg from s=
da to<br>
&gt;&gt; matha without affecting the current lv usage.<br>
&gt; <br>
&gt; lvchange --refresh should refresh the active LV to use mpatha.=C2=A0 T=
o avoid<br>
&gt; this, you might configure mpath on sda alone prior to adding the secon=
d<br>
&gt; path.<br>
&gt; <br>
&gt; Dave<br>
&gt; <br>
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
</blockquote></div></div>

--000000000000b009d705f9358d21--

--===============3456474566743762975==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============3456474566743762975==--

