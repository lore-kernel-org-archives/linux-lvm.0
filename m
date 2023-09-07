Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC54EE7FF4
	for <linux-lvm@archiver.kernel.org>; Mon, 11 Sep 2023 07:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694417995;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WEmG/7oVRNpYFTFtMDpTtXrr+TLZtaXGTkhcFure20A=;
	b=AeTVFwynBnvh+M7iiT/yisCcjZ8RBUrwtu5zphvdu6UzNrsS3qSdYedwmkmcyiPtXK8F1B
	GAOk4kjHq25x4NSk7k9t/lBzcBiAAw4fAoqIGYgFVV25xFcxU6a2umDvVJXnjdygnik5H6
	07QQMYyBILlYC8bSO/IjeHnRbRGdD2s=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-ekP-6ImdN1e59Wc6EaVQpA-1; Mon, 11 Sep 2023 03:39:51 -0400
X-MC-Unique: ekP-6ImdN1e59Wc6EaVQpA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA21D1C05134;
	Mon, 11 Sep 2023 07:39:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 756142156711;
	Mon, 11 Sep 2023 07:39:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F2F4919465A2;
	Mon, 11 Sep 2023 07:39:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 91FF4194658C
 for <linux-lvm@listman.corp.redhat.com>; Thu,  7 Sep 2023 07:30:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4EA8B4060E1; Thu,  7 Sep 2023 07:30:27 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 466A1404119
 for <linux-lvm@redhat.com>; Thu,  7 Sep 2023 07:30:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2664B1C18C63
 for <linux-lvm@redhat.com>; Thu,  7 Sep 2023 07:30:27 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-186-92m9m31KP5OIiaL2GCQ68Q-1; Thu, 07 Sep 2023 03:30:25 -0400
X-MC-Unique: 92m9m31KP5OIiaL2GCQ68Q-1
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3877Q6ti004010
 for <linux-lvm@redhat.com>; Thu, 7 Sep 2023 07:30:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sya4h821y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-lvm@redhat.com>; Thu, 07 Sep 2023 07:30:24 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3877Q9AQ004071
 for <linux-lvm@redhat.com>; Thu, 7 Sep 2023 07:30:24 GMT
Received: from ppma13.dal12v.mail.ibm.com
 (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sya4h821q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Sep 2023 07:30:24 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
 by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 3876gKs6012275; Thu, 7 Sep 2023 07:30:23 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
 by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3svhkk9h9t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Sep 2023 07:30:23 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com
 [10.241.53.103])
 by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3877UMlv590406
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 7 Sep 2023 07:30:22 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6244458056;
 Thu,  7 Sep 2023 07:30:22 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6C09258064;
 Thu,  7 Sep 2023 07:30:21 +0000 (GMT)
Received: from [9.171.64.107] (unknown [9.171.64.107])
 by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  7 Sep 2023 07:30:21 +0000 (GMT)
Message-ID: <4a01bb68-f737-c280-ab49-67cee29b004b@linux.ibm.com>
Date: Thu, 7 Sep 2023 13:00:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>,
 LVM general discussion and development <linux-lvm@redhat.com>
References: <fa1ed1e4-9eae-f921-1506-87b46c13ad1f@linux.ibm.com>
 <3cc29b24-8283-478a-bce2-56c392556391@gmail.com>
 <675f9bba-4c0b-205d-83ff-431567a31fe5@linux.ibm.com>
 <e867cf2c-6860-4914-bf39-8c011503b592@gmail.com>
From: Vishal Chourasia <vishalc@linux.ibm.com>
In-Reply-To: <e867cf2c-6860-4914-bf39-8c011503b592@gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IGcRfBfTV5wdnt3aGNXZLPJTf4x3S1SN
X-Proofpoint-ORIG-GUID: Bxqa_Pirsi0PEKdq254g1adN6IBjcELA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-06_12,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 phishscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309070060
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-001b2d01.pphosted.com id 3877Q6ti004010
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Mon, 11 Sep 2023 07:39:42 +0000
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.ibm.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

