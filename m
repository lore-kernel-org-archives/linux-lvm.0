Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506A9C4332F
	for <linux-lvm@archiver.kernel.org>; Thu, 13 Oct 2022 10:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665658254;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VVDprYBwOoRYsAcJ7suPZiPQ9w001PZNyESrilUagoE=;
	b=CGWJIpmLqnVJ9u6oOJUhcMWSkmJVC5cDue6SIx4NXS899LUZGIwdVw2p9W1vUrUp5+cqtx
	Ty7xvubPtb2/db4C9oJAhW0fYbSTrJ2XB1ogzdrbuF9WbbbwBC7IbtVlb0DMoCUK4CzLWD
	OK3GUqOvCW/74qJl8cIk2xSERF1ciLA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-540-jqPJ08fpMZqUsxKZ7mWS6Q-1; Thu, 13 Oct 2022 06:50:50 -0400
X-MC-Unique: jqPJ08fpMZqUsxKZ7mWS6Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB6A4811E67;
	Thu, 13 Oct 2022 10:50:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BA9B140CA40D;
	Thu, 13 Oct 2022 10:50:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 834351946594;
	Thu, 13 Oct 2022 10:50:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 05AEE1946588
 for <linux-lvm@listman.corp.redhat.com>; Thu, 13 Oct 2022 10:50:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E67959E70; Thu, 13 Oct 2022 10:50:39 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DEB8C422A9
 for <linux-lvm@redhat.com>; Thu, 13 Oct 2022 10:50:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFC00185A792
 for <linux-lvm@redhat.com>; Thu, 13 Oct 2022 10:50:39 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-600-_6BnxLRIMB2-Hk4aUg78Zg-1; Thu, 13 Oct 2022 06:50:38 -0400
X-MC-Unique: _6BnxLRIMB2-Hk4aUg78Zg-1
Received: by mail-ed1-f45.google.com with SMTP id a13so2095438edj.0;
 Thu, 13 Oct 2022 03:50:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cSU/pomzZ/o2IoNaBdtf/8uF95Iqa7SCPoQHrmr9fXM=;
 b=UQamezIe4XVCDpPGHAu3p2j5cyOncvxh3w6nGCpkpCPXpvgDTIlBI/pHO1x0eW9tBL
 xspkiH5S94dO8xvLKo8WqYTyDsYYkLVEagjoZRFwmWAFHCIEFovvLh/mPNV4dCNSzy8z
 X9tVFPe7OUuJjmta3c9FxYVZUro3NI1uz7cyRJpfrgjxa51/uOIvYxTinY9+xDpVyC7P
 VKoKxxzkLlP8vf7BJpFFDvVzuGJv5nLC2I10ECkhxa9DWy147SAumHpEoRE9u3Mffwyb
 lb/Ak+uDgQkWoE1CqOTmaQVoFuZfQ5PHaajrBd8PUoH+SC8SL6qa/60nK3GiMcuIT/rM
 GgOw==
X-Gm-Message-State: ACrzQf1wGTX9q9wkt3zJuIZHMVptKizcY6YQvkfrW8p7T2N5q+lnW0cS
 iLE4ZTl0E50gZHcNOQG5/IrESPlLcrg=
X-Google-Smtp-Source: AMsMyM74h8TJLbU1IDDo0l09hdRlspYcFbHLAbGABfgbFRNBHQL17GInsHHUf0sLJVuBo8uJhAUj4w==
X-Received: by 2002:a05:6402:540d:b0:450:bda7:f76e with SMTP id
 ev13-20020a056402540d00b00450bda7f76emr31353800edb.249.1665658236420; 
 Thu, 13 Oct 2022 03:50:36 -0700 (PDT)
Received: from [10.43.17.48] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a1709061ba100b00722e50dab2csm2796896ejg.109.2022.10.13.03.50.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Oct 2022 03:50:35 -0700 (PDT)
Message-ID: <91261aec-d0fd-7884-1f38-a575b4e540e2@gmail.com>
Date: Thu, 13 Oct 2022 12:50:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.1
To: LVM2 development <lvm-devel@redhat.com>,
 Pawan Sharma <sharmapawan@microsoft.com>,
 "linux-lvm@redhat.com" <linux-lvm@redhat.com>
References: <PUZP153MB075126926388815B6F9E1258AC229@PUZP153MB0751.APCP153.PROD.OUTLOOK.COM>
 <PUZP153MB07512B1B646868F0F8F1D205AC259@PUZP153MB0751.APCP153.PROD.OUTLOOK.COM>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <PUZP153MB07512B1B646868F0F8F1D205AC259@PUZP153MB0751.APCP153.PROD.OUTLOOK.COM>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [linux-lvm] LVM2 : performance drop even after deleting the
 snapshot
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
Cc: Kapil Upadhayay <kupadhayay@microsoft.com>,
 Mitta Sai Chaithanya <mittas@microsoft.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

