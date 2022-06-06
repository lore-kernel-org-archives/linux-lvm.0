Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBFFEC43334
	for <linux-lvm@archiver.kernel.org>; Tue,  7 Jun 2022 07:17:10 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314-t3bH7CAHNmmma0e92uYZgg-1; Tue, 07 Jun 2022 03:17:06 -0400
X-MC-Unique: t3bH7CAHNmmma0e92uYZgg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1DC1185A5B9;
	Tue,  7 Jun 2022 07:17:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B9E6A40EC002;
	Tue,  7 Jun 2022 07:16:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CB2E51947B95;
	Tue,  7 Jun 2022 07:16:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7116C194706E
 for <linux-lvm@listman.corp.redhat.com>; Mon,  6 Jun 2022 11:31:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3E7AC1678F; Mon,  6 Jun 2022 11:31:31 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A37782882
 for <linux-lvm@redhat.com>; Mon,  6 Jun 2022 11:31:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E9D83C16187
 for <linux-lvm@redhat.com>; Mon,  6 Jun 2022 11:31:31 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-500-4NrpC8GOMNOQRupTc2riUQ-1; Mon, 06 Jun 2022 07:31:29 -0400
X-MC-Unique: 4NrpC8GOMNOQRupTc2riUQ-1
Received: by mail-lj1-f182.google.com with SMTP id l18so8119655lje.13
 for <linux-lvm@redhat.com>; Mon, 06 Jun 2022 04:31:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=44U0i0oFIjuEk19ZToKaunXCs8jNeS9vaBWoWawztAs=;
 b=TsnLreW+xPvgd1WdqoSGlAl4Tm+Xdb4hrrH87bd9SUkgeA55O8dGMIX38JfiW3anuI
 9meCNNfJAzclf80PdwT2931W1SGAHeLBG7s+Xp5dAZbbvnGIiKL5GlcdhhbGFn3p3J7A
 YqUf6yJi8A3dRIGEtfHQKFYuBzXg5AHix+O4LsP540sDgtiPVATmtJ3Vb2mRHhqVVxR9
 qADUfgcgJh56598EGqTbT+MCqSoqjQBiiOORoW8lnrik5bFUoTm8PzFnbVBuW6UtF1YQ
 gsRZoGaBgNxZlA7F9Esg1Ik9ufPWGoqREc+2CWr7+XpY2bWaZPbj4J1eqAt/GhrsGxny
 +XTw==
X-Gm-Message-State: AOAM532TfH/lawEbsMVz5G1zrI/+pc9P77PKhO5vcOm2Ut0j98vxKKD9
 PGuzXjIoEeWWJrL6C3ES3GMdaXWjBD61FMHUkwDtgilW9zQ=
X-Google-Smtp-Source: ABdhPJwOyZnOwRDVwXUdlBBBYg5zOySRR/jaDiYiHuhDf40m/FVJbSTPRbOmS1+iq4IPvoWJqDxDiNzHve8VpE5wFow=
X-Received: by 2002:a2e:a588:0:b0:255:83f3:93d3 with SMTP id
 m8-20020a2ea588000000b0025583f393d3mr7421785ljp.332.1654515087296; Mon, 06
 Jun 2022 04:31:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAM3OQJGWsYo=boQBHqmLj1HRRtg14p3-Tp3yeu7KMYcKV2_hOA@mail.gmail.com>
 <CAAMCDecMgzcyQOdb2n-zLRwrHhK9wFSicHJDeA_9zhvSQbyPdw@mail.gmail.com>
 <CAM3OQJEEttEn22Ao3GJK=GYKSUj3Sp0brU1mv2_s1dnMeFUg5g@mail.gmail.com>
 <YpcUpGsiSjwK8cG2@itl-email>
 <CAM3OQJHe3GKfAqR4A3QT6Q6TgiG-qpHNBHfnEczD3eH+ruq0VA@mail.gmail.com>
 <CAAMCDefV+jHCKnrp0gad7BFgJaYDQNOkeQM5z8zkOe4PUz9Dpw@mail.gmail.com>
 <CAM3OQJHdTqOksDPx0dp_LbF2kRHaaoN3b4YEGamHFabHRGxScA@mail.gmail.com>
 <Yp2mZGmhFD23XQcL@itl-email>
In-Reply-To: <Yp2mZGmhFD23XQcL@itl-email>
From: Abhishek Agarwal <mragarwal.developer@gmail.com>
Date: Mon, 6 Jun 2022 17:01:15 +0530
Message-ID: <CAM3OQJEJCV_ozKjHS2FguUsnZXD37eK9YBExjRT-ZAdJGUp_TA@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Mailman-Approved-At: Tue, 07 Jun 2022 07:16:56 +0000
Subject: Re: [linux-lvm] lvm commands hanging when run from inside a
 kubernetes pod
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============7938456713152976945=="

--===============7938456713152976945==
Content-Type: multipart/alternative; boundary="0000000000000dcd7205e0c5d0f3"

--0000000000000dcd7205e0c5d0f3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Demi, can you explain how it will help to solve the problem? I'm
actually not aware of that much low-level stuff but would like to learn
about it. Also, can you provide a few references for it on how I can use it=
?

