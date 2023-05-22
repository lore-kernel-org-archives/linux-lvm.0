Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC91C7EE26
	for <linux-lvm@archiver.kernel.org>; Tue, 23 May 2023 06:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684824420;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=wzuVG6caL6Oco5AlSPukNKqOlQDGwKTYJ3nJmi9LMm4=;
	b=bjfiX3JIVyWgDrbGI9AM1n4f+27xYgmBwr2wRW3WCQuCFTyDn+BTTFv73MPG7vEGqhnBRO
	+hs6FCSjbf7ytD+n1xT/VAuwbAHU/mOTKGK2TfqA/bhUUOqY0EMcX/6ZpIOEOpdXRoYP6T
	xIl43k+L+aLlvX294g2ilV47+uLZXTM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-283-FQ0vWU4JN7yGJFJNbz3peg-1; Tue, 23 May 2023 02:46:56 -0400
X-MC-Unique: FQ0vWU4JN7yGJFJNbz3peg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 599131C07827;
	Tue, 23 May 2023 06:46:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8367B2166B26;
	Tue, 23 May 2023 06:46:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8CE751946A45;
	Tue, 23 May 2023 06:46:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 48587194658C
 for <linux-lvm@listman.corp.redhat.com>; Mon, 22 May 2023 07:22:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 36FD52166B26; Mon, 22 May 2023 07:22:34 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E7C22166B25
 for <linux-lvm@redhat.com>; Mon, 22 May 2023 07:22:34 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E90A3C025AD
 for <linux-lvm@redhat.com>; Mon, 22 May 2023 07:22:34 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-Zesn4NwQOUSwCnB_Aftdyw-1; Mon, 22 May 2023 03:22:31 -0400
X-MC-Unique: Zesn4NwQOUSwCnB_Aftdyw-1
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-3f42b984405so34429665e9.3
 for <linux-lvm@redhat.com>; Mon, 22 May 2023 00:22:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684740150; x=1687332150;
 h=message-id:to:date:from:subject:content-transfer-encoding
 :mime-version:user-agent:thread-topic:references:in-reply-to
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A5T6ltaBzcsuinKDFkZg2DddPBuCvY4wMhli1uSJ9d4=;
 b=HkqW2YKLwZ7yMthWWuo1UHTvA7rfOos83oyGE3tAViStK6oVCUbBWBY0xfLST5SH1C
 gplNBebW2rIeAmq4I7hgZap+9W8UYvg3eQfw61Kht+8f1vqGe7D4vdcEuY1YEEf69Qat
 31x2ftVwdGuqUQmoIQD+z7HHhkMaEE4xuC94gOxQ8YeU07FqP3eGUky3tbVlf9g6bGS6
 XnKKWWFy8qDJgbmkfGNyIfn7X67yZt9LedZGEwthcRIh0mTUc3bkyxsioiZxB3KCk9FO
 UxZ9Q/v4+N15qV7O2htlc5N1hRE5jHv7vRrlW2m3tg78X3VQ7c/AekxaVec8E3gqsS7t
 qGMw==
X-Gm-Message-State: AC+VfDzbZrNLtYJrhukSQD2yQ4Ujrn0cvRh6zeBlijwnAYaymWTsa9tU
 WBEYp2KqYaVh/IVHCvTwlrCbx2MWm3c=
X-Google-Smtp-Source: ACHHUZ5th3RSdWLtoJboLvbLqxBpedF8aQboUUtmqX7HB/StLW7OSysqCmb56AKLASYqQichY3EJsQ==
X-Received: by 2002:a1c:7303:0:b0:3f1:9acf:8682 with SMTP id
 d3-20020a1c7303000000b003f19acf8682mr6520769wmb.17.1684740149678; 
 Mon, 22 May 2023 00:22:29 -0700 (PDT)
Received: from [10.28.213.104] ([37.160.96.56])
 by smtp.gmail.com with ESMTPSA id
 z24-20020a05600c221800b003f31d44f0cbsm10461084wml.29.2023.05.22.00.22.28
 for <linux-lvm@redhat.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 May 2023 00:22:29 -0700 (PDT)
