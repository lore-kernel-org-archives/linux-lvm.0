Return-Path: <SRS0=jnPW=PR=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B850BC433F5
	for <linux-lvm@archiver.kernel.org>; Fri, 29 Oct 2021 11:07:19 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2AE460249
	for <linux-lvm@archiver.kernel.org>; Fri, 29 Oct 2021 11:07:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A2AE460249
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=werft22.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-4RAFKT5GMFKI55YJQOShIw-1; Fri, 29 Oct 2021 07:07:14 -0400
X-MC-Unique: 4RAFKT5GMFKI55YJQOShIw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 605E680668C;
	Fri, 29 Oct 2021 11:07:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7484C1017E35;
	Fri, 29 Oct 2021 11:07:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6C4EA4E9E2;
	Fri, 29 Oct 2021 11:06:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19RKl4D6003811 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 27 Oct 2021 16:47:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 81CB3400F3E3; Wed, 27 Oct 2021 20:47:04 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CBE640D1B9D
	for <linux-lvm@redhat.com>; Wed, 27 Oct 2021 20:47:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5FCCE811E76
	for <linux-lvm@redhat.com>; Wed, 27 Oct 2021 20:47:04 +0000 (UTC)
Received: from CHE01-GV0-obe.outbound.protection.outlook.com
	(mail-gv0che01on2131.outbound.protection.outlook.com [40.107.23.131])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-574-yjIQUUvFNgiV3V-Gyyt-wg-1; Wed, 27 Oct 2021 16:47:02 -0400
X-MC-Unique: yjIQUUvFNgiV3V-Gyyt-wg-1
Received: from SV0P279CA0039.NORP279.PROD.OUTLOOK.COM (2603:10a6:f10:13::8) by
	GVAP278MB0778.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:55::14) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.4628.16; Wed, 27 Oct 2021 20:46:58 +0000
Received: from HE1EUR02FT042.eop-EUR02.prod.protection.outlook.com
	(2603:10a6:f10:13:cafe::31) by SV0P279CA0039.outlook.office365.com
	(2603:10a6:f10:13::8) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13 via
	Frontend Transport; Wed, 27 Oct 2021 20:46:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 52.169.0.179)
	smtp.mailfrom=werft22.com; redhat.com;
	dkim=fail (body hash did not verify)
	header.d=nanoo.onmicrosoft.com; redhat.com;
	dmarc=bestguesspass action=none
	header.from=werft22.com
Received: from eu2.smtp.exclaimer.net (52.169.0.179) by
	HE1EUR02FT042.mail.protection.outlook.com (10.152.11.159) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.20.4649.14 via Frontend Transport; Wed, 27 Oct 2021 20:46:57 +0000
Received: from CHE01-ZR0-obe.outbound.protection.outlook.com (104.47.22.113)
	by eu2.smtp.exclaimer.net (52.169.0.179) with Exclaimer Signature
	Manager ESMTP Proxy eu2.smtp.exclaimer.net (tlsversion=TLS12,
	tlscipher=TLS_ECDHE_WITH_AES256_SHA384); Wed, 27 Oct 2021 20:46:57 +0000
X-ExclaimerHostedSignatures-MessageProcessed: true
X-ExclaimerProxyLatency: 11652432
X-ExclaimerImprintLatency: 314825
X-ExclaimerImprintAction: a5e22d20e0fb458dbdab2bf6ea66e563
Authentication-Results-Original: redhat.com; dkim=none (message not signed)
	header.d=none; redhat.com;
	dmarc=none action=none header.from=werft22.com
Received: from ZRAP278MB0397.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::5) by
	ZRAP278MB0351.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2a::7) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.4628.18; Wed, 27 Oct 2021 20:46:55 +0000
Received: from ZRAP278MB0397.CHEP278.PROD.OUTLOOK.COM
	([fe80::8d27:f211:395a:f942]) by ZRAP278MB0397.CHEP278.PROD.OUTLOOK.COM
	([fe80::8d27:f211:395a:f942%6]) with mapi id 15.20.4628.020;
	Wed, 27 Oct 2021 20:46:55 +0000
