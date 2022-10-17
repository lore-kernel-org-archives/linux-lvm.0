Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EFBCC43217
	for <linux-lvm@archiver.kernel.org>; Mon, 17 Oct 2022 13:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666012265;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Len/WySrF9VAhbSer47YCss48loyOqHVSsZs2Fk5RdU=;
	b=XTgwLoBRICexBqjF2toltxSqNcFyQwcNXj+tKG6ZDSVYwpWwQS5PulOGjnLc8VxrZRbtpG
	g7UEJLQgGYRtW1X63A3Ous2x7oM2XVnLngA0+oUweCgi+Z8GqHfyhaC7rCbbyDiYqp+j7q
	mlv3drBKkajAgr9E8ieM5fzj3jWYjIM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-41-ndwSb1BlNXeX6OWKma4Ksg-1; Mon, 17 Oct 2022 09:11:01 -0400
X-MC-Unique: ndwSb1BlNXeX6OWKma4Ksg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E8B5185A78F;
	Mon, 17 Oct 2022 13:10:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 745B42166B29;
	Mon, 17 Oct 2022 13:10:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4093B1946595;
	Mon, 17 Oct 2022 13:10:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 11DCD194658F
 for <linux-lvm@listman.corp.redhat.com>; Mon, 17 Oct 2022 13:10:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 024BDC158CF; Mon, 17 Oct 2022 13:10:53 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EF116C15BB9
 for <linux-lvm@redhat.com>; Mon, 17 Oct 2022 13:10:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D427F299E756
 for <linux-lvm@redhat.com>; Mon, 17 Oct 2022 13:10:52 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-641-BQVyBYtYNQG9JiH1AutgOA-1; Mon, 17 Oct 2022 09:10:49 -0400
X-MC-Unique: BQVyBYtYNQG9JiH1AutgOA-1
Received: by mail-ej1-f52.google.com with SMTP id fy4so24792696ejc.5;
 Mon, 17 Oct 2022 06:10:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MPiHhNShs2ZkQaPa8mJAxATpPgwfJX3nA+CFl2K7ok0=;
 b=0MjlGNZ45QOBiNjq3dtNpbmh5SOXeN3W1PCN8s8wIyvDOVh3XnaaxDCCk3NfeU/2vX
 jNalAjPQZ4Lp9j09mVi5iQwA0cDpHpHI2BqLWoO9Ou6g7sFb0DuDDuzb8AJh2fodV96C
 yBjBRWuPSKxGocMCtJXjTYYAd+DUfF++0pWYSw0IHWgmb0FqmTPxgQ/b86Pg330LfCGL
 5Tsb4xNxvM23CyWgTgqFwqO834GkmG01/kbjpKXd21N9cge/tH1TYXI1XHj4JCjg/S+F
 Z67cgliZ5202aDxK/fxD7btoy+z+evWpyfA+JDxJUAU/VOvI+HWKhGerFAE8dK6g4giD
 sDfw==
X-Gm-Message-State: ACrzQf31Crgrw7A+usNQKMZx1QBCU2WmqfIkcjGTZL8wwL91KBRx5Vwy
 BepmrHL5eIUTS3EyJKDyz5L1rQY4E1Xwtg==
X-Google-Smtp-Source: AMsMyM7Gi85OQJ4UEE6UEgjMQewmfuVXmFLbmhVKatUynCG4CwxgW4INaL/3y5ZrNwBaZD1ecHJf/A==
X-Received: by 2002:a17:907:318b:b0:740:33f2:9e8 with SMTP id
 xe11-20020a170907318b00b0074033f209e8mr8599372ejb.138.1666012247803; 
 Mon, 17 Oct 2022 06:10:47 -0700 (PDT)
Received: from [192.168.0.177] ([83.148.32.207])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a1709063d3100b00780636a85fasm6022929ejf.221.2022.10.17.06.10.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Oct 2022 06:10:47 -0700 (PDT)
Message-ID: <0e032336-8658-5686-3dfb-0e50cdcb7d91@gmail.com>
Date: Mon, 17 Oct 2022 15:10:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.1
To: Mitta Sai Chaithanya <mittas@microsoft.com>,
 LVM2 development <lvm-devel@redhat.com>,
 Pawan Sharma <sharmapawan@microsoft.com>,
 "linux-lvm@redhat.com" <linux-lvm@redhat.com>
