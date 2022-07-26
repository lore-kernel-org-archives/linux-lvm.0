Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DE3C3F6B0
	for <linux-lvm@archiver.kernel.org>; Wed, 27 Jul 2022 07:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658907570;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=gmbnAT3NQeL+Xjsmikcei7hAdeIff6Af7NiNusL1tiU=;
	b=T5VSGXw5y7zT1Ba8JFmkkPtxdVne5E2WiX+JVN4mxTUTsOiUkHAeXeAbRI9r71c44zDGh2
	Ov8TUbKX1OAkw6NC2f+a2bLu2FG3/JqdSWQoABlfIzkjDWyCC2Sn4rq3W9LMqPilzNlHo9
	EXXB0r2/fAYLRYFvHFH06JLh+e+34n0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-34-odGifkOTMgW7S3b27KpORw-1; Wed, 27 Jul 2022 03:39:26 -0400
X-MC-Unique: odGifkOTMgW7S3b27KpORw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95EAA185A7A4;
	Wed, 27 Jul 2022 07:39:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6056F2026D64;
	Wed, 27 Jul 2022 07:39:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 332DA1945D8F;
	Wed, 27 Jul 2022 07:39:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 843F71945D86
 for <linux-lvm@listman.corp.redhat.com>; Tue, 26 Jul 2022 09:11:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0608F1121319; Tue, 26 Jul 2022 09:11:48 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 022861121314
 for <linux-lvm@redhat.com>; Tue, 26 Jul 2022 09:11:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA6401C19764
 for <linux-lvm@redhat.com>; Tue, 26 Jul 2022 09:11:47 +0000 (UTC)
Received: from bounces.a-painless.mh.aa.net.uk
 (bounces.a-painless.mh.aa.net.uk [90.155.5.1]) by relay.mimecast.com with
 ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-sIF2SSqaP0uIFfzI5JIHKA-1; Tue, 26 Jul 2022 05:11:45 -0400
X-MC-Unique: sIF2SSqaP0uIFfzI5JIHKA-1
Received: from 4.13.169.217.in-addr.arpa ([217.169.13.4] helo=[192.168.10.122])
 by painless-a.thn.aa.net.uk with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <roger@beardandsandals.co.uk>) id 1oGGHK-002QrP-Ac
 for linux-lvm@redhat.com; Tue, 26 Jul 2022 09:50:57 +0100
From: Roger James <roger@beardandsandals.co.uk>
To: LVM general discussion and development <linux-lvm@redhat.com>
Date: Tue, 26 Jul 2022 09:50:46 +0100
Message-ID: <18239b39270.27a5.d4b3b9aee17a85f6bc878c68b3925db6@beardandsandals.co.uk>
In-Reply-To: <CAH5g025eDd60jvU+_d7DLaPdsmK0TsNjB-jkewKg5FSNJMEmJw@mail.gmail.com>
References: <CAH5g025eDd60jvU+_d7DLaPdsmK0TsNjB-jkewKg5FSNJMEmJw@mail.gmail.com>
User-Agent: AquaMail/1.37.0 (build: 103700163)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Mailman-Approved-At: Wed, 27 Jul 2022 07:39:16 +0000
Subject: Re: [linux-lvm] Problem with partially activate logical volume
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============0592956774743081888=="

This is a multi-part message in MIME format.
--===============0592956774743081888==
Content-Type: multipart/alternative; boundary="18239b39648707e27a5c97d9ff"

This is a multi-part message in MIME format.
--18239b39648707e27a5c97d9ff
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

Try https://www.linuxsysadmins.com/recover-a-deleted-physical-volume/?amp

On 26 July 2022 09:16:32 Ken Bass <daytooner@gmail.com> wrote:
> (fwiw: I am new to this list, so please bear with me.)
>
> Background: I have a very large (20TB) logical volume consisting of 3 
> drives. One of those drives unexpectedloy died (isn't that always the case 
> :-)). The drive that failed happened to be the last PV. So I am assuming 
> that there is still 2/3 of the data still intact and, to some extent, 
> recoverable. Although, apparently the ext4 fs is not recognised.
>
> I activated the LV partially (via -P). But running any utility on that (eg: 
> dumpe2fs, e2fsck, ...) I get many of these  in dmesg:
>
> "Buffer I/O error on dev dm-0, logical block xxxxxxx, async page read."  
> The thing is, the xxxxxxx block is on the missing drive/pv.
>
> I have also tried some recovery software, but eventually get these same 
> messages, and the data recovered is not really useful.
>
> Please help! How can I get passed that dmesg error, and move on. 14TB 
> recovered is better than 0.
>
> TIA
> ken
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


--18239b39648707e27a5c97d9ff
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">
<html>
<body>
<div dir=3D"auto">
<div dir=3D"auto">Try <a href=3D"https://www.linuxsysadmins.com/recover-a-d=
eleted-physical-volume/?amp">https://www.linuxsysadmins.com/recover-a-delet=
ed-physical-volume/?amp</a></div><div dir=3D'auto'><br></div>
<div id=3D"aqm-original" style=3D"color: black;">
<!-- body start -->
<div class=3D"aqm-original-body">
<div style=3D"color: black;">
<p style=3D"color: black; font-size: 10pt; font-family: sans-serif; margin:=
 8pt 0;">On 26 July 2022 09:16:32 Ken Bass &lt;daytooner@gmail.com&gt; wrot=
e:</p>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #808080; padding-left: 0.75ex;">
<div dir=3D"ltr"><div>(fwiw: I am new to this list, so please bear with me.=
)</div><div><br></div><div>Background: I have a very large (20TB) logical v=
olume consisting of 3 drives. One of those drives unexpectedloy died (isn't=
 that always the case :-)). The drive that failed happened to be the last P=
V. So I am assuming that there is still 2/3 of the data still intact and, t=
o some extent, recoverable. Although, apparently the ext4 fs is not recogni=
sed.<br></div><div><br></div><div>I activated the LV partially (via -P). Bu=
t running any utility on that (eg: dumpe2fs, e2fsck, ...) I get many of the=
se&nbsp; in dmesg:</div><div><br></div><div>"Buffer I/O error on dev dm-0, =
logical block xxxxxxx, async page read."&nbsp; The thing is, the xxxxxxx bl=
ock is on the missing drive/pv.<br></div><div><br></div><div>I have also tr=
ied some recovery software, but eventually get these same messages, and the=
 data recovered is not really useful. <br></div><div><br></div><div>Please =
help! How can I get passed that dmesg error, and move on. 14TB recovered is=
 better than 0.</div><div><br></div><div>TIA</div><div>ken</div><div><br></=
div><div><br></div></div>

<div>_______________________________________________</div>
<div>linux-lvm mailing list</div>
<div><a class=3D"aqm-autolink aqm-autowrap" href=3D"mailto:linux-lvm%40redh=
at.com">linux-lvm@redhat.com</a></div>
<div><a class=3D"aqm-autolink aqm-autowrap" href=3D"https://listman.redhat.=
com/mailman/listinfo/linux-lvm">https://listman.redhat.com/mailman/listinfo=
/linux-lvm</a></div>
<div>read the LVM HOW-TO at <a class=3D"aqm-autolink aqm-autowrap" href=3D"=
http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a></div=
>
<div><br></div>
</blockquote>
</div>
</div>
<!-- body end -->

</div><div dir=3D"auto"><br></div>
</div></body>
</html>

--18239b39648707e27a5c97d9ff--

--===============0592956774743081888==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============0592956774743081888==--