From: Andreas Trottmann <andreas.trottmann@werft22.com>
To: linux-lvm@redhat.com
References: <82721064-e346-9256-3f29-c5df310553ac@werft22.com>
Message-ID: <8829a805-f55d-695a-4192-65d1386feac9@werft22.com>
Date: Wed, 27 Oct 2021 22:46:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.14.0
In-Reply-To: <82721064-e346-9256-3f29-c5df310553ac@werft22.com>
X-ClientProxiedBy: ZR0P278CA0107.CHEP278.PROD.OUTLOOK.COM
	(2603:10a6:910:23::22) To ZRAP278MB0397.CHEP278.PROD.OUTLOOK.COM
	(2603:10a6:910:2e::5)
MIME-Version: 1.0
Received: from [IPv6:2a02:168:f013:0:ccbe:9f63:d676:f181]
	(2a02:168:f013:0:ccbe:9f63:d676:f181) by
	ZR0P278CA0107.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:23::22)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14
	via Frontend Transport; Wed, 27 Oct 2021 20:46:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1e4ccbf-9dc4-40f5-4870-08d9998aeb09
X-MS-TrafficTypeDiagnostic: ZRAP278MB0351:|GVAP278MB0778:
X-Microsoft-Antispam-PRVS: <GVAP278MB0778613B687E8C202D0E75B2E2859@GVAP278MB0778.CHEP278.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0
X-Microsoft-Antispam-Message-Info-Original: Wm3fNWEw4kwOynmuTKxf10oCAfBJ31cok2+7UKeE+U+1QFX/APR7qa6n0OVEW0Y4Dhk0JH+R5G7rYd9HyHWkXHUJ0YCAZIUTuBs2v6UL4vVKaN5ZJHr/PyqCESUFKXlnCbmyhk9PG4Q03NPr+AeEGxemsTtX8X/AYSFOyeTamZadi0bXPDIBvfw5D9jhTIQ4ewjRMRYxxhBm3sW8fM6eeNHM4nLY1n+Xe5+zK8DMjhT/f7EualxENg65SePpDLv9Q1ftJnBwwYTBtEhAQcLbIfjKehIhBJzABGLhB/WRecgZ3zQvYzXJOL6ghkc9gaVxy1B5lWjdHtPgIWS+srujCpHJ3vbqMUoMDqEXVFODNHUeX6hJIwx8dD5Xvu9J+ZonHOBXZHdeKTfbV7mvImUjXGN/yvuYbPAbA9JAAKTSwO4l9arsQO78xtbdyoUQmQfzKX3AFgXdiggd4k823wpp9J2/BaXGzMB72Or12JDZYWe77ia5UvQkFz4h8YZLZHsWvHU5litZLxc/Nj22RuAnb8hC0tNCzR0txk5ZvCbArM82oCOxFh+z8P1TLJr+cSdPLndFk8HvMXkjTFKfctMUxjmZsckSrZuKsOTHf1H+73Byw7/sSpdEOaQdwR46GmCHZKwI0rPARLwfImbT6wJHqsAcSMguHs/8Pe0Uc8NDE7xn43XmOewMQ14mTUzI4eHMyl/n6vkD9yZeSTJXbuwL9bz8EM/9KdEUhYBd4RpRV+89Hrqkl3TDIDDo7mTBnheI
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
	SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:ZRAP278MB0397.CHEP278.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
	SFS:(346002)(136003)(39830400003)(376002)(366004)(396003)(6916009)(6486002)(38100700002)(2616005)(508600001)(66946007)(5660300002)(66476007)(2906002)(8676002)(36756003)(86362001)(31686004)(186003)(44832011)(83380400001)(8936002)(316002)(19627235002)(31696002)(66556008)(14143004)(43740500002)(45980500001);
	DIR:OUT; SFP:1102
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZRAP278MB0351
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HE1EUR02FT042.eop-EUR02.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0c88addf-d363-405b-b780-08d9998ae98e
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: sGWmiGyLZNISzcQIVoCfOnOueyEXjb2cxQswbsYpWWoSvUl/Zd45t6wcLruG6Cs2SnGB6LLQOETDMBa8JqlnkvBrfc+e796HMdHhXJpouoUwgeW2Vw04KgjoT/5xkrGPte232wd0/ileM39drS/qcjHwD02FOSbFPJJhat/ZzqpBU7eKoaQ9knO0rajqGJJ6GE4Fgq71idhWIBagvHMfrFxud/gAMPNJJJrBW0KAwGaqzrOvUPUgPhPZUpb/AnKpARd/RGlG7Qc+vnXf82BD6Zi5tZjEu6DDGkfiwD/ywZzruXX6vmkDMm3aHxcQKMrZGlgRxkAOhEmAA+fGy4KCg2L2JWx4EtktqaqLlY3RNEMclZpA7NI4tyoPimLqZ0f0VO9pCArxo4vOcMObuFv82IJns5ICvbgZReUn6Mose4Oq3ffdmsuaYPt+LmvOE79tWYneMRA9IZOMpaVKKIu8/1dpECGDfyh/VPjNNfb3XnMUzBOk3UsAYIX7tCS+4A9fJaEhFmLoLUTWvJmYRDwrCsEcansTnhZwrgNuBflu2wkSr9DBZ7d/VaSOZKJDyTjQiumalaqOo4G0SJAY9Z4D5ABbW4z6IXk5h/lXGYq1vGkaNTbeNyN5Gvr2GnJwjag2y7vP10YRw1p3yOdPhu1lsB48U4kI+M+osF+92BPtDm01cqwLGtDFN3v3drVquQ7PKKe5DCH24EPycpbQuIFlBM7rlF05CiQy9itAY6WV4MvP0CBHD36ifojBFkWQIj5L
X-Forefront-Antispam-Report: CIP:52.169.0.179; CTRY:IE; LANG:en; SCL:1; SRV:;
	IPV:CAL; SFV:NSPM; H:eu2.smtp.exclaimer.net;
	PTR:eu2.smtp.exclaimer.net; CAT:NONE;
	SFS:(346002)(39830400003)(396003)(376002)(136003)(46966006)(36840700001)(82310400003)(47076005)(356005)(36860700001)(7596003)(5660300002)(83380400001)(31686004)(336012)(44832011)(8676002)(7636003)(26005)(316002)(8936002)(186003)(70586007)(70206006)(19627235002)(86362001)(2906002)(36756003)(2616005)(508600001)(6486002)(31696002)(6916009)(14143004)(43740500002);
	DIR:OUT; SFP:1102
