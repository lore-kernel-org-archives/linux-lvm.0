Return-Path: <SRS0=yTsL=MG=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E86F4C47E48
	for <linux-lvm@archiver.kernel.org>; Wed, 14 Jul 2021 19:43:03 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86385613D8
	for <linux-lvm@archiver.kernel.org>; Wed, 14 Jul 2021 19:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86385613D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-QgqVihgEPKWNqRKBlKBOMw-1; Wed, 14 Jul 2021 15:43:00 -0400
X-MC-Unique: QgqVihgEPKWNqRKBlKBOMw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B83D319253C2;
	Wed, 14 Jul 2021 19:42:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CEFB6090F;
	Wed, 14 Jul 2021 19:42:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A255A4A712;
	Wed, 14 Jul 2021 19:42:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16EJgU5X009120 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 14 Jul 2021 15:42:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AB588207AD25; Wed, 14 Jul 2021 19:42:30 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A59062087447
	for <linux-lvm@redhat.com>; Wed, 14 Jul 2021 19:42:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B93B8866DF1
	for <linux-lvm@redhat.com>; Wed, 14 Jul 2021 19:42:27 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.109.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-352-HoM27EMXMUSWsHtbSXUfJg-1;
	Wed, 14 Jul 2021 15:42:25 -0400
X-MC-Unique: HoM27EMXMUSWsHtbSXUfJg-1
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
	(mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-27-6nPvNyi-NNq8ItNSoXULWw-1; Wed, 14 Jul 2021 21:42:23 +0200
X-MC-Unique: 6nPvNyi-NNq8ItNSoXULWw-1
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
	DBAPR04MB7272.eurprd04.prod.outlook.com (2603:10a6:10:1ad::21) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.4308.22; Wed, 14 Jul 2021 19:42:22 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::d9ad:152e:66d6:b880]) by
	DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::d9ad:152e:66d6:b880%3]) with mapi id 15.20.4308.027;
	Wed, 14 Jul 2021 19:42:22 +0000
To: LVM general discussion and development <linux-lvm@redhat.com>,
	Zhong Lidong <lidong.zhong@suse.com>
