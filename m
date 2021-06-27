Return-Path: <SRS0=LNCl=LV=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29EC6C48BC2
	for <linux-lvm@archiver.kernel.org>; Sun, 27 Jun 2021 17:41:40 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B47BE61993
	for <linux-lvm@archiver.kernel.org>; Sun, 27 Jun 2021 17:41:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B47BE61993
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-zkgUu3ZXP4aoxtjWGKhQfw-1; Sun, 27 Jun 2021 13:41:36 -0400
X-MC-Unique: zkgUu3ZXP4aoxtjWGKhQfw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49B371084F40;
	Sun, 27 Jun 2021 17:41:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD0A15D9DC;
	Sun, 27 Jun 2021 17:41:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6972A4E9F5;
	Sun, 27 Jun 2021 17:41:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15RHf4xO032457 for <linux-lvm@listman.util.phx.redhat.com>;
	Sun, 27 Jun 2021 13:41:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 28919200B670; Sun, 27 Jun 2021 17:41:04 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 23959200B661
	for <linux-lvm@redhat.com>; Sun, 27 Jun 2021 17:41:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C567D80B719
	for <linux-lvm@redhat.com>; Sun, 27 Jun 2021 17:41:01 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.109.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-36-W83x7KHKNmim2fVu4KzOiQ-1;
	Sun, 27 Jun 2021 13:40:59 -0400
X-MC-Unique: W83x7KHKNmim2fVu4KzOiQ-1
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
	(mail-db3eur04lp2056.outbound.protection.outlook.com [104.47.12.56])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-5--e1BgiyvPqOpJPgycpNJlw-1; Sun, 27 Jun 2021 19:40:56 +0200
X-MC-Unique: -e1BgiyvPqOpJPgycpNJlw-1
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
	DB6PR0401MB2440.eurprd04.prod.outlook.com (2603:10a6:4:34::14) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.4264.24; Sun, 27 Jun 2021 17:40:55 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::d9ad:152e:66d6:b880]) by
	DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::d9ad:152e:66d6:b880%3]) with mapi id 15.20.4264.026;
	Sun, 27 Jun 2021 17:40:55 +0000
To: Zdenek Kabelac <zkabelac@redhat.com>,
	LVM general discussion and development <linux-lvm@redhat.com>,
	David Teigland <teigland@redhat.com>, Zhong Lidong <lidong.zhong@suse.com>
