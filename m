Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC63BCCA473
	for <linux-lvm@archiver.kernel.org>; Wed, 15 Jun 2022 05:50:53 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-256-y2GmbAEUP1ePeYblF4dUgA-1; Wed, 15 Jun 2022 01:50:49 -0400
X-MC-Unique: y2GmbAEUP1ePeYblF4dUgA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 624EA1C05EA9;
	Wed, 15 Jun 2022 05:50:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 42F282166B26;
	Wed, 15 Jun 2022 05:50:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 132151947B83;
	Wed, 15 Jun 2022 05:50:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 84877194706D
 for <linux-lvm@listman.corp.redhat.com>; Tue, 14 Jun 2022 10:16:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6CD1D2166B29; Tue, 14 Jun 2022 10:16:26 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 66ADA2166B26
 for <linux-lvm@redhat.com>; Tue, 14 Jun 2022 10:16:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B99A1857F02
 for <linux-lvm@redhat.com>; Tue, 14 Jun 2022 10:16:26 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-365-iw_P3-j8Om61KxlEnrJT8Q-1; Tue, 14 Jun 2022 06:16:23 -0400
X-MC-Unique: iw_P3-j8Om61KxlEnrJT8Q-1
Received: by mail-pf1-f182.google.com with SMTP id z17so8164479pff.7
 for <linux-lvm@redhat.com>; Tue, 14 Jun 2022 03:16:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :to:references:from:in-reply-to:content-transfer-encoding;
 bh=gKPj9JNdXcG87ccXNxVlGkweXuJK7nQ+xElURpPChZI=;
 b=4mLTshkfJwPU9G0dWxgKYlXMyrkKsNVlGtQXF5QnuvYMfgO21gZGzu3SrpyIQQ7H7A
 wuUIZDi87RvVd7GMjSo3px2FC/kUeHQEiolLnG9l3pA7BYPC8H4+6ZMOR9N9nUCzSAe7
 TLB5SfGutFugCHxDD20mnfgTN29TgUlmO+ZFGXgU+UbYjsJUXUxWwlKjrKkhr7KNjIhZ
 yNp02/+wEHzkLboTSJCs1ecvoY/m/WNS8/YBO80d+4u5UuR4g2umypXj1ZGVDJ9NN7Um
 2yjoW4c/gRCK2u3Mle9pR+pdhtSLtz2qKRdxHpppdaaq5OWiLhJJ2+CxYu0At53RqjQG
 xhww==
X-Gm-Message-State: AOAM530VMalRZ6o9IqgO0lRkuOnuZCFJ1ygc3yy7b/hp3tKgo7OwknWa
 FgmO79loxZYbLpZMKLyxo7Il5i6Ss5UBXg==
X-Google-Smtp-Source: ABdhPJx9EAlvan8XIgiDIHYE0LsB/Wy70ZEKBYstwsqO9YuPlg36VnmgrtnM5KUPsMSQjADIvAPhng==
X-Received: by 2002:a05:6a00:179b:b0:51b:f51f:992e with SMTP id
 s27-20020a056a00179b00b0051bf51f992emr4058261pfg.60.1655201781778; 
 Tue, 14 Jun 2022 03:16:21 -0700 (PDT)
Received: from [10.4.113.62] ([139.177.225.233])
 by smtp.gmail.com with ESMTPSA id
 x67-20020a623146000000b0051be16492basm7132890pfx.195.2022.06.14.03.16.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 03:16:21 -0700 (PDT)
Message-ID: <8baee796-9bfb-47a8-1661-7e94437826c9@bytedance.com>
Date: Tue, 14 Jun 2022 18:16:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
To: Gionatan Danti <g.danti@assyoma.it>,
 LVM general discussion and development <linux-lvm@redhat.com>
References: <9c22b11a-b539-1974-7994-6835eea82bfd@bytedance.com>
 <e779f9dc7139963adfa64b03eca170f3@assyoma.it>
