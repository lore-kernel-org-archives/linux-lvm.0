Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA8EC433F5
	for <linux-lvm@archiver.kernel.org>; Sat,  7 May 2022 21:21:10 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-250-Ea6wLGkPN6agktjRts-q3g-1; Sat, 07 May 2022 17:21:06 -0400
X-MC-Unique: Ea6wLGkPN6agktjRts-q3g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80F93185A7B2;
	Sat,  7 May 2022 21:21:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F28031544F20;
	Sat,  7 May 2022 21:20:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CCEAD194705D;
	Sat,  7 May 2022 21:20:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 626B1194705A
 for <linux-lvm@listman.corp.redhat.com>; Sat,  7 May 2022 21:20:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0D9F0C3598C; Sat,  7 May 2022 21:20:57 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A2BFC3598B
 for <linux-lvm@redhat.com>; Sat,  7 May 2022 21:20:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E006F294EDC8
 for <linux-lvm@redhat.com>; Sat,  7 May 2022 21:20:56 +0000 (UTC)
Received: from mail.gathman.org (mail.gathman.org [70.184.247.44]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-mFOOaV9eObumjMoB0saegQ-1; Sat, 07 May 2022 17:20:52 -0400
X-MC-Unique: mFOOaV9eObumjMoB0saegQ-1
Received: from mail.gathman.org (mail.gathman.org [IPv6:2001:470:8:809::1010])
 (authenticated bits=0)
 by mail.gathman.org (8.14.7/8.14.7) with ESMTP id 247KfCim004351
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <linux-lvm@redhat.com>; Sat, 7 May 2022 16:41:12 -0400
Date: Sat, 7 May 2022 16:41:12 -0400 (EDT)
From: Stuart D Gathman <stuart@gathman.org>
To: LVM general discussion and development <linux-lvm@redhat.com>
In-Reply-To: <87561BC7-DDA5-4BC9-9F98-17118199E96D@icloud.com>
Message-ID: <6d72d74a-98cc-b055-d1ba-bcd20201e67@gathman.org>
References: <7534073B-7DBD-46B5-9CA5-BFB3C603C75E@icloud.com>
 <25199.10122.376547.499176@quad.stoffel.home>
 <324D8F25-90D3-4165-BE86-11B217DAFDE4@icloud.com>
 <25200.21283.981034.416787@quad.stoffel.home>
 <87561BC7-DDA5-4BC9-9F98-17118199E96D@icloud.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [linux-lvm] Bypassing LVM Restrictions - RAID6 With Less Than 5
 Disks
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed;
 boundary="-1203360521-1701871415-1651956072=:4241"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
---1203360521-1701871415-1651956072=:4241
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.gathman.org id 247KfCim004351

On Fri, 6 May 2022, Alex Lieflander wrote:

> Thanks. I really don=E2=80=99t want to give up the DM-Integrity managemen=
t. Less complexity is just a bonus.

What are you trying to get out of RAID6?  If redundancy and integrity
are already managed at another layer, then just use RAID0 for striping.

I like to use RAID10 for mirror + striping, but I understand parity disks=
=20
give redundancy without halving capacity.  Parity means RMW cycles of
largish blocks, whereas straight mirroring (RAID1, RAID10) can write
single sectors without a RMW cycle.
---1203360521-1701871415-1651956072=:4241
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

---1203360521-1701871415-1651956072=:4241--

