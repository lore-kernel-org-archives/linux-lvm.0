Return-Path: <SRS0=kfxi=LC=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4373C47082
	for <linux-lvm@archiver.kernel.org>; Tue,  8 Jun 2021 16:19:00 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45F4361278
	for <linux-lvm@archiver.kernel.org>; Tue,  8 Jun 2021 16:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45F4361278
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-Lm-x9bmSOc6Ma57_54yi3A-1; Tue, 08 Jun 2021 12:18:57 -0400
X-MC-Unique: Lm-x9bmSOc6Ma57_54yi3A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C1D6102CB6F;
	Tue,  8 Jun 2021 16:18:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DED545D9DC;
	Tue,  8 Jun 2021 16:18:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 59E8B4EE7F;
	Tue,  8 Jun 2021 16:18:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 158GIeq2019866 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 8 Jun 2021 12:18:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8CB9D208C177; Tue,  8 Jun 2021 16:18:40 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 87100208AB95
	for <linux-lvm@redhat.com>; Tue,  8 Jun 2021 16:18:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D52480A0B0
	for <linux-lvm@redhat.com>; Tue,  8 Jun 2021 16:18:37 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.109.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-123-Qp1gNd-mMoigrNCkRabVIg-1;
	Tue, 08 Jun 2021 12:18:34 -0400
X-MC-Unique: Qp1gNd-mMoigrNCkRabVIg-1
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
	(mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-15-kEemp299ObeGwiNElwsP8w-1; Tue, 08 Jun 2021 18:18:31 +0200
X-MC-Unique: kEemp299ObeGwiNElwsP8w-1
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
	DB7PR04MB5980.eurprd04.prod.outlook.com (2603:10a6:10:88::11) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.4195.24; Tue, 8 Jun 2021 16:18:28 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::2c69:3d93:4901:ecfc]) by
	DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::2c69:3d93:4901:ecfc%3]) with mapi id 15.20.4195.030;
	Tue, 8 Jun 2021 16:18:28 +0000