Thanks

On Mon, 6 Jun 2022 at 12:32, Demi Marie Obenour <demi@invisiblethingslab.co=
m>
wrote:

> On Mon, Jun 06, 2022 at 11:19:47AM +0530, Abhishek Agarwal wrote:
> > 1. Yes, use_lvmetad is 0, and its systemd units for it are
> stopped/disabled.
> > 2. Yes, everything on the host machine i.e(/proc, /sys etc) are getting
> > mounted on the pod.
> >
> > *ubuntu@ip-172-31-89-47*:*~*$ kubectl exec -it openebs-lvm-node-v6jrb -=
c
> > openebs-lvm-plugin  -n kube-system -- sh
> >
> > # ls
> >
> > bin  boot  dev etc  home  host  lib  lib32  lib64  libx32  media  mnt o=
pt
> > plugin  proc  root  run  sbin  srv  sys  tmp  usr var
> >
> > # cd /host
> >
> > # ls
> >
> > bin  boot  dev etc  home  lib lib32  lib64  libx32  lost+found  media
> mnt
> > opt  proc  root  run  sbin  snap srv  sys  tmp  usr  var
> >
> > #
> > 3. The detail output of `strace -f -ttt` command:
> > https://pastebin.com/raw/VFyXLNaC
>
> I suggest bind-mounting the host=E2=80=99s D-Bus socket into the containe=
r and
> using systemd=E2=80=99s D-Bus API to run the LVM commands on the host.  T=
his
> will avoid the problems you are having.
> --
> Sincerely,
> Demi Marie Obenour (she/her/hers)
> Invisible Things Lab
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--0000000000000dcd7205e0c5d0f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey=C2=A0<span style=3D"color:rgb(32,33,36);font-size:0.87=
5rem;font-weight:bold;letter-spacing:0.2px;font-family:Roboto,RobotoDraft,H=
elvetica,Arial,sans-serif;white-space:nowrap">Demi,=C2=A0</span>can you exp=
lain how it will help to solve the problem? I&#39;m actually not aware of t=
hat much low-level stuff but would like to learn about it. Also, can you pr=
ovide a few references for it on how I can use it?<div><br></div><div>Thank=
s</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, 6 Jun 2022 at 12:32, Demi Marie Obenour &lt;<a href=3D"mailt=
o:demi@invisiblethingslab.com">demi@invisiblethingslab.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,20=
4,204);padding-left:1ex">On Mon, Jun 06, 2022 at 11:19:47AM +0530, Abhishek=
 Agarwal wrote:<br>
&gt; 1. Yes, use_lvmetad is 0, and its systemd units for it are stopped/dis=
abled.<br>
&gt; 2. Yes, everything on the host machine i.e(/proc, /sys etc) are gettin=
g<br>
&gt; mounted on the pod.<br>
&gt; <br>
&gt; *ubuntu@ip-172-31-89-47*:*~*$ kubectl exec -it openebs-lvm-node-v6jrb =
-c<br>
&gt; openebs-lvm-plugin=C2=A0 -n kube-system -- sh<br>
&gt; <br>
&gt; # ls<br>
&gt; <br>
&gt; bin=C2=A0 boot=C2=A0 dev etc=C2=A0 home=C2=A0 host=C2=A0 lib=C2=A0 lib=
32=C2=A0 lib64=C2=A0 libx32=C2=A0 media=C2=A0 mnt opt<br>
&gt; plugin=C2=A0 proc=C2=A0 root=C2=A0 run=C2=A0 sbin=C2=A0 srv=C2=A0 sys=
=C2=A0 tmp=C2=A0 usr var<br>
&gt; <br>
&gt; # cd /host<br>
&gt; <br>
&gt; # ls<br>
&gt; <br>
&gt; bin=C2=A0 boot=C2=A0 dev etc=C2=A0 home=C2=A0 lib lib32=C2=A0 lib64=C2=
=A0 libx32=C2=A0 lost+found=C2=A0 media=C2=A0 mnt<br>
&gt; opt=C2=A0 proc=C2=A0 root=C2=A0 run=C2=A0 sbin=C2=A0 snap srv=C2=A0 sy=
s=C2=A0 tmp=C2=A0 usr=C2=A0 var<br>
&gt; <br>
&gt; #<br>
&gt; 3. The detail output of `strace -f -ttt` command:<br>
&gt; <a href=3D"https://pastebin.com/raw/VFyXLNaC" rel=3D"noreferrer" targe=
t=3D"_blank">https://pastebin.com/raw/VFyXLNaC</a><br>
<br>
I suggest bind-mounting the host=E2=80=99s D-Bus socket into the container =
and<br>
using systemd=E2=80=99s D-Bus API to run the LVM commands on the host.=C2=
=A0 This<br>
will avoid the problems you are having.<br>
-- <br>
Sincerely,<br>
Demi Marie Obenour (she/her/hers)<br>
Invisible Things Lab<br>
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

--0000000000000dcd7205e0c5d0f3--

--===============7938456713152976945==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============7938456713152976945==--

