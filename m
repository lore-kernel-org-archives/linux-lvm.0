Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 510F7C77B61
	for <linux-lvm@archiver.kernel.org>; Sun,  9 Apr 2023 18:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681066425;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CRIV/gEPJ4OVOxAmICPpIDl+e05K/k5HAt1+zXARc+g=;
	b=BuDPGwMQjOaY5d3phKyKa7vdSxI/NYdA9gRVi2xy6JkwddvQh4NAI3tviSt/mcam+WUNUc
	dbUwS3Dvws3Ckx8qPzGdfINXcSZBsQQdWpuFErdbIxR/z7+TdqvjUBHX/eS/MliGAwPQds
	sA95GIkmDtv3uH2cu0K0EUC+iveVdww=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-EAEZcWITOu6dhM2UktcmbQ-1; Sun, 09 Apr 2023 14:53:43 -0400
X-MC-Unique: EAEZcWITOu6dhM2UktcmbQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E978E101A531;
	Sun,  9 Apr 2023 18:53:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EAC63492C14;
	Sun,  9 Apr 2023 18:53:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 71CEE19465A3;
	Sun,  9 Apr 2023 18:53:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EACC71946586
 for <linux-lvm@listman.corp.redhat.com>; Sun,  9 Apr 2023 18:53:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 21A5F40C20FA; Sun,  9 Apr 2023 18:53:23 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 19B3240C83A9
 for <linux-lvm@redhat.com>; Sun,  9 Apr 2023 18:53:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F300B185A78B
 for <linux-lvm@redhat.com>; Sun,  9 Apr 2023 18:53:22 +0000 (UTC)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-78-61vypbRRMKKtcl7Sbx0taQ-1; Sun, 09 Apr 2023 14:53:21 -0400
X-MC-Unique: 61vypbRRMKKtcl7Sbx0taQ-1
Received: by mail-ua1-f50.google.com with SMTP id x10so4311553uau.3
 for <linux-lvm@redhat.com>; Sun, 09 Apr 2023 11:53:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681066400;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1p2Ff5oXykaRNJ11ZeRpmyGh/dW/Lfn0vQU7VoFAW8s=;
 b=VrNRKZvE8oGx5QKkKHrjc1GVwKzYMrbIbVLVAkhrIgIp/dcC5NBAbDULjJ92feFLFR
 EML8D8YFLNMtd/yNY21sCEAAfddzrYJYWtbJqFB/OK69dp+oAxEK0ZWGgcBtYXCTxucf
 Mv8WxTjMDE/josRXz8yKLURNeeIxJoC3T6ewefHMh7VLcNzzmDvoisy9APbmTsVqHIoW
 7aAw7xyi9IZ1k3of1W5TmoBRMR6FKU/eOqF4yc9BXaQL9QdYqkAohS2jw8ukhQDRwaL6
 dnkVPvRnFyshsgbWcVfmB16iyIDcQ/oR9q/SgXS2rUZu2i77EVEQNW+U4Yfhr0qBc5b3
 ZK2w==
X-Gm-Message-State: AAQBX9eXF8viWDgILCPmc8AH3rCbF41VVw2U/+Vb5yLdSH/UzbPn02o3
 JdXoKwaUIR7WpMe+anRI5JxJ6iV3aNMxFaP8bNY=
X-Google-Smtp-Source: AKy350YhkDUpM6SobvxYb+S+w/TTS9eiY3I/XlluJxyW7fuhhNCuQb+Pq0WwFv0g3Zdps+lQP5LPqRDHeDHSyqlvITI=
X-Received: by 2002:a1f:9e52:0:b0:43b:ce2e:89f5 with SMTP id
 h79-20020a1f9e52000000b0043bce2e89f5mr4671405vke.3.1681066400403; Sun, 09 Apr
 2023 11:53:20 -0700 (PDT)
MIME-Version: 1.0
References: <4649980a-7af2-5b2e-47de-ce88ccb8ac6f@web.de>
 <CAAMCDefZC-J7Nc0H45e_EmqkRDr8ZjpOn-JvNWyBzExh8TaCsg@mail.gmail.com>
 <845e5b45-42d5-3d7f-bdad-a66ce7a2e5a9@web.de>