In-Reply-To: <60e1a6cf-0384-5f6b-299b-a40c60a0b1a4@vetterlein.com>
References: <60e1a6cf-0384-5f6b-299b-a40c60a0b1a4@vetterlein.com>
X-Referenced-Uid: 72695
Thread-Topic: [linux-lvm] badblocks
X-Is-Generated-Message-Id: true
X-Blue-Identity: !l=763&o=122&fo=2995&pl=656&po=0&qs=PREFIX&f=HTML&n=Roberto%20Fastec&e=roberto.fastec%40gmail.com&m=!%3ANjc1YWQ4YzEtOTRkNS00ZmZmLWE0YjEtYTEzYWRhYTNmYmVi%3ASU5CT1g%3D%3ANzI2OTU%3D%3AANSWERED&p=656&q=SHOW
User-Agent: Android
MIME-Version: 1.0
X-Local-Message-Id: <56f121cc-c581-42b5-a715-98b20c1f38f2@gmail.com>
From: Roberto Fastec <roberto.fastec@gmail.com>
Date: Mon, 22 May 2023 09:22:28 +0200
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <56f121cc-c581-42b5-a715-98b20c1f38f2@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mailman-Approved-At: Tue, 23 May 2023 06:46:44 +0000
Subject: Re: [linux-lvm] badblocks
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: multipart/mixed; boundary="===============4757812513881366289=="

--===============4757812513881366289==
Content-Type: multipart/alternative; boundary="----7WMUYOXAQ3ICSW3YMIVL5FKSJ2FTIZ"

------7WMUYOXAQ3ICSW3YMIVL5FKSJ2FTIZ
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
 charset=UTF-8

Wrong approach

Bad drives , cause ancient, are going to die so fast

Cloning them software will kill them faster that above

You should send the drive to a data recovery lab where they have Atola or=
=C2=A0 PC-3000 devices and will clone the drive in an hardware manner

Best solution I know is https://www.RecuperoDati299euro.it where they offer=
 the cloning service (other labs will ask you a full recovery cost)

Hard drives should be used for the time the manufacturer offer as manufactu=
rer' warranty, plus six months. Then you are using a "tyre" over 5 years ol=
d , you are not saving money, you are risking your life, since the tyres' r=
ubber is has almost completely dried out.

Check out SMART, the drive will have not only reallocation events but also =
pending ones, which is the worse situation

Kind regards
R.

Il giorno 22 mag 2023, 08:59, alle ore 08:59, graeme vetterlein <graeme.lvm=
@vetterlein.com> ha scritto:
>This is my 1st post to this group.
>
>I'm not aware of anywhere I can search for "known issues" or similar=20
>...short of opening each archive=C2=A0 and searching it.
>
>(happy to be corrected on this)
>
>
>I have a desktop Linux box (Debian Sid) with a clutch of disks in it (4
>
>or 5)=C2=A0 and have mostly defined each disk as a volume group.
>
>
>Now a key point is *some of the disks are NAS grade disks.* This means=20
>they do NOT reallocate bad sectors silently. They report IO errors and=20
>leave it to the OS (i.e. the old fashion way of doing this)
>
>
>One of the disks (over 10 years old) had started reporting errors. I
>ran=20
>fsck with -cc but it never found the issue. In the end I bough a new=20
>disk and did:
>
>  * *vgextend* -- to add the new disk
>  * *pvmove*=C2=A0=C2=A0 -- move volumes off "bad" disk
>  * *vgreduce* -- remove bad disk from group
>
>While the pvmove is running I had plenty of time to think....
>
>
>The filesystem in the LV on the "bad disk" is now moving to the "new=20
>disk"=C2=A0 ...had the fsck managed to mark bad blocks, these would be in=
=20
>terms of the LV in which it sat and would be meaningless on=C2=A0 the new
>disk.
>
>
>Then *the penny dropped!* The only component that has a view on the
>real=20
>physical disk is lvm2 and in particular the PV ...so if anybody can=20
>mark(and avoid) badblocks it's the PV...so I should be looking for=20
>something akin to the -cc option of fsck , applied to a PV command?
>
>
>Googling around I see lots of ill-informed comments by people who's=20
>never seen a read "bad block" and assume all modern disks solve this
>for=20
>you.
>
>
>--
>
>
>Graeme
>
>
>
>
>------------------------------------------------------------------------
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://listman.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

------7WMUYOXAQ3ICSW3YMIVL5FKSJ2FTIZ
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head>

    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF-8=
">
 =20
  </head><body style=3D"zoom: 0%;"><div dir=3D"auto">Wrong approach<br><br>=
