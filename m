Return-Path: <SRS0=qRy5=PX=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FC3CC433EF
	for <linux-lvm@archiver.kernel.org>; Thu,  4 Nov 2021 07:23:36 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7323261108
	for <linux-lvm@archiver.kernel.org>; Thu,  4 Nov 2021 07:23:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7323261108
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=koprow.ski
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-q3RTQ9vuNDS0edmQ04KMAA-1; Thu, 04 Nov 2021 03:23:30 -0400
X-MC-Unique: q3RTQ9vuNDS0edmQ04KMAA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7BD0806688;
	Thu,  4 Nov 2021 07:23:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 77C5A60854;
	Thu,  4 Nov 2021 07:23:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 83CCB4EA29;
	Thu,  4 Nov 2021 07:23:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A3Bf212009289 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 3 Nov 2021 07:41:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6FB2751E1; Wed,  3 Nov 2021 11:41:02 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 68CB851DC
	for <linux-lvm@redhat.com>; Wed,  3 Nov 2021 11:40:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 080A9899EC1
	for <linux-lvm@redhat.com>; Wed,  3 Nov 2021 11:40:58 +0000 (UTC)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
	[209.85.222.43]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-439-DFe5fXItMGe4Y1pAWoeyVg-1; Wed, 03 Nov 2021 07:40:55 -0400
X-MC-Unique: DFe5fXItMGe4Y1pAWoeyVg-1
Received: by mail-ua1-f43.google.com with SMTP id q13so3750657uaq.2
	for <linux-lvm@redhat.com>; Wed, 03 Nov 2021 04:40:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Y2WkCcBqTA/qB33GDs7l3tdVAVUwoSksXiZgnSOvCRE=;
	b=ObnAkyQq+FgGPYYA+hHenKj1srNx6wCnQg2Asc4B60su1/IQHaETZizNbS3dvSKjXY
	KsB2lp+A53EP5nD0ojnaauqZq0FKB5w/sxPU/0TCBqYqqftkXWcdASm5VYtnwCyF6+4+
	yYsd390cV4YsbVujzjR1z6u0sa8jN7dP1clBHAEReBYbjKuGn6N40XdAJS8thBpLeFcI
	9sYTPAcVaAD7Np2Uxmfmd4Y/QZa49pDJF4ZpCzI4VqzQCGbCO2/e+Log08CzWmk91Lqa
	uu9REGWhtljrX9OILHKXNI3gH3v8iftYHOBlJu/7eKy5Oz8C/wOFJdHiNVGBKUlFTjzf
	WgdQ==
X-Gm-Message-State: AOAM532fU88LD2kgM+83KO2AOVKAtaLrVFxIeqQiBwSN3YJhJFtMxfPp
	tNKV0AmU0b8Cop5Prr6RPlPfgSVgZDW/iv2Hg7BiH1ij6O7Ehw==
X-Google-Smtp-Source: ABdhPJzwUSFodGt4K/pj5acVkLZOZTmOu22lR2HNrBXB5jT4saF+YuPcmVNdz0++z+70gZW8dbCogE80ntotOQaw9YE=
X-Received: by 2002:a67:e19a:: with SMTP id e26mr25800532vsl.42.1635939654033; 
	Wed, 03 Nov 2021 04:40:54 -0700 (PDT)
MIME-Version: 1.0
From: Charles Koprowski <charles@koprow.ski>
Date: Wed, 3 Nov 2021 12:40:24 +0100
Message-ID: <CADBR731Q-Jfcj6iFo9Ai8r+PGtqeG473b-RjMj3Oq0ut8hrM-g@mail.gmail.com>
To: linux-lvm@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Thu, 04 Nov 2021 03:23:10 -0400
Subject: [linux-lvm] Changing shared VG lock type
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
Content-Type: multipart/mixed; boundary="===============0342765934973981898=="

--===============0342765934973981898==
Content-Type: multipart/alternative; boundary="000000000000f3f76105cfe0e11a"

