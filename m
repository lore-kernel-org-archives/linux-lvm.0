Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [170.10.129.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E33BC433EF
	for <linux-lvm@archiver.kernel.org>; Fri,  6 May 2022 07:09:09 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-347-aX06ygOJMEyhXFppHyoYig-1; Fri, 06 May 2022 03:09:04 -0400
X-MC-Unique: aX06ygOJMEyhXFppHyoYig-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67EA4101AA45;
	Fri,  6 May 2022 07:08:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3A331C28103;
	Fri,  6 May 2022 07:08:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D7CCA1947058;
	Fri,  6 May 2022 07:08:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 602BC1947043
 for <linux-lvm@listman.corp.redhat.com>; Thu,  5 May 2022 16:11:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 426F714682D3; Thu,  5 May 2022 16:11:45 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E2F614682CE
 for <linux-lvm@redhat.com>; Thu,  5 May 2022 16:11:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 264F13C02B77
 for <linux-lvm@redhat.com>; Thu,  5 May 2022 16:11:45 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-364-LCPSF8nNOXmhZ1UQZ-n93A-1; Thu, 05 May 2022 12:11:43 -0400
X-MC-Unique: LCPSF8nNOXmhZ1UQZ-n93A-1
Received: by mail-ej1-f52.google.com with SMTP id g6so9677326ejw.1
 for <linux-lvm@redhat.com>; Thu, 05 May 2022 09:11:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=FzNWFc4JewLJe6ZYg2Kwljrxz8nkKhU8du4YXw1CCXI=;
 b=7uMIZOikl3fBd/MnOga+25FlFh1Lu6WrwZu/KmM9ajqAbkqRZqQN6y1e2TJbr3kiTE
 Cr5dD9nKiUlMdDS5n0DeSK8sG6WiGyIrzA0OAJqbl8bEOu1kFnjiWexWKebwZj3sOouA
 MxUhr3xYwR8rE4DMVZ5mAwpiu/83i2A8b5PV8txqsOW6I4fjBNYrrWLDo7CVhmfTHQSH
 mVsuW/jHwii7GdbwDm51TA8L5sndyi5aLks9Xp7A44dnsnmG3xu1WDgPAPyuUyLvhpbC
 OtovJxSUk5qH5BhbcVk03xaTXb6MmXF+3l104SmFInC7c1tODgg9iSoEZijREj8bvygD
 is4w==
X-Gm-Message-State: AOAM533CezwXrw2lYtQNSDvUwFYxmjepon9wR2eU6xrlhX5btACT3ohj
 3oHOAH1z/xp+bqGO5huq9sFibH17pMInaRedYtRm2S3bIoew9Q==
X-Google-Smtp-Source: ABdhPJx2OyvvT0KeDcNs6xKtEj52+h9sD/6FzdNx2VezxnFZjHlm1iS8Gnjay2Ypyl1HTmC3NyySKhJh+LneuON24og=
X-Received: by 2002:a17:907:2064:b0:6f4:3f07:c76e with SMTP id
 qp4-20020a170907206400b006f43f07c76emr21210740ejb.462.1651767101069; Thu, 05
 May 2022 09:11:41 -0700 (PDT)
MIME-Version: 1.0
From: Robert Simmons <rsimmons0@gmail.com>
Date: Thu, 5 May 2022 12:11:29 -0400
Message-ID: <CA+QLa9BupRpP00xSpaKMwCvvsWtH=Q=_Z7hwuX1A7o8VsFNgWg@mail.gmail.com>
To: linux-lvm@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Mailman-Approved-At: Fri, 06 May 2022 07:08:40 +0000
Subject: [linux-lvm] Silence Pool Check Overprovisioning Warnings
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============7776712696362663390=="

--===============7776712696362663390==
Content-Type: multipart/alternative; boundary="0000000000004f9bdf05de45ff9b"

--0000000000004f9bdf05de45ff9b
Content-Type: text/plain; charset="UTF-8"

Greetings,

I knowingly overprovision storage pools. I have careful monitoring of the
overall free space in the storage pool, and the snapshots that I take for a
particular volume are ephemeral. They're only related to a particular
reverse engineering task. Once the task is complete, all the snapshots are
deleted. There are a set of warnings that are generated
during pool_check_overprovisioning here:

https://github.com/lvmteam/lvm2/blob/f70d97b91620bc7c2e5c5ccc39913c54379322c2/lib/metadata/thin_manip.c#L413-L428

The second, third, and fourth warnings are printed
via log_print_unless_silent but the first is printed via log_warn. I would
like an option that would silence all four of these warnings. If all four
were logged via log_print_unless_silent, there would still be the problem
of what other very useful warnings would I be silencing. This would be a
suboptimal fix. I have read one proposed fix that appears to be optimal for
my use case: adding an envvar "LVM_SUPPRESS_POOL_WARNINGS". This was
proposed by zkabelac at redhat.com here:
https://listman.redhat.com/archives/linux-lvm/2017-September/024332.html

What would be the next steps to getting this option implemented?

I see that there have been two threads about these warnings in the past:
https://listman.redhat.com/archives/linux-lvm/2016-April/023529.html
https://listman.redhat.com/archives/linux-lvm/2017-September/024323.html

One issue in the bug tracker that I can find:
https://bugzilla.redhat.com/show_bug.cgi?id=1465974

Finally, we have a thread going about our use case over at Proxmox here:
https://forum.proxmox.com/threads/solved-you-have-not-turned-on-protection-against-thin-pools-running-out-of-space.91055/

Thanks,
Rob

--0000000000004f9bdf05de45ff9b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Greetings,<div><br></div><div>I knowingly overprovision st=
orage pools. I have careful monitoring of the overall free space in the sto=
rage pool, and the snapshots that I take for a particular volume are epheme=
ral. They&#39;re only related to a particular reverse engineering task. Onc=
e the task is complete, all the snapshots are deleted. There are a set of w=
arnings that are generated during=C2=A0pool_check_overprovisioning here:</d=
iv><div><br></div><div><a href=3D"https://github.com/lvmteam/lvm2/blob/f70d=
97b91620bc7c2e5c5ccc39913c54379322c2/lib/metadata/thin_manip.c#L413-L428">h=
ttps://github.com/lvmteam/lvm2/blob/f70d97b91620bc7c2e5c5ccc39913c54379322c=
2/lib/metadata/thin_manip.c#L413-L428</a><br></div><div><br></div><div>The =
second, third, and fourth warnings are printed via=C2=A0log_print_unless_si=
lent but the first is printed via=C2=A0log_warn. I would like an option tha=
t would silence all four of these warnings. If all four were logged via=C2=
=A0log_print_unless_silent, there would still be the problem of what other =
very useful warnings would I be silencing. This would be a suboptimal fix. =
I have read one proposed fix that appears to be optimal for my use case: ad=
ding an envvar &quot;LVM_SUPPRESS_POOL_WARNINGS&quot;. This was proposed by=
=C2=A0zkabelac at <a href=3D"http://redhat.com">redhat.com</a> here:</div><=
div><a href=3D"https://listman.redhat.com/archives/linux-lvm/2017-September=
/024332.html">https://listman.redhat.com/archives/linux-lvm/2017-September/=
024332.html</a><br></div><div><br></div><div>What would be the next steps t=
o getting this option implemented?</div><div><br></div><div>I see that ther=
e have been two threads about these warnings in the past:</div><div><a href=
=3D"https://listman.redhat.com/archives/linux-lvm/2016-April/023529.html">h=
ttps://listman.redhat.com/archives/linux-lvm/2016-April/023529.html</a><br>=
</div><div><a href=3D"https://listman.redhat.com/archives/linux-lvm/2017-Se=
ptember/024323.html">https://listman.redhat.com/archives/linux-lvm/2017-Sep=
tember/024323.html</a><br></div><div><br></div><div>One issue in the bug tr=
acker that I can find:</div><div><a href=3D"https://bugzilla.redhat.com/sho=
w_bug.cgi?id=3D1465974">https://bugzilla.redhat.com/show_bug.cgi?id=3D14659=
74</a><br></div><div><br></div><div>Finally, we have a thread going about o=
ur use case over at Proxmox here:</div><div><a href=3D"https://forum.proxmo=
x.com/threads/solved-you-have-not-turned-on-protection-against-thin-pools-r=
unning-out-of-space.91055/">https://forum.proxmox.com/threads/solved-you-ha=
ve-not-turned-on-protection-against-thin-pools-running-out-of-space.91055/<=
/a><br></div><div><br></div><div>Thanks,</div><div>Rob</div><div><br></div>=
<div><br></div></div>

--0000000000004f9bdf05de45ff9b--

--===============7776712696362663390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============7776712696362663390==--

