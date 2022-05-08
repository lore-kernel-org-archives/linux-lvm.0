Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6822CC433F5
	for <linux-lvm@archiver.kernel.org>; Sun,  8 May 2022 14:21:08 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-lGzuawWXOA6QAqO6N0T0Qw-1; Sun, 08 May 2022 10:21:04 -0400
X-MC-Unique: lGzuawWXOA6QAqO6N0T0Qw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC7163C10249;
	Sun,  8 May 2022 14:21:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EB1679E60;
	Sun,  8 May 2022 14:20:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B1C8E194704E;
	Sun,  8 May 2022 14:20:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C0B901947041
 for <linux-lvm@listman.corp.redhat.com>; Sun,  8 May 2022 14:20:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A348240D1B9A; Sun,  8 May 2022 14:20:55 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F9B84010E2A
 for <linux-lvm@redhat.com>; Sun,  8 May 2022 14:20:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 834303C10248
 for <linux-lvm@redhat.com>; Sun,  8 May 2022 14:20:55 +0000 (UTC)
Received: from mail.gathman.org (mail.gathman.org [70.184.247.44]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-81-UFkFRPkFPZaiPecj0tLsUg-1; Sun, 08 May 2022 10:20:53 -0400
X-MC-Unique: UFkFRPkFPZaiPecj0tLsUg-1
Received: from mail.gathman.org (mail.gathman.org [IPv6:2001:470:8:809::1010])
 (authenticated bits=0)
 by mail.gathman.org (8.14.7/8.14.7) with ESMTP id 248DPsL7008325
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <linux-lvm@redhat.com>; Sun, 8 May 2022 09:25:58 -0400
Date: Sun, 8 May 2022 09:25:54 -0400 (EDT)
From: Stuart D Gathman <stuart@gathman.org>
To: LVM general discussion and development <linux-lvm@redhat.com>
In-Reply-To: <4D4E1DC0-8A04-474C-8DB2-4C9429F092F2@icloud.com>
Message-ID: <6910f1f-b08d-e0fc-4f4d-cbfda6ac7f57@gathman.org>
References: <7534073B-7DBD-46B5-9CA5-BFB3C603C75E@icloud.com>
 <25199.10122.376547.499176@quad.stoffel.home>
 <324D8F25-90D3-4165-BE86-11B217DAFDE4@icloud.com>
 <25200.21283.981034.416787@quad.stoffel.home>
 <87561BC7-DDA5-4BC9-9F98-17118199E96D@icloud.com>
 <6d72d74a-98cc-b055-d1ba-bcd20201e67@gathman.org>
 <4D4E1DC0-8A04-474C-8DB2-4C9429F092F2@icloud.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed;
 boundary="-1203360521-598408498-1652016358=:8240"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
---1203360521-598408498-1652016358=:8240
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.gathman.org id 248DPsL7008325

On Sat, 7 May 2022, Alex Lieflander wrote:

> I don=E2=80=99t trust the hardware I=E2=80=99m running on very much, but =
it=E2=80=99s all I have to work with at the moment; it=E2=80=99s important =
that the array is resilient to *any* (and multiple) single chunk corruption=
s because such corruptions are likely to happen in the future.
>
> For the last several months I=E2=80=99ve periodically been seeing (DM-Int=
egrity) checksum mismatch warnings at various locations on all of my disks.=
 I stopped using a few SATA ports that were explicitly throwing SATA errors=
, but I suspect that the remaining connections are unpredictably (albeit in=
frequently) corrupting data in ways that are more difficult to detect.

Sounds like a *great* test bed for software data integrity tools.  Don't
throw that system away when you get a more reliable one!

That sounds like a situation that btrfs with multiple copies could
handle.  Use a beefier checksum than the default crc-32 also.

---1203360521-598408498-1652016358=:8240
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

---1203360521-598408498-1652016358=:8240--

