Return-Path: <SRS0=tUC8=PY=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C5C2C433EF
	for <linux-lvm@archiver.kernel.org>; Fri,  5 Nov 2021 02:22:05 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED81E60273
	for <linux-lvm@archiver.kernel.org>; Fri,  5 Nov 2021 02:22:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED81E60273
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-m3WJKenqO1OSnBe3wjWiwg-1; Thu, 04 Nov 2021 22:22:02 -0400
X-MC-Unique: m3WJKenqO1OSnBe3wjWiwg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E03DC362F9;
	Fri,  5 Nov 2021 02:21:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E6F641017CF5;
	Fri,  5 Nov 2021 02:21:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0279A1806D03;
	Fri,  5 Nov 2021 02:21:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A52LSPx019260 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 4 Nov 2021 22:21:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 98E971121315; Fri,  5 Nov 2021 02:21:28 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 949BE1121314
	for <linux-lvm@redhat.com>; Fri,  5 Nov 2021 02:21:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2BCD185A794
	for <linux-lvm@redhat.com>; Fri,  5 Nov 2021 02:21:25 +0000 (UTC)
Received: from ms11p00im-qufo17291901.me.com (ms11p00im-qufo17291901.me.com
	[17.58.38.48]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-417-KZgd-Y7-MiybBk3OGnQI4w-1; Thu, 04 Nov 2021 22:21:24 -0400
X-MC-Unique: KZgd-Y7-MiybBk3OGnQI4w-1
Received: from smtpclient.apple (ip68-104-215-250.ph.ph.cox.net
	[68.104.215.250])
	by ms11p00im-qufo17291901.me.com (Postfix) with ESMTPSA id C695FCA0337
	for <linux-lvm@redhat.com>; Fri,  5 Nov 2021 02:21:22 +0000 (UTC)
From: Adam Puleo <adam.puleo@icloud.com>
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.24\))
Date: Thu, 4 Nov 2021 19:21:21 -0700
References: <1495660C-B6EF-4315-8599-F79F7B6CCF73@icloud.com>
	<20211103152558.7670fa10@desk>
