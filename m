Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C374EEE49A3
	for <linux-lvm@archiver.kernel.org>; Tue, 22 Aug 2023 06:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692687524;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=bXgTyuOGB7b4CFm94SSsQqPR4twU/4bZHDcjVcEm+Uo=;
	b=TJdS8Mq/WUYHz6KB7DYMLIT9jhOTh3g0OFD386fXDnuKsYoGOfRN/rwBTtQ8q8+f2XmNVU
	L+jU9xXI5WVTkSP+RosD1L3mxyh3g7/St7nSzkiuodl5UqroWtH/ahYzeyZnA4b1Wb4ugB
	fHgZ6Sxq7YtfJLiXvawtRBABsV2BSoc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-9tCsdlCgMuuKP1i5Q0-AxQ-1; Tue, 22 Aug 2023 02:58:41 -0400
X-MC-Unique: 9tCsdlCgMuuKP1i5Q0-AxQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D8DF101A528;
	Tue, 22 Aug 2023 06:58:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6A9CB2026D4B;
	Tue, 22 Aug 2023 06:58:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2FC6C1946588;
	Tue, 22 Aug 2023 06:58:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E9AAC1946586
 for <linux-lvm@listman.corp.redhat.com>; Mon, 21 Aug 2023 16:00:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 90A2A1121314; Mon, 21 Aug 2023 16:00:36 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 88FEA1121318
 for <linux-lvm@redhat.com>; Mon, 21 Aug 2023 16:00:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64C0B80C909
 for <linux-lvm@redhat.com>; Mon, 21 Aug 2023 16:00:36 +0000 (UTC)
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-JnyKnsHLPg64f6NR7d-6uw-1; Mon, 21 Aug 2023 12:00:32 -0400
X-MC-Unique: JnyKnsHLPg64f6NR7d-6uw-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2b9bf49342dso36870001fa.1
 for <linux-lvm@redhat.com>; Mon, 21 Aug 2023 09:00:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692633630; x=1693238430;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5bQnKTpC2zAExDdU+qcpQKbfl72pHixe5wPUhUUeswA=;
 b=fdoM2o+/OoAJf+6PY5drJAHAgYbJeJuJDdHrpyY5xII1RmDTRMcjuEke7ZXmmwecNZ
 CFNdVxM7rHGXYaFyc8+8k92l9SIEIpZ2JG4VWR85/IfM5rj7/qvBJnUoQlqKqBLzTX9Z
 yNV3P2fHUdRN6yt5+JjeORR3rymBy0F2Efh4XGOvkzd9/me5sZ6qvKkr64NIu2xjeS3z
 BfMxDEYvPzZbAGl8W9aE4YOElZ1ARfU8dStax2rJCdt9LJ4VCVLLc4+fnIYcdHvEtL12
 4AlCHibiCn2OeKS7M/WBS7VqvrMtWV7eALWDWu7Mi3YFBudqGTlVjdG8m+uaWJ8Qw//T
 TGqA==
X-Gm-Message-State: AOJu0YwWicS/jdqK0VNoXgUY5UurYjJgKujz95NhpWsa5vajbbjvvM7y
 i1bGDlrJkv2DO9oBxy3fIeQB3PmQ4d8BClcHkemVbRntuZoQsXutCFhd9YjDSaSis60ph3OKc4t
 Gpzc2ZFKwXqK7iDNd4Wl4ZoSrFhou5067MayIffnh
X-Received: by 2002:a2e:9851:0:b0:2bb:9822:cad8 with SMTP id
 e17-20020a2e9851000000b002bb9822cad8mr5164091ljj.51.1692633630275; 
 Mon, 21 Aug 2023 09:00:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElp/awKS1w6gPwGFrrs3Lo0I5PJnCO740iHNnmLynJ4uK3EwPa/SWN6t6jW8srGFjknezrZ7r4YPxukiND9gA=
