Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D5AC433F5
	for <linux-lvm@archiver.kernel.org>; Mon,  9 May 2022 07:53:45 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144-Fps7qlDtOz-xnXiYHSk9VA-1; Mon, 09 May 2022 03:53:43 -0400
X-MC-Unique: Fps7qlDtOz-xnXiYHSk9VA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6DF6A811E7A;
	Mon,  9 May 2022 07:53:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5E6A51415628;
	Mon,  9 May 2022 07:53:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 287E21947052;
	Mon,  9 May 2022 07:53:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A64BC1947056
 for <linux-lvm@listman.corp.redhat.com>; Fri,  6 May 2022 13:27:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 845282166B2D; Fri,  6 May 2022 13:27:32 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F8C22166B17
 for <linux-lvm@redhat.com>; Fri,  6 May 2022 13:27:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F001101AA44
 for <linux-lvm@redhat.com>; Fri,  6 May 2022 13:27:26 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-9c3idH3ANpKcO3L4a99uXQ-1; Fri, 06 May 2022 09:27:22 -0400
X-MC-Unique: 9c3idH3ANpKcO3L4a99uXQ-1
Received: by mail-pf1-f178.google.com with SMTP id d25so6255697pfo.10
 for <linux-lvm@redhat.com>; Fri, 06 May 2022 06:27:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :to:cc:references:from:in-reply-to:content-transfer-encoding;
 bh=JwZ8XhbXMTkLOK+zEo4cCLr1c6++bvn/saNembG+KWg=;
 b=CzhXITEwNUa3nIEmYuLEg7nabpdKflJ4t3JtGY3QYGvX9zm6HTe9nnDX1M/Ia3PeJV
 KHskNm36cuOM1AqKoHr0/w82x7h397YWOfQ59aUtV6m+SSrGYYGlD3SGc36gpwci0ZEw
 FwS6BSzfUFXq+wnOB6fDahxz8MGOSkoR+Y4CaZs0vifAWR4UfBLvsnNmarl1Fgc69KF7
 kNyQBd80QQTO6J0ywZYF66z7++npSjx2P7N1OwR8/yHl/9ljbOsyduK4vhU5A1wNJ1tk
 ClnAFh0Oe2qLcDRNRhWz3FalQVdM2n0WYWtebb62JEIdTLMopX8/tSFhhWd6HX+Mwg+v
 W+tQ==
X-Gm-Message-State: AOAM531rojaopvG/2HuYi1YaFtcrJgeNI4jlBcAkhMK++OSaO+jioTgF
 KLO9SVHmUelCyIECklNGlFzPWA==
X-Google-Smtp-Source: ABdhPJxe8v/w6DrtAed0EvPRrJPrbbKHINbGLoEGrPBeCwuNkWnPCBT/h8RPQoCJlCapfYr/g7/4sA==
X-Received: by 2002:a05:6a00:2405:b0:4e1:5008:adcc with SMTP id
 z5-20020a056a00240500b004e15008adccmr3522900pfh.35.1651843641732; 
 Fri, 06 May 2022 06:27:21 -0700 (PDT)
Received: from [10.4.101.70] ([139.177.225.240])
 by smtp.gmail.com with ESMTPSA id
 c3-20020aa79523000000b0050df474e4d2sm3378425pfp.218.2022.05.06.06.27.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 06:27:21 -0700 (PDT)
Message-ID: <3900d01b-bf36-af1e-013c-2db51c36d8e5@bytedance.com>
Date: Fri, 6 May 2022 21:27:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
To: David Teigland <teigland@redhat.com>
References: <8d9bb1b4-9f79-d557-e3d9-2b8e5f53e751@bytedance.com>
 <20220505140753.GA30224@redhat.com>
From: Zhiyong Ye <yezhiyong@bytedance.com>
In-Reply-To: <20220505140753.GA30224@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Mailman-Approved-At: Mon, 09 May 2022 07:53:34 +0000
Subject: Re: [linux-lvm] vgcreate doesn't work with lvmlockd running
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