In-Reply-To: <845e5b45-42d5-3d7f-bdad-a66ce7a2e5a9@web.de>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Sun, 9 Apr 2023 13:53:08 -0500
Message-ID: <CAAMCDedPAgGgVd4FdkWyfWfu_aqWtUtEbFvevXiJE90UzmYEcA@mail.gmail.com>
To: Roland <devzero@web.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [linux-lvm] bug? shrink lv by specifying pv extent to be
 removed does not behave as expected
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
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gU3VuLCBBcHIgOSwgMjAyMyBhdCAxOjIx4oCvUE0gUm9sYW5kIDxkZXZ6ZXJvQHdlYi5kZT4g
d3JvdGU6Cj4KPiA+IFdlbGwsIGlmIHRoZSBMViBpcyBiZWluZyB1c2VkIGZvciBhbnl0aGluZyBy
ZWFsLCB0aGVuIEkgZG9uJ3Qga25vdyBvZgo+ID4gYW55dGhpbmcgd2hlcmUgeW91IGNvdWxkIHJl
bW92ZSBhIGJsb2NrIGluIHRoZSBtaWRkbGUgYW5kIHN0aWxsIGhhdmUgYQo+ID4gd29ya2luZyBm
cy4gICBZb3UgY2FuIG9ubHkgcmVkdWNlIGZzJ2VzICh0aGUgb25lcyB0aGF0IHlvdSBjYW4gcmVk
dWNlKQo+ID4gYnkgcmVkdWNpbmcgb2ZmIG9mIHRoZSBlbmQgYW5kIG1ha2luZyBpdCBzbWFsbGVy
Lgo+Cj4geWVzLCB0aGF0J3MgY2xlYXIgdG8gbWUuCj4KPiA+IEl0IG1ha2VzIHplcm8gc2Vuc2Ug
dG8gYmUgYWJsZSB0byByZW1vdmUgYSBibG9jayBpbiB0aGUgbWlkZGxlIG9mIGEgTFYKPiA+IHVz
ZWQgYnkganVzdCBhYm91dCBldmVyeXRoaW5nIHRoYXQgdXNlcyBMVidzIGFzIG5vdGhpbmcgc3Vw
cG9ydHMgYmVpbmcKPiA+IGFibGUgdG8gcmVtb3ZlIGEgYmxvY2sgaW4gdGhlIG1pZGRsZS4KPgo+
IHllcywgdGhhdCBjcml0aWNzIGlzIHRvdGFsbHkgdmFsaWQuIGZyb20gYSBmcyBwb2ludCBvZiB2
aWV3IHlvdSBjb21wbGV0ZWx5Cj4gY29ycnVwdCAgdGhlIHZvbHVtZSwgdGhhdCdzIGNsZWFyIHRv
IG1lLgo+Cj4gPiBXaGF0IGlzIHlvdXIgdXNlIGNhc2UgdGhhdCB5b3UgYmVsaWV2ZSByZW1vdmlu
ZyBhIGJsb2NrIGluIHRoZSBtaWRkbGUKPiA+IG9mIGFuIExWIG5lZWRzIHRvIHdvcms/Cj4KPiBt
eSB1c2UgY2FzZSBpcyBjcmVhdGluZyBzb21lIGJhZGJsb2NrcyBzY3JpcHQgd2l0aCBsdm0gd2hp
Y2ggaW50ZWxsaWdlbnRseQo+IGhhbmRsZXMgYW5kIHNraXBzIGJyb2tlbiBzZWN0b3JzIG9uIGRp
c2tzIHdoaWNoIGNhbid0IGJlIHVzZWQgb3RoZXJ3aXNlLi4uCj4KPiBteSBwbGFuIGlzIHRvIHNj
YW4gYSBkaXNrIGZvciB1c2FibGUgc2VjdG9ycyBhbmQgbWFwIHRoZSBsb2dpY2FsIHZvbHVtZQo+
IGFyb3VuZCB0aGUgYnJva2VuIHNlY3RvcnMuCj4KPiB3aGVuZXZlciBtb3JlIHNlY3RvcnMgZ2V0
IGJyb2tlbiwgaSdkIGxpa2UgdG8gcmVtb3ZlIHRoZSBicm9rZW4gb25lcyB0byBoYXZlCj4gYSB1
c2FibGUgbHYgd2l0aG91dCBicm9rZW4gc2VjdG9ycy4KPgo+IHNpbmNlIHlvdSBuZWVkIHRvIHJl
YnVpbGQgeW91ciBkYXRhIGFueXdheSBmb3IgdGhhdCBkaXNrLCB5b3UgY2FuIGFsc28KPiByZWNy
ZWF0ZSB0aGUgd2hvbGUgbG9naWNhbCB2b2x1bWUuCj4KPiBteSBxdWVzdGlvbiBhbmQgbXkgcHJv
amVjdCBpcyBhIGxpdHRsZSBiaXQgYWNhZGVtaWMuIGknZCBzaW1wbHkgd2FudCB0byB0cnkKPiBv
dXQgaG93IG11Y2ggdXNlIHlvdSBjYW4gaGF2ZSBmcm9tIHNvbWUgZGVhZCBkaXNrcyB3aGljaCBh
cmUgdHJhc2ggb3RoZXJ3aXNlLi4uCj4KPgo+IHRoZSBtYW5wYWdlIGlzIHRlbGxpbmcgdGhpczoK
Pgo+Cj4gICAgICAgICBSZXNpemUgYW4gTFYgYnkgc3BlY2lmaWVkIFBWIGV4dGVudHMuCj4KPiAg
ICAgICAgIGx2cmVzaXplIExWIFBWIC4uLgo+ICAgICAgICAgICAgIFsgLXJ8LS1yZXNpemVmcyBd
Cj4gICAgICAgICAgICAgWyBDT01NT05fT1BUSU9OUyBdCj4KPgo+Cj4gc28sIHRoYXQgc291bmRz
IGxpa2UgdGhhdCBpIGNhbiByZXNpemUgaW4gYW55IGRpcmVjdGlvbiBieSBzcGVjaWZ5aW5nIGV4
dGVudHMuCj4KPgo+ID4gTm93IGlmIHlvdSByZWFsbHkgbmVlZCB0byByZW1vdmUgYSBzcGVjaWZp
YyBibG9jayBpbiB0aGUgbWlkZGxlIG9mIHRoZQo+ID4gTFYgdGhlbiB5b3UgYXJlIGxpa2VseSBn
b2luZyB0byBuZWVkIHRvIHVzZSBwdm1vdmUgd2l0aCBzcGVjaWZpYwo+ID4gYmxvY2tzIHRvIHJl
cGxhY2UgdGhvc2UgYmxvY2tzIHdpdGggc29tZXRoaW5nIGVsc2UuCj4KPiB5ZXMsIHB2bW92ZSBp
cyB0aGUgb3RoZXIgYXBwcm9hY2ggZm9yIHRoYXQuCj4KPiBidXQgd2lsbCBwdm1vdmUgY29udGlu
dWUvZmluaXNoIGJ5IGFsbCBtZWFucyB3aGVuIG1vdmluZyBleHRlbnRzIGxvY2F0ZWQgb24gYQo+
IGJhZCBzZWN0b3IgPwo+Cj4gdGhlIGRhdGEgbWF5IGJlIGNvcnJ1cHRlZCBhbnl3aHksIHNvIGkg
dGhvdWdodCBpdCdzIGJldHRlciB0byBza2lwIGl0Lgo+Cj4gd2hhdCBpJ20gcmVhbGx5IGFmdGVy
IGlzIHNvbWUgInJlbWFwIGEgcGh5c2ljYWwgZXh0ZW50IHRvIGEgaGVhbHR5L3Jlc2VydmVkCj4g
c2VjdGlvbiBhbmQgbGV0IHpmcyBzZWxmaGVhbCBkbyB0aGUgcmVzdCIuICBqdXN0IGxpa2UgImRp
c21pc3MgdGhlIHByb2JsZW1hdGljCj4gZXh0ZW50cyBhbmQgcmVwbGFjZSB3aXRoIGhlYWx0aHkg
ZXh0ZW50cyIuCj4KPiBpJ2QgYmV0dGVyIGxpa2UgcmVtYXBwaW5nIGluc3RlYWQgb2YgcmVtb3Zp
bmcgYSBQRSwgYXMgcmVtb3Zpbmcgd2lsbCBpbnZhbGlkYXRlCj4gdGhlIHdob2xlIExWLi4uLgo+
Cj4gcm9sYW5kCj4KCgpDcmVhdGUgYW4gTFYgcGVyIGRldmljZSwgYW5kIHdoZW4gdGhlIGRldmlj
ZSBpcyByZXBsYWNlZCB0aGVuIGx2cmVtb3ZlCnRoZSBkZXZpY2VzIGxpc3QuICBPbmNlIGEgc2Vj
dG9yL2FyZWEgaXMgYmFkIEkgd291bGQgbm90IHRydXN0IHRoZQpzZWN0b3JzIHVudGlsIHlvdSBy
ZXBsYWNlIHRoZSBkZXZpY2UuICBZb3UgbWF5IGJlIGFibGUgdG8gdHJ5IHRoZQpwdm1vdmUgbXVs
dGlwbGUgdGltZXMgYW5kIHRoZSBkaXNrIG1heSBiZSBhYmxlIHRvIGV2ZW50dWFsbHkgcmVidWls
ZAp0aGUgZGF0YS4KCk15IGV4cGVyaWVuY2Ugd2l0aCBiYWQgc2VjdG9ycyBpcyBvbmNlIGl0IHJl
cG9ydHMgYmFkIHRoZSBkaXNrcyB3aWxsCm9mdGVuIHJld3JpdGUgaXQgYXQgdGhlIHNhbWUgbG9j
YXRpb24gYW5kIGNhbGwgaXQgImdvb2QiIHdoZW4gaXQgaXMKZ29pbmcgdG8gcmVwb3J0IGJhZCBh
Z2FpbiBhbG1vc3QgaW1tZWRpYXRlbHksIG9yIGJlIGEgdXNlbGVzc2x5IHNsb3cKc2VjdG9yLiAg
IFNvbWV0aW1lcyBpdCB3aWxsIHJlcGxhY2UgdGhlIHNlY3RvciBvbiBhCnJlLXdyaXRlL3N1Y2Nl
c3NmdWwgcmVhZCBidXQgdGhhdCBzZWVtcyB1bnJlbGlhYmxlLgoKT24gbm9uLXpmcyBmcydlcyBJ
IGhhdmUgZm91bmQgdGhlICJiYWQiIGZpbGUgYW5kIHJlbmFtZWQgaXQKYmFkZmlsZS4jIyMjIGFu
ZCBwdXQgaXQgaW4gYSBkaXIgY2FsbGVkIGJhZGJsb2Nrcy4gIFNvIGxvbmcgYXMgdGhlIGJhZApi
bG9jayBpcyBpbiB0aGUgZmlsZSBkYXRhIHRoZW4geW91IGNhbiBjb250YWluIHRoZSBiYWRibG9j
ayBieQpjb250YWluaW5nIHRoZSBiYWQgZmlsZS4gICBBbmQgc2luY2UgbW9zdCBvZiB0aGUgZGlz
ayB3aWxsIGJlIGZpbGUKZGF0YSB0aGF0IHNob3VsZCBhbHNvIGJlIGEgbWFuYWdlbWVudCBzY2hl
bWUgbm90IHJlcXVpcmluZyBhIGZzCnJlYnVpbGQuCgpUaGUgcmUtd3JpdHRlbiBzZWN0b3IgbWF5
IGFsc28gYmUgInNsb3ciIGFuZCBpdCBtaWdodCBiZSB3aXNlIHRvIHRyZWF0CnRob3NlIHNlY3Rv
cnMgYXMgYmFkLCBhbmQgaW4gdGhlICJzbG93IiBzZWN0b3IgY2FzZSBwdm1vdmUgc2hvdWxkCmFj
dHVhbGx5IHdvcmsuICBGb3IgdGhhdCB5b3Ugd291bGQgbmVlZCBhIGJhZGJsb2NrcyB0aGF0ICJ0
aW1lZCIgdGhlCnJlYWRzIHRvIGRpc2sgYW5kIHRyZWF0cyBhbnkgc2VjdG9yIHRha2luZyBsb25n
ZXIgdGhhdCBldmVuIHNheSAuMjUKc2Vjb25kcyBhcyBzbG93L2JhZC4gICBBdCA1NDAwIHJwbSwg
LjI1LzI1MG1zIHRyYW5zbGF0ZXMgdG8gYXJvdW5kIDIyCmZhaWxlZCByZS1yZWFkIHRyaWVzLiAg
IElmIHlvdSB0aW1lIGl0IHlvdSBtYXkgaGF2ZSB0byBkbyBzb21lIHRlc3RpbmcKb24gdGhlIGVu
dGlyZSBncm91cCBvZiByZWFkcyBpbiBzbWFsbGVyIGFsaWduZWQgc2VjdG9ycyB0byBmaWd1cmUg
b3V0CndoaWNoIHNlY3RvciBpbiB0aGUgbWFpbiByZWFkIHdhcyBiYWQuICBJZiB5b3Ugc2Nhbm5l
ZCBvZnRlbiBlbm91Z2gKZm9yIHNsb3dzIHlvdSBtaWdodCBjYXRjaCB0aGVtIGJlZm9yZSB0aGV5
IGFyZSBjb21wbGV0ZWx5IGJhZC4KVGVjaG5pY2FsbHkgdGhlIGRpc2sgaXMgc3VwcG9zZWQgdG8g
ZG8gdGhhdCBvbiBpdHMgc2NhbnMsIGJ1dCBldmVuCndoZW4gSSBoYXZlIHR1cm5lZCB0aGUgc2Nh
bnMgdXAgdG8gZGFpbHkgaXQgZG9lcyBub3Qgc2VlbSB0byBhY3QKcmlnaHQuCgpBbmQgSSBoYXZl
IHVzdWFsbHkgZm91bmQgdGhhdCB0aGUgYmFkICJ1bml0cyIgYXJlIDggdW5pdHMgb2YgOAo1MTIt
Ynl0ZSBzZWN0b3JzIGZvciBhIHRvdGFsIG9mIGFyb3VuZCAzMmsgKGFsaWduZWQgb24gdGhlIGRp
c2spLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtbHZtIG1haWxpbmcgbGlzdApsaW51eC1sdm1AcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4u
cmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWx2bQpyZWFkIHRoZSBMVk0gSE9XLVRP
IGF0IGh0dHA6Ly90bGRwLm9yZy9IT1dUTy9MVk0tSE9XVE8vCg==

