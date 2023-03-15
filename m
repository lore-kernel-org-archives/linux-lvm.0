Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A25BC6FD1D
	for <linux-lvm@archiver.kernel.org>; Wed, 15 Mar 2023 16:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678896079;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xklj9dNj4HVs0z4A4j15zkQdHyZzh79R9hzJuZu4BVg=;
	b=YGGNLpISgZURuS4yrLmHPLSQjkQLG4VEgW/KCtWwMprEtQ2381ly5JCkavkUxAhYoCdqO9
	NbJLZ7tot1Y3nbadJ+ODPGUwSaRWeTbH1DTefyoItxr9BZREFYuL/Xo33YzQRdwN9PQwoC
	95RRms1V3nCXrMbkgsCMuK2i2zWtD4I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-168-fdmIW_WPMDSih2TxyQMRWA-1; Wed, 15 Mar 2023 12:01:15 -0400
X-MC-Unique: fdmIW_WPMDSih2TxyQMRWA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8BD321C08980;
	Wed, 15 Mar 2023 16:00:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 35ED6401042;
	Wed, 15 Mar 2023 16:00:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0B5C01946A41;
	Wed, 15 Mar 2023 16:00:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DC1BF1946597
 for <linux-lvm@listman.corp.redhat.com>; Wed, 15 Mar 2023 16:00:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 400F440C6E68; Wed, 15 Mar 2023 16:00:33 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 38AAE40C6E67
 for <linux-lvm@redhat.com>; Wed, 15 Mar 2023 16:00:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C66F5857FB5
 for <linux-lvm@redhat.com>; Wed, 15 Mar 2023 16:00:32 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.14]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-336-NFyc8OmyOMyTNmlf2Wj9SQ-1; Wed,
 15 Mar 2023 12:00:19 -0400
