Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8381EE7491F
	for <linux-lvm@archiver.kernel.org>; Mon,  2 Oct 2023 21:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696280489;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=q+WSu2x/mIz7TbFvgxJUpKWb0vYma6PI4aKki23lIvU=;
	b=JTHoCQQbSHWrqgr8i/7Z9/wqVLgxd0ID2ErPV8PfgxeItjkBGH8gS22K8eQ90ovzZ61/EA
	Nsj4V0fO8O5skvun5UzW9GDLKbdhn9f557UqiIbyP5ItkWDNzaXv4azGZE2amNjmGF2IOc
	XEJow/nyfW1W6PcPyfgjXnv7ANhJxf4=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-p-N5ENppNnSLtWRYN8b1PQ-1; Mon, 02 Oct 2023 17:01:26 -0400
X-MC-Unique: p-N5ENppNnSLtWRYN8b1PQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3135D1C2B675;
	Mon,  2 Oct 2023 21:01:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CFEC610CD76B;
	Mon,  2 Oct 2023 21:01:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7C64C19465A2;
	Mon,  2 Oct 2023 21:01:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 129FD1946595
 for <linux-lvm@listman.corp.redhat.com>; Mon,  2 Oct 2023 21:01:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D1803C03293; Mon,  2 Oct 2023 21:01:17 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C9A3CC15BB8
 for <linux-lvm@redhat.com>; Mon,  2 Oct 2023 21:01:17 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5C503C23644
 for <linux-lvm@redhat.com>; Mon,  2 Oct 2023 21:01:17 +0000 (UTC)