References: <ba88aa20-e176-0a07-5578-20afb39e0950@suse.com>
	<2d5ff29e-2836-0407-ce76-271255487baa@redhat.com>
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <d59d7b98-3eb6-4d7d-a0f0-f1d82af143f5@suse.com>
Date: Mon, 28 Jun 2021 01:40:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.11.0
In-Reply-To: <2d5ff29e-2836-0407-ce76-271255487baa@redhat.com>
X-Originating-IP: [123.123.129.64]
X-ClientProxiedBy: HK2P15301CA0014.APCP153.PROD.OUTLOOK.COM
	(2603:1096:202:1::24) To DB7PR04MB4666.eurprd04.prod.outlook.com
	(2603:10a6:5:2b::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from c73.home (123.123.129.64) by
	HK2P15301CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::24)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.0
	via Frontend Transport; Sun, 27 Jun 2021 17:40:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b10eed2b-c964-4cd8-400d-08d93992b73a
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2440:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0401MB24403416CD96CED8CDDF3C3D97049@DB6PR0401MB2440.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: g2VbQA0+DsNZml9RTV31dXEgbflLePRfHDGXo7h/5VgbguyeyRgDjaNjJhuSxP0IJpOvjH2n/ArTZcnOzMe0Gc8FKsuQAfuUISiYHZy7MChmXZJyFq/ejDAOi4WBX++s49vMyz+v0yBAYmc9FhTgOvcdJPRNK3rRJMzqrHiLWJ6cyC9FjXYtvxGX/QVZx0sF6EDY3Ns9Xunvwbyx+8w58CUwmOREPiqzeyOUEVTjeZhvDz3b7cKpgSXnzF9eQib1dIh9bN4pjtYogtqVvJn7vGBiV2NaAsvD/RKBSmtwAAG5rf/z731yCpjD8bkqqCQDuIZ8Ux9uF7BEDGaM9ODkl3mMiBgKV7w7B193S4HYW+pYBcsHVRPqOB4DscaTWzRje1Dg+I7rlu1uK4mofSTilhB08h50WxWjRBMzwg6pGJPYwsyFwozWVJeiBUdcCXy5fKzKCwbq3D4Za0083Dtc46B/ssfNHbQ0Mdhm8kZo8ZX/T3tUZqpGuXe8xkH2ZCH2y2kLTSfjsWMkAvLXk17LYHZtk8Lpn5qtxECgolmEPA50ZHvAWfIf1wijG3lyBH2CHSecu6D+Nvt21Ua/SE5Vo+UTSfwFUDQ+SgiFSvJgmSsFtQG7H5YAcbMDxDwx4WXViLng3br9cBEamPosg6JrPt89gmS/0szxoGsrvkg1JLfefmzmZhh5CI+1bmbrPUvHdIYakMpZIJBPTF9sxQCbVOYnQiQjAeLXgWK6ixcsB8iRGrQbj+oXrzVWKGTSPCLaZW1yZU6kW7oFfurm1IaTdII9droCeeUfvM2ThR+fTgIt/n9wg/82xBpD9nvQAmrHyf0Lvl3Xxwgi+8QKhjm3Ycac3A4pd76HD9o4aLJhxGgj1x3trWH60/1GP/Gt5Pbr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB7PR04MB4666.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(396003)(376002)(39850400004)(136003)(346002)(83380400001)(6666004)(8676002)(966005)(31696002)(186003)(6636002)(16526019)(6512007)(6506007)(8936002)(478600001)(36756003)(86362001)(2906002)(956004)(2616005)(110136005)(31686004)(6486002)(316002)(38100700002)(5660300002)(53546011)(8886007)(66946007)(66556008)(66476007)(450100002)(26005)(9126006)(43740500002)(45980500001);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vpSDqAJLz7n7zsmLgK+v2LFw3T6/MpV5rbQPxyCLFkFNIjYQ0qFVBcRj2Z9D?=
	=?us-ascii?Q?jeGEuuqpqglXnQpXk6nSP9qWPL2NHC5j39WI4aaQDAzeHgIFCvujocP9R7Uw?=
	=?us-ascii?Q?on9IFDJvVY+1nxMu3rBB74R4iIHI0EunFHH5p7Sw0O57t8I7XBM/QsWn2gNL?=
	=?us-ascii?Q?MHRBb86I/tfbRa38BkQlFvioi4nfzrcI8Da0/opy+iGtGLLHYOKFZEL96TKC?=
	=?us-ascii?Q?osRUup/QWYgqR6nZDJK+sfoyztHVf1pZ7kUlN5d4maUYYNmQSEuMU4Xv5mhS?=
	=?us-ascii?Q?TA4EcIf1ohEvh+AVP5xdgABWM5uxyveRXeh/0ECEyKNP2Qm0vFC6Aocu81x6?=
	=?us-ascii?Q?PU4aXH5xRqrbxGrdgPJfrrrx2/DMgk/zjuqErczJ0V5cH8YYm3U5ihO6MpzK?=
	=?us-ascii?Q?66jpZBdmIGcFOiLE8/2EGG1jHaj7iaoC5++HjlJhoh3tJCVGsd8hJE0F/4/f?=
	=?us-ascii?Q?Wdo0flsYjWCmhBLdGpdLmoJ/sI7hU8JkGHbCHom1QjdtRsdt6CVMjXvqIMV+?=
	=?us-ascii?Q?9SgeT1C40hJES5EviQYXckVrxRuAwi2W5gv2nwTYtI/T2Vq8Cci0dIknT9Td?=
	=?us-ascii?Q?hxLxLo8S+ADJvQdD+77KkiluwnXstd2huBUmBsdxDCFUo0w02qSMlYPwHI8Q?=
	=?us-ascii?Q?ajmDaXvlXUKIAGkW9R9U3PTm/0kK1XJFzg1x006OGnMPFpenGBb/t9YfN4LO?=
	=?us-ascii?Q?A2+k8ajVxpYtkwx0T5LuVxjw2Inihbkeva1OtuiWRwOGJNi6/BMqS2yhkrrP?=
	=?us-ascii?Q?fvc64pU9S+/Tc+CZHblkT+xl8KmkQ9BqzJMiT9ehGs6ZEID5SPse7pzlplpw?=
	=?us-ascii?Q?LyxhNmPBu2RjQcYxI6ESzr2QbN77s4jDkST76T9JDc/B/ApU9/4vY5ucVWhq?=
	=?us-ascii?Q?TgvVmYExVUnkQO57It36JDeLUTz/FU5YbhnPt78THD1iNRLWrjBZb4XW6gKG?=
	=?us-ascii?Q?j3Q3lpDet2uE0SurXyfxdAEIQ+5FmMXqzNl7eN7oetLp66YjqDBrFUGPhCmO?=
	=?us-ascii?Q?sqfO5Rm2yAWPHrlZKWoiik8OeMNdjiWJLyOhmvd5EEWn8z0EdZH6teCMHAkb?=
	=?us-ascii?Q?RAvPEHPzn9hKFaROCu5bwjCx4cy+jQGyeZm0cvVmLyxVMWWDeft0rE+TgT4v?=
	=?us-ascii?Q?B/iDoua7erfDq5xZHFJJI7qsriBcZpE5vfj2I14VHX1PHgFm2VHdziIAIY5n?=
	=?us-ascii?Q?enp9Il2Kef+jt/68Ju9giQqmlaTa/WHD3OgsEHbhnIHcAIrKOX6HiWx2lHRA?=
	=?us-ascii?Q?hCcXjjs9nF3+NqBbtVv+Sou4To6+f5K+edgsjqSv1+WVyN0HJjdJkQL1evSJ?=
	=?us-ascii?Q?sCKpOFYoyOFdQc0mrOKVaxii?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b10eed2b-c964-4cd8-400d-08d93992b73a
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2021 17:40:55.7219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YAHcidB1F5LnXZB+wg02iS8G7V/o9xs5cy0aUJcEv0HtWthQKfrkeQd9oq7eN4hQhjHhgu5hA6rFKW0GLEkTWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2440
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 15RHf4xO032457
X-loop: linux-lvm@redhat.com
Subject: Re: [linux-lvm] Does LVM have any plan/schedule to support btrfs in
	fsadm
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