U29ycnkgZm9yIHRoZSBkZWxheS4KCk9uIDgvMzEvMjMgMTU6NDQsIFpkZW5layBLYWJlbGFjIHdy
b3RlOgo+IERuZSAzMS4gMDguIDIzIHYgMDo0MCBWaXNoYWwgQ2hvdXJhc2lhIG5hcHNhbChhKToK
Pj4gT24gOC8zMC8yMyAyMDowMSwgWmRlbmVrIEthYmVsYWMgd3JvdGU6Cj4+PiBEbmUgMzAuIDA4
LiAyMyB2IDg6NDAgVmlzaGFsIENob3VyYXNpYSBuYXBzYWwoYSk6Cj4+Pj4gSGkgQWxsLAo+Pj4+
Cj4+ICMgY2F0IC9wcm9jL2NtZGxpbmUKPj4gQk9PVF9JTUFHRT0oaGQwLGdwdDIpL3ZtbGludXot
Ni40LjctMjAwLmZjMzgueDg2XzY0Cj4+IHJvb3Q9L2Rldi9tYXBwZXIvc3lzdmctcm9vdCBybyBj
b25zb2xlPXR0eTEgY29uc29sZT10dHlTMCwxMTUyMDBuOAo+PiByZC5sdm0ubHY9c3lzdmcvcm9v
dAo+Pgo+PiBJIGhhdmUgdHJpZWQgcGFzc2luZyAicm9vdD0vZGV2L21hcHBlci9zeXN2Zy1yb290
IHJkLmx2bS5sdj1zeXN2Zy9yb290Igo+PiB3aXRoIHRoZSAtYXBwZW5kIG9wdGlvbiBhbmQgaXQg
aGFzbid0IHdvcmtlZCBlaXRoZXIuCj4+Pgo+Pj4gZHJhY3V0IHRoYXQgbmVlZHMgdG8gaW5jbHVk
ZSBsdm0yIGNvZGUgYW5kIGJlIGFibGUgdG8gYWN0aXZhdGUgc3VjaCBMVgo+Pj4gcHJpb3Igc3dp
dGNoIHRvIHJvb3Rmc8KgIChoYXZpbmcgc29tZXdoZXJlIGluc2lkZcKgIGx2Y2hhbmdlIC1heQo+
Pj4gdmduYW1lL2x2cm9vdG5hbWUpCj4+IDEuIEhvdyBtYXkgSSB2ZXJpZnkgdGhhdCBkcmFjdXQg
aGFzIGluY2x1ZGVkIGx2bTIgY29kZSBvciBub3Q/Cj4+IDIuIFdoaWNoIGZpbGUgaW4gdGhlIGRy
YWN1dCB3b3VsZCBjb250YWluCj4+IMKgwqDCoCBgbHZjaGFuZ2UgLWF5IHZnbmFtZS9sdnJvb3Ru
YW1lYCBjb2RlPwo+IAo+IEhpCj4gCj4gSWYgeW91IGFyZSBtYWtpbmcgcmFtZGlzayBpbWFnZSBm
cm9tIHRoZSBzeXN0ZW0gLSBkcmFjdXQgc2hvdWxkCj4gYXV0b2RldGVjdCBzdWNoIGNhc2UgYW5k
IGJ1aWxkIHRoZSBpbWFnZSB3aXRoIGx2bTIgc3VwcG9ydCBpbnNpZGUKPiAodW5sZXNzIHlvdSd2
ZSBpbnN0cnVjdGVkIGluIGRyYWN1dC5jb25mIHRvIG5vdCBkb2luZyBzbykuCj4gCj4gWW91IGNh
biBjaGVjayBpZiB5b3UgZHJhY3V0IHJhbWRpc2sgaW1hZ2UgY29udGFpbnMgL3Vzci9zYmluL2x2
bQpZZXMuIC91c3Ivc2Jpbi9sdm0gaXMgcHJlc2VudAoKQWZ0ZXIgdW5hcmNoaXZpbmcgdGhlIGlu
aXRyZC5pbWcKCiQgZmluZCAuIC1uYW1lIGx2bQouL3Vzci9zYmluL2x2bQouL2V0Yy9sdm0KCj4g
YW5kIGFsc28gaWYgZGlyc8KgIGluIC91c3IvbGliL2RyYWN1dC9ob29rcyBkbyBoYXZlIGx2bTIg
c2NyaXB0cyBpbnNpZGUKCs67IGxzIHVzci9saWIvZHJhY3V0L2hvb2tzCmNsZWFudXAgIGNtZGxp
bmUgIGVtZXJnZW5jeSAgaW5pdHF1ZXVlICBtb3VudCAgbmV0cm9vdCAgcHJlLW1vdW50ICBwcmUt
cGl2b3QgIHByZS1zaHV0ZG93biAgcHJlLXRyaWdnZXIgIHByZS11ZGV2ICBzaHV0ZG93biAgc2h1
dGRvd24tZW1lcmdlbmN5CgrOuyBncmVwIC1yIC1pIGx2bSAqCmNtZGxpbmUvMzAtcGFyc2UtbHZt
LnNoOmlmIFsgLWUgL2V0Yy9sdm0vbHZtLmNvbmYgXSAmJiAhIGdldGFyZ2Jvb2wgMSByZC5sdm0u
Y29uZiAtZCAtbiByZF9OT19MVk1DT05GOyB0aGVuCmNtZGxpbmUvMzAtcGFyc2UtbHZtLnNoOiAg
ICBybSAtZiAtLSAvZXRjL2x2bS9sdm0uY29uZgpjbWRsaW5lLzMwLXBhcnNlLWx2bS5zaDpMVl9E
RVZTPSIkKGdldGFyZ3MgcmQubHZtLnZnIC1kIHJkX0xWTV9WRz0pICQoZ2V0YXJncyByZC5sdm0u
bHYgLWQgcmRfTFZNX0xWPSkiCmNtZGxpbmUvMzAtcGFyc2UtbHZtLnNoOmlmICEgZ2V0YXJnYm9v
bCAxIHJkLmx2bSAtZCAtbiByZF9OT19MVk0gXApjbWRsaW5lLzMwLXBhcnNlLWx2bS5zaDogICAg
aW5mbyAicmQubHZtPTA6IHJlbW92aW5nIExWTSBhY3RpdmF0aW9uIgpjbWRsaW5lLzMwLXBhcnNl
LWx2bS5zaDogICAgcm0gLWYgLS0gL2V0Yy91ZGV2L3J1bGVzLmQvNjQtbHZtKi5ydWxlcwoKVGhp
cyBzZWVtcyBzY3JpcHRzIHVuZGVyIGNtZGxpbmUgZGlyZWN0b3J5IHBhcnNlIGx2bSByZWxhdGVk
IHBhcmFtZXRlcnMKIHByZXNlbnQgaW4gdGhlIGNtZGxpbmUKCldlcmUgeW91IGxvb2tpbmcgZm9y
IGx2bSByZWxhdGVkIHNjcmlwdHMgdW5kZXIgcHJlLW1vdW50IG9yIG1vdW50IGRpcmVjdG9yaWVz
PwoKPiBhcyB3ZWxsIGFzIC9ldGMvbHZtL2x2bS5jb25mLgoKZmlsdGVyaW5nIGxpbmVzIHRoYXQg
ZG8gbm90IHN0YXJ0IHdpdGggJyMnCgokIGdyZXAgLXYgJ15bWzpzcGFjZTpdXSojXHxeJCcgZXRj
L2x2bS9sdm0uY29uZgpjb25maWcgewp9CmRldmljZXMgewp9CmFsbG9jYXRpb24gewp9CmxvZyB7
Cn0KYmFja3VwIHsKfQpzaGVsbCB7Cn0KZ2xvYmFsIHsKfQphY3RpdmF0aW9uIHsKfQpkbWV2ZW50
ZCB7Cn0KCiQgZ3JlcCAtdiAnXltbOnNwYWNlOl1dKiNcfF4kJyBldGMvbHZtL2x2bWxvY2FsLmNv
bmYKbG9jYWwgewp9Cj4gCj4gTm90IHJlYWxseSBzdXJlIGhvdyBhcmUgeW91IHRyeWluZyB0byBi
dWlsZCB0aGlzIHlvdXJzZWxmIHNpbmNlIHRoZQo+IEZlZG9yYSBhbmFjb25kYSBpbnN0YWxsZXIg
c2hvdWxkIGJlIGRvaW5nIGFsbCBvZiB0aGlzIGZvciB5b3UKPiBhdXRvbWF0aWNhbGx5IC0gc28g
aG93IGRpZCB5b3UgZ290IHRvIHRoZSBwb2ludCB5b3UgZG9uJ3QgZ2V0IHRoaXMgZnJvbQo+IHlv
dXIgaW5zdGFsbGF0aW9uIHRpbWUgPwoKSSBoYXZlIGEgVk0gYm9vdGVkIHdpdGggcWVtdS1zeXN0
ZW0teDg2XzY0IGFuZCBJIGFtIGJ1aWxkaW5nIGtlcm5lbCBhbmQgaW5pdHJkCm9uIHRoZSBob3N0
LiBJIGFtIGxvb2tpbmcgdG8gYm9vdCB0aGUgVk0gd2l0aCAta2VybmVsIGFuZCAtaW5pdHJkIG9w
dGlvbnMKPiAKPiBSZWdhcmRzCj4gCj4gWmRlbmVrCj4gCgpUaGFua3MKCnZpc2hhbC5jCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1sdm0gbWFp
bGluZyBsaXN0CmxpbnV4LWx2bUByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtbHZtCnJlYWQgdGhlIExWTSBIT1ctVE8gYXQgaHR0cDov
L3RsZHAub3JnL0hPV1RPL0xWTS1IT1dUTy8K