From: Zhiyong Ye <yezhiyong@bytedance.com>
In-Reply-To: <e779f9dc7139963adfa64b03eca170f3@assyoma.it>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Mailman-Approved-At: Wed, 15 Jun 2022 05:50:41 +0000
Subject: Re: [linux-lvm] Why is the performance of my lvmthin snapshot so
 poor
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

SGkgR2lvbmF0YW4sCgpUaGFua3MgZm9yIHlvdXIgcmVwbHkgYW5kIGRldGFpbGVkIGFuc3dlci4K
CkkgYWN0dWFsbHkgdXNlIGlTQ1NJIGZvciBteSB1bmRlcmx5aW5nIHN0b3JhZ2UgYW5kIHRoZSBi
YXJlIGRpc2sgcmFuZG9tIAp3cml0ZSBpb3BzIGlzIDY1NTQzLiBTb21lIG9mIHRoZSBwYXJhbWV0
ZXJzIG9mIG15IGlTQ1NJIGluaXRpYXRvciBhcmUgYXMgCmZvbGxvd3M6Cm5vZGUuc2Vzc2lvbi5p
c2NzaS5GaXJzdEJ1cnN0TGVuZ3RoID0gNTI0Mjg4Cm5vZGUuc2Vzc2lvbi5pc2NzaS5NYXhCdXJz
dExlbmd0aCA9IDMzNTUyMzg0Cm5vZGUuc2Vzc2lvbi5jbWRzX21heCA9IDQwOTYKbm9kZS5zZXNz
aW9uLnF1ZXVlX2RlcHRoID0gMTAyNAoKQWZ0ZXIgY3JlYXRpbmcgdGhlIFBWIGFuZCBWRyBiYXNl
ZCBvbiB0aGUgaVNDU0kgZGV2aWNlLCBJIGNyZWF0ZWQgdGhlIAp0aGluIHBvb2wgYXMgZm9sbG93
czoKbHZjcmVhdGUgLW4gcG9vbCAtTCAxMDAwRyB0ZXN0LXZnCmx2Y3JlYXRlIC1uIHBvb2xtZXRh
IC1MIDEwMEcgdGVzdC12ZwpsdmNvbnZlcnQgLS10eXBlIHRoaW4tcG9vbCAtLWNodW5rc2l6ZSA2
NGsgLS1wb29sbWV0YWRhdGEgCnRlc3QtdmcvcG9vbG1ldGEgdGVzdC12Zy9wb29sCmx2Y2hhbmdl
IC1aIG4gdGVzdC12Zy9wb29sCgpUaGVuIEkgY3JlYXRlIHRoaW4gbHYgaW4gdGhlIHRoaW4gcG9v
bDoKbHZjcmVhdGUgLW4gdGVzdC10aGluIC1WIDUwMEcgLS10aGlucG9vbCBwb29sIHRlc3QtdmcK
CkFuZCBteSBjb21tYW5kIGZvciBjcmVhdGluZyBzbmFwc2hvdHM6Cmx2Y3JlYXRlIC1uIHRlc3Qt
dGhpbjFzMSAtcyB0ZXN0LXZnL3Rlc3QtdGhpbgoKSSBoYXZlIHRoZSBmb2xsb3dpbmcgZmlvIHBh
cmFtZXRlciBhbmQgdXNlIGl0IGZvciBhbGwgdGVzdHM6CltnbG9iYWxdCmJzPTRrCmRpcmVjdD0x
CmlvZGVwdGg9MzIKbnVtam9icz04CmlvZW5naW5lPWxpYmFpbwpncm91cF9yZXBvcnRpbmcKcnVu
dGltZT0xMjAKdGltZV9iYXNlZApmaWxlbmFtZT0vZGV2L3ZkYgoKW3JhbmQtd3JpdGVdCm5hbWU9
cmFuZC13cml0ZQpydz1yYW5kd3JpdGUKc3RvbmV3YWxsCgpUaGFua3MgYWdhaW4hCgpaaGl5b25n
IFllCgrlnKggNi8xNC8yMiAzOjA0IFBNLCBHaW9uYXRhbiBEYW50aSDlhpnpgZM6Cj4gSWwgMjAy
Mi0wNi0xMyAxMDo0OSBaaGl5b25nIFllIGhhIHNjcml0dG86Cj4+IFRoZSBwZXJmb3JtYW5jZSBk
ZWdyYWRhdGlvbiBhZnRlciBzbmFwc2hvdHRpbmcgaXMgZXhwZWN0ZWQgYXMgd3JpdGluZwo+PiB0
byBhIHNuYXBzaG90dGVkIGx2IGludm9sdmluZyByZWFkaW5nIHRoZSBvcmlnaW5hbCBkYXRhLCB3
cml0aW5nIGl0Cj4+IGVsc2V3aGVyZSBhbmQgdGhlbiB3cml0aW5nIG5ldyBkYXRhIGludG8gdGhl
IG9yaWdpbmFsIGNodW5rLiBCdXQgdGhlCj4+IHBlcmZvcm1hbmNlIGxvc3Mgd2FzIHNvIG11Y2gg
bW9yZSB0aGFuIEkgZXhwZWN0ZWQuIElzIHRoZXJlIGFueSB3YXkgdG8KPj4gaW1wcm92ZSBwZXJm
b3JtYW5jZSBhZnRlciBjcmVhdGluZyBhIHNuYXBzaG90PyBDYW4gSSBhc2sgZm9yIHlvdXIKPj4g
aGVscD8KPiAKPiBUaGlzIGlzIHRoZSBrZXkgcG9pbnQ6IHdoZW4gZmlyc3Qgd3JpdGluZyB0byBh
IG5ldyBjaHVuaywgbm90IG9ubHkgaXQgCj4gbmVlZHMgdG8gYmUgYWxsb2NhdGVkLCBidXQgb2xk
IGRhdGEgbXVzdCBiZSBjb3BpZWQuIFRoaXMgci9tL3cgb3BlcmF0aW9uIAo+IHRyYW5zZm9ybSBh
biBhc3luYyBvcGVyYXRpb24gKHdyaXRlKSBvbiBhIHN5bmMgb25lIChyZWFkKSwgcnVpbmluZyAK
PiBwZXJmb3JtYW5jZS4gU3Vic2VxdWVudCB3cml0ZXMgdG8gdGhlIHNhbWUgY2h1bmsgZG9lcyBo
YXZlIHRoZSBzYW1lIGlzc3VlLgo+IAo+IFRoZSBtYWduaXR1dGUgb2YgdGhlIHNsb3dkb3duIHNl
ZW1zIHNvbWV3aGF0IGV4Y2Vzc2l2ZSwgdGhvdWdoLiBXaGVuIAo+IGRlYWxpbmcgd2l0aCBIREQg
cG9vbHMsIEkgcmVtZW1iZXIgYSAzLTV4IGltcGFjdCBvbiBJT1BzLiBDYW4geW91IHNob3cgCj4g
dGhlIGV4YWN0IGZpbyBjb21tYW5kIGFuZCB0aGUgcGFyYW1ldGVycyBvZiB5b3VyIHRoaW4gcG9v
bCAoaWU6IGNodW5rIAo+IHNpemUpIGFuZCBzdG9yYWdlIHN1YnN5c3RlbSAoSEREIHZzIFNTRCwg
U0FUQSB2cyBTQVMgdnMgTlZNRSk/Cj4gCj4gUmVnYXJkcy4KPiAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWx2bSBtYWlsaW5nIGxpc3QKbGlu
dXgtbHZtQHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1sdm0KcmVhZCB0aGUgTFZNIEhPVy1UTyBhdCBodHRwOi8vdGxkcC5vcmcvSE9X
VE8vTFZNLUhPV1RPLwo=

