Return-Path: <SRS0=XKGo=OU=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C6F2C433EF
	for <linux-lvm@archiver.kernel.org>; Thu, 30 Sep 2021 15:32:54 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13C1E615A7
	for <linux-lvm@archiver.kernel.org>; Thu, 30 Sep 2021 15:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 13C1E615A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-0ngVmZCTN6SIPdG5AqARfg-1; Thu, 30 Sep 2021 11:32:51 -0400
X-MC-Unique: 0ngVmZCTN6SIPdG5AqARfg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFFF4DF8A4;
	Thu, 30 Sep 2021 15:32:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D2E360BF1;
	Thu, 30 Sep 2021 15:32:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BC4174EA2F;
	Thu, 30 Sep 2021 15:32:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18UFWUZC013979 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 30 Sep 2021 11:32:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8839DF97FC; Thu, 30 Sep 2021 15:32:30 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 81E92F897F
	for <linux-lvm@redhat.com>; Thu, 30 Sep 2021 15:32:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65D928032EB
	for <linux-lvm@redhat.com>; Thu, 30 Sep 2021 15:32:30 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.111.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-158-8XBZbKrbPWCgBQ7p1wn-lg-1;
	Thu, 30 Sep 2021 11:32:28 -0400
X-MC-Unique: 8XBZbKrbPWCgBQ7p1wn-lg-1
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
	(mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-4-PYXIUGpPO1OhzdcwjLPSsg-1; Thu, 30 Sep 2021 17:32:25 +0200
X-MC-Unique: PYXIUGpPO1OhzdcwjLPSsg-1
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
	DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.4544.13; Thu, 30 Sep 2021 15:32:23 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::41ea:157:e802:5d8d]) by DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::41ea:157:e802:5d8d%6]) with mapi id 15.20.4544.023;
	Thu, 30 Sep 2021 15:32:23 +0000
To: Peter Rajnoha <prajnoha@redhat.com>
References: <20210607214835.GB8181@redhat.com>
	<20210608122901.o7nw3v56kt756acu@alatyr-rpi.brq.redhat.com>
	<f6b8c5b6c01ecef842eb711748a765f81b7f04e7.camel@suse.com>
	<20210909194417.GC19437@redhat.com>
	<20210927100032.xczilyd5263b4ohk@alatyr-rpi.brq.redhat.com>
	<20210927153822.GA4779@redhat.com>
	<9947152f39a9c5663abdbe3dfee343556e8d53d7.camel@suse.com>
	<20210928144254.GC11549@redhat.com>
	<138b7ddb721b6a58df8f0401b76c7975678f0dda.camel@suse.com>
	<20210928174246.GF3087@octiron.msp.redhat.com>
	<20210929220653.p45cvgzdhlbnp4gy@alatyr-rpi.brq.redhat.com>
	<e8459ca73b148e9ba20cbde0041f6e5f4093699d.camel@suse.com>
	<a3ef9433-ccab-68ea-de00-caebd74e81dc@suse.com>
	<d7248c67-afdf-9f27-bf41-13b74346f0c1@redhat.com>
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <7e91a1e8-2379-a33c-1482-b31adaa7bc8b@suse.com>
Date: Thu, 30 Sep 2021 23:32:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.14.0
In-Reply-To: <d7248c67-afdf-9f27-bf41-13b74346f0c1@redhat.com>
X-ClientProxiedBy: HKAPR04CA0009.apcprd04.prod.outlook.com
	(2603:1096:203:d0::19) To DB7PR04MB4666.eurprd04.prod.outlook.com
	(2603:10a6:5:2b::14)
MIME-Version: 1.0
Received: from c73.home (123.123.134.218) by
	HKAPR04CA0009.apcprd04.prod.outlook.com (2603:1096:203:d0::19)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15
	via Frontend Transport; Thu, 30 Sep 2021 15:32:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88e2033b-236e-4c50-fc58-08d984278004