References: <PUZP153MB075126926388815B6F9E1258AC229@PUZP153MB0751.APCP153.PROD.OUTLOOK.COM>
 <PUZP153MB07512B1B646868F0F8F1D205AC259@PUZP153MB0751.APCP153.PROD.OUTLOOK.COM>
 <91261aec-d0fd-7884-1f38-a575b4e540e2@gmail.com>
 <SI2P153MB0444EE48C7C6E92FB448262ED7249@SI2P153MB0444.APCP153.PROD.OUTLOOK.COM>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <SI2P153MB0444EE48C7C6E92FB448262ED7249@SI2P153MB0444.APCP153.PROD.OUTLOOK.COM>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [linux-lvm] [EXTERNAL] Re: LVM2 : performance drop even after
 deleting the snapshot
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
Cc: Kapil Upadhayay <kupadhayay@microsoft.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

RG5lIDE0LiAxMC4gMjIgdiAyMTozMSBNaXR0YSBTYWkgQ2hhaXRoYW55YSBuYXBzYWwoYSk6Cj4g
SGkgWmRlbmVrIEthYmVsYWMsCj4gIMKgwqDCoMKgwqDCoMKgwqDCoCBUaGFua3MgZm9yIHlvdXIg
cXVpY2sgcmVwbHkgYW5kIHN1Z2dlc3Rpb25zLgo+IAo+IFdlIGNvbmR1Y3RlZCBjb3VwbGUgb2Yg
dGVzdHMgb24gVWJ1bnR1IDIyLjA0IGFuZCBvYnNlcnZlZCBzaW1pbGFyIHBlcmZvcm1hbmNlIAo+
IGJlaGF2aW9yIHBvc3QgdGhpbiBzbmFwc2hvdCBkZWxldGlvbiB3aXRob3V0IHdyaXRpbmcgYW55
IGRhdGEgYW55d2hlcmUuCj4gCj4gKkNvbW1hbmRzIHVzZWQgdG8gY3JlYXRlIFRoaW4gTFZNIHZv
bHVtZSo6Cj4gLSBsdmNyZWF0ZcKgwqAtTCA0ODBHIC0tcG9vbG1ldGFkYXRhc3BhcmUgbiAtLXBv
b2xtZXRhZGF0YXNpemUgMTZHIAo+IC0tY2h1bmtzaXplPTY0SyAtLXRoaW5wb29swqDCoFRoaW5E
YXRhTFYgVGhpblZvbEdycAo+IC0gbHZjcmVhdGUgLW4gZXh0NC5UaGluTFYgLVYgMTAwRyAtLXRo
aW5wb29sIFRoaW5EYXRhTFYgVGhpblZvbEdycAoKCkhpCgpTbyBub3cgaXQncyBjbGVhciB5b3Ug
YXJlIHRhbGtpbmcgYWJvdXQgdGhpbiBzbmFwc2hvdHMgLSB0aGlzIGlzIGEgdmVyeSAKZGlmZmVy
ZW50IHN0b3J5IGdvaW5nIG9uIGhlcmUgKGFzIHdlIG5vcm1hbGx5IHVzZSB0ZXJtICJDT1ciIHZv
bHVtZXMgZm9yIHRoaWNrIApvbGQgc25hcHNob3RzKQoKSSdsbCBjb25zdWx0IG1vcmUgd2l0aCB0
aGlucCBhdXRob3IgLSBob3dldmVyIGl0IGRvZXMgbG9vayB0byBtZSB5b3UgYXJlIHVzaW5nIApz
YW1lIGRldmljZSB0byBzdG9yZSAgZGF0YSAmIG1ldGFkYXRhLgoKVGhpcyBpcyBhbHdheXMgYSBo
aWdobHkgc3ViLW9wdGltYWwgc29sdXRpb24gLSB0aGUgbWV0YWRhdGEgZGV2aWNlIGlzIGxpa2Vs
eSAKYmVzdCB0byBiZSBzdG9yZWQgb24gZmFzdCAobG93IGxhdGVuY3kpIGRldmljZXMuCgpTbyBt
eSB3aWxkIGd1ZXNzIC0geW91IGFyZSBwb3NzaWJseSB1c2luZyByb3RhdGlvbmFsIGRldmljZSBi
YWNrZW5kIHRvIHN0b3JlIAp5b3VyICB0aGluLXBvb2xzIG1ldGFkYXRhIHZvbHVtZSBhbmQgdGhl
biB5b3VyIHNldHVwcyBnZXRzIHZlcnkgc2Vuc2l0aXZlIG9uIAp0aGUgbWV0YWRhdGEgZnJhZ21l
bnRhdGlvbi4KClRoaW4tcG9vbCB3YXMgZGVzaWduZWQgdG8gYmUgdXNlZCB3aXRoIFNTRC9OVk1l
IGZvciBtZXRhZGF0YSB3aGljaCBpcyB3YXkgbGVzcyAKc2Vuc2l0aXZlIG9uIHNlZWtpbmcuCgpT
byB3aGVuIHlvdSAnY3JlYXRlJyBzbmFwc2hvdCAtIG1ldGFkYXRhIGdldHMgdXBkYXRlZCAtIHdo
ZW4geW91IHJlbW92ZSB0aGluIApzbmFwc2hvdCAtIG1ldGFkYXRhIGdldHMgYWdhaW4gYSBsb3Rz
IG9mIGNoYW5nZXMgKGVzcGVjaWFsbHkgd2hlbiB5b3VyIG9yaWdpbiAKdm9sdW1lIGlzIGFscmVh
ZHkgcG9wdWxhdGVkKSAtIGFuZCBmcmFnbWVudGF0aW9uIGlzIGluZXZpdGFibGUgYW5kIHlvdSBh
cmUgCmdldHRpbmcgaGlnaCBwZW5hbHR5IG9mIGhvbGRpbmcgbWV0YWRhdGEgZGV2aWNlIG9uIHRo
ZSBzYW1lIGRyaXZlIGFzIHlvdXIgZGF0YSAKZGV2aWNlLgoKU28gd2hpbGUgdGhlcmUgYXJlIHNv
bWUgcGxhbnMgdG8gaW1wcm92ZSBzb21lIG1ldGFkYXRhIGxvZ2lzdGljIC0gSSdkIG5vdCAKZXhw
ZWN0IG1pcmFjbGVzIG9uIHlvdSBwYXJ0aWN1bGFyIHNldHVwIC0gSSdkIGhpZ2hseSByZWNvbW1l
bmQgdG8gcGx1Zy1pbiBzb21lIAogIFNTRC9OVk1lIHN0b3JhZ2UgZm9yIHN0b3JpbmcgeW91ciB0
aGlucG9vbCBtZXRhZGF0YSAtIHRoaXMgaXMgdGhlIHdheSB0byBnbyAKdG8gZ2V0IGJldHRlciAn
YmVuY2htYXJraW5nJyBudW1iZXJzIGhlcmUuCgpGb3IgYW4gaW1wcm92ZW1lbnQgb24geW91ciBz
ZXR1cCAtIHRyeSB0byBzZWVrIGxhcmdlciBjaHVuayBzaXplIHZhbHVlcyB3aGVyZSAKeW91ciBk
YXRhICdzaGFyaW5nJyBpcyBzdGlsbCByZWFzb25hYmx5IHZhbHVhYmxlIC0gdGhpcyBkZXBlbmRz
IG9uIGRhdGEtdHlwZSAKdXNhZ2UgLSBidXQgY2h1bmsgc2l6ZSAyNTZLIG1pZ2h0IGJlIHBvc3Np
Ymx5IGEgZ29vZCBjb21wcm9taXNlICh3aXRoIGRpc2FibGVkIAp6ZXJvaW5nIC0gaWYgeW91IGh1
bnQgZm9yIHRoZSBiZXN0IHBlcmZvcm1hbmNlKS4KCgpSZWdhcmRzCgpaZGVuZWsKClBTOiBsYXRl
ciBtYWlscyBzdWdnZXN0IHlvdSBhcmUgdXNpbmcgc29tZSAnTVMgQXp1cmUnIGRldmljZXM/PyAt
IHNvIHBsZWFzZSAKcmVkbyB5b3VyIHRlc3Rpbmcgd2l0aCB5b3VyIGxvY2FsIGhhcmR3YXJlL3N0
b3JhZ2UgLSB3aGVyZSB5b3UgaGF2ZSBwcmVjaXNlIApndWFyYW50ZWVzIG9mIHN0b3JhZ2UgZHJp
dmUgcGVyZm9ybWFuY2UgLSB0ZXN0aW5nIGluIHRoZSBDbG91ZCBpcyByYW5kb20gYnkgCmRlc2ln
bi4uLi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWx2bSBtYWlsaW5nIGxpc3QKbGludXgtbHZtQHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFu
LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1sdm0KcmVhZCB0aGUgTFZNIEhPVy1U
TyBhdCBodHRwOi8vdGxkcC5vcmcvSE9XVE8vTFZNLUhPV1RPLwo=