To: LVM general discussion and development <linux-lvm@redhat.com>
In-Reply-To: <20211103152558.7670fa10@desk>
Message-Id: <530F35A9-87FD-4850-BB9E-0E22857F178C@icloud.com>
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
	=?UTF-8?Q?2903e8d5c8f:6.0.425, 18.0.790,
	17.0.607.475.0000000_definitions?=
	=?UTF-8?Q?=3D2021-11-05=5F01:2021-11-02=5F01, 2021-11-05=5F01,
	2020-04-07?= =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
	suspectscore=0
	adultscore=0 clxscore=1015 mlxscore=0 phishscore=0 spamscore=0
	mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.12.0-2009150000 definitions=main-2111050012
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1A52LSPx019260
X-loop: linux-lvm@redhat.com
Subject: Re: [linux-lvm] Replace Drive in RAID6
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8gQW5kcmVhcywKCkFmdGVyIGRlYWN0aXZhdGluZyBlYWNoIG9mIHRoZSBpbmRpdmlkdWFs
IHJtYWdlIGFuZCBybWV0YSB2b2x1bWVzIEkgcmVjZWl2ZSB0aGlzIGVycm9yOgojIGx2Y2hhbmdl
IC1hIHkgLS1hY3RpdmF0aW9ubW9kZSBkZWdyYWRlZCB2Z19kYXRhL2x2X2RhdGEKICBkZXZpY2Ut
bWFwcGVyOiByZWxvYWQgaW9jdGwgb24gICgyNTM6MTIpIGZhaWxlZDogSW52YWxpZCBhcmd1bWVu
dAoKSW4gbWVzc2FnZXMgSSBzZWUgdGhlIGZvbGxvd2luZyBlcnJvcnM6Ck5vdiAgNCAxOToxOTo0
MyBuYXMga2VybmVsOiBkZXZpY2UtbWFwcGVyOiByYWlkOiBGYWlsZWQgdG8gcmVhZCBzdXBlcmJs
b2NrIG9mIGRldmljZSBhdCBwb3NpdGlvbiAwCk5vdiAgNCAxOToxOTo0MyBuYXMga2VybmVsOiBk
ZXZpY2UtbWFwcGVyOiByYWlkOiBOZXcgZGV2aWNlIGluamVjdGVkIGludG8gZXhpc3RpbmcgcmFp
ZCBzZXQgd2l0aG91dCAnZGVsdGFfZGlza3MnIG9yICdyZWJ1aWxkJyBwYXJhbWV0ZXIgc3BlY2lm
aWVkCk5vdiAgNCAxOToxOTo0MyBuYXMga2VybmVsOiBkZXZpY2UtbWFwcGVyOiB0YWJsZTogMjUz
OjEyOiByYWlkOiBVbmFibGUgdG8gYXNzZW1ibGUgYXJyYXk6IEludmFsaWQgc3VwZXJibG9ja3MK
Tm92ICA0IDE5OjE5OjQzIG5hcyBrZXJuZWw6IGRldmljZS1tYXBwZXI6IGlvY3RsOiBlcnJvciBh
ZGRpbmcgdGFyZ2V0IHRvIHRhYmxlCgpBbSBJIG5vdCBhZGRpbmcgdGhlIG5ldyBkcml2ZSB0byB0
aGUgUkFJRCBjb3JyZWN0bHk/IEkgZmlyc3QgZGlkIGEgcHZjcmVhdGUgYW5kIHRoZW4gYSB2Z2V4
dGVuZC4KCkkgd2FzIHVzaW5nIHRoZSDigJRyZWJ1aWxkIG9wdGlvbiBiZWNhdXNlIEkga25vdyB3
aGljaCBwaHlzaWNhbCBkcml2ZSBpcyBiYWQuIEluIHRoZSBsdm1yYWlkIG1hbiBwYWdlIGl0IHNh
eXMg4oCUcmVwYWlyIG1pZ2h0IG5vdCBrbm93IHdoaWNoIGlzIHRoZSBjb3JyZWN0IGJsb2NrIHRv
IHVzZSBzbyB0byB1c2Ug4oCUcmVidWlsZC4KClRoYW5rIHlvdSwKLUFkYW0KCgoKT24gTm92IDMs
IDIwMjEsIGF0IDc6MjUgQU0sIEFuZHJlYXMgU2NocsOkZ2xlIDxsaW51eC1sdm1AYWpzMTI0LmRl
PiB3cm90ZToKCk9uIFR1ZSwgMiBOb3YgMjAyMSAyMjo1NjoxOCAtMDcwMApBZGFtIFB1bGVvIDxh
ZGFtLnB1bGVvQGljbG91ZC5jb20+IHdyb3RlOgoKPiBIZWxsbywKPiAKPiBPbmUgb2YgbXkgZHJp
dmVzIGZhaWxlZCBpbiBteSBSQUlENiBhbmQgSeKAmW0gdHJ5aW5nIHRvIHJlcGxhY2UgaXQgd2l0
aG91dCBzdWNjZXNzLgo+IAo+IEnigJltIHRyeWluZyB0byByZWJ1aWxkIHRoZSBmYWlsZWQgZHJp
dmUgKC9kZXYvc2RhKTogbHZjaGFuZ2UgLS1yZWJ1aWxkIC9kZXYvc2RhIHZnX2RhdGEKPiAKPiBC
dXQgSeKAmW0gcmVjZWl2aW5nIHRoZSBlcnJvcjogdmdfZGF0YS9sdl9kYXRhIG11c3QgYmUgYWN0
aXZlIHRvIHBlcmZvcm0gdGhpcyBvcGVyYXRpb24uCj4gCj4gSSBoYXZlIHRyaWVkIHRvIGFjdGl2
YXRlIHRoZSBsb2dpY2FsIHZvbHVtZSB3aXRob3V0IHN1Y2Nlc3MuCj4gCj4gSG93IGRvIEkgZ28g
YWJvdXQgYWN0aXZhdGluZyB0aGUgdm9sdW1lIHNvIHRoYXQgSSBjYW4gcmVidWlsZCB0aGUgZmFp
bGVkIGRyaXZlPwo+IAo+IFRoYW5rcywKPiAtQWRhbQo+IAo+ICMgbHZzIC1hIC1vIG5hbWUsc2Vn
dHlwZSxkZXZpY2VzCj4gIExWICAgICAgICAgICAgICAgICAgICAgICBUeXBlICAgRGV2aWNlcyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCj4gIGx2X2RhdGEgICAgICAgICAgICAg
ICAgICByYWlkNiAgbHZfZGF0YV9yaW1hZ2VfMCgwKSxsdl9kYXRhX3JpbWFnZV8xKDApLGx2X2Rh
dGFfcmltYWdlXzIoMCksbHZfZGF0YV9yaW1hZ2VfMygwKSxsdl9kYXRhX3JpbWFnZV80KDApCj4g
IFtsdl9kYXRhX3JpbWFnZV8wXSAgICAgICBlcnJvciAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgCj4gIFtsdl9kYXRhX3JpbWFnZV8xXSAgICAgICBsaW5lYXIgL2Rl
di9zZGMxKDEpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCj4gIFtsdl9kYXRhX3JpbWFn
ZV8yXSAgICAgICBsaW5lYXIgL2Rldi9zZGIxKDEpICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgCj4gIFtsdl9kYXRhX3JpbWFnZV8zXSAgICAgICBsaW5lYXIgL2Rldi9zZGYxKDEpICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgCj4gIFtsdl9kYXRhX3JpbWFnZV80XSAgICAgICBsaW5l
YXIgL2Rldi9zZGUxKDIpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCj4gIFtsdl9kYXRh
X3JtZXRhXzBdICAgICAgICBlcnJvciAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgCj4gIFtsdl9kYXRhX3JtZXRhXzFdICAgICAgICBsaW5lYXIgL2Rldi9zZGMxKDAp
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCj4gIFtsdl9kYXRhX3JtZXRhXzJdICAgICAg
ICBsaW5lYXIgL2Rldi9zZGIxKDApICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCj4gIFts
dl9kYXRhX3JtZXRhXzNdICAgICAgICBsaW5lYXIgL2Rldi9zZGYxKDApICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgCj4gIFtsdl9kYXRhX3JtZXRhXzRdICAgICAgICBsaW5lYXIgL2Rldi9z
ZGUxKDApICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCj4gCj4gIyBsdnMgLWEKPiAgTFYg
ICAgICAgICAgICAgICAgICAgICAgIFZHICAgICAgICAgICAgQXR0ciAgICAgICBMU2l6ZSAgIFBv
b2wgT3JpZ2luIERhdGElICBNZXRhJSAgTW92ZSBMb2cgQ3B5JVN5bmMgQ29udmVydAo+ICBsdl9k
YXRhICAgICAgICAgICAgICAgICAgdmdfZGF0YSAgICAgICByd2ktLS1yLS0tIDk5MC4wMGcgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCj4gIFtsdl9k
YXRhX3JpbWFnZV8wXSAgICAgICB2Z19kYXRhICAgICAgIHZ3aS1hLXItci0gMzMwLjAwZyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKPiAgW2x2X2Rh
dGFfcmltYWdlXzFdICAgICAgIHZnX2RhdGEgICAgICAgSXdpLWEtci1yLSAzMzAuMDBnICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAo+ICBbbHZfZGF0
YV9yaW1hZ2VfMl0gICAgICAgdmdfZGF0YSAgICAgICBJd2ktYS1yLXItIDMzMC4wMGcgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCj4gIFtsdl9kYXRh
X3JpbWFnZV8zXSAgICAgICB2Z19kYXRhICAgICAgIEl3aS1hLXItci0gMzMwLjAwZyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKPiAgW2x2X2RhdGFf
cmltYWdlXzRdICAgICAgIHZnX2RhdGEgICAgICAgSXdpLWEtci1yLSAzMzAuMDBnICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAo+ICBbbHZfZGF0YV9y
bWV0YV8wXSAgICAgICAgdmdfZGF0YSAgICAgICBld2ktYS1yLXItICAgNC4wMG0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCj4gIFtsdl9kYXRhX3Jt
ZXRhXzFdICAgICAgICB2Z19kYXRhICAgICAgIGV3aS1hLXItci0gICA0LjAwbSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKPiAgW2x2X2RhdGFfcm1l
dGFfMl0gICAgICAgIHZnX2RhdGEgICAgICAgZXdpLWEtci1yLSAgIDQuMDBtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAo+ICBbbHZfZGF0YV9ybWV0
YV8zXSAgICAgICAgdmdfZGF0YSAgICAgICBld2ktYS1yLXItICAgNC4wMG0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCj4gIFtsdl9kYXRhX3JtZXRh
XzRdICAgICAgICB2Z19kYXRhICAgICAgIGV3aS1hLXItci0gICA0LjAwbSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKPiAKPiAKPiAKPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LWx2bSBtYWls
aW5nIGxpc3QKPiBsaW51eC1sdm1AcmVkaGF0LmNvbQo+IGh0dHBzOi8vbGlzdG1hbi5yZWRoYXQu
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtbHZtCj4gcmVhZCB0aGUgTFZNIEhPVy1UTyBhdCBo
dHRwOi8vdGxkcC5vcmcvSE9XVE8vTFZNLUhPV1RPLwoKSGVsbG8gQWRhbSwKCmhvdyBleGFjdGx5
IGhhdmUgeW91IHRyaWVkIHRvIGFjdGl2YXRlIHRoZSBMViBzbyBmYXI/CgpsdmNoYW5nZSB3aXRo
IC0tYWN0aXZhdGlvbm1vZGUgZGVncmFkZWQgc2hvdWxkIHdvcmssIG5vPwoKQWxzbywgYXJlIHlv
dSBzdXJlIHRoYXQgLS1yZWJ1aWxkIGlzIHRoZSBjb3JyZWN0IG9wZXJhdGlvbj8KCm1hbiA3IGx2
bXJhaWQgc3VnZ2VzdCB5b3UgbWlnaHQgd2FudCAtLXJlcGFpciBvciAtLXJlcGxhY2UgaW5zdGVh
ZC4KCkJlc3QgUmVnYXJkcwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWx2bSBtYWlsaW5nIGxpc3QKbGludXgtbHZtQHJlZGhhdC5jb20KaHR0
cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1sdm0KcmVhZCB0
aGUgTFZNIEhPVy1UTyBhdCBodHRwOi8vdGxkcC5vcmcvSE9XVE8vTFZNLUhPV1RPLwoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWx2bSBtYWls
aW5nIGxpc3QKbGludXgtbHZtQHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1sdm0KcmVhZCB0aGUgTFZNIEhPVy1UTyBhdCBodHRwOi8v
dGxkcC5vcmcvSE9XVE8vTFZNLUhPV1RPLw==

