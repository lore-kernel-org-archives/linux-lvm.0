Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30516C7EE23
	for <linux-lvm@archiver.kernel.org>; Wed,  1 Mar 2023 22:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677711040;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Sw5A5AQG9G7Bcb9D4B+JAEnp73YfOw3cQ3ocjy8rugs=;
	b=V7rIokNczDqatE+t/Bh/Nt5p79r9IKSaH9dgVEQjaDU/3Mz8DnXDgnUCYNYU+6cTz/iGp1
	WcGpkfW7W1y7oqr/p+55We9oiQhZdJ1AdBJsLzEAXgieFcuFdIBFFi6wkI19CVCTLVoI0q
	zmd77/5+tD5jiP9UNice18bU0hXuFRY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-1IsmFJH7MjKdjFPVPkWpuw-1; Wed, 01 Mar 2023 17:50:38 -0500
X-MC-Unique: 1IsmFJH7MjKdjFPVPkWpuw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A0679803503;
	Wed,  1 Mar 2023 22:50:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3C79D140EBF4;
	Wed,  1 Mar 2023 22:50:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 09F5519452CE;
	Wed,  1 Mar 2023 22:50:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DB77E19472FC
 for <linux-lvm@listman.corp.redhat.com>; Wed,  1 Mar 2023 22:50:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AD251492C18; Wed,  1 Mar 2023 22:50:29 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A5D3C492C14
 for <linux-lvm@redhat.com>; Wed,  1 Mar 2023 22:50:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A694185A78B
 for <linux-lvm@redhat.com>; Wed,  1 Mar 2023 22:50:29 +0000 (UTC)
Received: from zimbra.karlsbakk.net (zimbra.karlsbakk.net [193.29.58.196])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-QKFZxEI9Nted6AqY-ms1dQ-1; Wed, 01 Mar 2023 17:50:27 -0500
X-MC-Unique: QKFZxEI9Nted6AqY-ms1dQ-1
Received: from localhost (localhost.localdomain [IPv6:::1])
 by zimbra.karlsbakk.net (Postfix) with ESMTP id 8A5DB3C1ECB;
 Wed,  1 Mar 2023 23:44:02 +0100 (CET)
Received: from zimbra.karlsbakk.net ([IPv6:::1])
 by localhost (zimbra.karlsbakk.net [IPv6:::1]) (amavisd-new, port 10032)
 with ESMTP id pauE3tNaeBNN; Wed,  1 Mar 2023 23:44:00 +0100 (CET)
Received: from localhost (localhost.localdomain [IPv6:::1])
 by zimbra.karlsbakk.net (Postfix) with ESMTP id B94A13C1ECC;
 Wed,  1 Mar 2023 23:44:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra.karlsbakk.net B94A13C1ECC
X-Virus-Scanned: amavisd-new at zimbra.karlsbakk.net
Received: from zimbra.karlsbakk.net ([IPv6:::1])
 by localhost (zimbra.karlsbakk.net [IPv6:::1]) (amavisd-new, port 10026)
 with ESMTP id AO3XkDuq1Xad; Wed,  1 Mar 2023 23:44:00 +0100 (CET)
Received: from zimbra.karlsbakk.net (localhost.localdomain [127.0.0.1])
 by zimbra.karlsbakk.net (Postfix) with ESMTP id 812973C1ECB;
 Wed,  1 Mar 2023 23:44:00 +0100 (CET)
