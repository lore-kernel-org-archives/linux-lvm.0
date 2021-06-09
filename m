Return-Path: <SRS0=616c=LD=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDC13C47095
	for <linux-lvm@archiver.kernel.org>; Wed,  9 Jun 2021 04:02:29 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BFDC61078
	for <linux-lvm@archiver.kernel.org>; Wed,  9 Jun 2021 04:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BFDC61078
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-A9hBfZ5EPueQnhakxrF0gQ-1; Wed, 09 Jun 2021 00:02:26 -0400
X-MC-Unique: A9hBfZ5EPueQnhakxrF0gQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE401107ACCA;
	Wed,  9 Jun 2021 04:02:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 63A8C60E3A;
	Wed,  9 Jun 2021 04:02:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 67C8D1800BB4;
	Wed,  9 Jun 2021 04:02:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15941wxu032582 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 9 Jun 2021 00:01:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 519E911558A5; Wed,  9 Jun 2021 04:01:58 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BB4211558A3
	for <linux-lvm@redhat.com>; Wed,  9 Jun 2021 04:01:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E7755800B29
	for <linux-lvm@redhat.com>; Wed,  9 Jun 2021 04:01:55 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.111.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-288-v2RS-8aaOfe6z9CUConEJw-1;
	Wed, 09 Jun 2021 00:01:53 -0400
X-MC-Unique: v2RS-8aaOfe6z9CUConEJw-1
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
	(mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-28-XxYeJmNsNTukCetxb1CHCg-1; Wed, 09 Jun 2021 06:01:51 +0200
X-MC-Unique: XxYeJmNsNTukCetxb1CHCg-1
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
	DBBPR04MB6218.eurprd04.prod.outlook.com (2603:10a6:10:d0::17) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.4195.24; Wed, 9 Jun 2021 04:01:49 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::2c69:3d93:4901:ecfc]) by
	DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::2c69:3d93:4901:ecfc%3]) with mapi id 15.20.4195.030;
	Wed, 9 Jun 2021 04:01:49 +0000
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
To: David Teigland <teigland@redhat.com>, Martin Wilck <martin.wilck@suse.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<CAAMCDef6sSy5X2+-WLR3wx5m7dx9bhmN3EKWyPa31SebS=wRGQ@mail.gmail.com>
	<dd395e820a4cf9b5e807e8de1e456786eebd2044.camel@suse.com>
	<20210607213003.GA8181@redhat.com>
	<0b83d419-8569-2ba0-5f5b-2c3df4e2eb21@suse.com>
