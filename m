Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61112C77B72
	for <linux-lvm@archiver.kernel.org>; Wed, 12 Apr 2023 13:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681305926;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ro5S47h3ONrzYUzFpvEGIOPXnq6SGgSa01KRiBsh/4c=;
	b=dI/U/HlWswcChNhIJhIVD5Vguqg+cOQNVWICGFh7V8Pruxt5Yffprb4n+/Zpx2kWHHwcdn
	FNRpTh/x966yRw54H9UWefA8Sow7G42aNIhcLqoPQRPfJQIwUhIKgE6J5xUXiBmr8T9m7C
	2K4WqHXs0IaD5FzokgsNZ2SVyMH48Ic=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-209-KavHMPDFPuy_4GW0c6aMzA-1; Wed, 12 Apr 2023 09:25:23 -0400
X-MC-Unique: KavHMPDFPuy_4GW0c6aMzA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09210857F81;
	Wed, 12 Apr 2023 13:25:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 220CD1121320;
	Wed, 12 Apr 2023 13:25:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 00AE01946594;
	Wed, 12 Apr 2023 13:25:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 606CB1946587
 for <linux-lvm@listman.corp.redhat.com>; Wed, 12 Apr 2023 13:16:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4EFB5141511D; Wed, 12 Apr 2023 13:16:21 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 466081415117
 for <linux-lvm@redhat.com>; Wed, 12 Apr 2023 13:16:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B3FA8996F9
 for <linux-lvm@redhat.com>; Wed, 12 Apr 2023 13:16:21 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-jOsitj7xOkuxcNJZcYx7Xw-1; Wed, 12 Apr 2023 09:16:19 -0400
X-MC-Unique: jOsitj7xOkuxcNJZcYx7Xw-1
Received: by mail-ej1-f43.google.com with SMTP id jg21so28403879ejc.2
 for <linux-lvm@redhat.com>; Wed, 12 Apr 2023 06:16:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681305378; x=1683897378;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VUasCOMD0gZayBq3N3c+Dh4ael1rYkyOuvITHl3PTb4=;
 b=SNGP0C/OnYVa5ckz67QcZcDSOpIyNM8Y9RmQjw//W6/zAvSZnApRbhiNUt9js8g0Z5
 tpdUQMQcODqsaNlR70Vx4fNR7JSxy5OHAcsmitA0ca+hYLVuxqCZWzfzrxSS+V3hdNSq
 N+OQ7sic+U5r/6EVx2FTdHhyqbPJ3jGP3nmwFZ1n4ieHztpHK8z8HunxQ/wrIquXxtnx
 ydbdgHMu51tJOfwf430UMcXjh58y2dUQNZCoeotmFeYNZEJSC55VaJan/+xH2qANd0BH
 tw1jg8861dFdyY38y2RD3XhfAoVzBqDhfGBYnXusUsCwJAfd99SBaoHvqc3Wl+N5+29W
 ulIA==
X-Gm-Message-State: AAQBX9fbF2rkHWMMMC7NXKeJ3KGxQmdA4RsLq46A8xdpXwCZKLaJbxIi
 53kpvF7RG5G75ix5IcR+4kXX0TZI10qR83/9
X-Google-Smtp-Source: AKy350YhuhpNHH61cAzls181iuyaLYC16Lb9IPdNjRwws+ShvQ6YJ6x+aFueVOs3AE0FfTA4MgZFKw==
X-Received: by 2002:a17:906:fb19:b0:8b1:7eba:de5 with SMTP id
 lz25-20020a170906fb1900b008b17eba0de5mr2501936ejb.10.1681305377803; 
 Wed, 12 Apr 2023 06:16:17 -0700 (PDT)
Received: from [192.168.0.177] ([94.142.239.37])
 by smtp.gmail.com with ESMTPSA id
 q18-20020a1709063d5200b0093237bd4bc3sm7272030ejf.116.2023.04.12.06.16.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 06:16:17 -0700 (PDT)
Message-ID: <73b6bda7-5399-ce0a-9724-c9dabde09da8@gmail.com>
Date: Wed, 12 Apr 2023 15:16:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.1
To: Roland <devzero@web.de>,
 LVM general discussion and development <linux-lvm@redhat.com>,
 Roger Heflin <rogerheflin@gmail.com>
References: <4649980a-7af2-5b2e-47de-ce88ccb8ac6f@web.de>
 <CAAMCDefZC-J7Nc0H45e_EmqkRDr8ZjpOn-JvNWyBzExh8TaCsg@mail.gmail.com>
 <845e5b45-42d5-3d7f-bdad-a66ce7a2e5a9@web.de>
 <563d6e1e-e752-12df-4073-70c9b45c1879@gmail.com>
 <b24e48de-f4c7-b9f4-97fa-60671824c1f4@web.de>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <b24e48de-f4c7-b9f4-97fa-60671824c1f4@web.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