To: David Teigland <teigland@redhat.com>, Martin Wilck <martin.wilck@suse.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<CAAMCDef6sSy5X2+-WLR3wx5m7dx9bhmN3EKWyPa31SebS=wRGQ@mail.gmail.com>
	<dd395e820a4cf9b5e807e8de1e456786eebd2044.camel@suse.com>
	<20210607213003.GA8181@redhat.com>
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <0b83d419-8569-2ba0-5f5b-2c3df4e2eb21@suse.com>
Date: Wed, 9 Jun 2021 00:18:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.10.0
In-Reply-To: <20210607213003.GA8181@redhat.com>
X-Originating-IP: [123.123.133.78]
X-ClientProxiedBy: HK2PR02CA0162.apcprd02.prod.outlook.com
	(2603:1096:201:1f::22) To DB7PR04MB4666.eurprd04.prod.outlook.com
	(2603:10a6:5:2b::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from c73.home (123.123.133.78) by
	HK2PR02CA0162.apcprd02.prod.outlook.com (2603:1096:201:1f::22)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21
	via Frontend Transport; Tue, 8 Jun 2021 16:18:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3dc2c3bb-9fc2-4678-a5fb-08d92a990cf8
X-MS-TrafficTypeDiagnostic: DB7PR04MB5980:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB5980EBEA61089620A4BE12BB97379@DB7PR04MB5980.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: yt2vAt7WfFE5f3IPg/+1CKq9ZS1DaSYP4UZkF51o9aVdHoOWAx9d54/5u/nieDh8UUI4cXUimeN+J98mZYt3DO0XQ7ZK1qure7pT/5ehWfJZPJvoaAC8/+2arthY3Q0OvU8tbNsBBKGou4PcxThB328VjBG3Sb/wXqp5vP8TqVAF2zubXbOX8cnLPfl6Chhpn+Jcf7+oDBjxfbvvSIFwmuXkldW4v2CuMwN8Kqi97C5iZxYtX9GSKmJAXJoDObN1HQ1FFCEVrZzCzvuTj9L7yDODmoSWst+/f7BN1WIGUZhu6hGWeN1oq0qMir7svQpCXAemFUn4q/G2O5+Bc+pM6TsWzrPf0s16w52KXCF0hyR+HG+4TSz6sbx24SwLFOKjjP1zC7FtjAWmuu0hPnE89yuB0cqZiEKhqLSso70VJ8WsSwmdpG8Ty2JmV7VQDihMvwQUJ4vOHzl5OM4B/d+b8Gd1+XvEj8Oszfht0LmL2aR8bD2XJqSEYXuHct5Y1OKbmNKB0zI8N57+/W6UeA+t88WCSmySSb0fHOc82TCTVH0DVPOlWWAGPP1OFs0VY2rIN4BJ89JgK0dXOe1aUvhNp2UWk3A5Sf5xxRHVARA/iiXwUTZG2wmPGCynpno+joccX5UEGeNU2+MmG3Qo9TKlgRw7DkTt/TpErGEe4SXk+jNx8qjuSWlcaTE/U4cgQKAlNlKUW2LvAlcQuOZEbF/qOQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB7PR04MB4666.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(376002)(39850400004)(366004)(396003)(136003)(346002)(6666004)(8886007)(86362001)(66946007)(66476007)(316002)(110136005)(5660300002)(66556008)(956004)(54906003)(26005)(6512007)(6506007)(6636002)(31686004)(16526019)(31696002)(83380400001)(6486002)(8676002)(4326008)(2906002)(36756003)(8936002)(38100700002)(186003)(2616005)(478600001)(53546011)(9126006)(45980500001)(43740500002);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?iguKHjafA1uFcVX5D4kNKXEmDpQNIWOVV+yGQUHsMNnOyCmln6NnFfzauApu?=
	=?us-ascii?Q?T2Vl8WytRH5gV7IJHL/QO8HsoCP/1UFHmQh7tQX6rfGa3cyYO6k4NjHSfcIF?=
	=?us-ascii?Q?BhVaCZ40V+OBp8TdttEyJ7F7zeEAJ/cd9MfZjdqLjDZjg4i7Iz9Db1jM0F1W?=
	=?us-ascii?Q?jhpSyPo+aJ+bf/16HsHxU41+bXRJJvB5YrCeE4q2pKVL5q+eswRpZ68waXXw?=
	=?us-ascii?Q?EzRCu/lNp9FCS3zWPnF2fl4MHk18vm7QsItqcTIDuinXz4IRcTXok0hpjf8R?=
	=?us-ascii?Q?4f5lb7FtCuMpxefvYbqqMHk+xYg8Dxq5MnScgvrG5sCPRAjAzri1yGaVXZJp?=
	=?us-ascii?Q?e1mn4x+3Iqz8RXn2JRtxzpKYbU4UAB3nYKI0uNUTqOEk3PX1IN8Hs8zsqpMF?=
	=?us-ascii?Q?sp9gl4yF5/VLqRnKaX9HC4TdtWU/DRYDdqPMRYjZ+8McAWfjpBnzEVqfo8r9?=
	=?us-ascii?Q?icQg4AgKLH/NCzNEGvB1OyG24PWvJ6nZQRG7BF/QHySUfSdIOMmyjfvsjwnI?=
	=?us-ascii?Q?Ai1rpbVMaJCsyk9oS8yMRRRxyvUgFEa1iTxNAruNkArgUR5b7XP4bDWEzbeX?=
	=?us-ascii?Q?qNwnldzfSXRObRY5bcaD9FbixsQsowhEnYqRLeGgy3TaJIdHJkQ8H0IAhvpJ?=
	=?us-ascii?Q?WF43CQpj7ntgOBqdMHYPMJ5RrseZQnd44n/jC9ahVjeEKRaA6JY7vol4fdst?=
	=?us-ascii?Q?DAWAfCZ+Fldnvc39VXSOC2qp/Kdep8cdmfQqROVBWLaVNfz4rWuuhNbOrPUn?=
	=?us-ascii?Q?e9dNSi3VsQh4NC02RV55I6jJB3Hf2irKwVoRBtaBqJtG5OxMMNobiCmd1nM6?=
	=?us-ascii?Q?SSybrJquJLrECJC/mOHn8pz+Jhk7iICNMObLANJhHfPBQS+Mhw0w/F/Z3X6a?=
	=?us-ascii?Q?pX2PHOlSoHAkkji1ueiVurWXPYkquvju5TmxeuJfJq3jUuXaeyPzXA4Dl2rn?=
	=?us-ascii?Q?zuzOtGbRcPu/RGnJl/M2FbBjx9UUZgqFT47avTEZYP+rRxho3lZTL0N7ObW4?=
	=?us-ascii?Q?OVzMHNxElscyFKPIlHgWBEyFhECurFwGIH2VivS9jq3UrLBKAsLNUBFuDIBL?=
	=?us-ascii?Q?ndeZ/w2jQIXutCtBhI220KQMNEhGvPeoJsjQ63wiRoHsGcQW0cn6FHX5xnmA?=
	=?us-ascii?Q?qoJZCW81K2wNf9IE+8t7K3K98UnOCnbeR9Njk7dCT2R6Cv0+3UGVgh8YWPFw?=
	=?us-ascii?Q?rd2GudEAJpxpuwONCT7QQK2nPtZNpYqgBhwgQ+LQyd6RJVjSn8wucpq4/Sxr?=
	=?us-ascii?Q?YLmw34pUG41Ku3asGsJcDPbj+SEyMea48ltMzlX2mwjOHaLBoP8yMqFMSXKJ?=
	=?us-ascii?Q?1RjxuA+JhFsR9ql9rBGk269N?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dc2c3bb-9fc2-4678-a5fb-08d92a990cf8
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 16:18:28.6980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LGM4ivL7YpehVfckhXWTdhkzT3IPuv4V0Dq0wKN0GvUAQfBMx8vRTI/SjN+3fxV242f3q1+KkgIL64yq1i9fPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5980
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 158GIeq2019866
X-loop: linux-lvm@redhat.com
Cc: "rogerheflin@gmail.com" <rogerheflin@gmail.com>,
	"zkabelac@redhat.com" <zkabelac@redhat.com>,
	"linux-lvm@redhat.com" <linux-lvm@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

T24gNi84LzIxIDU6MzAgQU0sIERhdmlkIFRlaWdsYW5kIHdyb3RlOgo+IE9uIE1vbiwgSnVuIDA3
LCAyMDIxIGF0IDEwOjI3OjIwQU0gKzAwMDAsIE1hcnRpbiBXaWxjayB3cm90ZToKPj4gTW9zdCBp
bXBvcnRhbnRseSwgdGhpcyB3YXMgYWJvdXQgTFZNMiBzY2FubmluZyBvZiBwaHlzaWNhbCB2b2x1
bWVzLiBUaGUKPj4gbnVtYmVyIG9mIHVkZXYgd29ya2VycyBoYXMgdmVyeSBsaXR0bGUgaW5mbHVl
bmNlIG9uwqBQViBzY2FubmluZywKPj4gYmVjYXVzZSB0aGUgdWRldiBydWxlcyBvbmx5IGFjdGl2
YXRlIHN5c3RlbWQgc2VydmljZS4gVGhlIGFjdHVhbAo+PiBzY2FubmluZyB0YWtlcyBwbGFjZSBp
biBsdm0yLXB2c2NhbkAuc2VydmljZS4gQW5kIHVubGlrZSB1ZGV2LCB0aGVyZSdzCj4+IG5vIGxp
bWl0IGZvciB0aGUgbnVtYmVyIG9mIGluc3RhbmNlcyBvZiBhIGdpdmVuIHN5c3RlbWQgc2Vydmlj
ZQo+PiB0ZW1wbGF0ZSB0aGF0IGNhbiBydW4gYXQgYW55IGdpdmVuIHRpbWUuCj4gCj4gRXhjZXNz
aXZlIGRldmljZSBzY2FubmluZyBoYXMgYmVlbiB0aGUgaGlzdG9yaWNhbCBwcm9ibGVtIGluIHRo
aXMgYXJlYSwKPiBidXQgSGVtaW5nIG1lbnRpb25lZCBkZXZfY2FjaGVfc2NhbigpIHNwZWNpZmlj
YWxseSBhcyBhIHByb2JsZW0uICBUaGF0IHdhcwo+IHN1cnByaXNpbmcgdG8gbWUgc2luY2UgaXQg
ZG9lc24ndCBzY2FuL3JlYWQgZGV2aWNlcywgaXQganVzdCBjcmVhdGVzIGEKPiBsaXN0IG9mIGRl
dmljZSBuYW1lcyBvbiB0aGUgc3lzdGVtIChlaXRoZXIgcmVhZGRpciBpbiAvZGV2IG9yIHVkZXYK
PiBsaXN0aW5nLikgIElmIHRoZXJlIGFyZSBzdGlsbCBwcm9ibGVtcyB3aXRoIGV4Y2Vzc2l2ZSBz
Y2Fubm5pbmcvcmVhZGluZywKPiB3ZSdsbCBuZWVkIHNvbWUgbW9yZSBkaWFnbm9zaXMgb2Ygd2hh
dCdzIGhhcHBlbmluZywgdGhlcmUgY291bGQgYmUgc29tZQo+IGNhc2VzIHdlJ3ZlIG1pc3NlZC4K
PiAKCnRoZSBkZXZfY2FjaGVfc2NhbiBkb2Vzbid0IGhhdmUgZGlyZWN0IGRpc2sgSU9zLCBidXQg
bGlidWRldiB3aWxsIHNjYW4vcmVhZAp1ZGV2IGRiIHdoaWNoIGlzc3VlIHJlYWwgZGlzayBJT3Mg
KGxvY2F0aW9uIGlzIC9ydW4vdWRldi9kYXRhKS4Kd2UgY2FuIHNlZSB3aXRoIGNvbWJpbmF0aW9u
ICJvYnRhaW5fZGV2aWNlX2xpc3RfZnJvbV91ZGV2PTAgJgpldmVudF9hY3RpdmF0aW9uPTEiIGNv
dWxkIGxhcmdlbHkgcmVkdWNlIGJvb3RpbmcgdGltZSBmcm9tIDJtaW42cyB0byA0MHMuCnRoZSBr
ZXkgaXMgZGV2X2NhY2hlX3NjYW4oKSBkb2VzIHRoZSBzY2FuIGRldmljZSBieSBpdHNlbGYgKHNj
YW5pbmcgIi9kZXYiKS4KCkkgYW0gbm90IHZlcnkgZmFtaWxpYXIgd2l0aCBzeXN0ZW1kLXVkZXYs
IGJlbG93IHNob3dzIGEgbGl0dGxlIG1vcmUgaW5mbwphYm91dCBsaWJ1ZGV2IHBhdGguIHRoZSB0
b3AgZnVuY3Rpb24gaXMgX2luc2VydF91ZGV2X2RpciwgdGhpcyBmdW5jdGlvbjoKMS4gc2NhbnMv
cmVhZHMgL3N5cy9jbGFzcy9ibG9jay8uIE8obikKMi4gc2NhbnMvcmVhZHMgdWRldiBkYiAoL3J1
bi91ZGV2L2RhdGEpLiBtYXkgTyhuKQogICAgdWRldiB3aWxsIGNhbGwgZGV2aWNlX3JlYWRfZGIg
PT4gaGFuZGxlX2RiX2xpbmUgdG8gaGFuZGxlIGV2ZXJ5CiAgICBsaW5lIG9mIGEgZGIgZmlsZS4K
My4gZG9lcyBxc29ydCAmIGRlZHVwbGljYXRpb24gdGhlIGRldmljZXMgbGlzdC4gIE8obikgKyBP
KG4pCjQuIGhhcyBsb3RzIG9mICJtZW1vcnkgYWxsb2MiICYgInN0cmluZyBjb3B5IiBhY3Rpb25z
IGR1cmluZyB3b3JraW5nLgogICAgaXQgdGFrZXMgdG9vIG11Y2ggbWVtb3J5LCBmcm9tIHRoZSBo
b3N0IHNpZGUsIHVzZSAndG9wJyBjYW4gc2VlOgogICAgLSBkaXJlY3QgYWN0aXZhdGlvbiBvbmx5
IHVzZWQgMkcgbWVtb3J5IGR1cmluZyBib290CiAgICAtIGV2ZW50IGFjdGl2YXRpb24gY29zdCB+
MjBHIG1lbW9yeS4KCkkgZGlkbid0IHRlc3QgdGhlIHJlbGF0ZWQgdWRldiBjb2RlLCBhbmQgZ3Vl
c3MgdGhlIDwyPiB0YWtlcyB0b28gbXVjaCB0aW1lLgpBbmQgdGhlcmUgYXJlIHRob3VzYW5kIHNj
YW5uaW5nIGpvYiBwYXJhbGxlbCBpbiAvcnVuL3VkZXYvZGF0YSwgbWVhbndoaWxlCnRoZXJlIGFy
ZSBtYW55IGRldmljZXMgbmVlZCB0byBnZW5lcmF0ZSB1ZGV2IGRiIGZpbGUgaW4gdGhlIHNhbWUg
ZGlyLiBJIGFtCm5vdCBzdXJlIGlmIHRoZSBmaWxlc3lzdGVtIGNhbiBwZXJmZWN0IGhhbmRsZSB0
aGlzIHNjZW5hcmlvLgp0aGUgYW5vdGhlciBjb2RlIHBhdGgsIG9idGFpbl9kZXZpY2VfbGlzdF9m
cm9tX3VkZXY9MCwgd2hpY2ggdHJpZ2dlcnMgdG8Kc2Nhbi9yZWFkICIvZGV2IiwgdGhpcyBkaXIg
aGFzIGxlc3Mgd3JpdGUgSU9zIHRoYW4gL3J1bi91ZGV2L2RhdGEuCgpSZWdhcmRzCmhlbWluZwoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWx2
bSBtYWlsaW5nIGxpc3QKbGludXgtbHZtQHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhh
dC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1sdm0KcmVhZCB0aGUgTFZNIEhPVy1UTyBhdCBo
dHRwOi8vdGxkcC5vcmcvSE9XVE8vTFZNLUhPV1RPLw==