Message-ID: <d349b4b1-194a-7ed5-d5e3-d06785b3664c@suse.com>
Date: Wed, 9 Jun 2021 12:01:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.10.0
In-Reply-To: <0b83d419-8569-2ba0-5f5b-2c3df4e2eb21@suse.com>
X-Originating-IP: [123.123.133.78]
X-ClientProxiedBy: HKAPR03CA0011.apcprd03.prod.outlook.com
	(2603:1096:203:c8::16) To DB7PR04MB4666.eurprd04.prod.outlook.com
	(2603:10a6:5:2b::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from c73.home (123.123.133.78) by
	HKAPR03CA0011.apcprd03.prod.outlook.com (2603:1096:203:c8::16)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.12
	via Frontend Transport; Wed, 9 Jun 2021 04:01:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6c58435-c996-4043-9701-08d92afb4e9d
X-MS-TrafficTypeDiagnostic: DBBPR04MB6218:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB621835FC2B9A66873CD6ED8A97369@DBBPR04MB6218.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: VuIiLvgeWcfe2E73ah5cLBztkDUlBM9MSrhrJ+vDhRvOCpUCzfggBkIQ/CKZE75qvGmXCHVCJ55OXtTCCkyIifIPqQnPFZMRNFlXqxmtJ2P99UJRzHAsy4GPZ+RZMm9QXDS9z6ZbTSLP88/qbNft/FNyN1UjuQbjpJAZIUTh1lx2lZgHFaWtcS0IVFdEi6p6el8tAg16WO9MQEjD0AjRihZ5PrEIWs+gybgFPzzTa5doUry+LVdL7x3dOyK18alZ/oXQZcfmyDuzrf05pNstADyAZ7kHFSBhzOngERchOQeeodr6f/aQeADhEKcK9gFQH2HzBs0ZPF5SAyxtA+567rTcxDEripzIt6jk1nXoYWXvCFteZUJ4u6fnH1BEeIW4zTpe7a10LdAq9LECDFBhAPGrAC7uRzMrv15zpJDleklnpsQ3QF2cXVORGQ8AF2nJGfI7nPEs9/fDa9Kf488EerAAkdee2AaoQyshzb6GqkOCOXesOPG3vbq9bTvqDO0yqeHdT9YWC7NSkCxrymna8vb0JsWs2ebCbeJVsnG0vQM+OVOVF+sezELenF4l39ZTaSXbTUAwJRncsoYrPY4LF8HRjm3fa2rzxCryHBX0VhmdLT8q6tMvIlmWtkubnGBmUU0QH0WjTidcTvxqDkLAoFX6yyK2cNz5U+INQG/HgQ8oNBu60td6keXpC0qndrWtzArQ9sA4336HRgk+Xwgi/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB7PR04MB4666.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(376002)(136003)(39850400004)(396003)(366004)(346002)(54906003)(110136005)(6506007)(316002)(53546011)(4326008)(36756003)(26005)(86362001)(16526019)(186003)(2616005)(8886007)(478600001)(83380400001)(31696002)(956004)(6666004)(6636002)(31686004)(66556008)(38100700002)(8936002)(6512007)(2906002)(8676002)(6486002)(66946007)(66476007)(5660300002)(9126006)(45980500001)(43740500002);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?kADzxbJONXBdI+glbE5HBkvOMFMNh0Kl+ufZHV9392pR3kRGYXM15l+CxWvg?=
	=?us-ascii?Q?09V096ErIq6e/Qp9MoFhlRXEvvPrgNL8wQEfIVhvdXa9t/b6R7iQHsh3mIsm?=
	=?us-ascii?Q?aXtx2S0l4l2YrmVc5LS/vDTPn1wX8tsYGcIDtiOaXNwb5RfoBA/uXs7e1Q0D?=
	=?us-ascii?Q?D/+YQetkPdQnMtSqLE+7VIeH5wMf5c6MGhi0mZ345duGqV/yWh73lgmGyc59?=
	=?us-ascii?Q?9292KjA0ph94ZRxAJD4y8ZGr9+nSLWzTYbsh/akLSCZrLi/S3vRi6JZAsRLG?=
	=?us-ascii?Q?laa+IlFTRoSEO+QGp8auNrWEUoFQfMFKXGpGCYWIHuOvh0z88Je2cAbwPgaf?=
	=?us-ascii?Q?gIcVe7O+kejyWAlKqF0MxDqbxNMuu8oJmzY0X0CM5x+nKZ+R9NVZ5vba7h62?=
	=?us-ascii?Q?yppO1OTMML0lCNfT7j0aKkdE8iXO/qyJmedhOSFvQKRpFA1y8jUuAq9EQ8C5?=
	=?us-ascii?Q?O9YGRn4LKE+AnQvbeUldXkSBb4iLJW2MzsZgLIXgunY7pJEEj2/MdcSeSQAI?=
	=?us-ascii?Q?jybg+W30hunTpCEh8dWvGRJisYsh7BEmAzhXEYSmo2DiWq6x10h0Z0kVyqBI?=
	=?us-ascii?Q?OYRg8y1AUYUIN9ZYQiRFD9ruzTEpVuQ6orLrOUAs+x/5OBKbqKKSdp0+i0q8?=
	=?us-ascii?Q?hBgOhE9pRhz2n/ExuFeaJmbsgMxWD+RpYBqsK9/ULyGizD0yM+pafx7PUWU7?=
	=?us-ascii?Q?sHqdpFbM6osUrvLvTSIhrGuOkewMuzuAAIqKIfT7V9CVlRSqmE7s9UydId/4?=
	=?us-ascii?Q?P7vdizLFMbqZr3C5D1E1H6ciwAV1xMU4ve/PGR6loZdKnPDzF1CbsuLadSrZ?=
	=?us-ascii?Q?Ua+a4pv/BQLwQoVRoUnVQ1Eu+I+CYN/MNvACjLNYqTnY7br0N913sk5R4bZD?=
	=?us-ascii?Q?EShVjdQhwNh6D5FO9zByYJE+jROaRvoEWszMDtbP9ht6SnOGj7D7b0gse8a4?=
	=?us-ascii?Q?mgAEK3XTz4A2mjhIKUGMESY3ZFodLPFyeR1o3nDtoES0jZBy1+a4L6G+kjr9?=
	=?us-ascii?Q?ErW1eJij4jq+utyNxd7cMkF9SF1VZDbkaFCZVTJTnl5/1Et2PatLZn5BlOBN?=
	=?us-ascii?Q?J5WLEdyWLoR2e2teQakTKl1XIb5t7lGsKc8/0AhCBT6v0yptX4D1ERoLR5Ir?=
	=?us-ascii?Q?YD1vpwX8yrTrgpDP3MxVtzskN7Avo3s9GQwzlgPdrlu9aIGim60oooOpSEYW?=
	=?us-ascii?Q?wLRM897HWsf6L+ko7+cLcUUekqdwKJaFtbxaj40BMI0d/sTU8kdtTnEfq83f?=
	=?us-ascii?Q?mLtDt3ErtEDlaMsBJNP78xQd41J8BSQWKDyv+kncQzOGAl1QztxcGhEF51Df?=
	=?us-ascii?Q?3tDVV4vnd5zKGjtDKTQV4hPA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6c58435-c996-4043-9701-08d92afb4e9d
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 04:01:49.6892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zyte9+y/OS4eukpf7/vucQxIfwlTDKVpj1mvq8Wta6TAAt4vZtKsz7C+xvprLd/UodB+O+/m23rZ53nHZapMMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6218
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 15941wxu032582
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

T24gNi85LzIxIDEyOjE4IEFNLCBoZW1pbmcuemhhb0BzdXNlLmNvbSB3cm90ZToKPiBPbiA2Lzgv
MjEgNTozMCBBTSwgRGF2aWQgVGVpZ2xhbmQgd3JvdGU6Cj4+IE9uIE1vbiwgSnVuIDA3LCAyMDIx
IGF0IDEwOjI3OjIwQU0gKzAwMDAsIE1hcnRpbiBXaWxjayB3cm90ZToKPj4+IE1vc3QgaW1wb3J0
YW50bHksIHRoaXMgd2FzIGFib3V0IExWTTIgc2Nhbm5pbmcgb2YgcGh5c2ljYWwgdm9sdW1lcy4g
VGhlCj4+PiBudW1iZXIgb2YgdWRldiB3b3JrZXJzIGhhcyB2ZXJ5IGxpdHRsZSBpbmZsdWVuY2Ug
b27CoFBWIHNjYW5uaW5nLAo+Pj4gYmVjYXVzZSB0aGUgdWRldiBydWxlcyBvbmx5IGFjdGl2YXRl
IHN5c3RlbWQgc2VydmljZS4gVGhlIGFjdHVhbAo+Pj4gc2Nhbm5pbmcgdGFrZXMgcGxhY2UgaW4g
bHZtMi1wdnNjYW5ALnNlcnZpY2UuIEFuZCB1bmxpa2UgdWRldiwgdGhlcmUncwo+Pj4gbm8gbGlt
aXQgZm9yIHRoZSBudW1iZXIgb2YgaW5zdGFuY2VzIG9mIGEgZ2l2ZW4gc3lzdGVtZCBzZXJ2aWNl
Cj4+PiB0ZW1wbGF0ZSB0aGF0IGNhbiBydW4gYXQgYW55IGdpdmVuIHRpbWUuCj4+Cj4+IEV4Y2Vz
c2l2ZSBkZXZpY2Ugc2Nhbm5pbmcgaGFzIGJlZW4gdGhlIGhpc3RvcmljYWwgcHJvYmxlbSBpbiB0
aGlzIGFyZWEsCj4+IGJ1dCBIZW1pbmcgbWVudGlvbmVkIGRldl9jYWNoZV9zY2FuKCkgc3BlY2lm
aWNhbGx5IGFzIGEgcHJvYmxlbS7CoCBUaGF0IHdhcwo+PiBzdXJwcmlzaW5nIHRvIG1lIHNpbmNl
IGl0IGRvZXNuJ3Qgc2Nhbi9yZWFkIGRldmljZXMsIGl0IGp1c3QgY3JlYXRlcyBhCj4+IGxpc3Qg
b2YgZGV2aWNlIG5hbWVzIG9uIHRoZSBzeXN0ZW0gKGVpdGhlciByZWFkZGlyIGluIC9kZXYgb3Ig
dWRldgo+PiBsaXN0aW5nLinCoCBJZiB0aGVyZSBhcmUgc3RpbGwgcHJvYmxlbXMgd2l0aCBleGNl
c3NpdmUgc2Nhbm5uaW5nL3JlYWRpbmcsCj4+IHdlJ2xsIG5lZWQgc29tZSBtb3JlIGRpYWdub3Np
cyBvZiB3aGF0J3MgaGFwcGVuaW5nLCB0aGVyZSBjb3VsZCBiZSBzb21lCj4+IGNhc2VzIHdlJ3Zl
IG1pc3NlZC4KPj4KPiAKPiB0aGUgZGV2X2NhY2hlX3NjYW4gZG9lc24ndCBoYXZlIGRpcmVjdCBk
aXNrIElPcywgYnV0IGxpYnVkZXYgd2lsbCBzY2FuL3JlYWQKPiB1ZGV2IGRiIHdoaWNoIGlzc3Vl
IHJlYWwgZGlzayBJT3MgKGxvY2F0aW9uIGlzIC9ydW4vdWRldi9kYXRhKS4KPiB3ZSBjYW4gc2Vl
IHdpdGggY29tYmluYXRpb24gIm9idGFpbl9kZXZpY2VfbGlzdF9mcm9tX3VkZXY9MCAmCj4gZXZl
bnRfYWN0aXZhdGlvbj0xIiBjb3VsZCBsYXJnZWx5IHJlZHVjZSBib290aW5nIHRpbWUgZnJvbSAy
bWluNnMgdG8gNDBzLgo+IHRoZSBrZXkgaXMgZGV2X2NhY2hlX3NjYW4oKSBkb2VzIHRoZSBzY2Fu
IGRldmljZSBieSBpdHNlbGYgKHNjYW5pbmcgIi9kZXYiKS4KPiAKPiBJIGFtIG5vdCB2ZXJ5IGZh
bWlsaWFyIHdpdGggc3lzdGVtZC11ZGV2LCBiZWxvdyBzaG93cyBhIGxpdHRsZSBtb3JlIGluZm8K
PiBhYm91dCBsaWJ1ZGV2IHBhdGguIHRoZSB0b3AgZnVuY3Rpb24gaXMgX2luc2VydF91ZGV2X2Rp
ciwgdGhpcyBmdW5jdGlvbjoKPiAxLiBzY2Fucy9yZWFkcyAvc3lzL2NsYXNzL2Jsb2NrLy4gTyhu
KQo+IDIuIHNjYW5zL3JlYWRzIHVkZXYgZGIgKC9ydW4vdWRldi9kYXRhKS4gbWF5IE8obikKPiAg
wqAgdWRldiB3aWxsIGNhbGwgZGV2aWNlX3JlYWRfZGIgPT4gaGFuZGxlX2RiX2xpbmUgdG8gaGFu
ZGxlIGV2ZXJ5Cj4gIMKgIGxpbmUgb2YgYSBkYiBmaWxlLgo+IDMuIGRvZXMgcXNvcnQgJiBkZWR1
cGxpY2F0aW9uIHRoZSBkZXZpY2VzIGxpc3QuwqAgTyhuKSArIE8obikKPiA0LiBoYXMgbG90cyBv
ZiAibWVtb3J5IGFsbG9jIiAmICJzdHJpbmcgY29weSIgYWN0aW9ucyBkdXJpbmcgd29ya2luZy4K
PiAgwqAgaXQgdGFrZXMgdG9vIG11Y2ggbWVtb3J5LCBmcm9tIHRoZSBob3N0IHNpZGUsIHVzZSAn
dG9wJyBjYW4gc2VlOgo+ICDCoCAtIGRpcmVjdCBhY3RpdmF0aW9uIG9ubHkgdXNlZCAyRyBtZW1v
cnkgZHVyaW5nIGJvb3QKPiAgwqAgLSBldmVudCBhY3RpdmF0aW9uIGNvc3QgfjIwRyBtZW1vcnku
Cj4gCj4gSSBkaWRuJ3QgdGVzdCB0aGUgcmVsYXRlZCB1ZGV2IGNvZGUsIGFuZCBndWVzcyB0aGUg
PDI+IHRha2VzIHRvbyBtdWNoIHRpbWUuCj4gQW5kIHRoZXJlIGFyZSB0aG91c2FuZCBzY2Fubmlu
ZyBqb2IgcGFyYWxsZWwgaW4gL3J1bi91ZGV2L2RhdGEsIG1lYW53aGlsZQo+IHRoZXJlIGFyZSBt
YW55IGRldmljZXMgbmVlZCB0byBnZW5lcmF0ZSB1ZGV2IGRiIGZpbGUgaW4gdGhlIHNhbWUgZGly
LiBJIGFtCj4gbm90IHN1cmUgaWYgdGhlIGZpbGVzeXN0ZW0gY2FuIHBlcmZlY3QgaGFuZGxlIHRo
aXMgc2NlbmFyaW8uCj4gdGhlIGFub3RoZXIgY29kZSBwYXRoLCBvYnRhaW5fZGV2aWNlX2xpc3Rf
ZnJvbV91ZGV2PTAsIHdoaWNoIHRyaWdnZXJzIHRvCj4gc2Nhbi9yZWFkICIvZGV2IiwgdGhpcyBk
aXIgaGFzIGxlc3Mgd3JpdGUgSU9zIHRoYW4gL3J1bi91ZGV2L2RhdGEuCj4gCj4gUmVnYXJkcwo+
IGhlbWluZwoKSSBtYWRlIGEgbWlub3IgbWlzdGFrZTogYWJvdmUgPDM+IHFzb3J0IHRpbWUgaXMg
Tyhsb2duKS4KCk1vcmUgaW5mbyBhYm91dCBteSBhbmFseXNpczoKSSBzZXQgZmlsdGVyIGluIGx2
bS5jb25mLCB0aGUgcnVsZTogZmlsdGVyID0gWyAiYXwvZGV2L3ZkYTJ8IiwgInJ8Lip8IiBdCnRo
ZSBib290aW5nIHRpbWUgcmVkdWNlZCBhIGxpdHRsZSwgZnJvbSAybWluIDZzIHRvIDFtaW4gNDJz
LgoKVGhlIHZtIHZkYTIgbGF5b3V0OgojIGxzYmxrIHwgZWdyZXAgLUEgNCAiXnZkIgp2ZGEgICAg
ICAgICAgICAgICAgIDI1MzowICAgICAwICA0MEcgIDAgZGlzawrilJzilIB2ZGExICAgICAgICAg
ICAgICAyNTM6MSAgICAgMCAgIDhNICAwIHBhcnQK4pSU4pSAdmRhMiAgICAgICAgICAgICAgMjUz
OjIgICAgIDAgIDQwRyAgMCBwYXJ0CiAgIOKUnOKUgHN5c3RlbS1zd2FwICAgICAyNTQ6MCAgICAg
MCAgIDJHICAwIGx2bSAgW1NXQVBdCiAgIOKUlOKUgHN5c3RlbS1yb290ICAgICAyNTQ6MSAgICAg
MCAgMzVHICAwIGx2bSAgLwoKdGhlIGZpbHRlciBydWxlIGRlbmllcyBhbGwgdGhlIExWcyBleGNl
cHQgcm9vdGZzIExWcy4KCnRoZSBydWxlIG1ha2VzIF9wdnNjYW5fY2FjaGVfYXJncygpIHRvIHJl
bW92ZSBkZXYgZnJvbSBkZXZsLT5saXN0IGJ5IG5vZGF0YSBmaWx0ZXJzLgp0aGUgaG90IHNwb3Qg
bmFycm93IHRvIHNldHVwX2RldmljZXMgKGNhbGxpbmcgZGV2X2NhY2hlX3NjYW4oKSkuCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWx2bSBt
YWlsaW5nIGxpc3QKbGludXgtbHZtQHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1sdm0KcmVhZCB0aGUgTFZNIEhPVy1UTyBhdCBodHRw
Oi8vdGxkcC5vcmcvSE9XVE8vTFZNLUhPV1RPLw==