Date: Wed, 1 Mar 2023 23:44:00 +0100 (CET)
From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
To: linux-lvm <linux-lvm@redhat.com>
Message-ID: <2023967259.761825.1677710640334.JavaMail.zimbra@karlsbakk.net>
MIME-Version: 1.0
X-Originating-IP: [2001:700:710:aa:8000:0:7:29]
Thread-Index: ZdTUH1AWH7tytRkxFIe7d1N9HdMuRA==
Thread-Topic: lvconvert --uncache takes hours
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [linux-lvm] lvconvert --uncache takes hours
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
Cc: Malin Bruland <malin.bruland@pm.me>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgYWxsCgpXb3JraW5nIHdpdGggYSBmcmllbmQncyBtYWNoaW5lLCBpdCBoYXMgbHZtY2FjaGUg
dHVybmVkIG9uIHdpdGggd3JpdGViYWNrLiBUaGlzIGhhcyB3b3JrZWQgd2VsbCwgYnV0IG5vdyBp
dCdzIHVuY2FjaGluZyBhbmQgaXQgdGFrZXMgKmhvdXJzKi4gVGhlIGFtb3VudCBvZiBjYWNoZSB3
YXMgY2hvc2VuIHRvIDEwMEdCIG9uIGFuIFNTRCBub3QgdXNlZCBmb3IgbXVjaCBlbHNlIGFuZCB0
aGUgZGF0YXNldCB0aGF0IGlzIGJlaW5nIGNhY2hlZCwgaXMgYSBSQUlELTYgc2V0IG9mIDEweDJU
QiB3aXRoIFhGUyBvbiB0b3AuIFRoZSBzeXN0ZW0gbWFpbmx5IHdvcmtzIHdpdGggZmlsZSBzZXJ2
aW5nLCBidXQgYWxzbyBoYXMgc29tZSBWTXMgdGhhdCBiZW5lZml0IGZyb20gdGhlIGNhY2hpbmcg
cXVpdGUgYSBiaXQuIEJ1dCB0aGVuIC0gSSB3b25kZXIgLSBob3cgY2FuIGl0IHNwZW5kIGhvdXJz
IGVtcHR5aW5nIHRoZSBjYWNoZSBsaWtlIHRoaXM/IE1vc3Qgd3JpdGUgY2FjaGluZyBJIGtub3cg
b2YgbGFzdCBvbmx5IHNlY29uZHMgb3IgcGVyaGFwcyBpbiByZWFsbHkgd29yc3QgY2FzZSBzY2Vu
YXJpb3MsIG1pbnV0ZXMuIFNpbmNlIHRoaXMgaXMgdGFraW5nIGhvdXJzLCBpdCBsb29rcyB0byBt
ZSBzb21ldGhpbmcgc2hvdWxkIGhhdmUgYmVlbiBmbHVzaGVkIGFnZXMgYWdvLgoKSGF2ZSBJIChv
ciB3ZSkgZG9uZSBzb21ldGhpbmcgdmVyeSBzdHVwaWQgaGVyZSBvciBpcyB0aGlzIHJlYWxseSBo
b3cgaXQncyBzdXBwb3NlZCB0byB3b3JrPwoKVmVubmxpZyBoaWxzZW4KCnJveQotLQpSb3kgU2ln
dXJkIEthcmxzYmFrawooKzQ3KSA5ODAxMzM1NgotLQpJIGFsbCBwZWRhZ29naWtrIGVyIGRldCBl
c3NlbnNpZWx0IGF0IHBlbnN1bSBwcmVzZW50ZXJlcyBpbnRlbGxpZ2liZWx0LiBEZXQgZXIgZXQg
ZWxlbWVudMOmcnQgaW1wZXJhdGl2IGZvciBhbGxlIHBlZGFnb2dlciDDpSB1bm5nw6UgZWtzZXNz
aXYgYW52ZW5kZWxzZSBhdiBpZGlvbWVyIG1lZCB4ZW5vdHlwIGV0eW1vbG9naS4gSSBkZSBmbGVz
dGUgdGlsZmVsbGVyIGVrc2lzdGVyZXIgYWRla3ZhdGUgb2cgcmVsZXZhbnRlIHN5bm9ueW1lciBw
w6Ugbm9yc2suCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1sdm0gbWFpbGluZyBsaXN0CmxpbnV4LWx2bUByZWRoYXQuY29tCmh0dHBzOi8vbGlz
dG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtbHZtCnJlYWQgdGhlIExWTSBI
T1ctVE8gYXQgaHR0cDovL3RsZHAub3JnL0hPV1RPL0xWTS1IT1dUTy8K