X-OriginatorOrg: werft22.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 20:46:57.5337 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1e4ccbf-9dc4-40f5-4870-08d9998aeb09
X-MS-Exchange-CrossTenant-Id: 28eff738-e52c-4df8-9f47-73928389e1b3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=28eff738-e52c-4df8-9f47-73928389e1b3; Ip=[52.169.0.179];
	Helo=[eu2.smtp.exclaimer.net]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR02FT042.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVAP278MB0778
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 19RKl4D6003811
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Fri, 29 Oct 2021 07:06:50 -0400
Subject: Re: [linux-lvm] "md/raid:mdX: cannot start dirty degraded array."
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
Content-Language: de-CH
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

QW0gMTEuMTAuMjEgdW0gMTY6MDggc2NocmllYiBBbmRyZWFzIFRyb3R0bWFubjoKCj4gSSBhbSBy
dW5uaW5nIGEgc2VydmVyIHRoYXQgcnVucyBhIG51bWJlciBvZiB2aXJ0dWFsIG1hY2hpbmVzIGFu
ZCBtYW5hZ2VzIHRoZWlyIHZpcnR1YWwgZGlza3MgYXMgbG9naWNhbCB2b2x1bWVzIHVzaW5nIGx2
bXJhaWQgKC4uLikKCj4gQWZ0ZXIgYSByZXN0YXJ0LCBhbGwgb2YgdGhlIGxvZ2ljYWwgdm9sdW1l
cyBjYW1lIGJhY2ssIGV4Y2VwdCBvbmUuCgo+IFdoZW4gSSdtIHRyeWluZyB0byBhY3RpdmF0ZSBp
dCwgSSBnZXQ6Cj4KPiAjIGx2Y2hhbmdlIC1hIHkgL2Rldi92Z19zc2RzXzAvaG9zdC1ob21lCj4g
ICAgQ291bGRuJ3QgZmluZCBkZXZpY2Ugd2l0aCB1dWlkIDhpejBwNS12aDFjLWtheEstY1RSQy0x
cnlkLWVRZDEtd1gxWXE5Lgo+ICAgIGRldmljZS1tYXBwZXI6IHJlbG9hZCBpb2N0bCBvbiAgKDI1
MzoyNDUpIGZhaWxlZDogSW5wdXQvb3V0cHV0IGVycm9yCgoKSSBhbSByZXBseWluZyB0byBteSBv
d24gZS1tYWlsIGhlcmUgaW4gb3JkZXIgdG8gZG9jdW1lbnQgaG93IEkgZ290IHRoZSAKZGF0YSBi
YWNrLCBpbiBjYXNlIHNvbWVvbmUgaW4gYSBzaW1pbGFyIHNpdHVhdGlvbiBmaW5kcyB0aGlzIG1h
aWwgd2hlbiAKc2VhcmNoaW5nIGZvciB0aGUgc3ltcHRvbXMuCgpGaXJzdDogSSBkaWQgKm5vdCog
c3VjY2VlZWQgaW4gYWN0aXZhdGluZyB0aGUgbHZtcmFpZCB2b2x1bWUuIE5vIG1hdHRlciAKaG93
IEkgdHJpZWQgdG8gbW9kaWZ5IHRoZSBfcm1ldGEgdm9sdW1lcywgSSBhbHdheXMgZ290ICJyZWxv
YWQgaW9jdGwgCiguLi4pIGZhaWxlZDogSW5wdXQvb3V0cHV0IGVycm9yIiBmcm9tICJsdmNoYW5n
ZSIsIGFuZCAiY2Fubm90IHN0YXJ0IApkaXJ0eSBkZWdyYWRlZCBhcnJheSIgaW4gZG1lc2cuCgpT
bywgSSB1c2VkICJsdmNoYW5nZSAtYSB5IC9kZXYvdmdfc3Nkc18wL2hvc3QtaG9tZV9yaW1hZ2Vf
MCIgKGFuZCAKX3JpbWFnZV8yIGFuZCBfcmltYWdlXzMsIGFzIHRob3NlIHdlcmUgdGhlIG9uZXMg
dGhhdCB3ZXJlICpub3QqIG9uIHRoZSAKZmFpbGVkIFBWKSB0byBnZXQgYWNjZXNzIHRvIHRoZSBp
bmRpdmR1YWwgUkFJRCBTdWJMVnMuIEkgdGhlbiB1c2VkICJkZCAKaWY9L2Rldi92Z19zc2RzXzAv
aG9zdC1ob21lX3JpbWFnZV8wIG9mPS9tbnQvc3BhY2UvcmltYWdlXzAiIHRvIGNvcHkgdGhlIApk
YXRhIHRvIGEgZmlsZSBvbiBhIGZpbGVzeXN0ZW0gd2l0aCBlbm91Z2ggc3BhY2UuIEkgcmVwZWF0
ZWQgdGhpcyB3aXRoIDIgCmFuZCAzIGFzIHdlbGwuIEkgdGhlbiB1c2VkIGxvc2V0dXAgdG8gYWNj
ZXNzIC9tbnQvc3BhY2UvcmltYWdlXzAgYXMgCi9kZXYvbG9vcDAsIHJpbWFnZV8yIGFzIGxvb3Ay
LCBhbmQgcmltYWdlXzMgYXMgbG9vcDMuCgpOb3cgSSB3YW50ZWQgdG8gdXNlIG1kYWRtIHRvICJi
dWlsZCIgdGhlIFJBSUQgaW4gdGhlICJhcnJheSB0aGF0IGRvZXNuJ3QgCmhhdmUgcGVyLWRldmlj
ZSBtZXRhZGF0YSAoc3VwZXJibG9ja3MpIiBjYXNlOgoKIyBtZGFkbSAtLWJ1aWxkIC9kZXYvbWQw
IC1uIDQgLWMgMTI4IC1sIDUgLS1hc3N1bWUtY2xlYW4gLS1yZWFkb25seSAKL2Rldi9sb29wMCBt
aXNzaW5nIC9kZXYvbG9vcDIgL2Rldi9sb29wMwoKSG93ZXZlciwgdGhpcyBmYWlsZWQgd2l0aCAi
bWRhZG06IFJhaWQgbGV2ZWwgNSBub3QgcGVybWl0dGVkIHdpdGggLS1idWlsZCIuCgooIi1jIDEy
OCIgd2FzIHRoZSBjaHVuayBzaXplIHVzZWQgd2hlbiBjcmVhdGluZyB0aGUgbHZtcmFpZCwgIi1u
IDQiIGFuZCAKIi1sIDUiIHJlZmVyIHRvIHRoZSBudW1iZXIgb2YgZGV2aWNlcyBhbmQgdGhlIHJh
aWQgbGV2ZWwpCgpJIHRoZW4gcmVhZCB0aGUgbWFuIHBhZ2UgYWJvdXQgdGhlICJzdXBlcmJsb2Nr
cyIsIGFuZCBmb3VuZCBvdXQgdGhhdCB0aGUgCiIxLjAiIHN0eWxlIG9mIFJBSUQgbWV0YWRhdGEg
KHNlbGVjdGVkIHdpdGggYW4gbWRhZG0gIi1lIDEuMCIgb3B0aW9uKSAKcGxhY2VzIGEgc3VwZXJi
bG9jayBhdCB0aGUgZW5kIG9mIHRoZSBkZXZpY2UuIFNvbWUgZXhwZXJpbWVudGluZyBvbiAKdW51
c2VkIGRldmljZXMgc2hvd2VkIHRoYXQgdGhlIHNpemUgdXNlZCBmb3IgYWN0dWFsIGRhdGEgd2Fz
IHRoZSBzaXplIG9mIAp0aGUgYmxvY2sgZGV2aWNlIG1pbnVzIDE0NCBLaUIgKHBvc3NpYmx5IDE0
NCBLaUIgPSAxMjggS2lCIChjaHVua3NpemUpICsgCjggS2lCIChzaXplIG9mIHN1cGVyYmxvY2sp
ICsgOCBLaUIgKHNpemUgb2YgYml0bWFwKS4gU28gSSBhZGRlZCAxNDc0NTYgCnplcm8gYnl0ZXMg
YXQgdGhlIGVuZCBvZiBlYWNoIGZpbGU6CgojIGZvciBpIGluIDAgMiAzOyBkbyBoZWFkIC1jIDE0
NzQ1NiAvZGV2L3plcm8gPj4gL21udC9zcGFjZS9yaW1hZ2VfJGk7IGRvbmUKCkFmdGVyIGRldGFj
aGluZyBhbmQgcmUtYXR0YWNoaW5nIHRoZSBsb29wIGRldmljZXMsIEkgcmFuCgojIG1kYWRtIC0t
Y3JlYXRlIC9kZXYvbWQwIC1uIDQgLWMgMTI4IC1sIDUgLWUgMS4wIC0tYXNzdW1lLWNsZWFuIAov
ZGV2L2xvb3AwIG1pc3NpbmcgL2Rldi9sb29wMiAvZGV2L2xvb3AzCgooc3Vic3RpdHV0aW5nICJt
aXNzaW5nIiBpbiB0aGUgcGxhY2Ugd2hlcmUgdGhlIG1pc3NpbmcgUkFJRCBTdWJMViB3b3VsZCAK
aGF2ZSBiZWVuKQoKQW5kLCB2b2lsw6A6IC9kZXYvbWQwIHdhcyBwZXJmZWN0bHkgcmVhZGFibGUs
IGZzY2sgc2hvd2VkIG5vIGVycm9ycywgYW5kIAppdCBjb3VsZCBiZSBtb3VudGVkIGNvcnJlY3Rs
eSwgd2l0aCBhbGwgZGF0YSBpbnRhY3QuCgoKCktpbmQgcmVnYXJkcwoKLS0gCkFuZHJlYXMgVHJv
dHRtYW5uCldlcmZ0MjIgQUcKVGVsICAgICs0MSAoMCk1NiAyMTAgOTEgMzIKRmF4ICAgICs0MSAo
MCk1NiAyMTAgOTEgMzQKTW9iaWxlICs0MSAoMCk3OSAyMjkgODggNTUKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1sdm0gbWFpbGluZyBsaXN0
CmxpbnV4LWx2bUByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtbHZtCnJlYWQgdGhlIExWTSBIT1ctVE8gYXQgaHR0cDovL3RsZHAub3Jn
L0hPV1RPL0xWTS1IT1dUTy8=

