Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79EAAC433EF
	for <linux-lvm@archiver.kernel.org>; Wed, 27 Apr 2022 17:17:19 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-sSLFBOacMEeWiaDogs3VDg-1; Wed, 27 Apr 2022 13:17:17 -0400
X-MC-Unique: sSLFBOacMEeWiaDogs3VDg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D9A6185A7BA;
	Wed, 27 Apr 2022 17:17:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 199514229AC;
	Wed, 27 Apr 2022 17:17:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9AE781947047;
	Wed, 27 Apr 2022 17:17:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 12D4B1947041
 for <linux-lvm@listman.corp.redhat.com>; Wed, 27 Apr 2022 17:17:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 00E48463E01; Wed, 27 Apr 2022 17:17:06 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EF2EB416158
 for <linux-lvm@redhat.com>; Wed, 27 Apr 2022 17:17:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D4C8D3810D25
 for <linux-lvm@redhat.com>; Wed, 27 Apr 2022 17:17:05 +0000 (UTC)
Received: from ci74p00im-qukt09082701.me.com (ci74p00im-qukt09082701.me.com
 [17.57.156.16]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-HDTqLXmZP1ua4bzmxsH0mg-1; Wed, 27 Apr 2022 13:17:03 -0400
X-MC-Unique: HDTqLXmZP1ua4bzmxsH0mg-1
Received: from [192.168.6.176] (ci77p00im-dlb-asmtp-mailmevip.me.com
 [17.57.156.26])
 by ci74p00im-qukt09082701.me.com (Postfix) with ESMTPS id 9754A4A00D16
 for <linux-lvm@redhat.com>; Wed, 27 Apr 2022 17:11:38 +0000 (UTC)
From: Alex Lieflander <atlief@icloud.com>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Message-Id: <7534073B-7DBD-46B5-9CA5-BFB3C603C75E@icloud.com>
Date: Wed, 27 Apr 2022 13:11:36 -0400
To: linux-lvm@redhat.com
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.790,17.11.62.513.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-12=5F03:2020-02-14=5F02,2022-01-12=5F03,2021-12-02?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=503
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 clxscore=1011
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2204270108
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: [linux-lvm] Bypassing LVM Restrictions - RAID6 With Less Than 5
 Disks
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8sCgpUaGFuayB5b3UgZm9yIHlvdXIgY29udGludWVkIHdvcmsgb24gTFZNKDIpLgoKSSBo
YXZlIDQgZGlza3MgdGhhdCBJ4oCZZCByZWFsbHkgbGlrZSB0byBwdXQgaW50byBhIFJBSUQ2LiBJ
IGtub3cgYWJvdXQgUkFJRDEwLCBidXQgaXQgd291bGRu4oCZdCB3b3JrIHdlbGwgZm9yIG1lIGZv
ciBzZXZlcmFsIHJlYXNvbnMuIEJ1eWluZyBhbm90aGVyIGRpc2sgd291bGQgYWxzbyBiZSBhIHdh
c3RlIG9mIG1vbmV5IGJlY2F1c2UgSSBkb27igJl0IG5lZWQgMy1kaXNrcy13b3J0aCBvZiB1c2Fi
bGUgY2FwYWNpdHkuCgpJIGtub3cgdGhlcmUgd2FzIGEgcXVlc3Rpb24gcmVnYXJkaW5nIHRoaXMg
YSBmZXcgeWVhcnMgYWdvLCBhbmQgdGhlIGNvbnNlbnN1cyB3YXMgdG8gbm90IG5hdGl2ZWx5IHN1
cHBvcnQgdGhhdCBjb25maWd1cmF0aW9uLiBJIGNhbiByZXNwZWN0IHRoYXQgKGFsdGhvdWdoIEkg
d291bGQgdXJnZSB5b3UgdG8gcmVjb25zaWRlciksIGJ1dCBJ4oCZZCBzdGlsbCBsaWtlIHRvIGRv
IGl0IG9uIG15IG1hY2hpbmUuCgpTbyBmYXIgSeKAmXZlIHRyaWVkIHJlbW92aW5nIHRoZSByZXN0
cmljdGlvbnMgZnJvbSB0aGUgc291cmNlIGNvZGUgYW5kIHJlY29tcGlsaW5nIChJIGRvbuKAmXQg
a25vdyBDLCBidXQgSeKAmW0gZmFtaWxpYXIgd2l0aCBnZW5lcmFsIGNvZGUgc3ludGF4KS4gSeKA
mXZlIHNsb3dseSBnb3R0ZW4gZnVydGhlciBpbiB0aGUgbHZjb252ZXJ0IHByb2Nlc3MsIGJ1dCB0
aGVyZSBzZWVtcyB0byBiZSBtYW55IHNpbWlsYXIgY2hlY2tzIHRocm91Z2hvdXQgdGhlIGNvZGUu
CgpJ4oCZbSBob3Bpbmcgc29tZW9uZSBjb3VsZCBwb2ludCBtZSBpbiB0aGUgcmlnaHQgZGlyZWN0
aW9uIHRvd2FyZHMgYWNoaWV2aW5nIHRoaXMgZ29hbC4gSWYgSSBzdWNjZXNzZnVsbHkgYnlwYXNz
IHRoZSB1c2VyLXNwYWNlIHRvb2wgcmVzdHJpY3Rpb25zLCB3aWxsIHRoZSByZXN0IG9mIExWTSBs
aWtlbHkgd29yayB3aXRoIG15IGRlc2lyZWQgY29uZmlnPyBXb3VsZCB5b3UgYmUgd2lsbGluZyB0
byBhbGxvdyB0aGUgLS1mb3JjZSBvcHRpb24gdG8gYnlwYXNzIHRoZSByZXN0cmljdGlvbnMgdGhh
dCBhcmUgbm90IHN0cmljdGx5IG5lY2Vzc2FyeSwgZXZlbiBhdCB0aGUgZXhwZW5zZSBvZiBleHBl
Y3RlZCBzdGFiaWxpdHk/IElzIHRoZXJlIGFueXRoaW5nIGVsc2UgeW91IGNvdWxkIHN1Z2dlc3Q/
CgpUaGFua3MsCkFsZXggTGllZmxhbmRlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtbHZtIG1haWxpbmcgbGlzdApsaW51eC1sdm1AcmVkaGF0
LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWx2
bQpyZWFkIHRoZSBMVk0gSE9XLVRPIGF0IGh0dHA6Ly90bGRwLm9yZy9IT1dUTy9MVk0tSE9XVE8v
Cg==

