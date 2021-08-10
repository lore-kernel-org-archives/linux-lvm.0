Return-Path: <SRS0=ysRg=NB=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33959C432BE
	for <linux-lvm@archiver.kernel.org>; Tue, 10 Aug 2021 08:53:44 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C36B60551
	for <linux-lvm@archiver.kernel.org>; Tue, 10 Aug 2021 08:53:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6C36B60551
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=assyoma.it
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-YjuP0IrINByUUcEgk53z3g-1; Tue, 10 Aug 2021 04:53:40 -0400
X-MC-Unique: YjuP0IrINByUUcEgk53z3g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC4A08799EB;
	Tue, 10 Aug 2021 08:53:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B443E2CE;
	Tue, 10 Aug 2021 08:53:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 034EF181A0F1;
	Tue, 10 Aug 2021 08:53:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17A8kevE018519 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 10 Aug 2021 04:46:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DB40B10F1C1F; Tue, 10 Aug 2021 08:46:40 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D6E3710F1C1E
	for <linux-lvm@redhat.com>; Tue, 10 Aug 2021 08:46:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49DA1858286
	for <linux-lvm@redhat.com>; Tue, 10 Aug 2021 08:46:38 +0000 (UTC)
Received: from mr024msb.fastweb.it (mr024msb.fastweb.it [85.18.95.100])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-604-C8XZemaAMI--xhYkf9C5Yw-1; Tue, 10 Aug 2021 04:46:35 -0400
X-MC-Unique: C8XZemaAMI--xhYkf9C5Yw-1
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgedvtddrjeelgddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhtefuvfghgfeupdfqfgfvnecuuegrihhlohhuthemuceftddtnecunecujfgurhepggffhffvufgjfhgfkfigtgfgsehtjehjtddtredvnecuhfhrohhmpefiihhonhgrthgrnhcuffgrnhhtihcuoehgrdgurghnthhisegrshhshihomhgrrdhitheqnecuggftrfgrthhtvghrnhepvdffvedtueevleehudekffeileeuhfdvtdeigfeukefgvddvhfelhefgkeffgfdtnecuffhomhgrihhnpegrshhshihomhgrrdhithenucfkphepleefrdeifedrheehrdehjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhephhgvlhhopehplhhuthhonhgvrdgrshhshihomhgrrdhithdpihhnvghtpeelfedrieefrdehhedrheejpdhmrghilhhfrhhomhepghdruggrnhhtihesrghsshihohhmrgdrihhtpdhrtghpthhtoheplhhinhhugidqlhhvmhesrhgvughhrghtrdgtohhmpdhrtghpthhtohepmhhinhhgnhhushesghhmrghilhdrtghomh
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from plutone.assyoma.it (93.63.55.57) by mr024msb.fastweb.it
	(5.8.715.01) id 605862BF0E8642CC; Tue, 10 Aug 2021 10:46:33 +0200
Received: from webmail.assyoma.it (localhost [IPv6:::1])
	by plutone.assyoma.it (Postfix) with ESMTPA id F037EDC848B5;
	Tue, 10 Aug 2021 10:46:32 +0200 (CEST)
MIME-Version: 1.0
Date: Tue, 10 Aug 2021 10:46:32 +0200
From: Gionatan Danti <g.danti@assyoma.it>
To: Ming-Hung Tsai <mingnus@gmail.com>
In-Reply-To: <CAAYit8RWCA3W0y4vuZju6aZVSeu7e6SjErkZ1orLceJj0nhsvw@mail.gmail.com>
References: <7956b86706382158e1fddb3c4bfbfde3@assyoma.it>
	<CAAYit8S5RZ8wh0WAxWEyuJJ=ejVd+TOXqUDFLhMLDGNEGhhRjQ@mail.gmail.com>
	<d377f85bbd88932b36394b3ac62a5e6b@assyoma.it>
	<CAAYit8RWCA3W0y4vuZju6aZVSeu7e6SjErkZ1orLceJj0nhsvw@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <17fdbee926c230a26f761fb70ae46444@assyoma.it>
X-Sender: g.danti@assyoma.it
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
Cc: linux-lvm@redhat.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Il 2021-08-10 10:40 Ming-Hung Tsai ha scritto:
> It depends on the number of thin volumes and the space utilization. A
> selective dump might also help, e.g.,
> # thin_dump <metadata> --dev-id <thin-id1> --dev-id <thin-id2> ...
> 
> The thin-ids could be obtained from lvs, using listing:
> # lvs -o lv_name,vg_name,thin_id
> or querying:
> # lvs -o thin_id --select <criteria> --noheadings

Greatly appreciated, thanks!

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

