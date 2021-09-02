Return-Path: <SRS0=nGmI=NY=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F476C432BE
	for <linux-lvm@archiver.kernel.org>; Thu,  2 Sep 2021 13:33:23 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D9366108B
	for <linux-lvm@archiver.kernel.org>; Thu,  2 Sep 2021 13:33:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D9366108B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=assyoma.it
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-tmKzQA_eOfCqkOfoQ3IeVQ-1; Thu, 02 Sep 2021 09:33:19 -0400
X-MC-Unique: tmKzQA_eOfCqkOfoQ3IeVQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21024100945A;
	Thu,  2 Sep 2021 13:33:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C95561093;
	Thu,  2 Sep 2021 13:33:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EA4121809C84;
	Thu,  2 Sep 2021 13:32:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 182DO821001946 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 2 Sep 2021 09:24:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 128D97AF0; Thu,  2 Sep 2021 13:24:08 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D2EE294C
	for <linux-lvm@redhat.com>; Thu,  2 Sep 2021 13:24:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16296800B24
	for <linux-lvm@redhat.com>; Thu,  2 Sep 2021 13:24:05 +0000 (UTC)
Received: from mr024msb.fastweb.it (mr024msb.fastweb.it [85.18.95.100])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-38-FkNgJ-xuOnOa_C1fm92G1Q-1; Thu, 02 Sep 2021 09:24:03 -0400
X-MC-Unique: FkNgJ-xuOnOa_C1fm92G1Q-1
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgedvtddruddvhedgieefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfetuffvhgfguedpqfgfvfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggffhffvufgjfhgfkfigtgfgsehtjehjtddtredvnecuhfhrohhmpefiihhonhgrthgrnhcuffgrnhhtihcuoehgrdgurghnthhisegrshhshihomhgrrdhitheqnecuggftrfgrthhtvghrnhepleeufeetveeifeegleekkeeiheetleejleeghefhkeegtddtgfeuhfetieeiuedtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdprghsshihohhmrgdrihhtnecukfhppeelfedrieefrdehhedrheejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehhvghlohepphhluhhtohhnvgdrrghsshihohhmrgdrihhtpdhinhgvthepleefrdeifedrheehrdehjedpmhgrihhlfhhrohhmpehgrdgurghnthhisegrshhshihomhgrrdhithdprhgtphhtthhopefoihhnghhlihdrjghuseifihhnughrihhvvghrrdgtohhmpdhrtghpthhtoheplhhinhhugidqlhhvmhesrhgvughhrghtrdgtohhm
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from plutone.assyoma.it (93.63.55.57) by mr024msb.fastweb.it
	(5.8.715.01) id 605862BF1059F0AB; Thu, 2 Sep 2021 15:24:01 +0200
Received: from webmail.assyoma.it (localhost [IPv6:::1])
	by plutone.assyoma.it (Postfix) with ESMTPA id 00CF5C0DEE1C;
	Thu,  2 Sep 2021 15:24:01 +0200 (CEST)
MIME-Version: 1.0
Date: Thu, 02 Sep 2021 15:24:00 +0200
From: Gionatan Danti <g.danti@assyoma.it>
To: LVM general discussion and development <linux-lvm@redhat.com>
In-Reply-To: <PH0PR11MB501412E2C1081FA98208E545F1CE9@PH0PR11MB5014.namprd11.prod.outlook.com>
References: <PH0PR11MB501412E2C1081FA98208E545F1CE9@PH0PR11MB5014.namprd11.prod.outlook.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <ba1b736723487985ec076d499d89313b@assyoma.it>
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
Cc: "Yu, Mingli" <Mingli.Yu@windriver.com>
Subject: Re: [linux-lvm] The size specified by "lvcreate -L" is not accurate
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

Il 2021-09-02 05:26 Yu, Mingli ha scritto:
> Per
> https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/tree/doc/RelNotes/v1.46.4.txt
> [1], after e2fsprogs upgrades to 1.46.4, the defaults for mke2fs now
> call for 256 byte inodes for all file systems (with the exception of
> file systems for the GNU Hurd, which only supports 128 byte inodes)
> and use "lvcreate -L 50 -n lv_test1 vg_test && mke2fs
> /dev/vg_test/lv_test1" and then continue to check the partiontion as
> below.(use lvm2 2.03.11 for the test)
>  # df -h | grep dev/mapper/vg_test-lv_test1
> 
>  /dev/mapper/vg_test-lv_test1   48M   14K   46M   1% /mnt/lv-test
> 
>  Though claim 50M as above, but it turns out to be only 48M.

I think that allocation are done in multiple of physical extent size 
which, by default, is at 4 MB.
50 is not a multiple of 4 while 48 is, so "lvcreate" probably rounded 
down the required size.
Using one or more "-v" should bring progressively more details.

Regards.

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

