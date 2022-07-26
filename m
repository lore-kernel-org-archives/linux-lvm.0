Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C79EC00140
	for <linux-lvm@archiver.kernel.org>; Tue, 26 Jul 2022 18:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658861553;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xE/TDg/oVXM/nno9sXkH4kbunZ4hOyjDkkqkhjRnVW0=;
	b=R8uJPcbJ1Rnnz71Z9GOW50WsQOpJ4fyEyZFDZ33ugRgUrgZeFIX5aAshflvZBWmM90oxR7
	XNTJK3d5wlMJHUY+89VqujfPL6kpWjHYw55z4H8hmI1VO2YoxdB4izjE/WkS8EnCdbSNGq
	se1Sus42zHV9sfBIwP/q/6dcGkQCoAc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-473-wEGy_kR8PK-2SEKUumDYRA-1; Tue, 26 Jul 2022 14:52:29 -0400
X-MC-Unique: wEGy_kR8PK-2SEKUumDYRA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7DC53810791;
	Tue, 26 Jul 2022 18:52:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 979DA40CFD0A;
	Tue, 26 Jul 2022 18:52:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 607EC1945D8A;
	Tue, 26 Jul 2022 18:52:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4CEE61945D86
 for <linux-lvm@listman.corp.redhat.com>; Tue, 26 Jul 2022 18:52:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 26804492CA5; Tue, 26 Jul 2022 18:52:19 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 22045492CA2
 for <linux-lvm@redhat.com>; Tue, 26 Jul 2022 18:52:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDCEE803520
 for <linux-lvm@redhat.com>; Tue, 26 Jul 2022 18:52:18 +0000 (UTC)
Received: from mail.gathman.org (mail.gathman.org [70.184.247.44]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-197-DSJEugUpPaS9dgMlXOewOw-1; Tue, 26 Jul 2022 14:52:17 -0400
X-MC-Unique: DSJEugUpPaS9dgMlXOewOw-1
Received: from mail.gathman.org (mail.gathman.org [IPv6:2001:470:8:809::1010])
 (authenticated bits=0)
 by mail.gathman.org (8.14.7/8.14.7) with ESMTP id 26QIMnOb001549
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 26 Jul 2022 14:22:53 -0400
Date: Tue, 26 Jul 2022 14:22:49 -0400 (EDT)
From: Stuart D Gathman <stuart@gathman.org>
To: Marcin Owsiany <marcin@owsiany.pl>
In-Reply-To: <CAFsGsxLOyawZH7xxgfLNkh=VftBNAaDStE0XQgQTGf9NmyZ+ZQ@mail.gmail.com>
Message-ID: <2a509a35-24ab-341e-c6f-51caef2f4e1b@gathman.org>
References: <CAFsGsxLOyawZH7xxgfLNkh=VftBNAaDStE0XQgQTGf9NmyZ+ZQ@mail.gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: Re: [linux-lvm] Where are the data blocks of an LV?
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
Cc: linux-lvm@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Checkout https://github.com/sdgathman/lbatofile
It was written to identify the file affected by a bad block (so it goes
the opposite direction), but the getpvmap() function obtains pe_start and 
pe_size plus the list of segments.  findlv() goes through the segments to
find the one an absolute sector is in.  That should tell you what you want 
to know.

On Fri, 22 Jul 2022, Marcin Owsiany wrote:

> I know that it is possible to find where a given logical volume's extents
> start on a PVs thanks to the information printed by lvdisplay --maps.
> 
> I was also able to experimentally establish that the actual data of an LV
> starts one megabyte after that location. Is that offset documented anywhere,
> or can I somehow discover it at runtime for a given LV?

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

