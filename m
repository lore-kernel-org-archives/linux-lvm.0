Return-Path: <SRS0=1Tek=NA=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3753C4320A
	for <linux-lvm@archiver.kernel.org>; Mon,  9 Aug 2021 08:34:02 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F57D60F55
	for <linux-lvm@archiver.kernel.org>; Mon,  9 Aug 2021 08:34:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1F57D60F55
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=assyoma.it
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-598-oRHNhr_PMSyOSLw5VYr9sg-1; Mon, 09 Aug 2021 04:33:59 -0400
X-MC-Unique: oRHNhr_PMSyOSLw5VYr9sg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FAC5100E421;
	Mon,  9 Aug 2021 08:33:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2949360CC9;
	Mon,  9 Aug 2021 08:33:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 33CA34BB7C;
	Mon,  9 Aug 2021 08:33:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1798XdMg016650 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 9 Aug 2021 04:33:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B0DF66E1BF; Mon,  9 Aug 2021 08:33:39 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB4376E1DA
	for <linux-lvm@redhat.com>; Mon,  9 Aug 2021 08:33:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8AB71066683
	for <linux-lvm@redhat.com>; Mon,  9 Aug 2021 08:33:36 +0000 (UTC)
Received: from mr024msb.fastweb.it (mr024msb.fastweb.it [85.18.95.100])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-409--xkWTELQP1uKddyv9VMEPg-1; Mon, 09 Aug 2021 04:33:34 -0400
X-MC-Unique: -xkWTELQP1uKddyv9VMEPg-1
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgedvtddrjeejgddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhtefuvfghgfeupdfqfgfvnecuuegrihhlohhuthemuceftddtnecunecujfgurhepggffhffvufgjfhgfkfigtgfgsehtjehjtddtredvnecuhfhrohhmpefiihhonhgrthgrnhcuffgrnhhtihcuoehgrdgurghnthhisegrshhshihomhgrrdhitheqnecuggftrfgrthhtvghrnhepvdffvedtueevleehudekffeileeuhfdvtdeigfeukefgvddvhfelhefgkeffgfdtnecuffhomhgrihhnpegrshhshihomhgrrdhithenucfkphepleefrdeifedrheehrdehjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhephhgvlhhopehplhhuthhonhgvrdgrshhshihomhgrrdhithdpihhnvghtpeelfedrieefrdehhedrheejpdhmrghilhhfrhhomhepghdruggrnhhtihesrghsshihohhmrgdrihhtpdhrtghpthhtoheplhhinhhugidqlhhvmhesrhgvughhrghtrdgtohhmpdhrtghpthhtohepmhhinhhgnhhushesghhmrghilhdrtghomh
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from plutone.assyoma.it (93.63.55.57) by mr024msb.fastweb.it
	(5.8.715.01) id 605862BF0E7344C6; Mon, 9 Aug 2021 10:33:31 +0200
Received: from webmail.assyoma.it (localhost [IPv6:::1])
	by plutone.assyoma.it (Postfix) with ESMTPA id 29130DC73F36;
	Mon,  9 Aug 2021 10:33:31 +0200 (CEST)
MIME-Version: 1.0
Date: Mon, 09 Aug 2021 10:33:31 +0200
From: Gionatan Danti <g.danti@assyoma.it>
To: LVM general discussion and development <linux-lvm@redhat.com>
In-Reply-To: <CAAYit8S5RZ8wh0WAxWEyuJJ=ejVd+TOXqUDFLhMLDGNEGhhRjQ@mail.gmail.com>
References: <7956b86706382158e1fddb3c4bfbfde3@assyoma.it>
	<CAAYit8S5RZ8wh0WAxWEyuJJ=ejVd+TOXqUDFLhMLDGNEGhhRjQ@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <d377f85bbd88932b36394b3ac62a5e6b@assyoma.it>
X-Sender: g.danti@assyoma.it
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
Cc: Ming-Hung Tsai <mingnus@gmail.com>
Subject: Re: [linux-lvm] How to check if thin volume or snapshot was ever
 activated
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Il 2021-08-09 05:53 Ming-Hung Tsai ha scritto:
> It sounds like you intend to keep snapshots that have been updated
> (written) since its creation, right?

True.

> The precise way might be checking the data mappings via thin_dump. An
> updated device has data mappings with timestamps greater than the
> device's creation time.

Interesting approach, thanks.

> Checking device activation might not meet what you need. An activated
> device might or might not receive any write, so you don't know whether
> a device has been updated by looking into its activation history.

Sure, but it can be a reasonable approximation before further 
inspection. Also, I wonder if dumping data mappings can be slow for big 
volumes.

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

