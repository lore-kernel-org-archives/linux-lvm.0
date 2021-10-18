Return-Path: <SRS0=tbfx=PG=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59942C433EF
	for <linux-lvm@archiver.kernel.org>; Mon, 18 Oct 2021 18:09:46 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3A7A60F48
	for <linux-lvm@archiver.kernel.org>; Mon, 18 Oct 2021 18:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C3A7A60F48
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bdmcc-us.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-lvP42qddPSaciEX1tu4A6Q-1; Mon, 18 Oct 2021 14:09:40 -0400
X-MC-Unique: lvP42qddPSaciEX1tu4A6Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3628A8066F0;
	Mon, 18 Oct 2021 18:09:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4B951F443;
	Mon, 18 Oct 2021 18:09:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6B6824E58F;
	Mon, 18 Oct 2021 18:09:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19II9EXS016676 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 18 Oct 2021 14:09:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 912D8115D7DA; Mon, 18 Oct 2021 18:09:14 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 89281115D7D9
	for <linux-lvm@redhat.com>; Mon, 18 Oct 2021 18:09:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E92C10B70F3
	for <linux-lvm@redhat.com>; Mon, 18 Oct 2021 18:09:11 +0000 (UTC)
Received: from friday.buadh-brath.com (drochaid.buadh-brath.com
	[45.33.103.245]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-451-tZdyyw5_P_S8n8C1ZUTbIA-1; Mon, 18 Oct 2021 14:09:09 -0400
X-MC-Unique: tZdyyw5_P_S8n8C1ZUTbIA-1
Received: from [69.133.187.32] (helo=buadh-brath.com)
	by friday.buadh-brath.com with esmtp (Exim 4.89)
	(envelope-from <bdmc@mail.buadh-brath.com>) id 1mcX4O-0004AR-RN
	for linux-lvm@redhat.com; Mon, 18 Oct 2021 18:09:08 +0000
Received: by buadh-brath.com (Postfix, from userid 1000)
	id ACDD6201C0; Mon, 18 Oct 2021 14:08:53 -0400 (EDT)
Date: Mon, 18 Oct 2021 14:08:53 -0400
From: Brian McCullough <bdmc@bdmcc-us.com>
To: linux-lvm@redhat.com
Message-ID: <20211018180853.GF28058@bdmcc-us.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-lvm@redhat.com
Subject: [linux-lvm] Help restoring a corrupted PV partition ( 18th )
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


I have had a disk go bad on me, causing me to lose one PV.

If I am not providing sufficient, or the proper, information, feel free
to ask for more.


I seem to have retrieved the partition using ddrescue and put it on to
a new drive, but it seems to be missing some label information, because
pvscan doesn't recognize it as a PV partition.

Using hexdump, I see the string " LVM2 " at 0x1004, but nothing before
that.  The whole 16 bytes is:

0x01000  16 d6 8e db 20 4c 56 4d  32 20 78 5b 35 41 25 72
                        L  V  M  2



I find what appears to be an LVM2 vgconfig block starting at 0x01200,
extracted that to a file and was able to read the UUID that this PV
should have.  It is one of about a dozen that make up this VG.


On another machine, I dumped a PV partition, and find "LABLEONE" at
0x200, with the same " LVM2 " at 0x01000.

I was concerned that my dump was offset, but the comparison to the
"good" one suggests that that isn't the problem, but just the missing
"LABLEONE" and related information at 0x0200.


How to fix?

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

