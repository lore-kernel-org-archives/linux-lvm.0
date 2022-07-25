Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF92C433EF
	for <linux-lvm@archiver.kernel.org>; Tue, 26 Jul 2022 08:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658823371;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=KyyVeMorJC9RIQV1Z+ueKEClyRqMgtJsYWHOWkn/NkA=;
	b=BWlaTn3toiixJCwwVhSGXsJ5KxUOF5tXQhhJu+K/ycejdZ22gib2oPr4LAWYTC99ufNLSK
	RgMZQXWDzaNIbKVvzUC5J0X12pm8/XIwS9vi1tsPrw7pFYkTOFYqZYIwdXN393ptKveyTw
	JW/7Ju0+i5BlJEef3fUbD+ddbddNTx8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-UUHXQu7HPKiR0na-9JrHBA-1; Tue, 26 Jul 2022 04:16:09 -0400
X-MC-Unique: UUHXQu7HPKiR0na-9JrHBA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6ACD1805B9A;
	Tue, 26 Jul 2022 08:16:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7F895404D883;
	Tue, 26 Jul 2022 08:16:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5038C1945DA7;
	Tue, 26 Jul 2022 08:16:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0CCAA1945D83
 for <linux-lvm@listman.corp.redhat.com>; Mon, 25 Jul 2022 14:48:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D3F74909FE; Mon, 25 Jul 2022 14:48:36 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D034518EAA
 for <linux-lvm@redhat.com>; Mon, 25 Jul 2022 14:48:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B463A185A7BA
 for <linux-lvm@redhat.com>; Mon, 25 Jul 2022 14:48:36 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-335-Cr7hQ_ZnPuOD2am9-z1TBA-2; Mon, 25 Jul 2022 10:48:34 -0400
X-MC-Unique: Cr7hQ_ZnPuOD2am9-z1TBA-2
Received: by mail-ed1-f48.google.com with SMTP id e15so14294656edj.2
 for <linux-lvm@redhat.com>; Mon, 25 Jul 2022 07:48:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=r3I4DudOkfZz69UzzDIqwG3HXHc0Vz8iKgx3jPte38Q=;
 b=ixBjsKJeOAJF5RCnMpVwjsW7Qd3XiqRCi4MALNXmDoGMYVmI9d4/ZqZHR9dNiePTi7
 Q4h4USbwG8Fy7gBiyTAx3/wRrDjjrktvLLMWxkb6kJHr2rGJR8S18sUnhuGpnk3+RkCC
 x9CGhhcMUGskmmZrOks+lIM3RezOqofV4EehVBRQLjHfmMqJnn05CjTJwTwaIiA/Oa4Y
 uJhsbsUsKzDGrBB2f5BfiodpiRfOAF9lC3QencDpWprym5epuNFagEiMukJN9ZJbYEgn
 86KMX3eR0zDkiylxcKOQgldmSsfavWQaYXWU1BKkqoPMIxQSI0+x6wfc+lzzSQaG8mxj
 B5HA==
X-Gm-Message-State: AJIora+RnQ3r0AL+2d2slJ2jZoyODMdw13kJImqOhmeetxlG25n0KOsq
 8kAyaFkIfGkOn74gpeYuxGO0TPV/ozsWPLbyc2E00ph54XE=
X-Google-Smtp-Source: AGRyM1vg6ysjkAO7mr5ULJinPHRgYWucBC2ceTl4B0317PTTSihPTdrFLs0llYoKBMxUdZqA6bsda3rABOgAjujJL6A=
X-Received: by 2002:a05:6402:31f7:b0:43b:ca75:cb4 with SMTP id
 dy23-20020a05640231f700b0043bca750cb4mr13824161edb.383.1658760513483; Mon, 25
 Jul 2022 07:48:33 -0700 (PDT)
MIME-Version: 1.0
From: Ken Bass <daytooner@gmail.com>
Date: Mon, 25 Jul 2022 09:48:22 -0500
Message-ID: <CAH5g025eDd60jvU+_d7DLaPdsmK0TsNjB-jkewKg5FSNJMEmJw@mail.gmail.com>
To: linux-lvm@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Mailman-Approved-At: Tue, 26 Jul 2022 08:15:59 +0000
Subject: [linux-lvm] Problem with partially activate logical volume
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
Content-Type: multipart/mixed; boundary="===============6526963486920772181=="

--===============6526963486920772181==
Content-Type: multipart/alternative; boundary="0000000000002c778305e4a2473b"

--0000000000002c778305e4a2473b
Content-Type: text/plain; charset="UTF-8"

(fwiw: I am new to this list, so please bear with me.)

Background: I have a very large (20TB) logical volume consisting of 3
drives. One of those drives unexpectedloy died (isn't that always the case
:-)). The drive that failed happened to be the last PV. So I am assuming
that there is still 2/3 of the data still intact and, to some extent,
recoverable. Although, apparently the ext4 fs is not recognised.

I activated the LV partially (via -P). But running any utility on that (eg:
dumpe2fs, e2fsck, ...) I get many of these  in dmesg:

"Buffer I/O error on dev dm-0, logical block xxxxxxx, async page read."
The thing is, the xxxxxxx block is on the missing drive/pv.

I have also tried some recovery software, but eventually get these same
messages, and the data recovered is not really useful.

Please help! How can I get passed that dmesg error, and move on. 14TB
recovered is better than 0.

TIA
ken

--0000000000002c778305e4a2473b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>(fwiw: I am new to this list, so please bear with me.=
)</div><div><br></div><div>Background: I have a very large (20TB) logical v=
olume consisting of 3 drives. One of those drives unexpectedloy died (isn&#=
39;t that always the case :-)). The drive that failed happened to be the la=
st PV. So I am assuming that there is still 2/3 of the data still intact an=
d, to some extent, recoverable. Although, apparently the ext4 fs is not rec=
ognised.<br></div><div><br></div><div>I activated the LV partially (via -P)=
. But running any utility on that (eg: dumpe2fs, e2fsck, ...) I get many of=
 these=C2=A0 in dmesg:</div><div><br></div><div>&quot;Buffer I/O error on d=
ev dm-0, logical block xxxxxxx, async page read.&quot;=C2=A0 The thing is, =
the xxxxxxx block is on the missing drive/pv.<br></div><div><br></div><div>=
I have also tried some recovery software, but eventually get these same mes=
sages, and the data recovered is not really useful. <br></div><div><br></di=
v><div>Please help! How can I get passed that dmesg error, and move on. 14T=
B recovered is better than 0.</div><div><br></div><div>TIA</div><div>ken</d=
iv><div><br></div><div><br></div></div>

--0000000000002c778305e4a2473b--

--===============6526963486920772181==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============6526963486920772181==--