X-Received: by 2002:a2e:9851:0:b0:2bb:9822:cad8 with SMTP id
 e17-20020a2e9851000000b002bb9822cad8mr5164077ljj.51.1692633629847; Mon, 21
 Aug 2023 09:00:29 -0700 (PDT)
MIME-Version: 1.0
References: <fa206f6a-2675-95c9-d6fe-7ef8466a0dd5@web.de>
 <5f40e362-e6b9-d66e-312b-6999e40ba951@web.de>
In-Reply-To: <5f40e362-e6b9-d66e-312b-6999e40ba951@web.de>
From: Marian Csontos <mcsontos@redhat.com>
Date: Mon, 21 Aug 2023 18:00:18 +0200
Message-ID: <CAJNi=Xo+4ti+bwfAWMO1Ocxa9zaiz0989pHQAoC0-2hhYOij-g@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mailman-Approved-At: Tue, 22 Aug 2023 06:58:33 +0000
Subject: Re: [linux-lvm] indistinguishable column names ( BA Start Start
 Start Start )
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============8325530247303048813=="

--===============8325530247303048813==
Content-Type: multipart/alternative; boundary="0000000000003e3a0d060370fabc"

--0000000000003e3a0d060370fabc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Roland, is `lvs --reportformat json` or `lvs --nameprefixes` good enough=
?

On Sat, Aug 19, 2023 at 6:06=E2=80=AFPM Roland <devzero@web.de> wrote:

>  > furthermore, it's a little bit weird that some columns being printed
> by default when using -o, is
>  > there an easier way to remove those besides explictly removing them
> one by one with several -o options ? "-o-opt1,-opt2,..." doesn't work
>
> sorry for this noise, i was too dumb for that , "-o+opt1,opt2
> -o-opt3,opt4" works as desired (as documented in manpage)
>
>  > themselves,and there also seems no way to add separators in between
> (like with printf) for separation/formatting
>
> also sorry for this, as we can use --separator=3D","   (apparently did
> have too much coffee and had overseen that in the manpage)
>
> the question regarding native column headers/description remains
>
> roland
>
> Am 19.08.23 um 17:20 schrieb Roland:
> > hello,
> >
> > does somebody know how we can have native (i.e. non translated) column
> > field names in first line of output of pvs ?
> >
> > in its current implementation, output is hard to read , difficult to
> > distinguish and also not scriptable/parseable, as whitespace is used
> > for field separator and there are fields which also contain whitespace
> > themselves,and there also seems no way to add separators in between
> > (like with printf) for separation/formatting
> >
> > # pvs --units s -o+pv_ba_start,seg_start,seg_start_pe,pvseg_start
> >   PV         VG        Fmt  Attr PSize        PFree BA Start Start
> > Start Start
> >   /dev/sdb   VGrecycle lvm2 a--  11720982528S    0S       0S
> > 2097152S     1     0
> >   /dev/sdb   VGrecycle lvm2 a--  11720982528S    0S       0S
> > 2097152S     1     1
> >   /dev/sdb   VGrecycle lvm2 a--  11720982528S    0S 0S 0S     0  5309
> >   /dev/sdb   VGrecycle lvm2 a--  11720982528S    0S 0S 0S     0  5587
> >   /dev/sdb   VGrecycle lvm2 a--  11720982528S    0S 0S 0S     0  5588
> >
> > i mean like this:
> >
> > # pvs --units s -o+pv_ba_start,seg_start,seg_start_pe,pvseg_start
> >   PV         VG        Fmt  Attr PSize        PFree pv_ba_start
> > seg_start seg_start_pe pvseg_start
> >   /dev/sdb   VGrecycle lvm2 a--  11720982528S    0S          0S
> > 2097152S            1           0
> >   /dev/sdb   VGrecycle lvm2 a--  11720982528S    0S          0S
> > 2097152S            1           1
> >   /dev/sdb   VGrecycle lvm2 a--  11720982528S    0S 0S 0S            0
> >        5309
> >   /dev/sdb   VGrecycle lvm2 a--  11720982528S    0S 0S 0S
> > 0        5587
> >   /dev/sdb   VGrecycle lvm2 a--  11720982528S    0S 0S 0S
> > 0        5588
> >
> > furthermore, it's a little bit weird that some columns being printed
> > by default when using -o, is there an easier way to remove those
> > besides explictly removing them one by one with several -o options ?
> > "-o-opt1,-opt2,..." doesn't work
> >
> > # pvs --units s -o+pv_ba_start,seg_start,pvseg_start,seg_start_pe
> > -o-vg_name -o-pv_name -o-pv_fmt -o-attr -o -pv_size -o -pv_free
> >   BA Start Start    Start Start
> >         0S 2097152S     0     1
> >         0S 2097152S     1     1
> >         0S       0S  5309     0
> >         0S       0S  5587     0
> >         0S       0S  5588     0
> >
> > roland
> >
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--0000000000003e3a0d060370fabc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Roland, is `lvs --reportformat=C2=A0json` or `lvs --nam=
eprefixes` good enough?</div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Sat, Aug 19, 2023 at 6:06=E2=80=AFPM Roland &lt;<=
a href=3D"mailto:devzero@web.de">devzero@web.de</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0&gt; furthermore, it&#=
39;s a little bit weird that some columns being printed <br>
by default when using -o, is<br>
=C2=A0&gt; there an easier way to remove those besides explictly removing t=
hem <br>
one by one with several -o options ? &quot;-o-opt1,-opt2,...&quot; doesn&#3=
9;t work<br>
<br>
sorry for this noise, i was too dumb for that , &quot;-o+opt1,opt2 <br>
-o-opt3,opt4&quot; works as desired (as documented in manpage)<br>
<br>
=C2=A0&gt; themselves,and there also seems no way to add separators in betw=
een <br>
(like with printf) for separation/formatting<br>
<br>
also sorry for this, as we can use --separator=3D&quot;,&quot;=C2=A0=C2=A0 =
(apparently did <br>
have too much coffee and had overseen that in the manpage)<br>
<br>
the question regarding native column headers/description remains<br>
<br>
roland<br>
<br>
Am 19.08.23 um 17:20 schrieb Roland:<br>
&gt; hello,<br>
&gt;<br>
&gt; does somebody know how we can have native (i.e. non translated) column=
 <br>
