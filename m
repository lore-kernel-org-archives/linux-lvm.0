Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E034AC7618A
	for <linux-lvm@archiver.kernel.org>; Mon, 20 Mar 2023 05:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679289441;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=W9qbN/bwFU0oQh1gyMFEe/89qHReoQ/W+neTuRxpMsY=;
	b=cR4V1ca2DbqJhf5xbdZ5KOqlQ3WZezl8ZX6513tBdmuVsVcKOXggvIgfCFMEuKrVD1l54l
	QT9JR/Lzdi9Q5Nt7EluKw0N14YoW3fwHjsTxU6Vf5ATkHEIOURYAem10SniTyxymx6XdQP
	8cXla+9SMXRFu1USidGTZ4dpx+K7YFM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-327-Lk9iOlgOOi-9s4woQiu75A-1; Mon, 20 Mar 2023 01:17:20 -0400
X-MC-Unique: Lk9iOlgOOi-9s4woQiu75A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 353A1855304;
	Mon, 20 Mar 2023 05:17:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DF483C15BA0;
	Mon, 20 Mar 2023 05:17:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C66F61946A50;
	Mon, 20 Mar 2023 05:17:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 01006194658F
 for <linux-lvm@listman.corp.redhat.com>; Sun, 19 Mar 2023 10:27:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E3DB01121318; Sun, 19 Mar 2023 10:27:47 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DCD251121315
 for <linux-lvm@redhat.com>; Sun, 19 Mar 2023 10:27:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF5FC185A791
 for <linux-lvm@redhat.com>; Sun, 19 Mar 2023 10:27:47 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-198-JQi8zEl9NcedmuNlfUhFJg-1; Sun, 19 Mar 2023 06:27:45 -0400
X-MC-Unique: JQi8zEl9NcedmuNlfUhFJg-1
Received: by mail-ed1-f47.google.com with SMTP id r11so36292314edd.5
 for <linux-lvm@redhat.com>; Sun, 19 Mar 2023 03:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679221663;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RfVjCiv0yOjekhC46qKCs163+h5ctLI9Xw6pOxFnjOE=;
 b=RQdh8AW0vJKEEXVr/TU9IJ2JHC9aw18t+1Z2Pvr1+MjweNxJWGn+5yFD5/2ACkK5ne
 EnXGpg4fKJo6Sery4HFFV6CiEOK8Ew7721Ue22Iu45X6J3hGWQ+91kRPnfz1cvRm8vQJ
 QLslYBcPVPBg0/DGYM8dQuerjCQRhkbbCIRwXzXOHZ1lb7MKt0rXkxsrwn6AW0Ih4+b/
 18eI2MdVon6mWL6oOtY4gvdtaruC0xYmD6x9pYczaO4L5daeFDLnhYPw0yUKoo/nOb5y
 OjG35YoPDuXRZ6wJkbXdTcyhEqWE+5kX+IOpgZH6AzBQDHKf2XtuZGRQYmKN6lsWODCU
 0/Vg==
X-Gm-Message-State: AO0yUKWJ1thI8MEgdR/9mJFTrS7/+HO0Nu3Q5sXqnMbIAmZHE1EUX76a
 OwxryT4GEmVuLOa88U6Ab0fO+W1L7mcCcLSh+M+nBpM66fg=
X-Google-Smtp-Source: AK7set+rqdEt71dZG0NEJQaZmuTwWSPSxPV7fgEmdm20A1vRE4Oy0EvqfBIBCgJ3SRoXsoPd4d3j6/3vrqH33FTMIQs=
X-Received: by 2002:a17:907:7e98:b0:8d8:4578:18e0 with SMTP id
 qb24-20020a1709077e9800b008d8457818e0mr2564158ejc.10.1679221663629; Sun, 19
 Mar 2023 03:27:43 -0700 (PDT)
MIME-Version: 1.0
From: Pascal <patatetom@gmail.com>
Date: Sun, 19 Mar 2023 11:27:32 +0100
Message-ID: <CAGhAaddYD7Y8ObY6Q3Yprhruzb8s6-q0t+GJUv5oYGLR3LCpRg@mail.gmail.com>
To: linux-lvm@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mailman-Approved-At: Mon, 20 Mar 2023 05:17:11 +0000
Subject: [linux-lvm] LVM and RO device/partition(s)
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============5434694220365718266=="

--===============5434694220365718266==
Content-Type: multipart/alternative; boundary="000000000000c284aa05f73e4296"

--000000000000c284aa05f73e4296
Content-Type: text/plain; charset="UTF-8"

hi,

the bio_check_ro function of the blk-core.c source file of the Linux kernel
refers to LVM :
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/block/blk-core.c?h=v6.2.7#n500

how does LVM currently behave when faced with a device marked as readonly ?
does it automatically switch itself in readonly mode?

according to some tests carried out in a virtual machine, it seems that it
doesn't and that LVM modifies the disk/partition(s) even though they are
all readonly (chmod 444 && blockdev --setro).

regards, lacsaP.

--000000000000c284aa05f73e4296
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>hi,</div><div><br></div><div>the <span style=3D"font-=
family:monospace">bio_check_ro</span> function of the <span style=3D"font-f=
amily:monospace">blk-core.c</span> source file of the Linux kernel refers t=
o LVM :</div><div><a href=3D"https://git.kernel.org/pub/scm/linux/kernel/gi=
t/stable/linux.git/tree/block/blk-core.c?h=3Dv6.2.7#n500">https://git.kerne=
l.org/pub/scm/linux/kernel/git/stable/linux.git/tree/block/blk-core.c?h=3Dv=
6.2.7#n500</a></div><div><br></div><div>how does LVM currently behave when =
faced with a device marked as readonly ?</div><div>does it automatically sw=
itch <span class=3D"gmail-Lm gmail-ng">itself </span>in readonly mode?</div=
><div><br></div><div>according to some tests carried out in a virtual machi=
ne, it seems that it doesn&#39;t and that LVM modifies the disk/partition(s=
) even though they are all readonly (<span style=3D"font-family:monospace">=
chmod 444</span> &amp;&amp; <span style=3D"font-family:monospace">blockdev =
--setro</span>).<br></div><div><br></div><div>regards, lacsaP.<br></div></d=
iv>

--000000000000c284aa05f73e4296--

--===============5434694220365718266==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============5434694220365718266==--