References: <177d20e6-71d1-37ff-f2af-59673e9cba09@suse.com>
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <55eeddda-7190-5279-bd78-993c10dffd35@suse.com>
Date: Thu, 15 Jul 2021 03:42:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.11.0
In-Reply-To: <177d20e6-71d1-37ff-f2af-59673e9cba09@suse.com>
X-ClientProxiedBy: HK2PR0401CA0006.apcprd04.prod.outlook.com
	(2603:1096:202:2::16) To DB7PR04MB4666.eurprd04.prod.outlook.com
	(2603:10a6:5:2b::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from c73.home (123.123.130.159) by
	HK2PR0401CA0006.apcprd04.prod.outlook.com (2603:1096:202:2::16)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21
	via Frontend Transport; Wed, 14 Jul 2021 19:42:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74747435-fb08-46cf-13d2-08d946ff7f91
X-MS-TrafficTypeDiagnostic: DBAPR04MB7272:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBAPR04MB72722A5562276DC8D511D07297139@DBAPR04MB7272.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:264
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: RpJrrkxAmbPbXtTzFEkjZVOclzv0m/rrqGpePa1Rf07aX5liRABzlzTO6A8mJDc/OEA95LkuFE4cgg/isN/VZ+pBaqO+jiBp9bjwuIh8e/Dyjj2PEOarjlnRx2Cle6Sh6np1jnYaExFgwbEBgRK9Ew+yfNLuJ/iaISd/rsbPyB+d+zIDr+ocIQ+H9BmFymSsBv6Lg0yZhLASfuwIy8g92/XlU1ywdigRN2xLP7jj/vtYQw8zlCPHDzK99IQ8ypUo+3/d60dGixhOdU+s76DNUXxKyl+oMltz/0kvnfUSuFmHH2gflNqHoYkv+WnrG0xkvN54x2ELfUZHIBL0kOWdxcMabd7OgwQIBc+KCEZf5sxopnT1VBtNgR1c9FnchY70pObHlsCedlthCJ3Rh9eGvoTdURMnhiBe29dPeJgBQ7ZTcjkSP1/OiR+uiwRJ8snMDv1eoJf2iE+1V/zw0o0J0nuH5Sex5Y1qspTc+WTElpWLh+RJEmpAIazESkcndt5HW+I0LwFPRz3gsrVNIbMvhq4513MFUXJM0SJchw46Mh+7EGZ0ZSQ4oWbgq0VIAnoDj589K4vsky7UADKsFnaRxbfRqi7g2I50Ze03aEgIPM6nTSqvXqVUFMs/QN2LQrxKp9w3gmoZEWUxnN/QJXyXKBhqDfX37t6jKSOq488GFUrcnzA3VWn5UTkhgE+Uw39IqcVDHtR6dPt1I2b59zE4MbVzF0DNALpfmSoIsNzsQmsDI/NQMAoIojJ+9Ea8Q4fO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB7PR04MB4666.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(39850400004)(136003)(346002)(376002)(366004)(396003)(31686004)(4326008)(6512007)(8676002)(53546011)(8886007)(31696002)(2906002)(5660300002)(478600001)(450100002)(6666004)(83380400001)(38100700002)(86362001)(66946007)(316002)(186003)(54906003)(6636002)(8936002)(6506007)(26005)(956004)(66556008)(110136005)(36756003)(6486002)(66476007)(2616005)(9126006)(45980500001)(43740500002);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OgQpPOeSOCzS1OBVvIZaxZIcZTSwBH95vb9FcFYzXSyy7qup5z6tVmA66BQg?=
	=?us-ascii?Q?7us07c/8pYONKj9MClKTtPe+qWnd+1+f4BI9EI0Fwbz6MNqLVjPT0fnlS7Iz?=
	=?us-ascii?Q?K9tLbeMdHfVlyOFRr3dX6AnNCcNAajcL1evFjS+/MaRSjKzBPjVEDmhzQVAJ?=
	=?us-ascii?Q?M2MB+rNdahO1hToO3PCc2UFZFCY9AZ6GiwrrTsSfOQZjGnpUzYgWIDsS38+/?=
	=?us-ascii?Q?ydWyQV6nSeGuhfD8JzntOnzVsAmu7VMcjEll3a+wMRuI5TwxFBuW0nXjB42U?=
	=?us-ascii?Q?IJXlPa67YOyJAJRSzwI3HYfL7S4Xx5LjZEONNCCpGjLCYtSKmZq5y4NCzqPF?=
	=?us-ascii?Q?3By+6uK+5TQhFvDblFquYmlRujmjDcIxaaK3dq0oFXhHscWLGsVbY1+F3Wxw?=
	=?us-ascii?Q?PSuAM/S4KLdGTwAgTP5Uv8D1xNNfTKNc0Vud+umnAs+wnXXL6CSg05G5Snx1?=
	=?us-ascii?Q?WpSxpLF1wUU7a24FzLoHpjrGV/3wPLHU71FCbWiQtZjln5FXvPTsUvJfi2eN?=
	=?us-ascii?Q?Q9W/04DlMnOtH3oiZW/F+GFCUgKV+w0iRUzNjlZaqNESk6oXX6QpFrjES98n?=
	=?us-ascii?Q?Ov44n5MnlVRVkC7FmVIP82WlSkaE5DBxVny7Df0oaYs8psHWQ1J0uSAtNBMH?=
	=?us-ascii?Q?GR6TLDXN7m2hO+oGpUgACwz13lTLfsUPucI057HBLc7yOyUePJaY5j1zYwzd?=
	=?us-ascii?Q?Ug6WMJOzrCBqMBfvU5js1LrY4k1EnghmQKZViYN4dlIdJDIRAfjBFWCBi/3S?=
	=?us-ascii?Q?GOnYFx5QC2KTxorQpeSUxUgSmZwAIw7IInKPudFs4pShkZChXCttGCHGdEu0?=
	=?us-ascii?Q?Xr+U5L1+nX6aDwmDUU1Z6o6Di496fYiibRzjm70wOlscXCpnFjHKWzpy6iZZ?=
	=?us-ascii?Q?qMSSQwfJ1DhdHrlMog83ZryFiGKsUt6kWntO/Lk71cmA/yJZaHO1AFYStpVM?=
	=?us-ascii?Q?/ptswsKnla3fRW9JGUnD2uNCbFsb7ZubTwu11XA5EzDjkru4RnnI06TVn088?=
	=?us-ascii?Q?Jcm9vE0k47ztiC82YQ96Z9/jGVA3+xzUFtrDY6Y4Fy3kUXgk8L/mi9G96bsP?=
	=?us-ascii?Q?0Zk9lr+ip4V6B60NMcDrl+xcbxuUKRDOrhIDl8JpLm8++tztRndNAAb5t9k8?=
	=?us-ascii?Q?7dl0bI9DCXxvyTU5o91S5zpwsja3WOpPKY3ejrf22Xt953yUMSaHp8WGh0Ak?=
	=?us-ascii?Q?dA+8bEEAM+WqjBT6TlQm1ps89n4pqg8OeATRYoqQV7Wk5pGmzNyibjMPLWva?=
	=?us-ascii?Q?jCLLPgsRG4q6YHm+0JuBaGR6LfHkPsWJWT2Xd6hneo38C+Zx2rT7AYlmDPb6?=
	=?us-ascii?Q?MqOudryq6MGO4+9F3Hq2JGJk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74747435-fb08-46cf-13d2-08d946ff7f91
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 19:42:22.2563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IEhLzCZ6rknNClHfxj2Id0b+Tb5QTChnUcHqj7vFpYPVBY18Hg5KFSjkpauV01DUBHz2JAS2KjWl2HAuXxoblA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7272
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 16EJgU5X009120
X-loop: linux-lvm@redhat.com
Cc: David Teigland <teigland@redhat.com>, agk@redhat.com,
	Zdenek Kabelac <zkabelac@redhat.com>
Subject: Re: [linux-lvm] [RFC PATCH] lvconvert: fix the size of log device
 when converting, from linear to mirror
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

SGVsbG8sCgpUaGlzIHBhdGNoIGxvb2tzIGdvb2QgdG8gbWUuCgpJIGdpdmUgYSBsaXR0bGUgbW9y
ZSBleHBsYWluLgoKU2NlbmFyaW86CnRoZXJlIGlzIGEgIi0tdHlwZSBtaXJyb3IiIExWIHdpdGgg
dHdvIGxlZ3M6IG9uZSBsZWcgaXMgbGluZWFyIGRldiwgYW5vdGhlciBsZWcgaXMgc3RyaXBlZCBk
ZXZzLgoKdGhlIGRpc2tzIChMVikgbGF5b3V0OgpgYGAKIyBsc2JsawpOQU1FICAgICAgICAgICAg
ICAgTUFKOk1JTiBSTSAgU0laRSBSTyBUWVBFIE1PVU5UUE9JTlQKc2RhICAgICAgICAgICAgICAg
ICAgODowICAgIDAgIDIwME0gIDAgZGlzawrilJTilIB2ZzEtbHYxX21pbWFnZV8wIDI1NDo0ICAg
IDAgICA5Nk0gIDAgbHZtCiAgIOKUlOKUgHZnMS1sdjEgICAgICAgIDI1NDoyICAgIDAgICA5Nk0g
IDAgbHZtCnNkYiAgICAgICAgICAgICAgICAgIDg6MTYgICAwICAyMDBNICAwIGRpc2sK4pSU4pSA
dmcxLWx2MV9taW1hZ2VfMSAyNTQ6NSAgICAwICAgOTZNICAwIGx2bQogICDilJTilIB2ZzEtbHYx
ICAgICAgICAyNTQ6MiAgICAwICAgOTZNICAwIGx2bQpzZGMgICAgICAgICAgICAgICAgICA4OjMy
ICAgMCAgMjAwTSAgMCBkaXNrCuKUlOKUgHZnMS1sdjFfbWltYWdlXzEgMjU0OjUgICAgMCAgIDk2
TSAgMCBsdm0KICAg4pSU4pSAdmcxLWx2MSAgICAgICAgMjU0OjIgICAgMCAgIDk2TSAgMCBsdm0K
c2RkICAgICAgICAgICAgICAgICAgODo0OCAgIDAgIDIwME0gIDAgZGlzawrilJzilIB2ZzEtbHYx
X21sb2cgICAgIDI1NDozICAgIDAgICAgNE0gIDAgbHZtCuKUgiDilJTilIB2ZzEtbHYxICAgICAg
ICAyNTQ6MiAgICAwICAgOTZNICAwIGx2bQrilJTilIB2ZzEtbHYxX21pbWFnZV8xIDI1NDo1ICAg
IDAgICA5Nk0gIDAgbHZtCiAgIOKUlOKUgHZnMS1sdjEgICAgICAgIDI1NDoyICAgIDAgICA5Nk0g
IDAgbHZtCgojIGRtc2V0dXAgdGFibGUKdmcxLWx2MTogMCAxOTY2MDggbWlycm9yIGRpc2sgMiAy
NTQ6MyAyMDQ4IDIgMjU0OjQgMCAyNTQ6NSAwIDEgaGFuZGxlX2Vycm9ycwp2ZzEtbHYxX21sb2c6
IDAgODE5MiBsaW5lYXIgODo0OCA3MzcyOAp2ZzEtbHYxX21pbWFnZV8xOiAwIDE5NjYwOCBzdHJp
cGVkIDMgNTEyIDg6MTYgODE5MiA4OjMyIDgxOTIgODo0OCA4MTkyCnZnMS1sdjFfbWltYWdlXzA6
IDAgMTk2NjA4IGxpbmVhciA4OjAgODE5MgpgYGAKClByZXNlbnQgbHZtIGFsZ29yaXRobTogIndo
b2xlIG9uZSBsZWcgc2l6ZSIgLyAic3RyaXBlZCBkZXZpY2VzIG51bWJlciIuICg5Nk1CIC8gMykK
QnV0IGtlcm5lbCBzaWRlIGRtLWxvZyBtb2R1bGUgZG9lc24ndCBkaXYgInN0cmlwZWQgZGV2aWNl
cyBudW1iZXIiLiAoOTZNQikKVGhlIGtlcm5lbCBzaWRlIGFsZ29yaXRobSBpcyBjb3JyZWN0LgpM
ZXQncyBpbWFnZSwgaW4gdG9wIGxheWVyLCBtaXJyb3JlZCBMViBvbmx5IGtub3cgaXQgaGFzIHR3
byBzYW1lIGxlZ3MsIGRpc2sgbG9nIG9ubHkgcmVsYXRlZCB0b3AKbGF5ZXIgd3JpdGUgSU8uCgoK
SXQgbG9va3MgbHZtMiBhbGdvcml0bSBpcyB3cm9uZyBmcm9tIHRoZSBmaXJzdCBjb21taXQ6CmBg
YApjb21taXQgMTZkOTI5M2JkNzIwNWM2YWQyZTkzMjIyNWFhZmNhNzUxM2U1NDBkOQpBdXRob3I6
IEFsYXNkYWlyIEtlcmdvbiA8YWdrQHJlZGhhdC5jb20+CkRhdGU6ICAgTW9uIE1hciAxIDIwOjAw
OjIwIDIwMTAgKzAwMDAKCiAgICAgRXh0ZW5kIGNvcmUgYWxsb2NhdGlvbiBjb2RlIGluIHByZXBh
cmF0aW9uIGZvciBtaXJyb3JlZCBsb2cgYXJlYXMuCmBgYAoKClRoZSAiLS10eXBlIG1pcnJvciIg
aXMgbWFya2VkIGFzIGRlcHJlY2F0ZWQgbWFueSB5ZWFycyBhZ28uIERvZXMgaXQgYmxvY2sgdGhp
cyBwYXRjaCB0byBiZSBhY2NlcHRlZD8KCk1heWJlIEkgbWlzcyBzb21ldGhpbmdzIGZvciB0aGUg
cmVsYXRlZCBjb2RlIGluIGx2bTIgZnVuY3Rpb24gX2FsbG9jX2luaXQoKT8KCmBgYF9hbGxvY19p
bml0QGxpYi9tZXRhZGF0YS9sdl9tYW5pcC5jCgogICAgIH0gZWxzZSB7IC8vdGhlICJlbHNlIiBi
cmFuY2ggc3VpdGVzIGZvciBvdGhlciBMViB0eXBlcyBleGNlcHQgZm9yICJtaXJyb3IiPwogICAg
ICAgICBhaC0+bG9nX2FyZWFfY291bnQgPSBtZXRhZGF0YV9hcmVhX2NvdW50OwogICAgICAgICBh
aC0+bG9nX2xlbiA9ICFtZXRhZGF0YV9hcmVhX2NvdW50ID8gMCA6CiAgICAgICAgICAgICBfbWly
cm9yX2xvZ19leHRlbnRzKGFoLT5yZWdpb25fc2l6ZSwgZXh0ZW50X3NpemUsCiAgICAgICAgICAg
ICAgICAgICAgICAgICAoZXhpc3RpbmdfZXh0ZW50cyArIG5ld19leHRlbnRzKSAvIGFoLT5hcmVh
X211bHRpcGxlKTsKICAgICB9CgpgYGAKClRoYW5rcwpIZW1pbmcKCk9uIDcvNi8yMSAxMDo1NyBB
TSwgWmhvbmcgTGlkb25nIHdyb3RlOgo+IFdoZW4gY29udmVydGluZyBhIGxhcmdlIGxpbmVhciBk
ZXZpY2UgdG8gbWlycm9yIHdpdGggLS1zdHJpcGVzIHBhcmFtZXRlcgo+IGluIGx2Y29udmVydCBj
b21tYW5kLCBpdCB3aWxsIHJlcG9ydCB0aGUgZm9sbG93aW5nIGVycm9yOgo+IAo+IGlvY3RsL2xp
YmRtLWlmYWNlLmM6MTg5NSAgICBkZXZpY2UtbWFwcGVyOiByZWxvYWQgaW9jdGwgb24gICgyNTQ6
MCkKPiBmYWlsZWQ6IEludmFsaWQgYXJndW1lbnQKPiAKPiBhbmQgdGhlIHJlbGF0ZWQga2VybmVs
IG1lc3NhZ2VzOgo+IAo+IGtlcm5lbDogWyAyMjkwLjY5ODE3MV0gZGV2aWNlLW1hcHBlcjogZGly
dHkgcmVnaW9uIGxvZzogbG9nIGRldmljZSAyNTQ6MQo+IHRvbyBzbWFsbDogbmVlZCA3MDc4OTEy
IGJ5dGVzCj4ga2VybmVsOiBbIDIyOTAuNjk4MjQ4XSBkZXZpY2UtbWFwcGVyOiB0YWJsZTogMjU0
OjA6IG1pcnJvcjogRXJyb3IKPiBjcmVhdGluZyBtaXJyb3IgZGlydHkgbG9nCj4ga2VybmVsOiBb
IDIyOTAuNjk4MjUxXSBkZXZpY2UtbWFwcGVyOiBpb2N0bDogZXJyb3IgYWRkaW5nIHRhcmdldCB0
byB0YWJsZQo+IAo+IFN0ZXBzIHRvIHJlcHJvZHVjZSB0aGlzIHByb2JsZW0KPiB+JDpwdnMKPiAg
ICBQViAgICAgICAgIFZHIEZtdCAgQXR0ciBQU2l6ZSAgUEZyZWUKPiAgICAvZGV2L2xvb3AwIHZn
IGx2bTIgYS0tICAxMC4wMHQgMTAuMDB0Cj4gICAgL2Rldi9sb29wMSB2ZyBsdm0yIGEtLSAgMTAu
MDB0IDEwLjAwdAo+ICAgIC9kZXYvbG9vcDIgdmcgbHZtMiBhLS0gIDEwLjAwdCAxMC4wMHQKPiAg
ICAvZGV2L2xvb3AzICAgIGx2bTIgLS0tICAxMC4wMHQgMTAuMDB0Cj4gICAgL2Rldi9sb29wNCAg
ICBsdm0yIC0tLSAgMTAuMDB0IDEwLjAwdAo+ICAgIC9kZXYvbG9vcDUgICAgbHZtMiAtLS0gIDEw
LjAwdCAxMC4wMHQKPiAKPiB+JDpsdmNyZWF0ZSAtbmx2ICAtTDI3VCB2Zwo+ICAgIExvZ2ljYWwg
dm9sdW1lICJsdiIgY3JlYXRlZC4KPiAKPiB+JDp2Z2V4dGVuZCB2ZyAvZGV2L2xvb3BbMy01XQo+
ICAgIFZvbHVtZSBncm91cCAidmciIHN1Y2Nlc3NmdWxseSBleHRlbmRlZAo+IAo+IH4kOmx2Y29u
dmVydCAgLS10eXBlIG1pcnJvciAtLW1pcnJvcnMgMSAtLXN0cmlwZXMgMyAtSTI1NiAgL2Rldi92
Zy9sdgo+IC9kZXYvbG9vcDMgL2Rldi9sb29wNCAvZGV2L2xvb3A1Cj4gICAgZGV2aWNlLW1hcHBl
cjogcmVsb2FkIGlvY3RsIG9uICAoMjU0OjApIGZhaWxlZDogSW52YWxpZCBhcmd1bWVudAo+ICAg
IEZhaWxlZCB0byBsb2NrIGxvZ2ljYWwgdm9sdW1lIHZnL2x2Lgo+IH4kOiBsdnMKPiAgICBXQVJO
SU5HOiBSZWFkaW5nIFZHIHZnIGZyb20gZGlzayBiZWNhdXNlIGx2bWV0YWQgbWV0YWRhdGEgaXMg
aW52YWxpZC4KPiAgICBMViAgICAgIFZHIEF0dHIgICAgICAgTFNpemUgIFBvb2wgT3JpZ2luIERh
dGElICBNZXRhJSAgTW92ZSBMb2cKPiBDcHklU3luYyBDb252ZXJ0Cj4gICAgbHYgICAgICB2ZyAt
d2ktYS0tLS0tIDI3LjAwdAo+ICAgIGx2X21sb2cgdmcgLXdpLWEtLS0tLSAgNC4wMG0KPiB+JDog
cHZzCj4gICAgUFYgICAgICAgICBWRyBGbXQgIEF0dHIgUFNpemUgIFBGcmVlCj4gICAgL2Rldi9s
b29wMCB2ZyBsdm0yIGEtLSAgMTAuMDB0ICAgICAwCj4gICAgL2Rldi9sb29wMSB2ZyBsdm0yIGEt
LSAgMTAuMDB0ICAgICAwCj4gICAgL2Rldi9sb29wMiB2ZyBsdm0yIGEtLSAgMTAuMDB0ICAzLjAw
dAo+ICAgIC9kZXYvbG9vcDMgdmcgbHZtMiBhLS0gIDEwLjAwdCAxMC4wMHQKPiAgICAvZGV2L2xv
b3A0IHZnIGx2bTIgYS0tICAxMC4wMHQgMTAuMDB0Cj4gICAgL2Rldi9sb29wNSB2ZyBsdm0yIGEt
LSAgMTAuMDB0IDEwLjAwdAo+IAo+IEFuYWx5c2lzOiBJbiBrZXJuZWwgc3BhY2UgdGhlIHJlcXVp
cmVkIGxvZyBzaXplIGRlcGVuZHMgb24gdGhlIHdob2xlCj4gdGFyZ2V0IGRldmljZSBzaXplLkJ1
dCBpbiB1c2VyIHNwYWNlLCB0aGUgbG9nIHNpemUgaXMgY2FsY3VsYXRlZCBmcm9tCj4gdGhlIHdo
b2xlIHRhcmdldCBkZXZpY2VzIHNpemUgZGl2aWRlZCBieSBhbGxvY2F0aW9uIGFyZWEgbnVtYmVy
LCB3aGljaAo+IGxlYWRzIHRvIHRoZSBtaXNtYXRjaCBoZXJlLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IExpZG9uZyBaaG9uZyA8bGlkb25nLnpob25nQHN1c2UuY29tPgo+IC0tLQo+ICAgbGliL21ldGFk
YXRhL2x2X21hbmlwLmMgfCAzICstLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9saWIvbWV0YWRhdGEvbHZfbWFuaXAu
YyBiL2xpYi9tZXRhZGF0YS9sdl9tYW5pcC5jCj4gaW5kZXggN2U2NmFmZDljLi5lOGQ2N2M3OWIg
MTAwNjQ0Cj4gLS0tIGEvbGliL21ldGFkYXRhL2x2X21hbmlwLmMKPiArKysgYi9saWIvbWV0YWRh
dGEvbHZfbWFuaXAuYwo+IEBAIC0zNzMwLDggKzM3MzAsNyBAQCBzdGF0aWMgc3RydWN0IGFsbG9j
X2hhbmRsZSAqX2FsbG9jX2luaXQoc3RydWN0Cj4gY21kX2NvbnRleHQgKmNtZCwKPiAgIAl9IGVs
c2Ugewo+ICAgCQlhaC0+bG9nX2FyZWFfY291bnQgPSBtZXRhZGF0YV9hcmVhX2NvdW50Owo+ICAg
CQlhaC0+bG9nX2xlbiA9ICFtZXRhZGF0YV9hcmVhX2NvdW50ID8gMCA6Cj4gLQkJCV9taXJyb3Jf
bG9nX2V4dGVudHMoYWgtPnJlZ2lvbl9zaXplLCBleHRlbnRfc2l6ZSwKPiAtCQkJCQkgICAgKGV4
aXN0aW5nX2V4dGVudHMgKyBuZXdfZXh0ZW50cykgLyBhaC0+YXJlYV9tdWx0aXBsZSk7Cj4gKwkJ
CV9taXJyb3JfbG9nX2V4dGVudHMoYWgtPnJlZ2lvbl9zaXplLCBleHRlbnRfc2l6ZSwgZXhpc3Rp
bmdfZXh0ZW50cyArCj4gbmV3X2V4dGVudHMpOwo+ICAgCX0KPiAKPiAgIAlpZiAodG90YWxfZXh0
ZW50cyB8fCBleGlzdGluZ19leHRlbnRzKQo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWx2bSBtYWlsaW5nIGxpc3QKbGludXgtbHZtQHJl
ZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1sdm0KcmVhZCB0aGUgTFZNIEhPVy1UTyBhdCBodHRwOi8vdGxkcC5vcmcvSE9XVE8vTFZNLUhP
V1RPLw==