--000000000000f3f76105cfe0e11a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I'm trying to change the lock type of a shared VG from =C2=ABdlm=C2=BB to =
=C2=ABsanlock=C2=BB.

>From the manpage I understand that I should first change it to =C2=ABnone=
=C2=BB and
then change it to =C2=ABsanlock=C2=BB.

So I changed the lock type to =C2=ABnone=C2=BB without problem.

I then started lvmlockd + sanlock and tried to change the lock type to
=C2=ABsanlock=C2=BB but it failed :

# vgchange --lock-type sanlock data
  Global lock failed: check that global lockspace is started

What could I have missed ?

Here is the log buffer from lvmlockd :

1635939300 lvmlockd started
1635939316 new cl 1 pi 2 fd 8
1635939316 recv vgchange[2576] cl 1 lock gl "" mode ex flags 0
1635939316 read_cluster_name: open error -1, check dlm_controld
1635939316 lockspace "" not found for sanlock gl, searching...
1635939316 work search for gl
1635939316 worker found no gl_is_enabled
1635939316 lockspace "" not found after search
1635939316 read_cluster_name: open error -1, check dlm_controld
1635939316 send vgchange[2576] cl 1 lock gl rv -210 ENOLS
NO_LOCKSPACES,NO_GL_LS
1635939316 close vgchange[2576] cl 1 fd 8
1635939320 new cl 2 pi 2 fd 8
1635939320 recv client[2577] cl 2 dump_log . "" mode iv flags 0

Thank you.

Regards,

--=20
Charles

--000000000000f3f76105cfe0e11a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>I&#39;m trying to change the loc=
k type of a shared VG from =C2=ABdlm=C2=BB to =C2=ABsanlock=C2=BB.</div><di=
v><br></div><div>From the manpage I understand that I should first change i=
t to =C2=ABnone=C2=BB and then change it to =C2=ABsanlock=C2=BB.</div><div>=
<br></div><div>So I changed the lock type to =C2=ABnone=C2=BB without probl=
em.</div><div><br></div><div>I then started lvmlockd=C2=A0+ sanlock and tri=
ed to change the lock type to =C2=ABsanlock=C2=BB but it failed :</div><div=
><br></div><div># vgchange --lock-type sanlock data<br>=C2=A0 Global lock f=
ailed: check that global lockspace is started</div><div><br></div><div>What=
 could I have missed ?</div><div><br></div><div>Here is the log buffer from=
=C2=A0lvmlockd :=C2=A0</div><div><br></div><div>1635939300 lvmlockd started=
<br>1635939316 new cl 1 pi 2 fd 8<br>1635939316 recv vgchange[2576] cl 1 lo=
ck gl &quot;&quot; mode ex flags 0<br>1635939316 read_cluster_name: open er=
ror -1, check dlm_controld<br>1635939316 lockspace &quot;&quot; not found f=
or sanlock gl, searching...<br>1635939316 work search for gl<br>1635939316 =
worker found no gl_is_enabled<br>1635939316 lockspace &quot;&quot; not foun=
d after search<br>1635939316 read_cluster_name: open error -1, check dlm_co=
ntrold<br>1635939316 send vgchange[2576] cl 1 lock gl rv -210 ENOLS NO_LOCK=
SPACES,NO_GL_LS<br>1635939316 close vgchange[2576] cl 1 fd 8<br>1635939320 =
new cl 2 pi 2 fd 8<br>1635939320 recv client[2577] cl 2 dump_log . &quot;&q=
uot; mode iv flags 0</div><div><br></div><div>Thank you.</div><div><br></di=
v><div>Regards,</div><div><br>-- <br><div dir=3D"ltr" class=3D"gmail_signat=
ure" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Charles</div></div=
></div></div>

--000000000000f3f76105cfe0e11a--

--===============0342765934973981898==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============0342765934973981898==--

