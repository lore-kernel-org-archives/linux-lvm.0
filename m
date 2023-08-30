Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A8CC83F2B
	for <linux-lvm@archiver.kernel.org>; Thu, 31 Aug 2023 06:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693465124;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=64iHlZjeZDOQCKCjlQgrD2pZxH2BGbrKk7xZt7oXH8Y=;
	b=GbYJ74hkg3tOT3bl6waL9KsTz+BQ7uCXNqDBzu7IsEzprkwYTjzroeZ1+A7+Su1L3dLk6M
	PiiLtpz5JY/xKp2DTuuKKQUapl5RTnSl4IFjXqwv/Ybo+Il2i//lgg6A4qbCpzhlEaD0eo
	Y7a7iA4e4aknkScHSGyzzUGE1Km7Wi0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-92-4whG1rACNtqtg2PDZJAlAg-1; Thu, 31 Aug 2023 02:58:40 -0400
X-MC-Unique: 4whG1rACNtqtg2PDZJAlAg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F1EF85C6E2;
	Thu, 31 Aug 2023 06:58:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 79FC11121315;
	Thu, 31 Aug 2023 06:58:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1642E19465B1;
	Thu, 31 Aug 2023 06:58:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 22EDF1946589
 for <linux-lvm@listman.corp.redhat.com>; Wed, 30 Aug 2023 22:40:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B70E2112131B; Wed, 30 Aug 2023 22:40:35 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE9901121315
 for <linux-lvm@redhat.com>; Wed, 30 Aug 2023 22:40:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D14E3C00122
 for <linux-lvm@redhat.com>; Wed, 30 Aug 2023 22:40:35 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-157-K49QddLIOka8F8in3gUEZw-1; Wed, 30 Aug 2023 18:40:32 -0400
X-MC-Unique: K49QddLIOka8F8in3gUEZw-1
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37UMaWQC018186
 for <linux-lvm@redhat.com>; Wed, 30 Aug 2023 22:40:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3stdwjs5f6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-lvm@redhat.com>; Wed, 30 Aug 2023 22:40:30 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37UMaotI019922
 for <linux-lvm@redhat.com>; Wed, 30 Aug 2023 22:40:30 GMT
Received: from ppma12.dal12v.mail.ibm.com
 (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3stdwjs5f1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Aug 2023 22:40:30 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
 by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 37ULjcpk004891; Wed, 30 Aug 2023 22:40:29 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
 by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3squqsyuh4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Aug 2023 22:40:29 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com
 [10.241.53.104])
 by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 37UMeSYt918198
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Aug 2023 22:40:28 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 785BD5806B;
 Wed, 30 Aug 2023 22:40:28 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8228B58065;
 Wed, 30 Aug 2023 22:40:27 +0000 (GMT)
Received: from [9.171.4.82] (unknown [9.171.4.82])
 by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 30 Aug 2023 22:40:27 +0000 (GMT)
Message-ID: <675f9bba-4c0b-205d-83ff-431567a31fe5@linux.ibm.com>
Date: Thu, 31 Aug 2023 04:10:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>,
 LVM general discussion and development <linux-lvm@redhat.com>
References: <fa1ed1e4-9eae-f921-1506-87b46c13ad1f@linux.ibm.com>
 <3cc29b24-8283-478a-bce2-56c392556391@gmail.com>
