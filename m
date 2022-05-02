Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB38EC433F5
	for <linux-lvm@archiver.kernel.org>; Mon,  2 May 2022 19:29:04 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-118-E8okn812PXWphcAhfrJH3g-1; Mon, 02 May 2022 15:29:00 -0400
X-MC-Unique: E8okn812PXWphcAhfrJH3g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47A9E811E75;
	Mon,  2 May 2022 19:28:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8A7D040D0165;
	Mon,  2 May 2022 19:28:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 51BC71947049;
	Mon,  2 May 2022 19:28:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 428851947043
 for <linux-lvm@listman.corp.redhat.com>; Mon,  2 May 2022 19:28:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 12B372166B49; Mon,  2 May 2022 19:28:51 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E3362166B41
 for <linux-lvm@redhat.com>; Mon,  2 May 2022 19:28:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF5A029AB414
 for <linux-lvm@redhat.com>; Mon,  2 May 2022 19:28:47 +0000 (UTC)
Received: from st43p00im-zteg10073501.me.com (st43p00im-zteg10073501.me.com
 [17.58.63.180]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-37-c97iSbsxMmeFaghhvakhrA-1; Mon, 02 May 2022 15:28:46 -0400
X-MC-Unique: c97iSbsxMmeFaghhvakhrA-1
Received: from [192.168.6.176] (st43p00im-dlb-asmtp-mailmevip.me.com
 [17.42.251.41])
 by st43p00im-zteg10073501.me.com (Postfix) with ESMTPSA id E7684360B5D
 for <linux-lvm@redhat.com>; Mon,  2 May 2022 19:22:32 +0000 (UTC)
From: Alex Lieflander <atlief@icloud.com>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Date: Mon, 2 May 2022 15:22:30 -0400
References: <7534073B-7DBD-46B5-9CA5-BFB3C603C75E@icloud.com>
 <25199.10122.376547.499176@quad.stoffel.home>
To: LVM general discussion and development <linux-lvm@redhat.com>
In-Reply-To: <25199.10122.376547.499176@quad.stoffel.home>
Message-Id: <324D8F25-90D3-4165-BE86-11B217DAFDE4@icloud.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-02_05:2022-05-02,
 2022-05-02 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=784 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2009150000 definitions=main-2205020144
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: Re: [linux-lvm] Bypassing LVM Restrictions - RAID6 With Less Than 5
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhhbmtzIGZvciB0aGUgcmVzcG9uc2UuCgpKb2huPiBBbGV4PiBJIGhhdmUgNCBkaXNrcyB0aGF0
IEnigJlkIHJlYWxseSBsaWtlIHRvIHB1dCBpbnRvIGEgUkFJRDYuIEkga25vdyBhYm91dCBSQUlE
MTAsIGJ1dCBpdCB3b3VsZG7igJl0IHdvcmsgd2VsbCBmb3IgbWUgZm9yIHNldmVyYWwgcmVhc29u
cy4KCkpvaG4+IENhbiB5b3UgZXhwbGFpbiB0aG9zZSByZWFzb25zPyAgSW4gZ2VuZXJhbCwgUkFJ
RDEwIGdpdmVzIHlvdSBvbmx5IDUwJSBjYXBhY2l0eSwgYnV0IG11Y2ggaW1wcm92ZWQgcGVyZm9y
bWFuY2Ugb3ZlciBSQUlENS82IGluIHRlcm1zIG9mIHJlYWQvd3JpdGUgcGVyZm9ybWFuY2UuCgpK
b2huPiBCdXQgaWYgeW91IHdhbnQgdG8gYmUgYWJsZSB0byBoYW5kbGUgdGhlIGZhaWx1cmUgb2Yg
YW55IHR3byBkaXNrcyBpbiB5b3VyIFJBSUQ2LCB0aGVuIEkgY2FuIHVuZGVyc3RhbmQgeW91ciBk
ZWNpc2lvbi4KCjEuIFJlc2lsaWVuY2UgdG8gYW55IHR3byBkaXNrIGZhaWx1cmVzL2luY29uc2lz
dGVuY2llcwoyLiBBYmlsaXR5IHRvIHNhZmVseSBhbmQgZWFzaWx5IGFkZCBzaW5nbGUgZGlza3Mg
aW4gdGhlIGZ1dHVyZeKAoCAoSGF2aW5nIDUgZGlza3Mgd2l0aCBteSBkZXNpcmVkIHJlc2lsaWVu
Y3kgd291bGQgcmVxdWlyZSBSQUlENikKMy4gQWJpbGl0eSB0byBzYWZlbHkgYW5kIGVhc2lseSBz
d2l0Y2ggYmV0d2VlbiAxLWRpc2stcmVzaWxpZW5jeSBhbmQgMi1kaXNrLXJlc2lsaWVuY3kgaW4g
dGhlIGZ1dHVyZeKAoCAoR29pbmcgZnJvbSBhIGNsZWFuIHJhaWQ2X2xzXzYgdG8gYSBjbGVhbiBy
YWlkNV9scyBpcyBleHRyZW1lbHkgZWFzeSBieSBjb21wYXJpc29uKQoK4oCgQWxsIGNvbnZlcnNp
b25zIG5lZWQgdG8gYmUgb25saW5lLiBXaXRoIFJBSUQxMCBJ4oCZZCBuZWVkIHRvIGdvIGZyb20g
UkFJRDEwIC0+IFJBSUQwIC0+IFJBSUQ1ICgtPiBSQUlENikuIFRoaXMgcHJvY2VzcyBpcyBib3Ro
IGxlbmd0aHkgYW5kIHZ1bG5lcmFibGUgdG8gYW55IHNpbmdsZSBkaXNrIGZhaWx1cmUgZHVyaW5n
IHBhcnQgb2YgdGhlIGNvbnZlcnNpb24uCgpKb2huPiBBbGV4PiBCdXlpbmcgYW5vdGhlciBkaXNr
IHdvdWxkIGFsc28gYmUgYSB3YXN0ZSBvZiBtb25leSBiZWNhdXNlIEkgZG9u4oCZdCBuZWVkIDMt
ZGlza3Mtd29ydGggb2YgdXNhYmxlIGNhcGFjaXR5LgoKSm9obj4gVGhhdCdzIGZhaXIuCgpKb2hu
PiBBbGV4PiBJIGtub3cgdGhlcmUgd2FzIGEgcXVlc3Rpb24gcmVnYXJkaW5nIHRoaXMgYSBmZXcg
eWVhcnMgYWdvLCBhbmQgdGhlIGNvbnNlbnN1cyB3YXMgdG8gbm90IG5hdGl2ZWx5IHN1cHBvcnQg
dGhhdCBjb25maWd1cmF0aW9uLiBJIGNhbiByZXNwZWN0IHRoYXQgKGFsdGhvdWdoIEkgd291bGQg
dXJnZSB5b3UgdG8gcmVjb25zaWRlciksIGJ1dCBJ4oCZZCBzdGlsbCBsaWtlIHRvIGRvIGl0IG9u
IG15IG1hY2hpbmUuCgpKb2huPiBJIHdvdWxkIGluc3RlYWQgYnVpbGQgeW91ciBSQUlENiB1c2lu
ZyBNRCwgYW5kIHRoZW4gbGF5ZXIgTFZNIG9uIHRvcCBvZiBpdC4gIEl0IHdvcmtzLCBpdCdzIHNv
bGlkIGFuZCBpdCBydW5zIHJlYWxseSB3ZWxsLgoKSm9obj4gQWxleD4gU28gZmFyIEnigJl2ZSB0
cmllZCByZW1vdmluZyB0aGUgcmVzdHJpY3Rpb25zIGZyb20gdGhlIHNvdXJjZSBjb2RlIGFuZCBy
ZWNvbXBpbGluZyAoSSBkb27igJl0IGtub3cgQywgYnV0IEnigJltIGZhbWlsaWFyIHdpdGggZ2Vu
ZXJhbCBjb2RlIHN5bnRheCkuIEnigJl2ZSBzbG93bHkgZ290dGVuIGZ1cnRoZXIgaW4gdGhlIGx2
Y29udmVydCBwcm9jZXNzLCBidXQgdGhlcmUgc2VlbXMgdG8gYmUgbWFueSBzaW1pbGFyIGNoZWNr
cyB0aHJvdWdob3V0IHRoZSBjb2RlLgoKSm9obj4gSWYgeW91IGRvbid0IGtub3cgdGhlIGNvZGUs
IHRoZW4geW91J3JlIG5vdCBnb2luZyB0byBnZXQgd29ya2luZyBSQUlENiB1cCBhbmQgcnVubmlu
ZyBhbnkgdGltZSBzb29uLgoKSm9obj4gQWxleD4gSeKAmW0gaG9waW5nIHNvbWVvbmUgY291bGQg
cG9pbnQgbWUgaW4gdGhlIHJpZ2h0IGRpcmVjdGlvbiB0b3dhcmRzIGFjaGlldmluZyB0aGlzIGdv
YWwuIElmIEkgc3VjY2Vzc2Z1bGx5IGJ5cGFzcyB0aGUgdXNlci1zcGFjZSB0b29sIHJlc3RyaWN0
aW9ucywgd2lsbCB0aGUgcmVzdCBvZiBMVk0gbGlrZWx5IHdvcmsgd2l0aCBteSBkZXNpcmVkIGNv
bmZpZz8gV291bGQgeW91IGJlIHdpbGxpbmcgdG8gYWxsb3cgdGhlIC0tZm9yY2Ugb3B0aW9uIHRv
IGJ5cGFzcyB0aGUgcmVzdHJpY3Rpb25zIHRoYXQgYXJlIG5vdCBzdHJpY3RseSBuZWNlc3Nhcnks
IGV2ZW4gYXQgdGhlIGV4cGVuc2Ugb2YgZXhwZWN0ZWQgc3RhYmlsaXR5PyBJcyB0aGVyZSBhbnl0
aGluZyBlbHNlIHlvdSBjb3VsZCBzdWdnZXN0PwoKSm9obj4gSSByZWFsbHkgY2FuIG9ubHkgc3Vn
Z2VzdCB5b3Ugc2V0dXAgUkFJRDYgdXNpbmcgdGhlIE1EIHJhaWQgdG9vbHMgKG1kYWRtKSBhbmQg
dGhlbiBjcmVhdGUgeW91ciBMVk0gUFZzLCBWR3MgYW5kIExWcyBvbiB0b3Agb2YgdGhhdC4gSXQg
cmVhbGx5IHdvcmtzIHdlbGwuCgpKb2huPiBZZXMsIHlvdSBub3cgbmVlZCB0byBoYXZlIGFub3Ro
ZXIgdG9vbCB0byBtYW5hZ2UgYW5vdGhlciBsYXllciwgYnV0IHNpbmNlIHRoZSBNRCBzeXN0ZW0g
aXMgd2VsbCB0ZXN0ZWQsIHJlbGlhYmxlIGFuZCBqdXN0IHdvcmtzLCB0aGVuIEkgd291bGQgZ28g
d2l0aCBpdCBhcyB0aGUgYmFzZS4KCkkgYWN0dWFsbHkgdXNlZCB0byB1c2UgTURBRE0gd2l0aCBM
Vk0gb24gdG9wLiBJIHN3aXRjaGVkIHRvIHB1cmUgTFZNIGZvciBzaW1wbGljaXR5IGFuZCBwZXIt
ZGlzayBob3N0LW1hbmFnZWQgaW50ZWdyaXR5LWNoZWNraW5nLiBJIGRvbuKAmXQga25vdyBpZiBN
REFETSBoYXMgc2luY2UgZ2FpbmVkIHRoZSBhYmlsaXR5IHRvIGNvcnJlY3Qgc2luZ2xlLWRpc2sg
aW5jb25zaXN0ZW5jaWVzLCBidXQgd2l0aG91dCBwZXItZGlzayBpbnRlZ3JpdHktY2hlY2tpbmcg
aXQgd291bGQgYmUgdGVjaG5pY2FsbHkgaW1wb3NzaWJsZSB0byBkbyB0aGlzIGlmIDEgZGlzayBo
YWQgYWxyZWFkeSBmYWlsZWQuCgpBbGV4IExpZWZsYW5kZXIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWx2bSBtYWlsaW5nIGxpc3QKbGludXgt
bHZtQHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1sdm0KcmVhZCB0aGUgTFZNIEhPVy1UTyBhdCBodHRwOi8vdGxkcC5vcmcvSE9XVE8v
TFZNLUhPV1RPLwo=

