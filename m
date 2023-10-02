Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F8EE776CB
	for <linux-lvm@archiver.kernel.org>; Mon,  2 Oct 2023 22:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696287042;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=33+e1U8ncVDghA6BNggYKs2IqWX3hliOowXHCxVWOys=;
	b=KutNtx/OhIePh7vfIjUnogA6ztLxOKVAg72Gsib2Z0gaispPez3BE+hy2iSnZRDSwLtB52
	u3uRYUax0LlzBwTiZZUaIRxgny+IOpHel8jBWmH+qHY5FPV0rXK3TyxvgJQWIyQQYWrV66
	rnfe3iwuk2SsCbqE3ZoUW9ZY+A5IdG0=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-439-aZeQeA4xNiWIZUtosBioKQ-1; Mon, 02 Oct 2023 18:50:39 -0400
X-MC-Unique: aZeQeA4xNiWIZUtosBioKQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC0473800BA4;
	Mon,  2 Oct 2023 22:50:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5D08751E3;
	Mon,  2 Oct 2023 22:50:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0E98F19465A2;
	Mon,  2 Oct 2023 22:50:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 339181946595
 for <linux-lvm@listman.corp.redhat.com>; Mon,  2 Oct 2023 22:50:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F009128FE; Mon,  2 Oct 2023 22:50:25 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E8FF451E3
 for <linux-lvm@redhat.com>; Mon,  2 Oct 2023 22:50:25 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB54C85A5A8
 for <linux-lvm@redhat.com>; Mon,  2 Oct 2023 22:50:25 +0000 (UTC)
Received: from server.interlinx.bc.ca (mail.interlinx.bc.ca
 [69.165.217.196]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-aTy_5U2xMXq4Ji0OZj9QFw-1; Mon, 02 Oct 2023 18:50:23 -0400
X-MC-Unique: aTy_5U2xMXq4Ji0OZj9QFw-1
Received: from brian-laptop.interlinx.bc.ca (unknown
 [IPv6:fd0c:685d:4db3:4ba7:23ab:92fe:41d5:f62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by server.interlinx.bc.ca (Postfix) with ESMTPSA id 666702F5EE
 for <linux-lvm@redhat.com>; Mon,  2 Oct 2023 18:50:22 -0400 (EDT)
Message-ID: <800e8363150ab830a3b2514e3133794e088d242f.camel@interlinx.bc.ca>
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
To: linux-lvm@redhat.com
Date: Mon, 02 Oct 2023 18:50:21 -0400
In-Reply-To: <87v8boviwj.fsf@vps.thesusis.net>
References: <d667deb919722b147b4f78b3e00a6ce22a575f44.camel@interlinx.bc.ca>
 <87pm1wn9j0.fsf@vps.thesusis.net>
 <f510c5de56008c4c74a7d22f267ab2f8e2f37c96.camel@interlinx.bc.ca>
 <87v8boviwj.fsf@vps.thesusis.net>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [linux-lvm] Is MD array (containing a PV) reducible?
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: interlinx.bc.ca
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Mon, 2023-10-02 at 16:48 -0400, Phillip Susi wrote:
>=20
> You want to put an MD array inside of another MD array?=A0 Why?

Just to take advantage of MD's online/background sync to get the data
from md0 array to the md1 array.

> I would suggest instead that you add the luks volume as a new PV to
> your
> VG, then use pvmove to migrate all of your logical volumes from md0
> to
> md1, then vgreduce md0 from the VG, stop md0, mdadm --zero-
> superblocks
> /dev/sdc, then add sdc to md1.

That's an interesting alternative.  Thanks for the suggestion.

Cheers,
b.

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