T24gNi8yNS8yMSA2OjU3IFBNLCBaZGVuZWsgS2FiZWxhYyB3cm90ZToKPiBEbmUgMjUuIDA2LiAy
MSB2IDc6MjggaGVtaW5nLnpoYW9Ac3VzZS5jb20gbmFwc2FsKGEpOgo+PiBIZWxsbyBaZGVuZWsg
JiBEYXZpZCwKPj4KPj4gRnJvbSBVUkw6IGh0dHBzOi8vZmVkb3JhcHJvamVjdC5vcmcvd2lraS9C
dHJmcwo+PiBUaGUgYnRyZnMgYmVjb21lcyBkZWZhdWx0IGZpbGVzeXN0ZW0gZm9yIGRlc2t0b3Bz
Lgo+Pgo+PiBEbyB3ZSBoYXZlIGFueSBwbGFuIHRvIGFkZCBidHJmcyBjb2RlIGZvciBzY3JpcHRz
L2ZzYWRtLnNoPwo+Pgo+PiBJZiB0aGUgYW5zd2VyIGlzIHllcy4gSSBjb3VsZCBzaGFyZSBhIHN1
c2Ugc3BlY2lhbCBwYXRjaCwgdGhpcyBwYXRjaAo+PiBoYWQgYmVlbiBydW4gYWJvdXQgNCB5ZWFy
cyBpbiBzdXNlIHByb2R1Y3RzLgo+IAo+IAo+IEhpCj4gCj4gSWYgeW91IGhhdmUgc29tZSBwYXRj
aGVzIHByb3ZpZGVkIHdpdGggc29tZSBnb29kIHVzYWJsZSB0ZXN0aW5nIChsdm0yIHRlc3Qgc3Vp
dGUpwqAgLSBpdCBjb3VsZCBiZSBwb3NzaWJseSBtZXJnZWQuCgpQYXRjaCBmb3IgZnNhZG0gaXMg
YWxyZWFkeSBtYW55IHllYXJzIGFnbywgYnV0IHRlc3Qgc3VpdGUgaXMgZW1wdHkuCkkgcGxhbiB0
byBhZGQgc29tZSB0ZXN0IGNhc2VzIHRoZW4gZmlsZSB0aGUgcGF0Y2ggZmlsZXMuCgo+IAo+IE9u
IHRoZSBvdGhlciBoYW5kIGhlbHBpbmcvc3VnZ2VzdGluZyB1c2VycyB0byB1c2UgQnRyZnMgb24g
dG9wIG9mIGx2bTIgaGFzIGFsc28gaXRzIGxvZ2ljYWwgJ3F1ZXN0aW9uJyBtYXJrcy7CoCBTaW5j
ZcKgIGJ0cmZzIHVzZXJzIHNob3VsZCBwcm9iYWJseSBiZSBhdm9pZGluZyBwbGFjaW5nICdhbm90
aGVyJyBsYXllciBiZXR3ZWVuIHJlYWwgaHcgLSB3aGVuIGJ0cmZzIHNob3VsZCBiZSBtb3N0bHkg
Y2FwYWJsZSBoYW5kbGluZyBsdm0yIGZlYXR1cmVzIGluIGl0cyAndmVyeSBvd24nIHdheS4gRWFj
aCBsYXllciBoYXMgaXQncyBvd24gbWVhc3VyYWJsZSBjb3N0cy4gQW5kIHllYWggd2UgZG8gbm90
IHdhbnQgdG8gYmUgaW52b2x2ZWQgaW50byBidHJmcyByZWxhdGVkIHJlY292ZXJ5IGNhc2VzLCBh
cyB3ZSBzaW1wbHkgbmV2ZXIgdW5kZXJzdG9vZCBpdHMgaGFuZGxpbmcgb2YgYXR0YWNoZWQgZGlz
a3MuCj4gCgpJbiBteSBvcGluaW9uLCB0aGUgdXNpbmcgc3R5bGUgb2YgYnRyZnMgYnkgbWFueSB1
c2VycyBhcmUgc2FtZSBhcyBleHQ0L3hmcy4KYnRyZnMgaGFzIGxvdHMgb2YgZmVhdHVyZXMsIGJ1
dCB0aGVyZSBhcmUgTUFZIGV4cGVyaW1lbnRhbCBvciBub3Qgc3RhYmxlLgpVc2VycyBwcmVmZXIg
dG8gdXNlIGJ0cmZzIGNvcmUgZnVuY3Rpb25hbGl0eS4gQW5kIG5vdCB0byBzcGVhayBvZiBjb21w
YXRpYmxlCnJlYXNvbnMsIGluIG1hbnkgc2NlbmFyaW9zLCBidHJmcyBzdGlsbCB3b3JrcyB3aXRo
IGx2bSBvciBtZGFkbS4KCkZvciBtaW5pbWFsIGNvZGUgZGVzaWduIChtaW5pbWFsIGJ1ZyBvY2N1
ciksIGluIGZzYWRtLCB3ZSBvbmx5IHRyZWF0IGJ0cmZzIGFzCmFub3RoZXIgZXh0NC94ZnMgc3R5
bGUgZmlsZXN5c3RlbS4KImZzYWRtIHJlc2l6ZSIgZXhlY3V0ZXMgImJ0cmZzIHJlc2l6ZSIKImZz
YWRtIGNoZWNrIiBleGVjdXRlcyAiYnRyZnMgc2NydWIiCgpUaGFua3MsCkhlbWluZwoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWx2bSBtYWls
aW5nIGxpc3QKbGludXgtbHZtQHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1sdm0KcmVhZCB0aGUgTFZNIEhPVy1UTyBhdCBodHRwOi8v
dGxkcC5vcmcvSE9XVE8vTFZNLUhPV1RPLw==

