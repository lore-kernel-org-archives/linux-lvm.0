Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A7DC001E0
	for <linux-lvm@archiver.kernel.org>; Wed, 26 Jul 2023 06:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690353608;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=TCeumlj+nchlrEAoQcQ6/8OTZ0JY/IOlvv7tkySqeuE=;
	b=MOvnLHTLZbO12fxCWBPhg7oCgeOcPuxaQGdhgml/SPkkg+1GdR2QsQIYvLioPoHuULIrBK
	mqw9LxqJxnL+rD/3LCJWAH8HoDXvUiq0W+ni6ByKnd7VmkV35tP/+UTLriUiPMr84jx5sn
	PFsBTNmK6eVMOCysiqSmcrFVbeqFGkY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-133-e-kvfe7mMPqElojSLbRHJw-1; Wed, 26 Jul 2023 02:40:06 -0400
X-MC-Unique: e-kvfe7mMPqElojSLbRHJw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A6568894EC7;
	Wed, 26 Jul 2023 06:40:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5031D201EC58;
	Wed, 26 Jul 2023 06:39:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 885F0193F504;
	Wed, 26 Jul 2023 06:39:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 195DD1946589
 for <linux-lvm@listman.corp.redhat.com>; Wed, 26 Jul 2023 02:10:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0ADEB200BA74; Wed, 26 Jul 2023 02:10:43 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0398E200B66C
 for <linux-lvm@redhat.com>; Wed, 26 Jul 2023 02:10:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFD8A857FD1
 for <linux-lvm@redhat.com>; Wed, 26 Jul 2023 02:10:42 +0000 (UTC)