X-MC-Unique: NFyc8OmyOMyTNmlf2Wj9SQ-1
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [172.20.35.164] ([37.24.118.138]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M7usw-1pYdn83w5C-005IHd for
 <linux-lvm@redhat.com>; Wed, 15 Mar 2023 17:00:16 +0100
Message-ID: <8a702d08-5b71-b2fe-1137-9cef23d43150@web.de>
Date: Wed, 15 Mar 2023 17:00:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
From: Roland <devzero@web.de>
To: linux-lvm@redhat.com
X-Provags-ID: V03:K1:GZec5x3BK64c6pXBSFG3hoMuPCmo4tExiL7hEbhuPmXgUYorjIw
 ThB+i+TD0IKzOi4a02jPAp7ZCVAWzlBd4b1RKgjmvMcLH1QT8wravRtz1LqIUxaZGQ6QbEk
 41/JPjm4jOOIKMk8KpOUi2ECjJ45WOdlnzrmRy+23syFfCao77uJEWqHpIp1oe4r7OLeg9/
 d0xkdL4TbRIzipT+xKgqA==
UI-OutboundReport: notjunk:1;M01:P0:A+QwlF2ZF/A=;o6Q2MKuFblTXWm4OdL+QNqYkNji
 hjv5ksLS65bcOwmjY5wf/Sbstrj+TSMFEw3fT7i8cM3sw5fcv/SGdXOILRg5OBq/NHeFGuFiA
 vy7ksKlrsqf/d7Wgap+TkrPpIpuB+FgAUdLqGvZZQU1eIdr8q8JVgidfNf3jkEl4DyxGzbz/z
 otvHf4CrRzrQ6JF6lng62ih7QQS/y75bA8uPdySve5bixMaD/YW5HWVzOBgTiyZy82WCLnlSW
 XPPMMsPiuvsUhOawpAecF4OeJvI2NooAEXtRCEE6DZuhMnU+gfgpG5jCLTgvDzGt54tHqbXVe
 JPdgBo4I8x6Kvl1Hk6dAvvo1f97DTPC5m742GDYndpC8DvHLv48x1yAr3BXSivNUXN2e66xFV
 T44CEEExHL1nbk1irX4+o6sQTWUlKpVSN42uLxsV5Ld+flnvEao9s0ujpdwrYwoIr4fAHm7Mk
 5Sqf3YJYGuquP917dp09Pvx0Yeg2m0yOrHHRhIdNh5fMlQYFpI2PqA8JDz1z3MoqdWR9hJALf
 84yS3bvAc6kO7TTVXqLRY0P5AF5+dNz90JURSo8cs5646UV7P/9ScGepMH/WRnXwmFwCw9He8
 Y7nzfXWGQ9WnAWJpfmMy0FcpryIlTuH1JPPjDDaZ/0UFfl1SeLn0j0u/0k2BiCI9g+M1DKipp
 oRAlzOSOSDSHdMV3hsN0nYoL+PwpW2ifM4BkTdJwdw2YXbzYvPFKnkrgYDhV+fggK2bV3dBtP
 FHdzX8wcqd7aBJUuWC4uM25DG3kZkhebNnYpGGJkDv58EnxgaYn76YZ0J+tDLXAzirmPS3HUC
 rpcALFi/MuWQ+Wthw8ISh1lEZv+/piT7vrYTXTNf8Z/rZQUSnsRYVmipNRgc43aoLWV3b7ik2
 BUxH/VczEuEzKQkd46mhjyOcxeUHVJc5ryoftjCrld8QDVihxOuYNN/Wyl7dtfoPvmoJ5Ei87
 0PhNMA==
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [linux-lvm] How to handle Bad Block relocation with LVM?
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

aGVsbG8sCgpxdWl0ZSBvbGQgdGhyZWFkIC0gYnV0IGRhbW4gaW50ZXJlc3RpbmcsIHRob3VnaCA6
KQoKID4gSGF2aW5nIHRoZSBQRSBudW1iZXIsIHlvdSBjYW4gZWFzaWx5IGRvCiA+IHB2bW92ZSAv
ZGV2L2Jyb2tlbjpQRSAvZGV2L3NvbWV3aGVyZS1lbHNlCgpkb2VzIHNvbWVib2R5IGtub3cgaWYg
aXQncyBwb3NzaWJsZSB0byBlYXNpbHkgcmVtYXAgYSBQRSB3aXRoIHN0YW5kYXJkCmx2bSB0b29s
cywKaW5zdGVhZCBvZiBwdm1vdmluZyBpdCA/Cgp0cnlpbmcgdG8gbW92ZSBkYXRhIG9mZiBmcm9t
IGRlZmVjdGl2ZSBzZWN0b3JzIGNhbiBuZWVkIGEgdmVyeSBsb25nCnRpbWUsIGVzcGVjaWFsbHkK
d2hlbiBtdWx0aXBsZSBzZWN0b3JzIGJlaW5nIGFmZmVjdGVkIGFuZCBpZiB0aGUgZGlza3MgYXJl
IGRlc2t0b3AgZHJpdmVzLgoKbGV0J3MgdGhpbmsgb2Ygc29tZSAicmUtcGFydGl0aW9uaW5nIiB0
b29sIHdoaWNoIHNldHMgdXAgbHZtIG9uIHRvcCBvZiBhCmRpc2sgd2l0aCBiYWQKc2VjdG9ycyBh
bmQgd2hpY2ggc2NhbnMvc2tpcHMmcmVtYXBzIG1lZ2FieXRlIHNpemVkIFBFJ3MgdG8gc29tZSBz
cGFyZQphcmVhLCBiZWZvcmUgdGhlCmRpc2sgaXMgYmVpbmcgdXNlZC7CoCBiYWRibG9jayByZW1h
cHBpbmcgYXQgdGhlIG9zIGxldmVsIGluc3RlYWQgYXQgdGhlCmRpc2tzIGNvbnRyb2xsZXIKbGV2
ZWwuCgp5ZXMsIG1vc3Qgb2YgeW91IHdpbGwgdGVsbCBpdCdzIGEgYmFkIGlkZWEgYnV0IGkgaGF2
ZSBhIGNhYmluZXQgZnVsbCBvZgpkaXNrcyB3aXRoIGJhZApzZWN0b3JzIGFuZCBpJ2QgYmUgcmVh
bGx5IGJlIGN1cmlvdXMgaG93IGdvb2QgYW5kIGhvdyBsb25nIGEgemZzIHJhaWR6CndvdWxkIHdv
cmsgb24gdG9wCm9mIHN1Y2ggImJhZGJsb2NrcyBsdm0iLsKgIGF0IGxlYXN0LCBpJ2QgbGlrZSB0
byBleHBlcmltZW50IHdpdGggdGhhdC4KbGV0J3MgY2FsbCBpdAphY2FkZW1pY2FsIHByb2plY3Qg
Zm9yIGxlYXJuaW5nIHB1cnBvc2UgYW5kIGZvciBkZW1vbnN0cmF0aW9uIG9mIGx2bQpzdHJlbmd0
aCA6RAoKc3VjaCAicmVtYXBwaW5nIiBjb3VsZCBsb29rIGxpa2UgdGhpczoKCiMgcHZzIC0tc2Vn
bWVudHMgLW92Z19uYW1lLGx2X25hbWUsc2VnX3N0YXJ0X3BlLHNlZ19zaXplX3BlLHB2c2VnX3N0
YXJ0wqAKLU8gcHZzZWdfc3RhcnQgLVMgdmdfbmFtZT1WR2xvb3AwCiDCoCBWR8KgwqDCoMKgwqAg
TFbCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFN0YXJ0IFNTaXplIFN0YXJ0CiDCoCBWR2xv
b3AwIGJsb2Nrc19nb29kwqDCoMKgwqDCoCAwwqDCoMKgwqAgNMKgwqDCoMKgIDAKIMKgIFZHbG9v
cDAgYmxvY2tzX2JhZMKgwqDCoMKgwqDCoCAxwqDCoMKgwqAgMcKgwqDCoMKgIDQKIMKgIFZHbG9v
cDAgYmxvY2tzX2dvb2TCoMKgwqDCoMKgIDXCoMKgIDE5NcKgwqDCoMKgIDUKIMKgIFZHbG9vcDAg
YmxvY2tzX2JhZMKgwqDCoMKgwqDCoCAywqDCoMKgwqAgMcKgwqAgMjAwCiDCoCBWR2xvb3AwIGJs
b2Nrc19nb29kwqDCoMKgIDIwMcKgwqAgNjk5wqDCoCAyMDEKIMKgIFZHbG9vcDAgYmxvY2tzX3Nw
YXJlwqDCoMKgwqAgMMKgwqAgMTIwwqDCoCA5MDAKIMKgIFZHbG9vcDAgYmxvY2tzX2dvb2TCoMKg
wqAgMjAwwqDCoMKgwqAgMcKgIDEwMjAKIMKgIFZHbG9vcDAgYmxvY2tzX2dvb2TCoMKgwqDCoMKg
IDTCoMKgwqDCoCAxwqAgMTAyMQogwqAgVkdsb29wMCBibG9ja3NfYmFkwqDCoMKgwqDCoMKgIDDC
oMKgwqDCoCAxwqAgMTAyMgoKCmJsb2Nrc19nb29kIGlzIExWIHdpdGggaGVhbHR5IFBFJ3MsIGJs
b2Nrc19iYWQgaXMgTFYgd2l0aCBiYWQgUEUncyBhbmQKYmxvY2tzX3NwYXJlIGlzIExWCndoZXJl
IHlvdSB0YWtlIGhlYWx0aHkgUEUncyBmcm9tIGFzIGEgcmVwbGFjZW1lbnQgZm9yIGJhZCBQRSdz
IGZvdW5kIGluCmJsb2Nrc19nb29kIExWCgpyb2xhbmQKc3lzYWRtaW4KCgogPiBsaW51eC1sdm1d
IEhvdyB0byBoYW5kbGUgQmFkIEJsb2NrIHJlbG9jYXRpb24gd2l0aCBMVk0/CiA+IExhcnMgRWxs
ZW5iZXJnIGxhcnMuZWxsZW5iZXJnIGF0IGxpbmJpdC5jb20KID4gVGh1IE5vdiAyOSAxNDowNDow
MSBVVEMgMjAxMgogPgogPiDCoMKgwqAgUHJldmlvdXMgbWVzc2FnZSAoYnkgdGhyZWFkKTogW2xp
bnV4LWx2bV0gSG93IHRvIGhhbmRsZSBCYWQgQmxvY2sKcmVsb2NhdGlvbiB3aXRoIExWTT8KID4g
wqDCoMKgIE5leHQgbWVzc2FnZSAoYnkgdGhyZWFkKTogW2xpbnV4LWx2bV0gSG93IHRvIGhhbmRs
ZSBCYWQgQmxvY2sKcmVsb2NhdGlvbiB3aXRoIExWTT8KID4gwqDCoMKgIE1lc3NhZ2VzIHNvcnRl
ZCBieTogWyBkYXRlIF0gWyB0aHJlYWQgXSBbIHN1YmplY3QgXSBbIGF1dGhvciBdCiA+CiA+IE9u
IFRodSwgTm92IDI5LCAyMDEyIGF0IDA3OjI2OjI0QU0gLTA1MDAsIEJyaWFuIEouIE11cnJlbGwg
d3JvdGU6CiA+ID4gT24gMTItMTEtMjggMDg6NTcgQU0sIFpkZW5layBLYWJlbGFjIHdyb3RlOgog
PiA+ID4KID4gPiA+IFNvcnJ5LCBubyBhdXRvbWF0ZWQgdG9vbC4KID4gPgogPiA+IFBpdHksCiA+
ID4KID4gPiA+IFlvdSBjb3VsZCBwb3NzaWJseSBwdm1vdmUgc2VwYXJhdGVkIFBFcyBtYW51YWxs
eSB3aXRoIHNldCBvZiBwdm1vdmUKID4gPiA+IGNvbW1hbmRzLgogPiA+CiA+ID4gU28sIGlzIHRo
ZSBiYXNpYyBwcmVtaXNlIHRvIGp1c3QgZmluZCB0aGUgUEUgdGhhdCBpcyBzaXR0aW5nIG9uIGEg
YmFkCiA+ID4gYmxvY2sgYW5kIGp1c3QgcHZtb3ZlIGl0IGludG8gYW4gTFYgY3JlYXRlZCBqdXN0
IGZvciB0aGUgcHVycG9zZSBvZgogPiA+IGhvbGRpbmcgUEVzIHRoYXQgYXJlIG9uIGJhZCBibG9j
a3M/CiA+ID4KID4gPiBTbyB3aGF0IGhhcHBlbnMgd2hlbiBJIHB2bW92ZSBhIFBFIG91dCBvZiBh
biBMVj/CoCBJIHRha2UgaXQgTFZNIG1vdmVzCiA+ID4gdGhlIGRhdGEgKG9yIGF0IGxlYXN0IHRy
aWVzIGluIHRoaXMgY2FzZSkgb24gdGhlIFBFIGJlaW5nIHB2bW92ZWQgb250bwogPiA+IGFub3Ro
ZXIgUEUgYmVmb3JlIG1vdmluZyBpdD8KID4gPgogPiA+IE9oLCBidXQgd2FpdC7CoCBwdm1vdmUg
KHR5cGljYWxseSkgbW92ZXMgUEVzIGJldHdlZW4gcGh5c2ljYWwgdm9sdW1lcy4KID4gPiBDYW4g
aXQgYmUgdXNlZCB0byByZW1hcCBQRXMgbGlrZSB0aGlzPwogPgogPiBTbyB3aGF0IGRvIHlvdSBr
bm93PwogPiBZb3UgZWl0aGVyIGtub3cgdGhhdCBweXNpY2FsIHNlY3RvciBQIG9uIHNvbWUgcGh5
c2ljYWwgZGlzayBpcyBicm9rZW4uCiA+IE9yIHlvdSBrbm93IHRoYXQgbG9naWNhbCBzZWN0b3Ig
TCBpbiBzb21lIGxvZ2ljYWwgdm9sdW1lIGlzIGJyb2tlbi4KID4KID4gSWYgeW91IGRvCiA+IHB2
cyAtLXVuaXQgcyAtLXNlZ21lbnQgLW8KdmdfbmFtZSxsdl9uYW1lLHNlZ19zdGFydCxzZWdfc2l6
ZSxzZWdfc3RhcnRfcGUscGVfc3RhcnQsc2VnX3BlX3JhbmdlcwogPgogPiBUaGF0IHNob3VsZCBn
aXZlIHlvdSBhbGwgeW91IG5lZWQgdG8gdHJhbnNmb3JtIHRoZW0gaW50byBlYWNoIG90aGVyLAog
PiBhbmQgdG8gdHJhbnNmb3JtIHRoZSBzZWN0b3IgbnVtYmVyIHRvIFBFIG51bWJlci4KID4KID4g
SGF2aW5nIHRoZSBQRSBudW1iZXIsIHlvdSBjYW4gZWFzaWx5IGRvCiA+IHB2bW92ZSAvZGV2L2Jy
b2tlbjpQRSAvZGV2L3NvbWV3aGVyZS1lbHNlCiA+CiA+IE9yIHdpdGggYWxsb2MgYW55d2hlcmUg
ZXZlbiBlbHNld2hlcmUgb24gdGhlIHNhbWUgYnJva2VuIGRpc2suCiA+ICMgSWYgeW91IGRvbid0
IGhhdmUgYW4gb3RoZXIgUFYgYXZhaWxhYmxlLAogPiAjIGJ1dCB0aGVyZSBhcmUgZnJlZSAiaGVh
bHRoeSIgZXh0ZW50cyBvbiB0aGUgc2FtZSBQVjoKID4gIyBwdm1vdmUgLS1hbGxvYyBhbnl3aGVy
ZSAvZGV2L2Jyb2tlbjpQRSAvZGV2L2Jyb2tlbgogPiBXaGljaCB3b3VsZCBsaWtlbHkgbm90IGJl
IHRoZSBzbWFydGVzdCBpZGVhIDstKQogPgogPiBZb3Ugc2hvdWxkIHRoZW4gY3JlYXRlIG9uZSBM
ViBuYW1lZCBlLmcuICJCQURfQkxPQ0tTIiwKID4gd2hpY2ggeW91IHdvdWxkIGNyZWF0ZS9leHRl
bmQgdG8gY292ZXIgdGhhdCBiYWQgUEUsCiA+IHNvIHRoYXQgd29uJ3QgYmUgcmUtYWxsb2NhdGVk
IGFnYWluIGxhdGVyOgogPiBsdmV4dGVuZCBWRy9CQURfQkxPQ0tTIC1sICsxIC9kZXYvYnJva2Vu
OlBFCiA+CiA+IEJldHRlciB5ZXQsIHB2Y2hhbmdlIC1hbiAvZGV2L2Jyb2tlbiwKID4gc28gaXQg
d29uJ3QgYmUgdXNlZCBmb3IgbmV3IExWcyBhbnltb3JlLAogPiBhbmQgcHZtb3ZlIC9kZXYvYnJv
a2VuIGNvbXBsZXRlbHkgdG8gc29tZXdoZXJlIGVsc2UuCiA+CiA+IFNvIG11Y2ggZm9yIHRoZSB0
aGVvcnksIGhvdyBJIHdvdWxkIHRyeSB0byBkbyB0aGlzLgogPiBJbiBjYXNlIEkgd291bGQgZG8g
dGhpcyBhdCBhbGwuCiA+IFdoaWNoIEkgcHJvYmFibHkgd29uJ3QsIGlmIEkgaGFkIGFuIG90aGVy
IFBWIGF2YWlsYWJsZS4KID4KID4gwqDCoMKgIDstKQogPgogPiBJJ20gdW5zdXJlIGhvdyBwdm1v
dmUgd2lsbCBoYW5kbGUgSU8gZXJyb3JzLCB0aG91Z2guCiA+CiA+ID4gPiBCdXQgSSdkIHN0cm9u
Z2x5IHJlY29tbWVuZCB0byBnZXQgcmlkIG9mIHN1Y2ggYnJva2VuIGRyaXZlcgpxdWlja2x5IHRo
ZW4KID4gPiA+IHlvdSBsb29zZSBhbnkgbW9yZSBkYXRhIC0gSU1ITyBpdCdzIHRoZSBtb3N0IGVm
ZmljaWVudCBzb2x1dGlvbgpjb3N0ICYKID4gPiA+IHRpbWUuCiA+CiA+IFJpZ2h0LgogPgogPiDC
oMKgwqAgTGFycwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1sdm0gbWFpbGluZyBsaXN0CmxpbnV4LWx2bUByZWRoYXQuY29tCmh0dHBzOi8v
bGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtbHZtCnJlYWQgdGhlIExW
TSBIT1ctVE8gYXQgaHR0cDovL3RsZHAub3JnL0hPV1RPL0xWTS1IT1dUTy8K

