Return-Path: <SRS0=MvFQ=PW=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17329C433F5
	for <linux-lvm@archiver.kernel.org>; Wed,  3 Nov 2021 06:06:44 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 986BF61053
	for <linux-lvm@archiver.kernel.org>; Wed,  3 Nov 2021 06:06:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 986BF61053
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-akoYOILjN-S3Jj1qOmqtIg-1; Wed, 03 Nov 2021 02:06:40 -0400
X-MC-Unique: akoYOILjN-S3Jj1qOmqtIg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D70E8042E0;
	Wed,  3 Nov 2021 06:06:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 16AD26FEED;
	Wed,  3 Nov 2021 06:06:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7AB4A1800B9E;
	Wed,  3 Nov 2021 06:06:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A366BV3011429 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 3 Nov 2021 02:06:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E89AE40CFD10; Wed,  3 Nov 2021 06:06:10 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E383440CFD07
	for <linux-lvm@redhat.com>; Wed,  3 Nov 2021 06:06:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C84FE80231F
	for <linux-lvm@redhat.com>; Wed,  3 Nov 2021 06:06:10 +0000 (UTC)
Received: from ms11p00im-qufo17281701.me.com (ms11p00im-qufo17281701.me.com
	[17.58.38.54]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-543-cjjyn2xWN1usxRr9OkmepA-1; Wed, 03 Nov 2021 02:06:09 -0400
X-MC-Unique: cjjyn2xWN1usxRr9OkmepA-1
Received: from smtpclient.apple (ip68-104-215-250.ph.ph.cox.net
	[68.104.215.250])
	by ms11p00im-qufo17281701.me.com (Postfix) with ESMTPSA id 4C47FBC01A5
	for <linux-lvm@redhat.com>; Wed,  3 Nov 2021 05:56:19 +0000 (UTC)
From: Adam Puleo <adam.puleo@icloud.com>
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.24\))
Message-Id: <1495660C-B6EF-4315-8599-F79F7B6CCF73@icloud.com>
Date: Tue, 2 Nov 2021 22:56:18 -0700
To: linux-lvm@redhat.com
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
	=?UTF-8?Q?2903e8d5c8f:6.0.425, 18.0.790,
	17.0.607.475.0000000_definitions?=
	=?UTF-8?Q?=3D2021-11-03=5F01:2021-11-01=5F01, 2021-11-03=5F01,
	2020-04-07?= =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=911
	suspectscore=0
	phishscore=0 bulkscore=0 mlxscore=0 spamscore=0 clxscore=1011
	malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.12.0-2009150000 definitions=main-2111030035
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1A366BV3011429
X-loop: linux-lvm@redhat.com
Subject: [linux-lvm] Replace Drive in RAID6
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8sCgpPbmUgb2YgbXkgZHJpdmVzIGZhaWxlZCBpbiBteSBSQUlENiBhbmQgSeKAmW0gdHJ5
aW5nIHRvIHJlcGxhY2UgaXQgd2l0aG91dCBzdWNjZXNzLgoKSeKAmW0gdHJ5aW5nIHRvIHJlYnVp
bGQgdGhlIGZhaWxlZCBkcml2ZSAoL2Rldi9zZGEpOiBsdmNoYW5nZSAtLXJlYnVpbGQgL2Rldi9z
ZGEgdmdfZGF0YQoKQnV0IEnigJltIHJlY2VpdmluZyB0aGUgZXJyb3I6IHZnX2RhdGEvbHZfZGF0
YSBtdXN0IGJlIGFjdGl2ZSB0byBwZXJmb3JtIHRoaXMgb3BlcmF0aW9uLgoKSSBoYXZlIHRyaWVk
IHRvIGFjdGl2YXRlIHRoZSBsb2dpY2FsIHZvbHVtZSB3aXRob3V0IHN1Y2Nlc3MuCgpIb3cgZG8g
SSBnbyBhYm91dCBhY3RpdmF0aW5nIHRoZSB2b2x1bWUgc28gdGhhdCBJIGNhbiByZWJ1aWxkIHRo
ZSBmYWlsZWQgZHJpdmU/CgpUaGFua3MsCi1BZGFtCgojIGx2cyAtYSAtbyBuYW1lLHNlZ3R5cGUs
ZGV2aWNlcwogIExWICAgICAgICAgICAgICAgICAgICAgICBUeXBlICAgRGV2aWNlcyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgbHZfZGF0YSAgICAgICAgICAgICAgICAgIHJh
aWQ2ICBsdl9kYXRhX3JpbWFnZV8wKDApLGx2X2RhdGFfcmltYWdlXzEoMCksbHZfZGF0YV9yaW1h
Z2VfMigwKSxsdl9kYXRhX3JpbWFnZV8zKDApLGx2X2RhdGFfcmltYWdlXzQoMCkKICBbbHZfZGF0
YV9yaW1hZ2VfMF0gICAgICAgZXJyb3IgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIAogIFtsdl9kYXRhX3JpbWFnZV8xXSAgICAgICBsaW5lYXIgL2Rldi9zZGMxKDEp
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgW2x2X2RhdGFfcmltYWdlXzJdICAgICAg
IGxpbmVhciAvZGV2L3NkYjEoMSkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICBbbHZf
ZGF0YV9yaW1hZ2VfM10gICAgICAgbGluZWFyIC9kZXYvc2RmMSgxKSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIAogIFtsdl9kYXRhX3JpbWFnZV80XSAgICAgICBsaW5lYXIgL2Rldi9zZGUx
KDIpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgW2x2X2RhdGFfcm1ldGFfMF0gICAg
ICAgIGVycm9yICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICBb
bHZfZGF0YV9ybWV0YV8xXSAgICAgICAgbGluZWFyIC9kZXYvc2RjMSgwKSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIAogIFtsdl9kYXRhX3JtZXRhXzJdICAgICAgICBsaW5lYXIgL2Rldi9z
ZGIxKDApICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgW2x2X2RhdGFfcm1ldGFfM10g
ICAgICAgIGxpbmVhciAvZGV2L3NkZjEoMCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAK
ICBbbHZfZGF0YV9ybWV0YV80XSAgICAgICAgbGluZWFyIC9kZXYvc2RlMSgwKSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIAoKIyBsdnMgLWEKICBMViAgICAgICAgICAgICAgICAgICAgICAg
VkcgICAgICAgICAgICBBdHRyICAgICAgIExTaXplICAgUG9vbCBPcmlnaW4gRGF0YSUgIE1ldGEl
ICBNb3ZlIExvZyBDcHklU3luYyBDb252ZXJ0CiAgbHZfZGF0YSAgICAgICAgICAgICAgICAgIHZn
X2RhdGEgICAgICAgcndpLS0tci0tLSA5OTAuMDBnICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIAogIFtsdl9kYXRhX3JpbWFnZV8wXSAgICAgICB2Z19k
YXRhICAgICAgIHZ3aS1hLXItci0gMzMwLjAwZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAKICBbbHZfZGF0YV9yaW1hZ2VfMV0gICAgICAgdmdfZGF0
YSAgICAgICBJd2ktYS1yLXItIDMzMC4wMGcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgCiAgW2x2X2RhdGFfcmltYWdlXzJdICAgICAgIHZnX2RhdGEg
ICAgICAgSXdpLWEtci1yLSAzMzAuMDBnICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIAogIFtsdl9kYXRhX3JpbWFnZV8zXSAgICAgICB2Z19kYXRhICAg
ICAgIEl3aS1hLXItci0gMzMwLjAwZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAKICBbbHZfZGF0YV9yaW1hZ2VfNF0gICAgICAgdmdfZGF0YSAgICAg
ICBJd2ktYS1yLXItIDMzMC4wMGcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgCiAgW2x2X2RhdGFfcm1ldGFfMF0gICAgICAgIHZnX2RhdGEgICAgICAg
ZXdpLWEtci1yLSAgIDQuMDBtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIAogIFtsdl9kYXRhX3JtZXRhXzFdICAgICAgICB2Z19kYXRhICAgICAgIGV3
aS1hLXItci0gICA0LjAwbSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAKICBbbHZfZGF0YV9ybWV0YV8yXSAgICAgICAgdmdfZGF0YSAgICAgICBld2kt
YS1yLXItICAgNC4wMG0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgCiAgW2x2X2RhdGFfcm1ldGFfM10gICAgICAgIHZnX2RhdGEgICAgICAgZXdpLWEt
ci1yLSAgIDQuMDBtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIAogIFtsdl9kYXRhX3JtZXRhXzRdICAgICAgICB2Z19kYXRhICAgICAgIGV3aS1hLXIt
ci0gICA0LjAwbSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtbHZtIG1haWxpbmcgbGlzdApsaW51eC1sdm1AcmVkaGF0LmNvbQpodHRwczovL2xpc3Rt
YW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWx2bQpyZWFkIHRoZSBMVk0gSE9X
LVRPIGF0IGh0dHA6Ly90bGRwLm9yZy9IT1dUTy9MVk0tSE9XVE8v

