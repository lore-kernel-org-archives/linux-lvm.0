Return-Path: <SRS0=tbfx=PG=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBB3AC433F5
	for <linux-lvm@archiver.kernel.org>; Mon, 18 Oct 2021 03:02:37 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B19B661050
	for <linux-lvm@archiver.kernel.org>; Mon, 18 Oct 2021 03:02:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B19B661050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bdmcc-us.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-UGSpfWSZOfaVv8azNfi0Fw-1; Sun, 17 Oct 2021 23:02:32 -0400
X-MC-Unique: UGSpfWSZOfaVv8azNfi0Fw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5340100F944;
	Mon, 18 Oct 2021 03:02:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CD7E60657;
	Mon, 18 Oct 2021 03:02:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A6EEF4A703;
	Mon, 18 Oct 2021 03:02:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19I31t2O024530 for <linux-lvm@listman.util.phx.redhat.com>;
	Sun, 17 Oct 2021 23:01:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 927C62166B26; Mon, 18 Oct 2021 03:01:55 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D23E2166B25
	for <linux-lvm@redhat.com>; Mon, 18 Oct 2021 03:01:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE2CB899EC1
	for <linux-lvm@redhat.com>; Mon, 18 Oct 2021 03:01:52 +0000 (UTC)
Received: from friday.buadh-brath.com (drochaid.buadh-brath.com
	[45.33.103.245]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-390-6Mz7Jd0mPRmiiOLsgfJN3Q-1; Sun, 17 Oct 2021 23:01:50 -0400
X-MC-Unique: 6Mz7Jd0mPRmiiOLsgfJN3Q-1
Received: from [69.133.187.32] (helo=buadh-brath.com)
	by friday.buadh-brath.com with esmtp (Exim 4.89)
	(envelope-from <bdmc@mail.buadh-brath.com>) id 1mcIDV-0003zp-6N
	for linux-lvm@redhat.com; Mon, 18 Oct 2021 02:17:33 +0000
Received: by buadh-brath.com (Postfix, from userid 1000)
	id 3D75E201C0; Sun, 17 Oct 2021 22:17:19 -0400 (EDT)
Date: Sun, 17 Oct 2021 22:17:19 -0400
From: Brian McCullough <bdmc@bdmcc-us.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <20211018021719.GA16936@bdmcc-us.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-lvm@redhat.com
Subject: [linux-lvm] Recovering "broken" disk ( 17th )
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Folks,

I have had a disk go bad on me, causing me to lose one PV.


I seem to have retrieved the partition using ddrescue, but it also seems
to be missing some label information, because pvscan doesn't see it.

Using hexdump, I see the string " LVM2 " at 0x1004, but nothing before
that.  The whole phrase is: 

0x01000  16 d6 8e db 20 4c 56 4d  32 20 78 5b 35 41 25 72


I find what appears to be an LVM2 configuration section at 0x1200, and
so I was able to read the UUID that this PV should have.


On another machine, I dumped a PV partition, and find "LABLEONE" at
0x200, with the same " LVM2 " at 0x01000.

I was concerned that my dump was offset, but the comparison to the
"good" one suggests that that isn't the problem, but just the missing
"LABLEONE" and related information at 0x0200.

If I do a "pvcreate --uuid xxxx" would this fix that recovered partition
so that pvscan and friends can work properly, and I can finally boot
that machine?


Thank you,
Brian


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

