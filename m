Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54995E7B60F
	for <linux-lvm@archiver.kernel.org>; Wed,  4 Oct 2023 13:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696425525;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sIXWtbaQ2mdsUqJrVZhPFKAF844Snhro3BjvPYRAnS0=;
	b=a8LQEXwUG349nuIWPUhFcfMz5DqBUURuq7rgKHz7xDsK5eF+mhgEp6Q+b4LijiLPEb2g9t
	7PX4scPbrxVxgF8xDeUjfG4lqNsqv4xy6Azhsr57DhE7OV9UH6KujWTNANQZI6lBRSC36y
	pOPiFPoWElZg2k8ZDCDDyEFEtbWDHYM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-101-uPWKA3tlOiGFSSiV13eVYA-1; Wed, 04 Oct 2023 09:18:41 -0400
X-MC-Unique: uPWKA3tlOiGFSSiV13eVYA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25DCA2823809;
	Wed,  4 Oct 2023 13:18:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 91F8440C6EC1;
	Wed,  4 Oct 2023 13:18:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4474E1946597;
	Wed,  4 Oct 2023 13:18:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9DD26194658D
 for <linux-lvm@listman.corp.redhat.com>; Wed,  4 Oct 2023 13:18:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6BFBA47CD2; Wed,  4 Oct 2023 13:18:19 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 64ADE440E3
 for <linux-lvm@redhat.com>; Wed,  4 Oct 2023 13:18:19 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 46DBA3C1477B
 for <linux-lvm@redhat.com>; Wed,  4 Oct 2023 13:18:19 +0000 (UTC)
Received: from vps.thesusis.net (vps.thesusis.net [34.202.238.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-220-cXpEFWDzPumouPXNdXBgOg-1; Wed,
 04 Oct 2023 09:18:17 -0400
X-MC-Unique: cXpEFWDzPumouPXNdXBgOg-1
Received: by vps.thesusis.net (Postfix, from userid 1000)
 id E531C13E0E2; Wed,  4 Oct 2023 09:18:16 -0400 (EDT)
From: Phillip Susi <phill@thesusis.net>
To: "Brian J. Murrell" <brian@interlinx.bc.ca>, linux-lvm@redhat.com
In-Reply-To: <d6e03767fe9d155812fc1d6f1e13c1c64f0391d7.camel@interlinx.bc.ca>
References: <d667deb919722b147b4f78b3e00a6ce22a575f44.camel@interlinx.bc.ca>
 <87pm1wn9j0.fsf@vps.thesusis.net>
 <f510c5de56008c4c74a7d22f267ab2f8e2f37c96.camel@interlinx.bc.ca>
 <87v8boviwj.fsf@vps.thesusis.net>
 <800e8363150ab830a3b2514e3133794e088d242f.camel@interlinx.bc.ca>
 <878r8ksihe.fsf@vps.thesusis.net>
 <d6e03767fe9d155812fc1d6f1e13c1c64f0391d7.camel@interlinx.bc.ca>
Date: Wed, 04 Oct 2023 09:18:16 -0400
Message-ID: <87wmw2le5j.fsf@vps.thesusis.net>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: thesusis.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

IkJyaWFuIEouIE11cnJlbGwiIDxicmlhbkBpbnRlcmxpbnguYmMuY2E+IHdyaXRlczoKCj4gU28g
anVzdCB0byBjb25maXJtLCBnaXZlbjoKPgo+IHNkYyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIDg6MzIgICAwICAgMy43VCAgMCBkaXNrICAKPiDilJTilIBtZDAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgOTowICAgIDAgICAzLjdU
ICAwIHJhaWQxIAo+ICAg4pSc4pSAYmFja3Vwcy1iYWNrdXBzICAgICAgICAgICAgICAgICAgICAg
ICAgICAgMjUzOjEzICAgMCAgIDIuNVQgIDAgbHZtICAgLy5zbmFwc2hvdHMKPiAgIOKUnOKUgGJh
Y2t1cHMtYm9yZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDI1MzoxNCAgIDAgICAzMDBH
ICAwIGx2bSAgIAo+ICAg4pSU4pSAYmFja3Vwcy12ZG8tLXRlc3QgICAgICAgICAgICAgICAgICAg
ICAgICAgMjUzOjE1ICAgMCAgIDcwMEcgIDAgbHZtICAgCj4gICAgIOKUlOKUgHZkby1iYWNrdXBz
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAyNTM6NzMgICAwICAgMS44VCAgMCB2ZG8gICAK
PiBzZGQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA4OjQ4ICAg
MCAgIDMuN1QgIDAgZGlzayAgCj4g4pSU4pSAbWQxICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIDk6MSAgICAwICAgMy43VCAgMCByYWlkMSAKPiAgIOKUlOKUgGx1a3Mt
YmFja3VwICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDI1Mzo0MCAgIDAgICAzLjdUICAw
IGNyeXB0IAo+Cj4gSSB3YW50IHRvIGRvOgo+Cj4gIyBwdmNyZWF0ZSAvZGV2L21hcHBlci9sdWtz
LWJhY2t1cAo+ICMgdmdleHRlbmQgYmFja3VwcyAvZGV2L21hcHBlci9sdWtzLWJhY2t1cAo+ICMg
cHZtb3ZlIC9kZXYvbWQwIC9kZXYvbHVrcy1iYWNrdXAKPiAjIHZncmVkdWNlIGJhY2t1cHMgL2Rl
di9tZDAKPiAjIG1kYWRtIC0tc3RvcCAvZGV2L21kMAo+ICMgbWRhZG0gLS16ZXJvLXN1cGVyYmxv
Y2tzIC9kZXYvc2RjCj4gIyBtZGFkbSAvZGV2L21kMSAtLWFkZCAvZGV2L3NkYwo+Cj4gQ29ycmVj
dD8KClllcC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWx2bSBtYWlsaW5nIGxpc3QKbGludXgtbHZtQHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0
bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1sdm0KcmVhZCB0aGUgTFZNIEhP
Vy1UTyBhdCBodHRwOi8vdGxkcC5vcmcvSE9XVE8vTFZNLUhPV1RPLwo=

