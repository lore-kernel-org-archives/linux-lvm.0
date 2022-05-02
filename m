Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E6D2C433EF
	for <linux-lvm@archiver.kernel.org>; Mon,  2 May 2022 21:54:59 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-OyA_4ieHMOin6BXBZfeG6A-1; Mon, 02 May 2022 17:54:55 -0400
X-MC-Unique: OyA_4ieHMOin6BXBZfeG6A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE2F780A0AD;
	Mon,  2 May 2022 21:54:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3DDF8553FE6;
	Mon,  2 May 2022 21:54:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A93EA1947049;
	Mon,  2 May 2022 21:54:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2485E1947042
 for <linux-lvm@listman.corp.redhat.com>; Mon,  2 May 2022 21:54:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 02BC5553FE6; Mon,  2 May 2022 21:54:47 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F349B553FDE
 for <linux-lvm@redhat.com>; Mon,  2 May 2022 21:54:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DFF05185A7B2
 for <linux-lvm@redhat.com>; Mon,  2 May 2022 21:54:46 +0000 (UTC)
Received: from mail.stoffel.org (li1843-175.members.linode.com
 [172.104.24.175]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-332-oEkIbpZiNYyzWWo2cR4w6Q-1; Mon, 02 May 2022 17:54:45 -0400
X-MC-Unique: oEkIbpZiNYyzWWo2cR4w6Q-1
Received: from quad.stoffel.org (068-116-170-226.res.spectrum.com
 [68.116.170.226])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.stoffel.org (Postfix) with ESMTPSA id CB56323D70
 for <linux-lvm@redhat.com>; Mon,  2 May 2022 17:54:44 -0400 (EDT)
Received: by quad.stoffel.org (Postfix, from userid 1000)
 id 09F26A7B63; Mon,  2 May 2022 17:54:44 -0400 (EDT)
MIME-Version: 1.0
Message-ID: <25200.21283.981034.416787@quad.stoffel.home>
Date: Mon, 2 May 2022 17:54:43 -0400
From: "John Stoffel" <john@stoffel.org>
To: LVM general discussion and development <linux-lvm@redhat.com>
In-Reply-To: <324D8F25-90D3-4165-BE86-11B217DAFDE4@icloud.com>
References: <7534073B-7DBD-46B5-9CA5-BFB3C603C75E@icloud.com>
 <25199.10122.376547.499176@quad.stoffel.home>
 <324D8F25-90D3-4165-BE86-11B217DAFDE4@icloud.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Pj4+Pj4gIkFsZXgiID09IEFsZXggTGllZmxhbmRlciA8YXRsaWVmQGljbG91ZC5jb20+IHdyaXRl
czoKCkFsZXg+IEkgYWN0dWFsbHkgdXNlZCB0byB1c2UgTURBRE0gd2l0aCBMVk0gb24gdG9wLiBJ
IHN3aXRjaGVkIHRvIHB1cmUKQWxleD4gTFZNIGZvciBzaW1wbGljaXR5IGFuZCBwZXItZGlzayBo
b3N0LW1hbmFnZWQKQWxleD4gaW50ZWdyaXR5LWNoZWNraW5nLiBJIGRvbuKAmXQga25vdyBpZiBN
REFETSBoYXMgc2luY2UgZ2FpbmVkIHRoZQpBbGV4PiBhYmlsaXR5IHRvIGNvcnJlY3Qgc2luZ2xl
LWRpc2sgaW5jb25zaXN0ZW5jaWVzLCBidXQgd2l0aG91dApBbGV4PiBwZXItZGlzayBpbnRlZ3Jp
dHktY2hlY2tpbmcgaXQgd291bGQgYmUgdGVjaG5pY2FsbHkgaW1wb3NzaWJsZQpBbGV4PiB0byBk
byB0aGlzIGlmIDEgZGlzayBoYWQgYWxyZWFkeSBmYWlsZWQuCgpDYW4geW91IHRlbGwgbWUgd2hh
dCB5b3UgbWVhbiBieSAicGVyLWRpc2sgaG9zdC1tYW5hZ2VkCmludGVncml0eS1jaGVja2luZyI/
ICBBcmUgeW91IHJ1bm5pbmcgZG0taW50ZWdyaXR5IGluIHlvdXIgc2V0dXA/ICBDYW4KeW91IHBv
c3QgdGhlIG91dHB1dCBvZjoKCiAgICBsc2JsawoKc28gd2UgdW5kZXJzdGFuZCBiZXR0ZXIgd2hh
dCB5b3UgaGF2ZT8gIEJ1dCBpbiBhbnkgY2FzZSwgZ29vZCBsdWNrCndpdGggZ2V0dGluZyBSQUlE
NiBzb2xpZCBhbmQgd29ya2luZyBhcyBhIHB1cmUgTFZNIHNldHVwLiAgSSBkb24ndAp0aGluayB5
b3UncmUgZ29pbmcgdG8gbWFrZSBpdCBoYXBwZW4gYW55IHRpbWUgc29vbiwgYW5kIEkgaG9uZXN0
bHkKcHJlZmVyIHRvIGhhdmUgc2VwZXJhdGUgbGF5ZXJzIGZvciBteSBzZXR1cCBzbyB0aGF0IGVh
Y2ggbGF5ZXIgZG9lcwppdCdzIG93biB0aGluayBhbmQgZG9lcyBpdCB3ZWxsLgoKSm9obgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtbHZtIG1h
aWxpbmcgbGlzdApsaW51eC1sdm1AcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWx2bQpyZWFkIHRoZSBMVk0gSE9XLVRPIGF0IGh0dHA6
Ly90bGRwLm9yZy9IT1dUTy9MVk0tSE9XVE8vCg==

