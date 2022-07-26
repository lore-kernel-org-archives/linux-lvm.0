Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 777D7C04A68
	for <linux-lvm@archiver.kernel.org>; Wed, 27 Jul 2022 07:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658907570;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=dEWTRRsW1L90Pgh7s8HPZ6xhMivlRbITGMoz1alFs3E=;
	b=dMgg4G5a9MyYjOrcZrrah9vQTuDL2Kb4MZJaLB+qWGjX4MeKolRJLjaJK8jkZP3SlOfi1i
	D6C603mrlmZdPx7WcJXG3YCRcRb+OTPun8uvzSaS2UKfCEKK7Bulr2dGtsKqfpLdfZyfoT
	1GgTa75zNNlBE4latJd7U1Un+ECGEhk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-68-4KkT0dcHPw2KiJt4ndbxYA-1; Wed, 27 Jul 2022 03:39:26 -0400
X-MC-Unique: 4KkT0dcHPw2KiJt4ndbxYA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 936D085A586;
	Wed, 27 Jul 2022 07:39:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C06A02026D07;
	Wed, 27 Jul 2022 07:39:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5998B1945D9B;
	Wed, 27 Jul 2022 07:39:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3A5CB1945D86
 for <linux-lvm@listman.corp.redhat.com>; Tue, 26 Jul 2022 08:58:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 191E440315E; Tue, 26 Jul 2022 08:58:51 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 155AA492C3B
 for <linux-lvm@redhat.com>; Tue, 26 Jul 2022 08:58:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0F9A1C08964
 for <linux-lvm@redhat.com>; Tue, 26 Jul 2022 08:58:50 +0000 (UTC)
Received: from bounces.a-painless.mh.aa.net.uk
 (bounces.a-painless.mh.aa.net.uk [90.155.5.1]) by relay.mimecast.com with
 ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314-cmlitdmcM0ajr_ycPVoCCA-1; Tue, 26 Jul 2022 04:58:42 -0400
X-MC-Unique: cmlitdmcM0ajr_ycPVoCCA-1
Received: from 4.13.169.217.in-addr.arpa ([217.169.13.4] helo=[192.168.10.122])
 by painless-a.thn.aa.net.uk with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <roger@beardandsandals.co.uk>) id 1oGGOo-002RKV-FC
 for linux-lvm@redhat.com; Tue, 26 Jul 2022 09:58:41 +0100
From: Roger James <roger@beardandsandals.co.uk>
To: LVM general discussion and development <linux-lvm@redhat.com>
Date: Tue, 26 Jul 2022 09:58:38 +0100
Message-ID: <18239bac630.27a5.d4b3b9aee17a85f6bc878c68b3925db6@beardandsandals.co.uk>
In-Reply-To: <CAFsGsxLOyawZH7xxgfLNkh=VftBNAaDStE0XQgQTGf9NmyZ+ZQ@mail.gmail.com>
References: <CAFsGsxLOyawZH7xxgfLNkh=VftBNAaDStE0XQgQTGf9NmyZ+ZQ@mail.gmail.com>
User-Agent: AquaMail/1.37.0 (build: 103700163)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Mailman-Approved-At: Wed, 27 Jul 2022 07:39:16 +0000
Subject: Re: [linux-lvm] Where are the data blocks of an LV?
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
Content-Type: multipart/mixed; boundary="===============6008136444085044413=="

This is a multi-part message in MIME format.
--===============6008136444085044413==
Content-Type: multipart/alternative; boundary="18239bac847707e27a55d75dee"

This is a multi-part message in MIME format.
--18239bac847707e27a55d75dee
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

See https://talk.manageiq.org/t/lvm-internals-structures-disk-layout/1328

On 26 July 2022 09:16:31 Marcin Owsiany <marcin@owsiany.pl> wrote:
> Hello,
>
> I know that it is possible to find where a given logical volume's extents 
> start on a PVs thanks to the information printed by lvdisplay --maps.
>
> I was also able to experimentally establish that the actual data of an LV 
> starts one megabyte after that location. Is that offset documented 
> anywhere, or can I somehow discover it at runtime for a given LV?
>
> regards,
> Marcin
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


--18239bac847707e27a55d75dee
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">
<html>
<body>
<div dir=3D"auto">
<div dir=3D"auto">See <a href=3D"https://talk.manageiq.org/t/lvm-internals-=
structures-disk-layout/1328">https://talk.manageiq.org/t/lvm-internals-stru=
ctures-disk-layout/1328</a></div><div dir=3D'auto'><br></div>
<div id=3D"aqm-original" style=3D"color: black;">
<!-- body start -->
<div class=3D"aqm-original-body">
<div style=3D"color: black;">
<p style=3D"color: black; font-size: 10pt; font-family: sans-serif; margin:=
 8pt 0;">On 26 July 2022 09:16:31 Marcin Owsiany &lt;marcin@owsiany.pl&gt; =
wrote:</p>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #808080; padding-left: 0.75ex;">
<div dir=3D"auto">Hello,<div dir=3D"auto"><br></div><div dir=3D"auto">I kno=
w that it is possible to find where a given logical volume's extents start =
on a PVs thanks to the information printed by lvdisplay --maps.</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">I was also able to experimentally e=
stablish that the actual data of an LV starts one megabyte after that locat=
ion. Is that offset documented anywhere, or can I somehow discover it at ru=
ntime for a given LV?</div><div dir=3D"auto"><br></div><div dir=3D"auto">re=
gards,</div><div dir=3D"auto">Marcin</div></div>

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

--18239bac847707e27a55d75dee--

--===============6008136444085044413==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============6008136444085044413==--

