Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E520C433EF
	for <linux-lvm@archiver.kernel.org>; Sat,  7 May 2022 23:15:18 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616--f7mEd8pPc-o5KeCJmEvTA-1; Sat, 07 May 2022 19:15:13 -0400
X-MC-Unique: -f7mEd8pPc-o5KeCJmEvTA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76202101AA46;
	Sat,  7 May 2022 23:15:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 94F03111CD35;
	Sat,  7 May 2022 23:14:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6EBF11947061;
	Sat,  7 May 2022 23:14:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 65908194705D
 for <linux-lvm@listman.corp.redhat.com>; Sat,  7 May 2022 23:14:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3BB0A4010E49; Sat,  7 May 2022 23:14:54 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 377654010E24
 for <linux-lvm@redhat.com>; Sat,  7 May 2022 23:14:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 200B3101AA42
 for <linux-lvm@redhat.com>; Sat,  7 May 2022 23:14:54 +0000 (UTC)
Received: from st43p00im-ztfb10071701.me.com (st43p00im-ztfb10071701.me.com
 [17.58.63.173]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-FEY3A4uKNguqMNlA4nwnJA-1; Sat, 07 May 2022 19:14:52 -0400
X-MC-Unique: FEY3A4uKNguqMNlA4nwnJA-1
Received: from [192.168.6.176] (st43p00im-dlb-asmtp-mailmevip.me.com
 [17.42.251.41])
 by st43p00im-ztfb10071701.me.com (Postfix) with ESMTPSA id A420CA0500
 for <linux-lvm@redhat.com>; Sat,  7 May 2022 23:14:51 +0000 (UTC)
From: Alex Lieflander <atlief@icloud.com>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Date: Sat, 7 May 2022 19:14:50 -0400
References: <7534073B-7DBD-46B5-9CA5-BFB3C603C75E@icloud.com>
 <25199.10122.376547.499176@quad.stoffel.home>
 <324D8F25-90D3-4165-BE86-11B217DAFDE4@icloud.com>
 <25200.21283.981034.416787@quad.stoffel.home>
 <87561BC7-DDA5-4BC9-9F98-17118199E96D@icloud.com>
 <6d72d74a-98cc-b055-d1ba-bcd20201e67@gathman.org>
To: LVM general discussion and development <linux-lvm@redhat.com>
In-Reply-To: <6d72d74a-98cc-b055-d1ba-bcd20201e67@gathman.org>
Message-Id: <4D4E1DC0-8A04-474C-8DB2-4C9429F092F2@icloud.com>
X-Proofpoint-GUID: dPOh8gVrhhxkvqvEPr5pBgpRPL6ZZMsn
X-Proofpoint-ORIG-GUID: dPOh8gVrhhxkvqvEPr5pBgpRPL6ZZMsn
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.425,18.0.816,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-17=5F04:2022-01-14=5F01,2022-01-17=5F04,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=660
 mlxscore=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205070159
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiBPbiBNYXkgNywgMjAyMiwgYXQgNDo0MSBQTSwgU3R1YXJ0IEQgR2F0aG1hbiB3cm90ZToKPiAK
Pj4gT24gRnJpLCA2IE1heSAyMDIyLCBBbGV4IExpZWZsYW5kZXIgd3JvdGU6Cj4+IAo+PiBUaGFu
a3MuIEkgcmVhbGx5IGRvbuKAmXQgd2FudCB0byBnaXZlIHVwIHRoZSBETS1JbnRlZ3JpdHkgbWFu
YWdlbWVudC4gTGVzcyBjb21wbGV4aXR5IGlzIGp1c3QgYSBib251cy4KPiAKPiBXaGF0IGFyZSB5
b3UgdHJ5aW5nIHRvIGdldCBvdXQgb2YgUkFJRDY/ICBJZiByZWR1bmRhbmN5IGFuZCBpbnRlZ3Jp
dHkKPiBhcmUgYWxyZWFkeSBtYW5hZ2VkIGF0IGFub3RoZXIgbGF5ZXIsIHRoZW4ganVzdCB1c2Ug
UkFJRDAgZm9yIHN0cmlwaW5nLgo+IAo+IEkgbGlrZSB0byB1c2UgUkFJRDEwIGZvciBtaXJyb3Ig
KyBzdHJpcGluZywgYnV0IEkgdW5kZXJzdGFuZCBwYXJpdHkgZGlza3MgZ2l2ZSByZWR1bmRhbmN5
IHdpdGhvdXQgaGFsdmluZyBjYXBhY2l0eS4gIFBhcml0eSBtZWFucyBSTVcgY3ljbGVzIG9mCj4g
bGFyZ2lzaCBibG9ja3MsIHdoZXJlYXMgc3RyYWlnaHQgbWlycm9yaW5nIChSQUlEMSwgUkFJRDEw
KSBjYW4gd3JpdGUKPiBzaW5nbGUgc2VjdG9ycyB3aXRob3V0IGEgUk1XIGN5Y2xlLgoKSSBkb27i
gJl0IHRydXN0IHRoZSBoYXJkd2FyZSBJ4oCZbSBydW5uaW5nIG9uIHZlcnkgbXVjaCwgYnV0IGl0
4oCZcyBhbGwgSSBoYXZlIHRvIHdvcmsgd2l0aCBhdCB0aGUgbW9tZW50OyBpdOKAmXMgaW1wb3J0
YW50IHRoYXQgdGhlIGFycmF5IGlzIHJlc2lsaWVudCB0byAqYW55KiAoYW5kIG11bHRpcGxlKSBz
aW5nbGUgY2h1bmsgY29ycnVwdGlvbnMgYmVjYXVzZSBzdWNoIGNvcnJ1cHRpb25zIGFyZSBsaWtl
bHkgdG8gaGFwcGVuIGluIHRoZSBmdXR1cmUuCgpGb3IgdGhlIGxhc3Qgc2V2ZXJhbCBtb250aHMg
SeKAmXZlIHBlcmlvZGljYWxseSBiZWVuIHNlZWluZyAoRE0tSW50ZWdyaXR5KSBjaGVja3N1bSBt
aXNtYXRjaCB3YXJuaW5ncyBhdCB2YXJpb3VzIGxvY2F0aW9ucyBvbiBhbGwgb2YgbXkgZGlza3Mu
IEkgc3RvcHBlZCB1c2luZyBhIGZldyBTQVRBIHBvcnRzIHRoYXQgd2VyZSBleHBsaWNpdGx5IHRo
cm93aW5nIFNBVEEgZXJyb3JzLCBidXQgSSBzdXNwZWN0IHRoYXQgdGhlIHJlbWFpbmluZyBjb25u
ZWN0aW9ucyBhcmUgdW5wcmVkaWN0YWJseSAoYWxiZWl0IGluZnJlcXVlbnRseSkgY29ycnVwdGlu
ZyBkYXRhIGluIHdheXMgdGhhdCBhcmUgbW9yZSBkaWZmaWN1bHQgdG8gZGV0ZWN0LgoKSeKAmXZl
IHRyaWVkIHRvIOKAnGNoZWNr4oCdIGFuZCDigJxyZXBhaXLigJ0gbXkgYXJyYXkgb24gbXVsdGlw
bGUga2VybmVsIHZlcnNpb25zIGFuZCBsaXZlIHJlY292ZXJ5IFVTQiBzdGlja3MsIGJ1dCB0aGUg
4oCcY2hlY2siIGFsd2F5cyBzZWVtcyB0byBmcmVlemUgYW5kIGFsbCBzdWJzZXF1ZW50IElPIHRv
IHRoZSBhcnJheSBoYW5ncyB1bnRpbCByZWJvb3Q7IGF0IHRoZSBtb21lbnQsIGEgY2h1bmsgaXMg
b25seSBldmVyIG1hZGUgY29uc2lzdGVudCB3aGVuIGl0cyBkYXRhIGlzIG92ZXJ3cml0dGVuLCBz
byBpdCBuZWVkcyB0byBzdXJ2aXZlIHBlcmlvZGljLCByYW5kb20gY29ycnVwdGlvbiBmb3IgYXMg
bG9uZyBhcyBwb3NzaWJsZS4KCkkgYWxzbyBoYXZlIGEgZGlzayB0aGF0IGluZnJlcXVlbnRseSBm
YWlscyB0byByZWFkIGZyb20gYSBwYXJ0aWN1bGFyIGFyZWEsIGJ1dCB0aGUgcmVzdCBvZiB0aGUg
ZGlzayBpcyBmaW5lLiBJIHdvdWxkbuKAmXQgdHJ1c3QgdGhhdCBkaXNrIHdpdGggdmFsdWFibGUg
ZGF0YSwgYnV0IGl0IHNlZW1zIGxpa2UgYSBwZXJmZWN0IGNhbmRpZGF0ZSB0byBob2xkIGFkZGl0
aW9uYWwgcGFyaXR5IChyYWlkNl9sc182KSB0aGF0IEkgaG9wZWZ1bGx5IG5ldmVyIG5lZWQuCgpB
bGV4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1sdm0gbWFpbGluZyBsaXN0CmxpbnV4LWx2bUByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5y
ZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtbHZtCnJlYWQgdGhlIExWTSBIT1ctVE8g
YXQgaHR0cDovL3RsZHAub3JnL0hPV1RPL0xWTS1IT1dUTy8K