From: Vishal Chourasia <vishalc@linux.ibm.com>
In-Reply-To: <3cc29b24-8283-478a-bce2-56c392556391@gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lFEF6WrkB_EcK2OMEfMCnM-Z9275NN44
X-Proofpoint-ORIG-GUID: 722HpZds8fUwKSbXu7LVFlZneKJUSiJe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-30_18,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 mlxlogscore=999
 mlxscore=0 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308300204
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-001b2d01.pphosted.com id 37UMaWQC018186
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mailman-Approved-At: Thu, 31 Aug 2023 06:51:19 +0000
Subject: Re: [linux-lvm] Trouble Booting Custom Kernel with QEMU:
 dracut-initqueue timeout waiting for /dev/sysvg/root
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
X-Mimecast-Originator: linux.ibm.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gOC8zMC8yMyAyMDowMSwgWmRlbmVrIEthYmVsYWMgd3JvdGU6Cj4gRG5lIDMwLiAwOC4gMjMg
diA4OjQwIFZpc2hhbCBDaG91cmFzaWEgbmFwc2FsKGEpOgo+PiBIaSBBbGwsCj4+Cj4+IEkgaG9w
ZSB0aGlzIGVtYWlsIGZpbmRzIHlvdSB3ZWxsLiBJIGFtIGN1cnJlbnRseSBmYWNpbmcgYW4gaXNz
dWUgd2l0aAo+PiBib290aW5nIGEgVk0gdXNpbmcgYSBjdXN0b20tY29tcGlsZWQga2VybmVsIGFu
ZCB3b3VsZCBhcHByZWNpYXRlIHlvdXIKPj4gZXhwZXJ0aXNlIG9uIHRoZSBtYXR0ZXIuCj4+Cj4g
Cj4gSGkKPiAKPiBOb3QgcmVhbGx5IHN1cmUgaG93IHRoaXMgcmVsYXRlcyB0byAnbHZtMicgeWV0
IC0geW91ciBrZXJuZWwgJ3N0dWNrJwo+IHNlZW1zIHRvIGJlIGNhdXNlZCBieSB0aGUgaW5hYmls
aXR5IHRvIHN3aXRjaCB0byAncm9vdGZzJ8KgIC0gd2hpY2gKPiBzaG91bGQgYmUgbG9jYXRlZCBv
biAvZGV2L3ZkYTPCoCAoYWNjb3JkaW5nIHRvIHlvdXIgcWVtdSBleGVjIGxpbmUpIC0gYnV0Cj4g
a2VybmVsIHBhbmljcwo+IHJlcG9ydHMgdGhhdCBkZXZpY2UgZG9lcyBub3QgaGF2ZSByZWNvZ25p
emFibGUgZmlsZXN5c3RlbS4KPiAKPiBUaGVyZSBzZWVtcyB0byBiZSBubyBsdm0yIGludm9sdmVk
IGF0IGFsbCBzbyBmYXIuCj4gCj4gCj4+ICMjIyBQcm9ibGVtIERlc2NyaXB0aW9uCj4+IEkgaGF2
ZSBkb3dubG9hZGVkIHRoZSBgRmVkb3JhLVNlcnZlci1LVk0tMzgtMS42Lng4Nl82NC5xY293MmAg
aW1hZ2UgYW5kCj4+IHN1Y2Nlc3NmdWxseSBib290ZWQgaXQgdXNpbmcgYHFlbXUtc3lzdGVtLXg4
Nl82NGAuIEhvd2V2ZXIsIHdoZW4gSSB0cnkKPj4gdG8gYm9vdCB0aGlzIFZNIHdpdGggYSBjdXN0
b20tY29tcGlsZWQga2VybmVsIHVzaW5nIHRoZSBgLWtlcm5lbGAgZmxhZywKPj4gaXQgZmFpbHMg
dG8gYm9vdC4gVGhlIHJvb3QgZmlsZXN5c3RlbSBpcyBvbiBMVk0sIGFuZCBpdCBzZWVtcyB0aGUg
a2VybmVsCj4+IG5lZWRzIHRvIGFjdGl2YXRlIHZvbHVtZSBncm91cHMgYmVmb3JlIG1vdW50aW5n
IHRoZSByb290IGZpbGVzeXN0ZW0uCj4gCj4gSWYgeW91IGJlbGlldmUgdGhlIGZpbGVzeXN0ZW0g
aXMgcmVhbGx5IG9uIExWTSBhbmQgeW91ciAvZGV2L3ZkYTMgaXMKPiBqdXN0IGEgUFYgLSB0aGVu
IHlvdXIgYm9vdCBsaW5lIGlzIHdyb25nIC0gYW5kIHlvdSBuZWVkIHRvIGJlIHVzaW5nCj4gZGlm
ZmVyZW50IG5hbWluZyAtCj4gcG9zc2libHkgc29tZXRoaW5nIGxpa2U6Cj4gcm9vdD0vZGV2L3Zn
bmFtZS9sdnJvb3RuYW1lIHJkLmx2bS5sdj12Z25hbWUvbHZyb290bmFtZQojIGNhdCAvcHJvYy9j
bWRsaW5lCkJPT1RfSU1BR0U9KGhkMCxncHQyKS92bWxpbnV6LTYuNC43LTIwMC5mYzM4Lng4Nl82
NApyb290PS9kZXYvbWFwcGVyL3N5c3ZnLXJvb3Qgcm8gY29uc29sZT10dHkxIGNvbnNvbGU9dHR5
UzAsMTE1MjAwbjgKcmQubHZtLmx2PXN5c3ZnL3Jvb3QKCkkgaGF2ZSB0cmllZCBwYXNzaW5nICJy
b290PS9kZXYvbWFwcGVyL3N5c3ZnLXJvb3QgcmQubHZtLmx2PXN5c3ZnL3Jvb3QiCndpdGggdGhl
IC1hcHBlbmQgb3B0aW9uIGFuZCBpdCBoYXNuJ3Qgd29ya2VkIGVpdGhlci4KPiAKPiBkcmFjdXQg
dGhhdCBuZWVkcyB0byBpbmNsdWRlIGx2bTIgY29kZSBhbmQgYmUgYWJsZSB0byBhY3RpdmF0ZSBz
dWNoIExWCj4gcHJpb3Igc3dpdGNoIHRvIHJvb3Rmc8KgIChoYXZpbmcgc29tZXdoZXJlIGluc2lk
ZcKgIGx2Y2hhbmdlIC1heQo+IHZnbmFtZS9sdnJvb3RuYW1lKQoxLiBIb3cgbWF5IEkgdmVyaWZ5
IHRoYXQgZHJhY3V0IGhhcyBpbmNsdWRlZCBsdm0yIGNvZGUgb3Igbm90PwoyLiBXaGljaCBmaWxl
IGluIHRoZSBkcmFjdXQgd291bGQgY29udGFpbgogICBgbHZjaGFuZ2UgLWF5IHZnbmFtZS9sdnJv
b3RuYW1lYCBjb2RlPwo+IAo+IEJ1dCBpdCdzIG5vdCByZWFsbHkgY2xlYXIgaG93IGhhdmUgeW91
IG1vdmVkIGZyb20geW91ciAvZGV2L3ZkYTMgdG8KPiBzb21ldGhpbmcgb24gdG9wIG9mIGx2bTIu
Li4KTm90IHN1cmUgd2hhdCB5b3UgbWVhbiBieSB0aGlzLgojIyMjIGxzYmxrCmBgYApOQU1FICAg
ICAgICAgICBNQUo6TUlOIFJNICBTSVpFIFJPIFRZUEUgTU9VTlRQT0lOVFMKc3IwICAgICAgICAg
ICAgIDExOjAgICAgMSAxMDI0TSAgMCByb20KenJhbTAgICAgICAgICAgMjUxOjAgICAgMCAgMy44
RyAgMCBkaXNrIFtTV0FQXQp2ZGEgICAgICAgICAgICAyNTI6MCAgICAwICAgIDdHICAwIGRpc2sK
4pSc4pSAdmRhMSAgICAgICAgIDI1MjoxICAgIDAgICAgMU0gIDAgcGFydArilJzilIB2ZGEyICAg
ICAgICAgMjUyOjIgICAgMCAgICAxRyAgMCBwYXJ0IC9ib290CuKUlOKUgHZkYTMgICAgICAgICAy
NTI6MyAgICAwICAgIDZHICAwIHBhcnQKICDilJTilIBzeXN2Zy1yb290IDI1MzowICAgIDAgICAg
NkcgIDAgbHZtICAvCmBgYApGcm9tIGxzYmxrIG91dHB1dCBJIHNlZSBzeXN2Zy1yb290IGlzIHBh
cnQgb2YgL2Rldi92ZGEzIGFuZCB0aGVyZWZvcmUgSQp0cmllZCBydW5uaW5nIHFlbXUgd2l0aCBk
aWZmZXJlbnQgcGVybXV0YXRpb25zLiAvZGV2L3ZkYTMgd2FzIG9uZSBvZgp0aGVtIGJ1dCBub3Ro
aW5nIGhhcyB3b3JrZWQgc28gZmFyLgoKPj4gUmVnYXJkcwo+IAo+IFpkZW5lawo+IAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtbHZtIG1haWxp
bmcgbGlzdApsaW51eC1sdm1AcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWx2bQpyZWFkIHRoZSBMVk0gSE9XLVRPIGF0IGh0dHA6Ly90
bGRwLm9yZy9IT1dUTy9MVk0tSE9XVE8vCg==