X-MS-TrafficTypeDiagnostic: DB8PR04MB7065:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB7065A752F6AE43B5CA796D1D97AA9@DB8PR04MB7065.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: xs8hUA4oQpPOIKbpf3akH7nwn7Fnq5/KPcTln48kbPinDc26DfTwXjxWY9qMnTWaLccc7X6a43aOLQuRNLzRCLTSyjuFGdfrLKok2ncJloIg40amPAD6qCJ0rZtGgrYpye92HvdC0FyCxFX8tgF+S8ovlPhhyvBAkVXDrS7j2adQNKGMZDpWZvrRB/EtMTWS/Pcn8ZONVRtcQWYaunXcBr8zNZPDCuddN9QHvawMGWM6Lx8s0aWSV0XDhLXRUbo24GX+CXHDV1MyzON6kcsmYwPfNfUp0K2/zLzBeQV823HuxM/eavJJukcZc3BVn7n3npWbi2WB/kDmDoPjzDUkpmH2P6J50JEOUBKC4kJGfUWwY5tX/WgjkZY41xVbebNLJK4PRf5e1GDrC3sLfflsv0aDLHDUfXG0S4wj1yZVhSqshC3I9TUEGbPG+lU4bvtLEaG3NBwAKKrIvUGhUnrnYYCojpLAkDCPIJ1pwz4Nzv2GtCsApTESsyPKSkJCdehzx5R45L1pR+wQyh1inpYtnYKU5NiMRj3zwNFjFxxGlVBttIhn/R+kt4w12a+adidNo+1/5Qu+seVm3xvtZPY9A9QA52lcD7q+LoMz1waH1nJchgwYykICnM9684UFIM7VyqcthURz0UHra2fm3Yr02Vhw+P+5ihLl1xkGIuj5UXQqM4BgYH3bCj3zXKVpPZTpHMXgjyyYzFK2Ww2ONhNzbU7AyFyP/3p7bELe4bpUyyjIz/jGBKGf3JyB9MyUeY2tPyDrgvpbrLyfZ69fSufb1/wE/T+PBMU2Buiq3aq8+1w6pi/tDL1wUOlzwkIhIduM2iTbM/7tBo7eQRF3HRMMQhURWsAAWMakwh9KC4DfkfG/OD5jS5Au4baZjbX7PoL1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB7PR04MB4666.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(8886007)(26005)(186003)(53546011)(31686004)(2616005)(6916009)(508600001)(2906002)(966005)(956004)(5660300002)(6486002)(36756003)(66946007)(6512007)(450100002)(54906003)(86362001)(4326008)(8936002)(66476007)(8676002)(83380400001)(38100700002)(6506007)(6666004)(31696002)(316002)(66556008)(9126006)(43740500002)(45980500001);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l4PP2eflv49gFFde9k9qPr96QVN4EqmTpyp8ftSL/F7cRFDuAZ7I/6f3u3f6?=
	=?us-ascii?Q?BXFoAxpkuoCZNL4P3gQ/0nSbxDLj0dC40Fm4zdDaxQi5SV4G4JEcMZPj3v6h?=
	=?us-ascii?Q?oSO26nSpT376oBkc2rxX5DlTgiY2XaXajZVPDaxQp+9KVyAu68b58q+t3TgL?=
	=?us-ascii?Q?fRHzis2V/42n/RspAqDvV0+FoiJ64mEmCHzDoZT9wpc5tWy7WTzVq6QqdDJf?=
	=?us-ascii?Q?IzxBHYDbsPaIJnk6T+fCEoU5xPoplxCQ1lv9npe9tsDgbZpmgr0EWmioqCXC?=
	=?us-ascii?Q?6cUH4iFQIVhiy7/0JR5LM17Y3bmh9InUFU3izxZK3Q00siapW88/6zWw60G6?=
	=?us-ascii?Q?e8wwkMaWBj+dr+5eTg4vGOIjS5BX8UV4Us9cCAjqNxFwnaE43IhhUfRcCdIU?=
	=?us-ascii?Q?cbJLOKt6Tjllz7b6kbVldnHxXPVaR+bmog3YR4OZLlc15sCW5XlWnwimL2rp?=
	=?us-ascii?Q?TC2nXINJA2lZOLuo4e8rWKkSor/pnIJloWjgeqNW6hJ3mqXvlV4Gppb5VAuy?=
	=?us-ascii?Q?z9G15Wo5rk+DjbM6FLdqthxNCfirM2z4rPxgidKTmFIJ8slapTyRlGg8RVCA?=
	=?us-ascii?Q?9s75wYvOXR+/4tAHhItUxFHpNzYLAuH9NAtDUxNgZIqQlU/p2gwXOloJBEkn?=
	=?us-ascii?Q?Q9I1gyu887m7/QuEd2p8u78nh/3ngLKGGfjMFE5MvAyT7K4DqDXEsoTeqmIj?=
	=?us-ascii?Q?addfznfZE1ICnCwM8pb7fuQJ2Dxn2aJWsYgrJqgxf4FnsvwcTEb9/EAJOP4I?=
	=?us-ascii?Q?TaJ7Y69Aj0q8fLWgeRBFMijFoXVZ+bhZcz5MLEal1XRJ4by2v96rT8w1CqKd?=
	=?us-ascii?Q?hZCcJHxSY0xfUdxR6Dgd/IJZkKrcQudAUnZ/Pr9hBIhmjZa+OeoHEV+YLwQT?=
	=?us-ascii?Q?OE9KVbLwXAXy1hS9r185GKBKKodOnVUNy+8cFZlMZ/VklaQcEoN0zS6jBceH?=
	=?us-ascii?Q?/D09ANPRXRER7JGF7Kaqax3xNoqN1whTvz8deQSNKBcQVgnwhbhmd3Czufp5?=
	=?us-ascii?Q?UgO5z/e2oRPQtzjcfzNcUUy7vypVqXZzVRrZMD+0YeJktNZyfy9bkOYaCU/m?=
	=?us-ascii?Q?e3YgxdJacHPr0p1xjLcV/WPQrqxPDNnUALR1hD6xp3T/LV8paLULfB/v04am?=
	=?us-ascii?Q?+EhqI9B7vO4Shl7zAUqbmIT+S42wK3O1WKqYyyoCGGNrB4M4FHDe6abMcscs?=
	=?us-ascii?Q?cZL03JFfp5Lj0E22mMJEpZoWM5GnSM6EncpxCOrcIiC4+RjN5I9Zy1wfRe3F?=
	=?us-ascii?Q?vU6jRwlQJPGf2X7rv0xVUWW1AOdqVVbYibLXHSINMKkQzPxcLGDx3tC8JeHV?=
	=?us-ascii?Q?FNdgW+bqHScs8oOKyP+lUpbr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88e2033b-236e-4c50-fc58-08d984278004
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 15:32:23.7066 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6LlrfJFphwN1jspJtrtiuUwornH5zR11g+ULUgd5ygrDgEioXxx2EbwQu0ICjd4U7eJRkQGqeSJaEjdRjagAMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7065
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 18UFWUZC013979
X-loop: linux-lvm@redhat.com
Cc: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"linux-lvm@redhat.com" <linux-lvm@redhat.com>,
	"teigland@redhat.com" <teigland@redhat.com>,
	Martin Wilck <martin.wilck@suse.com>,
	"zkabelac@redhat.com" <zkabelac@redhat.com>