Received: from cstnet.cn (smtp86.cstnet.cn [159.226.251.86]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-627-f6UeaUriMw6s0g6Jx3eH3Q-1; Tue,
 25 Jul 2023 22:10:38 -0400
X-MC-Unique: f6UeaUriMw6s0g6Jx3eH3Q-1
Received: from zhixing$nj.iscas.ac.cn ( [180.110.115.47] ) by
 ajax-webmail-APP-16 (Coremail) ; Wed, 26 Jul 2023 10:02:32 +0800
 (GMT+08:00)
X-Originating-IP: [180.110.115.47]
Date: Wed, 26 Jul 2023 10:02:32 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?56iL5pm65pif?= <zhixing@nj.iscas.ac.cn>
To: linux-lvm@redhat.com
X-Priority: 3
MIME-Version: 1.0
Message-ID: <c63bc8d.3c07c.1898fef021b.Coremail.zhixing@nj.iscas.ac.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: sQCowAD3_4u4fsBkcQ0JAA--.23142W
X-CM-SenderInfo: x2kl5xdqj60y4olvutnvoduhdfq/1tbiBwcECmTAT-GNDgAAsX
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mailman-Approved-At: Wed, 26 Jul 2023 06:33:19 +0000
Subject: [linux-lvm] Problems encountered in compiling lvm packages using
 the musl Toolchain
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: nj.iscas.ac.cn
Content-Type: multipart/mixed; boundary="===============8025860389785846273=="

--===============8025860389785846273==
Content-Type: multipart/alternative; 
	boundary="----=_Part_1231231_336732323.1690336952858"

------=_Part_1231231_336732323.1690336952858
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

aGnvvIxmcmllbmTvvJoKCkkgZW5jb3VudGVyZWQgdGhlIGZvbGxvd2luZyBwcm9ibGVtcyB3aGVu
IGNvbXBpbGluZyBsdm0gcGFja2FnZXMgdXNpbmcgdGhlIG11c2wgVG9vbGNoYWluOgoKUXVlc3Rp
b24gMSDvvJoKCgp8IHZnaW1wb3J0ZGV2aWNlcy5jOiBJbiBmdW5jdGlvbiAndmdpbXBvcnRkZXZp
Y2VzJzoKfCB2Z2ltcG9ydGRldmljZXMuYzoxNDg6MzA6IGVycm9yOiAnTE9DS19FWCcgdW5kZWNs
YXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pOyBkaWQgeW91IG1lYW4gJ0xPQ0tFRCc/
CnwgICAxNDggfCAgaWYgKCFsb2NrX2RldmljZXNfZmlsZShjbWQsIExPQ0tfRVgpKSB7CnwgICAg
ICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn4KfCAgICAgICB8ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgTE9DS0VECnwgdmdpbXBvcnRkZXZpY2VzLmM6MTQ4OjMw
OiBub3RlOiBlYWNoIHVuZGVjbGFyZWQgaWRlbnRpZmllciBpcyByZXBvcnRlZCBvbmx5IG9uY2Ug
Zm9yIGVhY2ggZnVuY3Rpb24gaXQgYXBwZWFycyBpbgoKQWJvdXQgTE9DS19FWCBkZWZpbml0aW9u
IGlzIGluIGZpbGUuaCwgSSBjYW4gY29tcGlsZSB0aGlzIHBhY2thZ2UgYnkgYWRkaW5nIHRoaXMg
SGVhZGVyIGZpbGUgaW4gdmdpbXBvcnRkZXZpY2VzLmM6CgojaW5jbHVkZSA8c3lzL2ZpbGUuaD4K
CkNvdWxkIHlvdSBhZGQgdGhpcyBIZWFkZXIgZmlsZSB0byBvdXIgc291cmNlIGNvZGUgdG8gZml4
IHRoaXMgcHJvYmxlbSBvciBkbyB5b3UgaGF2ZSBhIGJldHRlciBzb2x1dGlvbj8KCgoKCkxvb2tp
bmcgZm9yd2FyZCB0byB5b3VyIHJlcGx5IQoKCgoKCg==
------=_Part_1231231_336732323.1690336952858
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PHAgc3R5bGU9ImZvbnQtZmFtaWx5OlNpbVN1bjsiPgoJaGnvvIxmcmllbmTvvJoKPC9wPgo8cCBz
dHlsZT0iZm9udC1mYW1pbHk6U2ltU3VuOyI+Cgk8c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6U2lt
U3VuOyI+SSBlbmNvdW50ZXJlZCB0aGUgZm9sbG93aW5nIHByb2JsZW1zIHdoZW4gY29tcGlsaW5n
IGx2bSBwYWNrYWdlcyB1c2luZyB0aGUgbXVzbCBUb29sY2hhaW46PC9zcGFuPgo8L3A+CjxwIHN0
eWxlPSJmb250LWZhbWlseTpTaW1TdW47Ij4KCTxzcGFuIHN0eWxlPSJmb250LWZhbWlseTpTaW1T
dW47Ij5RdWVzdGlvbiAxIO+8mjxicj4KPC9zcGFuPgo8L3A+CjxwIHN0eWxlPSJmb250LWZhbWls
eTpTaW1TdW47Ij4KCXwgdmdpbXBvcnRkZXZpY2VzLmM6IEluIGZ1bmN0aW9uICd2Z2ltcG9ydGRl
dmljZXMnOjxicj4KfCB2Z2ltcG9ydGRldmljZXMuYzoxNDg6MzA6IGVycm9yOiAnTE9DS19FWCcg
dW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pOyBkaWQgeW91IG1lYW4gJ0xP
Q0tFRCc/PGJyPgp8Jm5ic3A7ICZuYnNwOzE0OCB8Jm5ic3A7IGlmICghbG9ja19kZXZpY2VzX2Zp
bGUoY21kLCBMT0NLX0VYKSkgezxicj4KfCZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwO3wmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyBefn5+fn5+PGJyPgp8
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7fCZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7IExPQ0tFRDxicj4KfCB2Z2ltcG9ydGRldmljZXMuYzoxNDg6MzA6
IG5vdGU6IGVhY2ggdW5kZWNsYXJlZCBpZGVudGlmaWVyIGlzIHJlcG9ydGVkIG9ubHkgb25jZSBm
b3IgZWFjaCBmdW5jdGlvbiBpdCBhcHBlYXJzIGluCjwvcD4KPHAgc3R5bGU9ImZvbnQtZmFtaWx5
OlNpbVN1bjsiPgoJQWJvdXQgTE9DS19FWCBkZWZpbml0aW9uIGlzIGluIGZpbGUuaCwgSSBjYW4g
Y29tcGlsZSB0aGlzIHBhY2thZ2UgYnkgYWRkaW5nIHRoaXMgSGVhZGVyIGZpbGUgaW4gPHNwYW4g
c3R5bGU9ImZvbnQtZmFtaWx5OlNpbVN1bjt0ZXh0LXdyYXA6d3JhcDsiPnZnaW1wb3J0ZGV2aWNl
cy5jOjwvc3Bhbj4KPC9wPgo8cCBzdHlsZT0iZm9udC1mYW1pbHk6U2ltU3VuOyI+CgkjaW5jbHVk
ZSAmbHQ7c3lzL2ZpbGUuaCZndDsKPC9wPgo8cCBzdHlsZT0iZm9udC1mYW1pbHk6U2ltU3VuOyI+
CjwvcD4KPHAgc3R5bGU9ImZvbnQtZmFtaWx5OlNpbVN1bjsiPgoJQ291bGQgeW91IGFkZCB0aGlz
IEhlYWRlciBmaWxlIHRvIG91ciBzb3VyY2UgY29kZSB0byBmaXggdGhpcyBwcm9ibGVtIG9yIGRv
IHlvdSBoYXZlIGEgYmV0dGVyIHNvbHV0aW9uPwo8L3A+CjxwIHN0eWxlPSJmb250LWZhbWlseTpT
aW1TdW47Ij4KCTxicj4KPC9wPgo8cCBzdHlsZT0iZm9udC1mYW1pbHk6U2ltU3VuOyI+CglMb29r
aW5nIGZvcndhcmQgdG8geW91ciByZXBseSEKPC9wPgo8cCBzdHlsZT0iZm9udC1mYW1pbHk6U2lt
U3VuOyI+Cgk8YnI+Cgk8L3A+PGRpdj4KCQk8YnI+Cgk8L2Rpdj4KPHA+PC9wPg==
------=_Part_1231231_336732323.1690336952858--

--===============8025860389785846273==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============8025860389785846273==--