Received: from vps.thesusis.net (vps.thesusis.net [34.202.238.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-356-YbCkWnQbOZePgXZu2aEWng-1; Mon,
 02 Oct 2023 17:01:00 -0400
X-MC-Unique: YbCkWnQbOZePgXZu2aEWng-1
Received: by vps.thesusis.net (Postfix, from userid 1000)
 id 522B013C98F; Mon,  2 Oct 2023 17:01:00 -0400 (EDT)
References: <d667deb919722b147b4f78b3e00a6ce22a575f44.camel@interlinx.bc.ca>
 <87pm1wn9j0.fsf@vps.thesusis.net>
 <f510c5de56008c4c74a7d22f267ab2f8e2f37c96.camel@interlinx.bc.ca>
User-agent: mu4e 1.7.12; emacs 27.1
From: Phillip Susi <phill@thesusis.net>
To: "Brian J. Murrell" <brian@interlinx.bc.ca>
Date: Mon, 02 Oct 2023 16:48:38 -0400
In-reply-to: <f510c5de56008c4c74a7d22f267ab2f8e2f37c96.camel@interlinx.bc.ca>
Message-ID: <87v8boviwj.fsf@vps.thesusis.net>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
Cc: linux-lvm@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: thesusis.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

CiJCcmlhbiBKLiBNdXJyZWxsIiA8YnJpYW5AaW50ZXJsaW54LmJjLmNhPiB3cml0ZXM6Cgo+IEJl
Y2F1c2UgSSBuZWVkIHRvIGFkZCBhbm90aGVyIG1lbWJlciB0byB0aGUgYXJyYXkgdGhhdCBpcyBq
dXN0IHNsaWdodGx5Cj4gc21hbGxlciB0aGFuIHRoZSBleGlzdGluZyBhcnJheS4gIEl0J3MgdGhl
IHNhbWUgc2l6ZWQgZGlzayBhcyB3aGF0J3MgaW4KPiB0aGUgYXJyYXkgY3VycmVudGx5IGJ1dCBp
cyBpdHNlbGYgYW4gTUQgYXJyYXkgd2l0aCBsdWtzLCB3aGljaCBpcwo+IHJlc2VydmluZyBpdCdz
IG93biBtZXRhZGF0YSByZWdpb24gZnJvbSB0aGUgdG90YWwgZGlzayBtYWtpbmcgaXQKPiBzbGln
aHRseSBzbWFsbGVyLgoKWW91IHdhbnQgdG8gcHV0IGFuIE1EIGFycmF5IGluc2lkZSBvZiBhbm90
aGVyIE1EIGFycmF5PyAgV2h5PwoKPiBTbyB5ZXMsIHVsdGltYXRlbHkgSSBhbSBnb2luZyB0byBo
YXZlIGJvdGggYW4gZW5jcnlwdGVkIGFuZCB1bmVuY3J5cHRlZAo+IG1lbWJlciBvZiB0aGlzIHJh
aWQtMSBhcnJheS4gIEF0IGxlYXN0IHVudGlsIHRoZSBlbmNyeXB0ZWQgbWVtYmVyIGlzCj4gYWRk
ZWQgYW5kIHRoZW4gSSB3aWxsIHJlbW92ZSB0aGUgdW5lbmNyeXB0ZWQgbWVtYmVyIGFuZCBhZGQg
aXQgdG8gdGhlCj4gbHVrcyBlbmNyeXB0ZWQgYXJyYXkuCj4KPiBUaGUgZ2VuZXJhbCBpZGVhIGlz
IHRvIChzYWZlbHkgLS0gYXMgaW4gYmUgYWJsZSB0byBhY2hpZXZlIGluIHNwZWNpZmljCj4gc2Vw
ZWFyYXRlIHN0ZXBzIHRoYXQgaGF2ZSBhIGJhY2stb3V0IHBsYW4pIGNvbnZlcnQgYSBub24tZW5j
cnlwdGVkCj4gcmFpZC0xIGFycmF5IGludG8gYW4gZW5jcnlwdGVkIHJhaWQtMSBhcnJheS4KPgo+
IFNvIHdoYXQgSSBoYXZlIHJpZ2h0IG5vdyBpczoKPiBzZGMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICA4OjMyICAgMCAgIDMuN1QgIDAgZGlzayAgCj4g4pSU4pSA
bWQwICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDk6MCAgICAwICAg
My43VCAgMCByYWlkMSAKPiAgIOKUnOKUgGJhY2t1cHMtYmFja3VwcyAgICAgICAgICAgICAgICAg
ICAgICAgICAgIDI1MzoxMyAgIDAgICAyLjVUICAwIGx2bSAgIC8uc25hcHNob3RzCj4gICDilJzi
lIBiYWNrdXBzLWJvcmcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAyNTM6MTQgICAwICAg
MzAwRyAgMCBsdm0gICAKPiAgIOKUlOKUgGJhY2t1cHMtdmRvLS10ZXN0ICAgICAgICAgICAgICAg
ICAgICAgICAgIDI1MzoxNSAgIDAgICA3MDBHICAwIGx2bSAgIAo+ICAgICDilJTilIB2ZG8tYmFj
a3VwcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMjUzOjczICAgMCAgIDEuOFQgIDAgdmRv
ICAgCj4gc2RkICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgODo0
OCAgIDAgICAzLjdUICAwIGRpc2sgIAo+IOKUlOKUgG1kMSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICA5OjEgICAgMCAgIDMuN1QgIDAgcmFpZDEgCj4gICDilJTilIBs
dWtzLWJhY2t1cCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAyNTM6NDAgICAwICAgMy43
VCAgMCBjcnlwdCAKCkkgd291bGQgc3VnZ2VzdCB0aGF0IHJhdGhlciB0aGFuCgo+IEkgYW0gZ29p
bmcgdG8gcmVkdWNlIHRoZSBzaXplIG9mIG1kMCBzbyB0aGF0IGl0J3MgdGhlIHNhbWUgc2l6ZSBh
cyBtZDEsCj4gdGhlbiBhZGQgbWQxIHRvIG1kMCAoc28geWVzLCBJIHdpbGwgaGF2ZSBhIHJhaWQt
MSBhcnJheSB3aXRoIGEgcmFpZC0xCj4gbWVtYmVyKS4gIFRoZW4gSSBhbSBnb2luZyB0byByZW1v
dmUgbWQwIGZyb20gdGhlIG1kMSBhcnJheSBhbmQgdGhlbiBhZGQKPiBzZGMgdG8gbWQxIHNvIHRo
YXQgbWQwIG5vIGxvbmdlciBleGlzdHMgYW5kIG1kMSBpcyB0aGUgcHJpbWFyeSByYWlkLTEKPiBh
cnJheS4gIElkZWFsbHksIHJlbmFtZSBtZDEgdG8gbWQwIG9uY2UgZG9uZSBidXQgdGhhdCdzIGFl
c3RoZXRpYy4KCkkgd291bGQgc3VnZ2VzdCBpbnN0ZWFkIHRoYXQgeW91IGFkZCB0aGUgbHVrcyB2
b2x1bWUgYXMgYSBuZXcgUFYgdG8geW91cgpWRywgdGhlbiB1c2UgcHZtb3ZlIHRvIG1pZ3JhdGUg
YWxsIG9mIHlvdXIgbG9naWNhbCB2b2x1bWVzIGZyb20gbWQwIHRvCm1kMSwgdGhlbiB2Z3JlZHVj
ZSBtZDAgZnJvbSB0aGUgVkcsIHN0b3AgbWQwLCBtZGFkbSAtLXplcm8tc3VwZXJibG9ja3MKL2Rl
di9zZGMsIHRoZW4gYWRkIHNkYyB0byBtZDEuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1sdm0gbWFpbGluZyBsaXN0CmxpbnV4LWx2bUByZWRo
YXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
bHZtCnJlYWQgdGhlIExWTSBIT1ctVE8gYXQgaHR0cDovL3RsZHAub3JnL0hPV1RPL0xWTS1IT1dU
Ty8K