Subject: Re: [linux-lvm] Discussion: performance issue on event activation
 mode
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

T24gOS8zMC8yMSA3OjQxIFBNLCBQZXRlciBSYWpub2hhIHdyb3RlOgo+IE9uIDkvMzAvMjEgMTA6
MDcsIGhlbWluZy56aGFvQHN1c2UuY29tIHdyb3RlOgo+PiBPbiA5LzMwLzIxIDM6NTEgUE0sIE1h
cnRpbiBXaWxjayB3cm90ZToKPj4+IE9uIFRodSwgMjAyMS0wOS0zMCBhdCAwMDowNiArMDIwMCwg
UGV0ZXIgUmFqbm9oYSB3cm90ZToKPj4+PiBPbiBUdWUgMjggU2VwIDIwMjEgMTI6NDIsIEJlbmph
bWluIE1hcnppbnNraSB3cm90ZToKPj4+Pj4gT24gVHVlLCBTZXAgMjgsIDIwMjEgYXQgMDM6MTY6
MDhQTSArMDAwMCwgTWFydGluIFdpbGNrIHdyb3RlOgo+Pj4+Pj4gSSBoYXZlIHBvbmRlcmVkIHRo
aXMgcXVpdGUgYSBiaXQsIGJ1dCBJIGNhbid0IHNheSBJIGhhdmUgYQo+Pj4+Pj4gY29uY3JldGUK
Pj4+Pj4+IHBsYW4uCj4+Pj4+Pgo+Pj4+Pj4gVG8gYXZvaWQgZGVwZW5kaW5nIG9uICJ1ZGV2IHNl
dHRsZSIsIG11bHRpcGF0aGQgbmVlZHMgdG8KPj4+Pj4+IHBhcnRpYWxseQo+Pj4+Pj4gcmV2ZXJ0
IHRvIHVkZXYtaW5kZXBlbmRlbnQgZGV2aWNlIGRldGVjdGlvbi4gQXQgbGVhc3QgZHVyaW5nCj4+
Pj4+PiBpbml0aWFsCj4+Pj4+PiBzdGFydHVwLCB3ZSBtYXkgZW5jb3VudGVyIG11bHRpcGF0aCBt
YXBzIHdpdGggbWVtYmVycyB0aGF0IGRvbid0Cj4+Pj4+PiBleGlzdAo+Pj4+Pj4gaW4gdGhlIHVk
ZXYgZGIsIGFuZCB3ZSBuZWVkIHRvIGRlYWwgd2l0aCB0aGlzIHNpdHVhdGlvbgo+Pj4+Pj4gZ3Jh
Y2VmdWxseS4gV2UKPj4+Pj4+IGN1cnJlbnRseSBkb24ndCwgYW5kIGl0J3MgYSB0b3VnaCBwcm9i
bGVtIHRvIHNvbHZlIGNsZWFubHkuIE5vdAo+Pj4+Pj4gcmVseWluZwo+Pj4+Pj4gb24gdWRldiBv
cGVucyB1cCBhIFBhbmRvcmEncyBib3ggd3J0IFdXSUQgZGV0ZXJtaW5hdGlvbiwgZm9yCj4+Pj4+
PiBleGFtcGxlLgo+Pj4+Pj4gQW55IHN1Y2ggY2hhbmdlIHdvdWxkIHdpdGhvdXQgZG91YnQgY2Fy
cnkgYSBsYXJnZSByaXNrIG9mCj4+Pj4+PiByZWdyZXNzaW9ucwo+Pj4+Pj4gaW4gc29tZSBzY2Vu
YXJpb3MsIHdoaWNoIHdlIHdvdWxkbid0IHdhbnQgdG8gaGFwcGVuIGluIG91ciBsYXJnZQo+Pj4+
Pj4gY3VzdG9tZXIncyBkYXRhIGNlbnRlcnMuCj4+Pj4+Cj4+Pj4+IEknbSBub3QgYWN0dWFsbHkg
c3VyZSB0aGF0IGl0J3MgYXMgYmFkIGFzIGFsbCB0aGF0LiBXZSBqdXN0IG1heQo+Pj4+PiBuZWVk
IGEKPj4+Pj4gd2F5IGZvciBtdWx0aXBhdGhkIHRvIGRldGVjdCBpZiB0aGUgY29sZHBsdWcgaGFz
IGhhcHBlbmVkLsKgIEknbQo+Pj4+PiBzdXJlIGlmCj4+Pj4+IHdlIHNheSB3ZSBuZWVkIGl0IHRv
IHJlbW92ZSB0aGUgdWRldiBzZXR0bGUsIHdlIGNhbiBnZXQgc29tZSBtZXRob2QKPj4+Pj4gdG8K
Pj4+Pj4gY2hlY2sgdGhpcy4gUGVyaGFwcyB0aGVyZSBpcyBvbmUgYWxyZWFkeSwgdGhhdCBJIGRv
bid0IGtub3cgYWJvdXQuCj4+Pj4+IElmCj4+Pj4KPj4+PiBUaGUgY29sZHBsdWcgZXZlbnRzIGFy
ZSBzeW50aGVzaXplZCBhbmQgYXMgc3VjaCwgdGhleSBhbGwgbm93IGNvbnRhaW4KPj4+PiBTWU5U
SF9VVUlEPTxVVUlEPiBrZXktdmFsdWUgcGFpciB3aXRoIGtlcm5lbD49NC4xMzoKPj4+Pgo+Pj4+
IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRz
L2xpbnV4LmdpdC90cmVlL0RvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtdWV2ZW50Cj4+
Pj4KPj4+PiBJJ3ZlIGFscmVhZHkgdHJpZWQgdG8gcHJvcG9zZWUgYSBwYXRjaCBmb3Igc3lzdGVt
ZC91ZGV2IHRoYXQgd291bGQKPj4+PiBtYXJrCj4+Pj4gYWxsIHVldmVudHMgY29taW5nIGZyb20g
dGhlIHRyaWdnZXIgKGluY2x1ZGluZyB0aGUgb25lIHVzZWQgYXQgYm9vdAo+Pj4+IGZvcgo+Pj4+
IGNvbGRwbHVnKSB3aXRoIGFuIGV4dHJhIGtleS12YWx1ZSBwYWlyIHRoYXQgd2UgY291bGQgZWFz
aWx5IG1hdGNoIGluCj4+Pj4gcnVsZXMsCj4+Pj4gYnV0IHRoYXQgd2FzIG5vdCBhY2NlcHRlZC4g
U28gcmlnaHQgbm93LCB3ZSBjb3VsZCBkZXRlY3QgdGhhdAo+Pj4+IHN5bnRoZXNpemVkIHVldmVu
dCBoYXBwZW5lZCwgdGhvdWdoIHdlIGNhbid0IGJlIHN1cmUgaXQgd2FzIHRoZQo+Pj4+IGFjdHVh
bAo+Pj4+IHVkZXYgdHJpZ2dlciBhdCBib290LiBGb3IgdGhhdCwgd2UnZCBuZWVkIHRoZSBleHRy
YSBtYXJrcy4gSSBjYW4gZ2l2ZQo+Pj4+IGl0Cj4+Pj4gYW5vdGhlciB0cnkgdGhvdWdoLCBtYXli
ZSBpZiB0aGVyZSBhcmUgbW9yZSBwZW9wbGUgYXNraW5nIGZvciB0aGlzCj4+Pj4gZnVuY3Rpb25h
bGl0eSwgd2UnbGwgYmUgYXQgYmV0dGVyIHBvc2l0aW9uIGZvciB0aGlzIHRvIGJlIGFjY2VwdGVk
Lgo+Pj4KPj4+IFRoYXQgd291bGQgYWxsb3cgdXMgdG8gZGlzY2VybiBzeW50aGV0aWMgZXZlbnRz
LCBidXQgSSdtIHVuc3VyZSBob3cKPj4+IHRoaXMgd2hhdCBoZWxwIHVzLiBIZXJlLCB3aGF0IG1h
dHRlcnMgaXMgdG8gZmlndXJlIG91dCB3aGVuIHdlIGRvbid0Cj4+PiBleHBlY3QgYW55IG1vcmUg
b2YgdGhlbSB0byBhcnJpdmUuCj4+Pgo+Pj4gSSBndWVzcyBpdCB3b3VsZCBiZSBwb3NzaWJsZSB0
byBjb21wYXJlIHRoZSBsaXN0IG9mIChpbnRlcmVzdGluZykKPj4+IGRldmljZXMgaW4gc3lzZnMg
d2l0aCB0aGUgbGlzdCBvZiBkZXZpY2VzIGluIHRoZSB1ZGV2IGRiLiBGb3IKPj4+IG11bHRpcGF0
aGQsIHdlIGNvdWxkCj4+Pgo+Pj4gwqAgLSBzY2FuIHNldCBVIG9mIHVkZXYgZGV2aWNlcyBvbiBz
dGFydHVwCj4+PiDCoCAtIHNjYW4gc2V0IFMgb2Ygc3lzZnMgZGV2aWNlcyBvbiBzdGFydHVwCj4+
PiDCoCAtIGxpc3RlbiBmb3IgdWV2ZW50cyBmb3IgdXBkYXRpbmcgYm90aCBTIGFuZCBVCj4+PiDC
oCAtIGFmdGVyIGVhY2ggdWV2ZW50LCBjaGVjayBpZiB0aGUgZGlmZmVyZW5jZSBzZXQgb2YgUyBh
bmQgVSBpcyBlbXRweQo+Pj4gwqAgLSBpZiB5ZXMsIGNvbGRwbHVnIGhhcyBmaW5pc2hlZAo+Pj4g
wqAgLSBvdGhlcndpc2UsIGNvbnRpbnVlIHdhaXRpbmcsIHBvc3NpYmx5IHVudGlsIHNvbWUgdGlt
ZW91dCBleHBpcmVzLgo+Pj4KPj4+IEl0J3MgbW9yZSBkaWZmaWN1bHQgZm9yIExWTSBiZWNhdXNl
IHlvdSBoYXZlIG5vIGRhZW1vbiBtYWludGFpbmluZwo+Pj4gc3RhdGUuCj4+Pgo+Pgo+PiBBbm90
aGVyIHBlcmZvcm1hbmNlIHN0b3J5Ogo+PiBUaGUgbGVnYWN5IGx2bTIgKDIuMDIueHgpIHdpdGgg
bHZtZXRhZCBkYWVtb24sIHRoZSBldmVudC1hY3RpdmF0aW9uIG1vZGUKPj4gaXMgdmVyeSBsaWtl
bHkgdGltZW91dCBvbiBhIGxhcmdlIHNjYWxlIFBWcy4KPj4gV2hlbiBjdXN0b21lciBtZXQgdGhp
cyBpc3N1ZSwgd2Ugc3VnZ2VzdGVkIHRoZW0gdG8gZGlzYWJsZSBsdm1ldGFkLgo+IAo+IFdlJ3Zl
IGFscmVhZHkgZHVtcGVkIGx2bWV0YWQuIEhhcyB0aGlzIGFsc28gYmVlbiBhbiBpc3N1ZSB3aXRo
IGx2bSB2ZXJzaW9ucyB3aXRob3V0IGx2bWV0YWQsIGJ1dCBzdGlsbCB1c2luZyB0aGUgZXZlbnQt
YWN0aXZhdGlvbiBtb2RlPyAoLi4udGhlIGx2bSB2ZXJzaW9ucyB3aGVyZSBpbnN0ZWFkIG9mIGx2
bWV0YWQsIHdlIHVzZSB0aGUgaGVscGVyIGZpbGVzIHVuZGVyIC9ydW4vbHZtIHRvIHRyYWNrIHRo
ZSBzdGF0ZSBvZiBpbmNvbWluZyBQVnMgYW5kIFZHIGNvbXBsZXRlbmVzcykKPiAKPiBBbHNvLCB3
aGVuIEkgdHJpZWQgYm9vdHVwIHdpdGggb3ZlciAxMDAwIGRldmljZXMgaW4gcGxhY2UgKHRob3Vn
aCBpbiBhIFZNLCBJIGRvbid0IGhhdmUgYWNjZXNzIHRvIHJlYWwgbWFjaGluZSB3aXRoIHNvIG1h
bnkgZGV2aWNlcyksIEkndmUgbm90aWNlZCBhIHBlcmZvcm1hbmNlIHJlZ3Jlc3Npb24gaW4gbGli
dWRldiBpdHNlbGYgd2l0aCB0aGUgaW50ZXJmYWNlIHRvIGVudW1lcmF0ZSBkZXZpY2VzICh3aGlj
aCBpcyB0aGUgZGVmYXVsdCBvYnRhaW5fZGV2aWNlX2xpc3RfZnJvbV91ZGV2PTEgaW4gbHZtLmNv
bmYpOgo+IGh0dHBzOi8vYnVnemlsbGEucmVkaGF0LmNvbS9zaG93X2J1Zy5jZ2k/aWQ9MTk4NjE1
OAo+IAo+IEl0J3MgdmVyeSBpbXBvcnRhbnQgdG8gbWVhc3VyZSB3aGF0J3MgZXhhY3RseSBjYXVz
aW5nIHRoZSBkZWxheXMuIEFuZCBhbHNvIGltcG9ydGFudCBob3cgd2UgbWVhc3VyZSBpdCAtIEkn
bSBub3QgdGhhdCB0cnVzdGZ1bCB0byBzeXN0ZW1kLWFuYWx5emUgYmxhbWUgYXMgaXQncyB2ZXJ5
IG1pc3R5IG9mIHdoYXQgaXQgaXMgYWN0dWFsbHkgbWVhc3VyaW5nLgo+IAo+IEkganVzdCB3YW50
IHRvIHNheSB0aGF0IHNvbWUgb2YgdGhlIGlzc3VlcyBtaWdodCBzaW1wbHkgYmUgcmVncmVzc2lv
bnMvaXNzdWVzIHdpdGggc3lzdGVtZC91ZGV2IHRoYXQgY291bGQgYmUgZml4ZWQuIFdlIGFzIHBy
b3ZpZGVycyBvZiBibG9jayBkZXZpY2UgYWJzdHJhY3Rpb25zIHdoZXJlIHdlIG5lZWQgdG8gaGFu
ZGxlLCBzb21ldGltZXMsIHRob3VzYW5kcyBvZiBkZXZpY2VzLCBtaWdodCBiZSB0aGUgZmlyc3Qg
b25lcyB0byBoaXQgdGhlc2UgaXNzdWVzLgo+IAoKVGhlIHJoZWw4IGNhbGxncmluZCBwaWN0dXJl
IChodHRwczovL3ByYWpub2hhLmZlZG9yYXBlb3BsZS5vcmcvYnoxOTg2MTU4L3JoZWw4X2xpYnVk
ZXZfY3JpdGljYWxfY29zdC5wbmcpCnJlc3BvbmRzIHRvIG15IGFuYWx5c2lzOgpodHRwczovL2xp
c3RtYW4ucmVkaGF0LmNvbS9hcmNoaXZlcy9saW51eC1sdm0vMjAyMS1KdW5lL21zZzAwMDIyLmh0
bWwKaGFuZGxlX2RiX2xpbmUgdG9vayB0b28gbXVjaCB0aW1lIGFuZCBiZWNvbWUgdGhlIGhvdHNw
b3QuCgpIZW1pbmcKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1sdm0gbWFpbGluZyBsaXN0CmxpbnV4LWx2bUByZWRoYXQuY29tCmh0dHBzOi8v
bGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtbHZtCnJlYWQgdGhlIExW
TSBIT1ctVE8gYXQgaHR0cDovL3RsZHAub3JnL0hPV1RPL0xWTS1IT1dUTy8=