SGkgRGF2aWQsCgpUaGFua3MgZm9yIHlvdXIgcmVwbHkgYW5kIGRldGFpbGVkIGFuc3dlci4gSXQg
aXMgdHJ1ZSB0aGF0IEl0IHdvcmtzIGZpbmUKd2l0aCB0aGUgbGF0ZXN0IHZlcnNpb24gb2YgbHZt
IGFzIHlvdSBzYWlkLgoKVGhhbmtzIGFnYWluIQoKWmhpeW9uZwoK5ZyoIDUvNS8yMiAxMDowNyBQ
TSwgRGF2aWQgVGVpZ2xhbmQg5YaZ6YGTOgo+IE9uIFRodSwgTWF5IDA1LCAyMDIyIGF0IDAyOjA4
OjM2UE0gKzA4MDAsIFpoaXlvbmcgWWUgd3JvdGU6Cj4+IHJvb3RAbjE1MS0xNDMtMDM1On4jIGx2
bWxvY2tkIC1WCj4+IGx2bWxvY2tkIHZlcnNpb246IDIuMDMuMDIoMikgKDIwMTgtMTItMTgpCj4+
IHJvb3RAbjE1MS0xNDMtMDM1On4jIHNhbmxvY2sgLVYKPj4gc2FubG9jayAzLjYuMCAoYnVpbHQg
SnVsIDExIDIwMTggMTI6NDQ6MjkpCj4gCj4+IEl0IGlzIG1lbnRpb25lZCBpbiB0aGUgbWFpbiBw
YWdlIHVuZGVyICJjcmVhdGluZyB0aGUgZmlyc3Qgc2FubG9jayBWRyIKPj4gdGhhdCB0aGUgZmly
c3QgVkcgaXMgY3JlYXRlZCB0byBnZXQgdGhlIGdsb2JhbCBsb2NrLCBzbyBJIGNyZWF0ZSB0aGUg
VkcKPj4gZGlyZWN0bHk6Cj4+Cj4+IHJvb3RAbjE1MS0xNDMtMDM1On4jIHZnY3JlYXRlIC0tbG9j
ay10eXBlIHNhbmxvY2sgLS1zaGFyZWQgdGVzdAo+PiAvZGV2L21hcHBlci9tcGF0aGExIC0tdmVy
Ym9zZQo+IAo+IFRoaXMgaXMgY29ycmVjdC4KPiAKPj4gICAgRW5hYmxpbmcgc2FubG9jayBnbG9i
YWwgbG9jawo+PiAgICAgIFdpcGluZyBzaWduYXR1cmVzIG9uIG5ldyBQViAvZGV2L21hcHBlci9t
cGF0aGExLgo+PiAgICAgIFNldCB1cCBwaHlzaWNhbCB2b2x1bWUgZm9yICIvZGV2L21hcHBlci9t
cGF0aGExIiB3aXRoIDIxNDc0ODM2NDgKPj4gYXZhaWxhYmxlIHNlY3RvcnMuCj4+ICAgICAgWmVy
b2luZyBzdGFydCBvZiBkZXZpY2UgL2Rldi9tYXBwZXIvbXBhdGhhMS4KPj4gICAgICBXcml0aW5n
IHBoeXNpY2FsIHZvbHVtZSBkYXRhIHRvIGRpc2sgIi9kZXYvbWFwcGVyL21wYXRoYTEiLgo+PiAg
ICBQaHlzaWNhbCB2b2x1bWUgIi9kZXYvbWFwcGVyL21wYXRoYTEiIHN1Y2Nlc3NmdWxseSBjcmVh
dGVkLgo+PiAgICAgIEFkZGluZyBwaHlzaWNhbCB2b2x1bWUgJy9kZXYvbWFwcGVyL21wYXRoYTEn
IHRvIHZvbHVtZSBncm91cCAndGVzdCcKPj4gICAgICBBcmNoaXZpbmcgdm9sdW1lIGdyb3VwICJ0
ZXN0IiBtZXRhZGF0YSAoc2Vxbm8gMCkuCj4+ICAgICAgQ3JlYXRpbmcgbG9naWNhbCB2b2x1bWUg
bHZtbG9jawo+PiAgICAgIENyZWF0aW5nIHZvbHVtZSBncm91cCBiYWNrdXAgIi9ldGMvbHZtL2Jh
Y2t1cC90ZXN0IiAoc2Vxbm8gMikuCj4+ICAgICAgQWN0aXZhdGluZyBsb2dpY2FsIHZvbHVtZSB0
ZXN0L2x2bWxvY2suCj4+ICAgICAgYWN0aXZhdGlvbi92b2x1bWVfbGlzdCBjb25maWd1cmF0aW9u
IHNldHRpbmcgbm90IGRlZmluZWQ6IENoZWNraW5nIG9ubHkKPj4gaG9zdCB0YWdzIGZvciB0ZXN0
L2x2bWxvY2suCj4+ICAgICAgQ3JlYXRpbmcgdGVzdC1sdm1sb2NrCj4+ICAgICAgTG9hZGluZyB0
YWJsZSBmb3IgdGVzdC1sdm1sb2NrICgyNTQ6MSkuCj4+ICAgICAgUmVzdW1pbmcgdGVzdC1sdm1s
b2NrICgyNTQ6MSkuCj4+ICAgIC9kZXYvdGVzdC9sdm1sb2NrOiBub3QgZm91bmQ6IGRldmljZSBu
b3QgY2xlYXJlZAo+PiAgICBBYm9ydGluZy4gRmFpbGVkIHRvIHdpcGUgc3RhcnQgb2YgbmV3IExW
Lgo+IAo+IFRoaXMgbG9va3MgbGlrZSBhIGJ1ZywgYW5kIGl0IGRvZXMgbG9vayBmYW1pbGlhci4g
IEknZCBndWVzcyB0aGF0IHNlY3Rpb24KPiBvZiBjb2RlIGlzIG1pc3NpbmcgYSBjYWxsIHRvIHN5
bmNocm9uaXplIHdpdGggdWRldiAoc3luY19sb2NhbF9kZXZfbmFtZXMpLgo+IFVuZm9ydHVuYXRl
bHkgeW91ciB2ZXJzaW9uIG9mIGx2bSAoYW5kIHNhbmxvY2spIGFyZSBvbGQgZW5vdWdoIHRoYXQg
aXQncwo+IGhhcmQgdG8gc2F5IGltbWVkaWF0ZWx5IGlmIGl0J3MgZml4ZWQuICBUaGUgYmVzdCBv
cHRpb24gd291bGQgYmUgdHJ5aW5nCj4gbmV3ZXIgdmVyc2lvbnMgd2hlcmUgaXQncyBtb3N0IGxp
a2VseSBiZWVuIGZpeGVkLgo+IAo+IERhdmUKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWx2bSBtYWlsaW5nIGxpc3QKbGludXgtbHZtQHJl
ZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1sdm0KcmVhZCB0aGUgTFZNIEhPVy1UTyBhdCBodHRwOi8vdGxkcC5vcmcvSE9XVE8vTFZNLUhP
V1RPLwo=