RG5lIDEyLiAwNC4gMjMgdiAxNDozNyBSb2xhbmQgbmFwc2FsKGEpOgo+ICA+UmVhbGwgc2lsbHkg
cGxhbsKgIC0gYmVlbiB0aGVyZSB5ZWFycyBiYWNrIGluIHRpbWUgd2hlbiBkcml2ZXMgd2VyZSBG
QVIKPiBtb3JlIGV4cGVuc2l2ZSB3aXRoIHRoZSBwcmljZSBwZXIgR2lCLgo+ICA+VG9kYXlzIC0g
anVzdCB0aHJvdyBiYWQgZHJpdmUgdG8gcmVjeWNsZSBiaW4gLSBpdCdzIG5vdCB3b3J0aCB0byBk
bwo+IHRoaXMgc2lsbGluZXNzLgo+IAo+IG9rLCBpIHVuZGVyc3RhbmQgeW91ciBwb2ludCBvZiB2
aWV3LiBhbmQgdGhhbmsgeW91IGZvciB0aGUgaW5wdXQuCj4gCj4gYnV0IHRoaXMgYXBwbGllcyB0
byBhIHdvcmxkIHdpdGggZW5kbGVzcyByZXNzb3VyY2VzIGFuZCB3aGVuIHBlb3BsZSBjYW4KPiBh
ZmZvcmQgdGhlIG5ldyBoYXJkd2FyZS4KPiAKCkhpCgpJdCdzIHJlYWxseSBub3QgYWJvdXQgdGhl
ICdlbmRsZXNzJyByZXNvdXJjZSAtIGl0J3MganVzdCBhYm91dCAncHJhY3RpY2FsJyAKdGhpbmtp
bmcuCgo+IGkgdGhpbmssIHdpdGggdGhlIHNhbWUgbG9naWMsIHlvdSBjYW4gZGVzaWduYXRlIHNv
bWUgZ3V5IHRvIGJlIHNpbGx5ICwKPiBpZiBoZSBwdXRzIGEgcGF0Y2ggb24gaGlzIGJpY3ljbGUg
aW5uZXIgdHViZSBpbnN0ZWFkCgpUbyB1c2UgeW91ciBjb21wYXJhdGl2ZSBjYXNlIHdpdGggYmlj
eWNsZSAtIHlvdSB3b3VsZG4ndCBsaWtlbHkgcmlkZSBvbmUgLSAKd2hlcmUgdGhlICduZXh0JyBo
b2xlIGluIHRoZSB0dWJlIHdvdWxkIGJlIGFwcGVhcmluZyByYW5kb21seSAmIHVuZXhwZWN0ZWRs
eQpkdXJpbmcgeW91ciBmdXR1cmUgcmlkZXMgLSB5b3Ugd291bGQgc2ltcGx5IGJ1eSBhIG5ldyB0
dWJlIHRvIGJlIHN1cmUgeW91IApjb3VsZCBnZXQgc29tZXdoZXJlLi4uLgoKQmFkIGRyaXZlcyBh
cmUgaGlnaGx5IHVucHJlZGljdGFibGUgLSBzbyBhcyBsb25nIGFzIHlvdSBzaW1wbHkgZG9uJ3Qg
Y2FyZSAKYWJvdXQgZGF0YSBhbmQgeW91IHN0b3JlIHRoZXJlIGp1c3Qgc29tZXRoaW5nIHlvdSBj
b3VsZCBlYXNpbHkgZG93bmxvYWQgYWdhaW4gCmZyb20gc29tZSBvdGhlciBwbGFjZSAtIHRoYXQg
Y291bGQgYmUgdGhlIG9ubHkgdXNlIGNhc2UgSSBjb3VsZCBpbWFnaW5lLApidXQgSSdkIG5ldmVy
IHB1dCB0aGVyZSB5b3Ugb25seSBjb3B5IG9mIHlvdXIgZmFtaWx5IGFsYnVtLi4uLgoKPiBidXQg
c2hvdWxkbid0IHdlIHBlcmhhcHMgbGVhdmUgaXQgdXAgdG8gdGhlIGVuZCB1c2VyIC8gb3duZXIg
b2YgdGhlCj4gaGFyZHdhcmUswqAgdG8gZGVjaWRlIHdoZW4gaXQncyByZWFkeSBmb3IgdGhlIHJl
Y3ljbGUgYmluID8KClllYWggLSBpZiB0aGUgaGFyZHdhcmUgd291bGQgY29zdCBtb3JlIDopIHRo
ZW4gdGhlIHRpbWUgeW91IHNwZW5kIHdpdGggdHJ5aW5nIAp0byBhbmFseXplIGFuZCB1c2UgYmFk
IGRyaXZlcyAtIHRoYW4gdGhlcmUgd291bGQgYmUgd2hvbGUgJ3JlY3ljbGluZycgaW5kdXN0cnkg
CmZvciB0aGVzZSBkcml2ZXMgLSB0aGFua2Z1bGx5IHdoZXJlIGFyZSBub3QgaGVhZGluZyB0b3dh
cmRzIHRoaXMgIEFUTSA6KQpXaGF0IEkgY291bGQgb2JzZXJ2ZSBpcyB0aGF0IEhERCBvZiAnc21h
bGwnIHNpemVzIGFyZSBiZWluZyB0b3RhbGx5IG9ic29sZXRlZCAKYnkgU1NEcy9OTVZlcy4uLi4K
Cj4gb3Igc2hvdWxkIHdlIHBlcmhhcHMgd2FpdCBmb3IgdGhlIG5leHQgaGFyZGRyaXZlIHN1cHBs
eSBjcmlzaXMgKGxpa2UgaW4KPiAyMDExKT/CoCB0aGVuIHBlb3BsZSBzdGFydCB0byBnZXQgbW9y
ZSBjcmVhdGl2ZSBpbiB1c2luZwo+IHdoYXQgdGhleSBoYXZlLCBiZWNhdXNlIHRoZXkgaGF2ZSBu
byBvdGhlciBvcHRpb24uLi4KCkFzc3VtaW5nIHlvdSBhcmUgYWxyZWFkeSBwcmVwYXJpbmcgaG9y
c2VzIGluIHRoZSBiYXJuID8KCj4geWVzLCBpIGhhdmUgYWxyZWFkeSBjb21lIHRvIHRoZSBjb25j
bHVzaW9uLCB0aGF0IGl0J3MgYWx3YXlzIGJldHRlciB0bwo+IHN0YXJ0IGZyb20gc2NyYXRjaCBs
aWtlIHRoaXMuIGkgZGlzbWlzc2VkIHRoZSBpZGVhIG9mCj4gZXhjbHVkaW5nIG9yIHJlbG9jYXRp
bmcgYmFkIHNlY3RvcnMuCgpUaGUga2V5IGlzIC0gdGhhdCB5b3Uga25vdyBob3cgdGhlIGRyaXZl
IGlzIGJ1aWx0IGFuZCBob3cgbWFueSBkaXNrIHBsYXRlcyBhcmUgCmFmZmVjdGVkIGFuZCBhbHNv
IGhvdyBxdWlja2x5IGVycm9ycyBhcmUgc3ByZWFkaW5nIHRvIHN1cnJvdW5kaW5nIHNlY3RvcnMu
Li4uCgpNeSBiZXN0IGVmZm9ydCB3YXMgYWx3YXlzIHRvIGxlYXZlIHNvbWUgbm90IHNvIHNtYWxs
IGFtb3VudCBvZiB0aGUgJ2ZyZWUnIApzcGFjZSBhcm91bmQgYmFkIGRpc2sgYXJlYXMgLSBidXQg
b25jZSBkaXNrcyBzdGFydGVkIHRvICdyZWxvY2F0ZScgYmFkIHNlY3RvcnMgCm9uIGl0cyBvd24g
LSB0aGlzIGFsbCBiZWNhbWUgYSBnYW1lIGhhcmQgdG8gd2luLi4uLgoKPiAgPiBCdXQgZ29vZCBh
ZHZpY2UgZnJvbSBtZSAtIHdoZW5ldmVywqAgJ3NtYXJ0Y3RsJyBzdGFydHMgdG8gc2hvdwo+IHJl
bG9jYXRpb24gYmxvY2sgZXJyb3JzIC0gaXQncyB0aGUgcmlnaHQgbW9tZW50IHRvwqAgJ2RkX3Jl
c2N1ZScKPiAgPiBhbnkgTFYgdG8geW91ciBuZXcgZHJpdmUuLi4KPiAKPiB5ZXMsIGknbSB0b3Rh
bGx5IGF3YXJlIHRoYXQgd2Ugd2FsayBvbiB2ZXJ5IHRoaW4gaWNlIGhlcmUuCj4gCj4gYnV0IGkn
ZCByZWFsbHkgbGlrZSB0byBjb2xsZWN0IHNvbWUgcmVhbCB3b3JsZCBkYXRhL2luZm9ybWF0aW9u
IG9uIGhvdwo+IGdvb2Qgc3VjaCBkaXNrICJyZWN5Y2xpbmciIGNhbiBwcm9iYWJseSB3b3JrLsKg
IGkgZG9uJ3QgaGF2ZQoKTWF5YmUgYXNrIEdvb2dsZSBwZW9wbGUgOikgdGhleSBhcmUgdGhlIG1v
c3QgZXhwZXJpZW5jZWQgb25lcyB3aXRoIHRyYXNoaW5nIApzdG9yYWdlLi4uLgoKPiAKPiBpIGd1
ZXNzIHN1Y2ggImJyb2tlbiIgZGlza3MgYmVpbmcgdXNlZCB3aXRoIHpmcyBpbiBhIHJlZHVuZGFu
dCBzZXR1cCwKPiB0aGV5IGNvdWxkIHByb2JhYmxlIHN0aWxsIHNlcnZlIGEgcHVycG9zZS4gbWF5
YmUgbm90Cj4gZm9yIHByb2R1Y3Rpb24gZGF0YSwgYnV0IHByb2JhYmx5IGdvb2QgZW5vdWdoIGZv
ciAibm90IHNvIGltcG9ydGFudCIKPiBhcHBsaWNhdGlvbi4KPiAKPiBpdCdzIGEgbGl0dGxlIGJp
dCBhY2FkZW1pYyBwcm9qZWN0LiBmb3IgbXkgb3duIGZ1bi4gaSBsaWtlIHRvIGZpZGRsZQo+IHdp
dGggZGlza3MsIGx2bSwgemZzIGFuZCB0aGF0IHN0dWZmLi4uLgoKQW5vdGhlciBpZGVhIHRvICdk
ZXBsb3knIChJJ3ZlIGJlZW4gZXZlbiB1c2luZyBteXNlbGYpIC0gaXMgdG8ganVzdCBta2ZzLmV4
dDIgCmJhZCBkcml2ZSBhbmQgYW5kIHdyaXRlIHRoZXJlIGxhcmdlIHNpemVkICgxME1pQi0xMDBN
aUIpIGZpbGVzIG9mICd6ZXJvZXMnLgoKVGhlbiBzaW1wbHkgbWQ1IGNoZWNrc3VtIC0gYW5kIHJl
bW92ZSAnY29ycmVjdCcgb25lcyBhbmQga2VlcCBhbmQgbWFyayAKaW1tdXRhYmxlIHRob3NlLCB3
aGVyZSB5b3UgZmFpbCB0byByZWFkJnZhbGlkYXRlIHRoZW0uCgpXaXRoIHNvbWUgYW1vdW50IG9m
IGx1Y2sgLSBleHQyIG1ldGFkYXRhIHdpbGwgbm90IGhpdCB0aGUgJ2JhZCcgcGFydHMgb2YgZHJp
dmUKKG90aGVyd2lzZSB5b3Ugd291bGQgcmVhbGx5IG5lZWQgdG8gdXNlIHBhcnRlZCBvciBsdm0y
IHRvIHNraXAgdGhvc2UgYXJlYXMpCgpUaGlzIHdheSB5b3UgZW5kLXVwIHdpdGggc29tZXdoYXQg
J3VzYWJsZScgc3RvcmFnZSAtICB3aGVyZSBiYWQgc2VjdG9ycyBhcmUgCmhpZGRlbiBpbiB0aG9z
ZSBicm9rZW4gJ3plcm8nIGZpbGVzIHlvdSBqdXN0IGtlZXAgaW4gZmlsZXN5c3RlbS4KCk5leHQg
dGltZSB0aGUgJ2Vycm9yJyBzcHJlYWQgIC0geW91IHJlYXBwbHkgc2FtZSBzdHJhdGVneS4KCkFu
ZCB5b3UgZXZlbiBkb24ndCBuZWVkIGx2bTIgZm9yIHRoaXMuLi4uCgpUaGlzIGlzIHRoZSBlYXNp
ZXN0IHdheSBob3cgdG8ga2VlcCAnc29tZScgbm90IGZhdGFsbHkgYnJva2VuIGRyaXZlcyBpbiB1
c2UgCmZvciBhIHdoaWxlIC0gYnV0IGp1c3QgZG9uJ3QgcHV0IHRoZXJlIGFueXRoaW5nIHlvdSBk
ZXBlbmQgb24gLSBhcyBkcml2ZSBjYW4gCmJlIGdvbmUgYW55dGltZSB2ZXJ5IGVhc2lseS4uLi4u
CgpSZWdhcmRzCgpaZGVuZWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWx2bSBtYWlsaW5nIGxpc3QKbGludXgtbHZtQHJlZGhhdC5jb20KaHR0
cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1sdm0KcmVhZCB0
aGUgTFZNIEhPVy1UTyBhdCBodHRwOi8vdGxkcC5vcmcvSE9XVE8vTFZNLUhPV1RPLwo=