RG5lIDEzLiAxMC4gMjIgdiA4OjUzIFBhd2FuIFNoYXJtYSBuYXBzYWwoYSk6Cj4gYWRkaW5nIHRo
aXMgdG8gbHZtLWRldmVsIG1haWxpbmcgbGlzdCBhbHNvLgo+IAo+IFJlZ2FyZHMsCj4gUGF3YW4K
PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAqRnJvbToqIFBhd2FuIFNoYXJtYQo+ICpTZW50Oiog
V2VkbmVzZGF5LCBPY3RvYmVyIDEyLCAyMDIyIDEwOjQyIFBNCj4gKlRvOiogbGludXgtbHZtQHJl
ZGhhdC5jb20gPGxpbnV4LWx2bUByZWRoYXQuY29tPgo+ICpDYzoqIE1pdHRhIFNhaSBDaGFpdGhh
bnlhIDxtaXR0YXNAbWljcm9zb2Z0LmNvbT47IEthcGlsIFVwYWRoYXlheSAKPiA8a3VwYWRoYXlh
eUBtaWNyb3NvZnQuY29tPgo+ICpTdWJqZWN0OiogTFZNMiA6IHBlcmZvcm1hbmNlIGRyb3AgZXZl
biBhZnRlciBkZWxldGluZyB0aGUgc25hcHNob3QKPiBIaSBFdmVyeW9uZSwKPiAKPiAKPiBXZSBh
cmUgZXZhbHVhdGluZyBsdm0yIHNuYXBzaG90cyBhbmQgZG9pbmcgcGVyZm9ybWFuY2UgdGVzdGlu
ZyBvbiBpdC4gVGhpcyBpcyAKPiB3aGF0IHdlIGFyZSBkb2luZyA6Cj4gCj4gIDEuIGR1bXAgc29t
ZSBkYXRhIHRvIGx2bTIgdm9sdW1lICh1c2luZyBmaW8pCj4gIDIuIHRha2UgdGhlIHNuYXBzaG90
Cj4gIDMuIGRlbGV0ZSB0aGUgc25hcHNob3QgKG5vIElPcyBhbnl3aGVyZSBhZnRlciBjcmVhdGlu
ZyB0aGUgc25hcHNob3QpCj4gIDQuIHJ1biB0aGUgZmlvIG9uIGx2bTIgdm9sdW1lCj4gCj4gSGVy
ZSBhcyB5b3UgY2FuIHNlZSwgd2UgYXJlIGp1c3QgY3JlYXRpbmcgdGhlIHNuYXBzaG90IGFuZCBp
bW1lZGlhdGVseSAKPiBkZWxldGluZyBpdC4gVGhlcmUgYXJlIG5vIElPcyB0byB0aGUgbWFpbiB2
b2x1bWUgb3IgYW55d2hlcmUuIFdoZW4gd2UgcnVuIHRoZSAKPiBmaW8gYWZ0ZXIgdGhpcyAoc3Rl
cCA0KSBhbmQgd2Ugc2VlIGFyb3VuZCA1MCUgZHJvcCBpbiBwZXJmb3JtYW5jZSB3aXRoIAo+IHJl
ZmVyZW5jZSB0byB0aGUgbnVtYmVyIHdlIGdldCBpbiBzdGVwIDEuCj4gCj4gSXQgaXMgZXhwZWN0
ZWQgdG8gc2VlIGEgcGVyZm9ybWFuY2UgZHJvcCBpZiB0aGVyZSBpcyBhIHNuYXBzaG90IGJlY2F1
c2Ugb2YgdGhlIAo+IENPVy4gQnV0IGhlcmUgd2UgZGVsZXRlZCB0aGUgc25hcHNob3QsIGFuZCBp
dCBpcyBub3QgcmVmZXJyaW5nIHRvIGFueSBkYXRhIAo+IGFsc28uIFdlIHNob3VsZCBub3Qgc2Vl
IGFueSBwZXJmb3JtYW5jZSBkcm9wIGhlcmUuCj4gCj4gQ291bGTCoHNvbWVvbmUgcGxlYXNlIGhl
bHAgbWUgdW5kZXJzdGFuZCB0aGlzIGJlaGF2aW9yLiBXaHkgYXJlIHdlIHNlZWluZyB0aGUgCj4g
cGVyZm9ybWFuY2UgZHJvcCBpbiB0aGlzIGNhc2U/IEl0IHNlZW1zIGxpa2Ugd2UgZGVsZXRlZCB0
aGUgc25hcHNob3QgYnV0IHN0aWxsIAo+IGl0IGlzIG5vdCBkZWxldGVkLCBhbmQgd2UgYXJlIHBh
eWluZyB0aGUgQ09XIHBlbmFsdHkuCj4gCj4gU3lzdGVtIEluZm86Cj4gCj4gT1MgOiB1YnVudHUg
MTguMDQKPiBLZXJuZWwgOiA1LjQuMAo+IAo+ICMgbHZtIHZlcnNpb24KPiBMVk0gdmVyc2lvbjoy
LjAyLjE3NigyKSAoMjAxNy0xMS0wMykKPiBMaWJyYXJ5IHZlcnNpb246IDEuMDIuMTQ1ICgyMDE3
LTExLTAzKQo+IERyaXZlciB2ZXJzaW9uOjQuNDEuMAo+IAo+IFdlIGFsc28gdHJpZWQgb24gbGF0
ZXN0IHVidW50dSB3aXRoIG5ld2VyIHZlcnNpb24gb2YgTFZNLiBXZSBnb3QgdGhlIHNhbWUgCj4g
YmVoYXZpb3IuCj4gCj4KCkhpCgpEZWJ1Z2dpbmcgIDUgeWVhciBvbGQgc29mdHdhcmUgaXMgbGlr
ZWx5IG5vdCBnb2luZyB0byBnZXQgbG90IG9mIGF0dGVudGlvbiAKZnJvbSB1cHN0cmVhbS4KClNv
IHBsZWFzZToKCmEpIHJlcHJvZHVjZSB0aGUgaXNzdWUgd2l0aCBzb21lIHJlY2VudCAga2VybmVs
ICYgbHZtMgpiKSB0YWtlICAgJ2Rtc2V0dXAgdGFibGUgJiYgZG1zZXR1cCBzdGF0dXMnICBiZWZv
cmUgeW91IHJ1biBldmVyeSAnZmlvJyB0ZXN0IAphbmQgcHJlc2VudCBoZXJlIHlvdXIgcmVzdWx0
IGluIHNvbWUgZm9ybSAtIG90aGVyd2lzZSB3ZSBjYW4gaGFyZGx5IHNlZSB3aGF0IAppcyB0aGUg
cHJvYmxlbS4KCgpXaGF0IHNob3VsZCBiZSBleHBlY3RlZCAtIGlmIHlvdSB1c2Ugb2xkL3RoaWNr
IHNuYXBzaG90cyAtIHdoZW4geW91ICdkcm9wJyAKc25hcHNob3QgLSB5b3UgaGF2ZSB5b3VyIG9y
aWdpbmFsIGludGFjdCBMViAtIHNvIHJlc3VsdHMgc2hvdWxkIG1vc3RseSBtYXRjaCAKcmVzdWx0
cyBiZWZvcmUgeW91IHRha2UgdGhlIHNuYXBzaG90IC0gYnV0IHlvdSBjbGVhcmx5IGhhdmUgdG8g
dGFrZSBpbnRvIAphY2NvdW50IGlmIHlvdSB1c2Ugc29tZSAnU1NEL05WTWUnIGRpc2NhcmRpbmcg
YW5kIG90aGVyIHRoaW5ncyAtIHNvIGFsd2F5cyBydW4gCnNlcmllcyBvZiB0ZXN0cyBhbmQgYXZl
cmFnZSB5b3VyIHJlc3VsdHMuCgpJZiB5b3UgdXNlICB0aGluIHNuYXBzaG90IC0gdGhhdCB5b3Ug
Y2FuIGdldCB2YXJpb3VzIHJlc3VsdHMgZGVwZW5kaW5nIG9uIHlvdXIgCnNldHRpbmdzIG9mIHRo
aW4gY2h1bmtzLCBkaXNjYXJkIHVzYWdlLgoKQWxzbyBtYXliZSB0cnkgeW91ciBiZW5jaG1hcmsg
d2l0aCBkaWZmZXJlbnQgZmlsZXN5c3RlbXMuLi4KClJlZ2FyZHMKClpkZW5lawoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtbHZtIG1haWxpbmcg
bGlzdApsaW51eC1sdm1AcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWx2bQpyZWFkIHRoZSBMVk0gSE9XLVRPIGF0IGh0dHA6Ly90bGRw
Lm9yZy9IT1dUTy9MVk0tSE9XVE8vCg==