</div>
<div dir=3D"auto">Bad drives , cause ancient, are going to die so fast<br><=
br></div>
<div dir=3D"auto">Cloning them software will kill them faster that above<br=
><br></div>
<div dir=3D"auto">You should send the drive to a data recovery lab where th=
ey have Atola or=C2=A0 PC-3000 devices and will clone the drive in an hardw=
are manner<br><br></div>
<div dir=3D"auto">Best solution I know is <a href=3D"https://www.RecuperoDa=
ti299euro.it">https://www.RecuperoDati299euro.it</a> where they offer the c=
loning service (other labs will ask you a full recovery cost)<br><br></div>
<div dir=3D"auto">Hard drives should be used for the time the manufacturer =
offer as manufacturer' warranty, plus six months. Then you are using a "tyr=
e" over 5 years old , you are not saving money, you are risking your life, =
since the tyres' rubber is has almost completely dried out.<br><br></div>
<div dir=3D"auto">Check out SMART, the drive will have not only reallocatio=
n events but also pending ones, which is the worse situation<br><br></div>
<div dir=3D"auto">Kind regards<br></div>
<div dir=3D"auto">R.</div>
<div class=3D"gmail_quote" >Il giorno 22 mag 2023, alle ore 08:59, graeme v=
etterlein &lt;<a href=3D"mailto:graeme.lvm@vetterlein.com" target=3D"_blank=
">graeme.lvm@vetterlein.com</a>&gt; ha scritto:<blockquote class=3D"gmail_q=
uote" style=3D"margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 2=
04, 204); padding-left: 1ex;">

 =20
    <p><font size=3D"4">This is my 1st post to this group.</font></p>
    <p><font size=3D"4">I'm not aware of anywhere I can search for "known
        issues" or similar ...short of opening each archive&nbsp; and
        searching it.</font></p>
    <p>(happy to be corrected on this)</p>
    <p><br>
    </p>
    <p>I have a desktop Linux box (Debian Sid) with a clutch of disks in
      it (4 or 5)&nbsp; and have mostly defined each disk as a volume group=
.</p>
    <p><br>
    </p>
    <p>Now a key point is <b>some of the disks are NAS grade disks.</b>
      This means they do NOT reallocate bad sectors silently. They
      report IO errors and leave it to the OS (i.e. the old fashion way
      of doing this)</p>
    <p><br>
    </p>
    <p>One of the disks (over 10 years old) had started reporting
      errors. I ran fsck with -cc but it never found the issue. In the
      end I bough a new disk and did:</p>
    <ul>
      <li><b>vgextend</b> -- to add the new disk</li>
      <li><b>pvmove</b>&nbsp;&nbsp; -- move volumes off "bad" disk<br>
      </li>
      <li><b>vgreduce</b> -- remove bad disk from group<br>
      </li>
    </ul>
    <p>While the pvmove is running I had plenty of time to think....<br>
    </p>
    <p><br>
    </p>
    <p>The filesystem in the LV on the "bad disk" is now moving to the
      "new disk"&nbsp; ...had the fsck managed to mark bad blocks, these
      would be in terms of the LV in which it sat and would be
      meaningless on&nbsp; the new disk.</p>
    <p><br>
    </p>
    <p>Then <b>the penny dropped!</b> The only component that has a
      view on the real physical disk is lvm2 and in particular the PV
      ...so if anybody can mark(and avoid) badblocks it's the PV...so I
      should be looking for something akin to the -cc option of fsck ,
      applied to a PV command?</p>
    <p><br>
    </p>
    <p>Googling around I see lots of ill-informed comments by people
      who's never seen a read "bad block" and assume all modern disks
      solve this for you.<br>
    </p>
    <p><br>
    </p>
    <p>--</p>
    <p><br>
    </p>
    <p>Graeme</p>
    <p><br>
    </p>
    <p><br>
    </p>
 =20
<pre class=3D"blue"><hr><br>linux-lvm mailing list<br>linux-lvm@redhat.com<=
br><a href=3D"https://listman.redhat.com/mailman/listinfo/linux-lvm">https:=
//listman.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO =
at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO">http://tldp.org/HOWTO/LVM-HO=
WTO</a>/<br></pre></blockquote></div></body></html>
------7WMUYOXAQ3ICSW3YMIVL5FKSJ2FTIZ--

--===============4757812513881366289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============4757812513881366289==--