&gt; field names in first line of output of pvs ?<br>
&gt;<br>
&gt; in its current implementation, output is hard to read , difficult to <=
br>
&gt; distinguish and also not scriptable/parseable, as whitespace is used <=
br>
&gt; for field separator and there are fields which also contain whitespace=
 <br>
&gt; themselves,and there also seems no way to add separators in between <b=
r>
&gt; (like with printf) for separation/formatting<br>
&gt;<br>
&gt; # pvs --units s -o+pv_ba_start,seg_start,seg_start_pe,pvseg_start<br>
&gt; =C2=A0 PV=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VG=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Fmt=C2=A0 Attr PSize=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 PFree BA Start Start=C2=A0=C2=A0=C2=A0 <br>
&gt; Start Start<br>
&gt; =C2=A0 /dev/sdb=C2=A0=C2=A0 VGrecycle lvm2 a--=C2=A0 11720982528S=C2=
=A0=C2=A0=C2=A0 0S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0S <br>
&gt; 2097152S=C2=A0=C2=A0=C2=A0=C2=A0 1=C2=A0=C2=A0=C2=A0=C2=A0 0<br>
&gt; =C2=A0 /dev/sdb=C2=A0=C2=A0 VGrecycle lvm2 a--=C2=A0 11720982528S=C2=
=A0=C2=A0=C2=A0 0S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0S <br>
&gt; 2097152S=C2=A0=C2=A0=C2=A0=C2=A0 1=C2=A0=C2=A0=C2=A0=C2=A0 1<br>
&gt; =C2=A0 /dev/sdb=C2=A0=C2=A0 VGrecycle lvm2 a--=C2=A0 11720982528S=C2=
=A0=C2=A0=C2=A0 0S 0S 0S=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0 5309<br>
&gt; =C2=A0 /dev/sdb=C2=A0=C2=A0 VGrecycle lvm2 a--=C2=A0 11720982528S=C2=
=A0=C2=A0=C2=A0 0S 0S 0S=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0 5587<br>
&gt; =C2=A0 /dev/sdb=C2=A0=C2=A0 VGrecycle lvm2 a--=C2=A0 11720982528S=C2=
=A0=C2=A0=C2=A0 0S 0S 0S=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0 5588<br>
&gt;<br>
&gt; i mean like this:<br>
&gt;<br>
&gt; # pvs --units s -o+pv_ba_start,seg_start,seg_start_pe,pvseg_start<br>
&gt; =C2=A0 PV=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VG=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Fmt=C2=A0 Attr PSize=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 PFree pv_ba_start <br>
&gt; seg_start seg_start_pe pvseg_start<br>
&gt; =C2=A0 /dev/sdb=C2=A0=C2=A0 VGrecycle lvm2 a--=C2=A0 11720982528S=C2=
=A0=C2=A0=C2=A0 0S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 0S <br>
&gt; 2097152S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0<br>
&gt; =C2=A0 /dev/sdb=C2=A0=C2=A0 VGrecycle lvm2 a--=C2=A0 11720982528S=C2=
=A0=C2=A0=C2=A0 0S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0S=
 <br>
