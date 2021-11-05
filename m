Return-Path: <SRS0=tUC8=PY=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D88EBC433FE
	for <linux-lvm@archiver.kernel.org>; Fri,  5 Nov 2021 13:16:09 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 144C961212
	for <linux-lvm@archiver.kernel.org>; Fri,  5 Nov 2021 13:16:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 144C961212
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=koprow.ski
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51---0NdZpCNq6j1saHwZkuGg-1; Fri, 05 Nov 2021 09:16:05 -0400
X-MC-Unique: --0NdZpCNq6j1saHwZkuGg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 039ED8005A2;
	Fri,  5 Nov 2021 13:15:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E4B295B826;
	Fri,  5 Nov 2021 13:15:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1E68F4EA2A;
	Fri,  5 Nov 2021 13:15:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A5BcJG3005283 for <linux-lvm@listman.util.phx.redhat.com>;
	Fri, 5 Nov 2021 07:38:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BECE0400DEF8; Fri,  5 Nov 2021 11:38:19 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8A3F40CFD05
	for <linux-lvm@redhat.com>; Fri,  5 Nov 2021 11:38:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A0AC9800B26
	for <linux-lvm@redhat.com>; Fri,  5 Nov 2021 11:38:19 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
	[209.85.222.48]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-604-pgZKT8JuNeCkwwKWMS65qg-1; Fri, 05 Nov 2021 07:38:17 -0400
X-MC-Unique: pgZKT8JuNeCkwwKWMS65qg-1
Received: by mail-ua1-f48.google.com with SMTP id az37so16459178uab.13
	for <linux-lvm@redhat.com>; Fri, 05 Nov 2021 04:38:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vZhPDwTAyoZ5lxiKqG590xzd7WZWPbPaZZxcCxo23wI=;
	b=j7MlBeVruoXqhz9bCcQJmZ+6+ij2VTEuP4Bj8byKxsHgnt+tqigpDHRX2fW+DjjcNw
	U5kyg9n+pQdYv9Ohy4pXT8GZwimp/fT8sXH/dEKaklCasKQE51IM7gsTGSzfKn0+YIFD
	37UKsfNgp3A/DOnFpXGavWCs4BLKU7vby7Wz3XAJePF/joy9UlZxQseywaH211i8kwCB
	2t4XnBaPtq6zlo0lBjai8ETdEelAqYFF5ouX0egYv2Yy+fKgYEO0wzemXNV9na+Rxo0b
	IOofDz4CXECa5CW7ykybceGi1xLrejXf++vaqFxMYq0q26yfG4e79/q50YekOtRHrIaX
	SbFQ==
X-Gm-Message-State: AOAM532+rIC4lY5DOvEAGFdU4OtXzE1mZCaDnv5/JYq86XQNiRt7zj1J
	NkIPsrsDPwe/XmkUO2Socn01hWmGnBx6EhumagRavg==
X-Google-Smtp-Source: ABdhPJyPNBGEv3KSYIQDQZulG+q4juJSsj3A8E7QltwP2vcyrQ2U+I4MPk3L3pElvG+L9j9LaU7oHR6ToSTcuBIMFZA=
X-Received: by 2002:ab0:6942:: with SMTP id c2mr64471276uas.92.1636112296458; 
	Fri, 05 Nov 2021 04:38:16 -0700 (PDT)
MIME-Version: 1.0
References: <CADBR731Q-Jfcj6iFo9Ai8r+PGtqeG473b-RjMj3Oq0ut8hrM-g@mail.gmail.com>
	<20211104152521.GA16100@redhat.com>
In-Reply-To: <20211104152521.GA16100@redhat.com>
From: Charles Koprowski <charles@koprow.ski>
Date: Fri, 5 Nov 2021 12:37:48 +0100
Message-ID: <CADBR733jNf_DvY_6=84w+0uX=60zC-hHPu127wmcB0Y5euF3=Q@mail.gmail.com>
To: David Teigland <teigland@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Fri, 05 Nov 2021 09:15:38 -0400
Cc: linux-lvm@redhat.com
Subject: Re: [linux-lvm] Changing shared VG lock type
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
Content-Type: multipart/mixed; boundary="===============8310573383452383013=="

--===============8310573383452383013==
Content-Type: multipart/alternative; boundary="0000000000003e4e8105d0091425"

--0000000000003e4e8105d0091425
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 4 nov. 2021 =C3=A0 16:25, David Teigland <teigland@redhat.com> a =
=C3=A9crit :

> To work around this, you can force the vgchange by skipping the global
> lock, and then start the lockspace:
>
> $ vgchange --locktype sanlock --lockopt skipgl svg
>   WARNING: skipping global lock in lvmlockd.
>   Logical volume "lvmlock" created.
>   Volume group "svg" successfully changed


Hi David,

Thanks for the tip.

Using =C2=AB--lockopt skipgl=C2=BB worked as expected.

Regards,

--=20
Charles

--0000000000003e4e8105d0091425
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Le=C2=A0jeu. 4 nov. 2021 =C3=A0=C2=A016:2=
5, David Teigland &lt;<a href=3D"mailto:teigland@redhat.com">teigland@redha=
t.com</a>&gt; a =C3=A9crit=C2=A0:</div><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
To work around this, you can force the vgchange by skipping the global<br>
lock, and then start the lockspace:<br>
<br>
$ vgchange --locktype sanlock --lockopt skipgl svg<br>
=C2=A0 WARNING: skipping global lock in lvmlockd.<br>
=C2=A0 Logical volume &quot;lvmlock&quot; created.<br>
=C2=A0 Volume group &quot;svg&quot; successfully changed</blockquote><div><=
br></div><div>Hi David,</div><div><br></div></div><div>Thanks for the tip.<=
/div><div><br></div><div>Using =C2=AB--lockopt skipgl=C2=BB worked as expec=
ted.</div><div><br></div><div>Regards,</div><div><br></div>-- <br><div dir=
=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr">Charles<br></div></div>=
</div>

--0000000000003e4e8105d0091425--

--===============8310573383452383013==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============8310573383452383013==--