&gt; 2097152S=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1<br>
&gt; =C2=A0 /dev/sdb=C2=A0=C2=A0 VGrecycle lvm2 a--=C2=A0 11720982528S=C2=
=A0=C2=A0=C2=A0 0S 0S 0S=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 <b=
r>
&gt; =C2=A0 =C2=A0 =C2=A0=C2=A0 5309<br>
&gt; =C2=A0 /dev/sdb=C2=A0=C2=A0 VGrecycle lvm2 a--=C2=A0 11720982528S=C2=
=A0=C2=A0=C2=A0 0S 0S 0S=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
&gt; 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5587<br>
&gt; =C2=A0 /dev/sdb=C2=A0=C2=A0 VGrecycle lvm2 a--=C2=A0 11720982528S=C2=
=A0=C2=A0=C2=A0 0S 0S 0S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 <br>
&gt; 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5588<br>
&gt;<br>
&gt; furthermore, it&#39;s a little bit weird that some columns being print=
ed <br>
&gt; by default when using -o, is there an easier way to remove those <br>
&gt; besides explictly removing them one by one with several -o options ? <=
br>
&gt; &quot;-o-opt1,-opt2,...&quot; doesn&#39;t work<br>
&gt;<br>
&gt; # pvs --units s -o+pv_ba_start,seg_start,pvseg_start,seg_start_pe <br>
&gt; -o-vg_name -o-pv_name -o-pv_fmt -o-attr -o -pv_size -o -pv_free<br>
&gt; =C2=A0 BA Start Start=C2=A0=C2=A0=C2=A0 Start Start<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0S 2097152S=C2=A0=C2=A0=C2=
=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0 1<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0S 2097152S=C2=A0=C2=A0=C2=
=A0=C2=A0 1=C2=A0=C2=A0=C2=A0=C2=A0 1<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0S=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 0S=C2=A0 5309=C2=A0=C2=A0=C2=A0=C2=A0 0<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0S=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 0S=C2=A0 5587=C2=A0=C2=A0=C2=A0=C2=A0 0<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0S=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 0S=C2=A0 5588=C2=A0=C2=A0=C2=A0=C2=A0 0<br>
&gt;<br>
&gt; roland<br>
&gt;<br>
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

--0000000000003e3a0d060370fabc--

--===============8325530247303048813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============8325530247303048813==--

