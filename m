Return-Path: <SRS0=XKGo=OU=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40B20C433F5
	for <linux-lvm@archiver.kernel.org>; Thu, 30 Sep 2021 19:37:24 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4C206135E
	for <linux-lvm@archiver.kernel.org>; Thu, 30 Sep 2021 19:37:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C4C206135E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-GYvuaIuIPnq4bZRQju_pJQ-1; Thu, 30 Sep 2021 15:37:20 -0400
X-MC-Unique: GYvuaIuIPnq4bZRQju_pJQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 874B784A5F0;
	Thu, 30 Sep 2021 19:37:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BAD219733;
	Thu, 30 Sep 2021 19:37:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DF7F11806D01;
	Thu, 30 Sep 2021 19:37:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18U7k5Zg000368 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 30 Sep 2021 03:46:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E3D782168693; Thu, 30 Sep 2021 07:46:04 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD2982028680
	for <linux-lvm@redhat.com>; Thu, 30 Sep 2021 07:45:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 15708899EC5
	for <linux-lvm@redhat.com>; Thu, 30 Sep 2021 07:45:57 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.109.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-80-XIrF8Kh1O3GNrm9fXScKnQ-1;
	Thu, 30 Sep 2021 03:45:55 -0400
X-MC-Unique: XIrF8Kh1O3GNrm9fXScKnQ-1
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
	(mail-ve1eur03lp2054.outbound.protection.outlook.com [104.47.9.54])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-19-hbCGINkhNSGBjxtHgoEoBQ-1; Thu, 30 Sep 2021 09:45:52 +0200
X-MC-Unique: hbCGINkhNSGBjxtHgoEoBQ-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB6PR0402MB2743.eurprd04.prod.outlook.com (2603:10a6:4:95::8) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18;
	Thu, 30 Sep 2021 07:45:51 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::5158:3113:295b:d9c1]) by
	DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::5158:3113:295b:d9c1%5]) with mapi id 15.20.4566.015;
	Thu, 30 Sep 2021 07:45:51 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: "prajnoha@redhat.com" <prajnoha@redhat.com>
Thread-Topic: [linux-lvm] Discussion: performance issue on event activation
	mode
Thread-Index: AQHXWptdVb+iQI7pP06gMwUhQri0uKsIs+kAgABkm4CAAPX+gIAADzyAgJKTMYCAG6beAIAAXmQAgAD6QwCAApMkgIAApZKA
Date: Thu, 30 Sep 2021 07:45:51 +0000
Message-ID: <5614e0888db96d2290893d3755428d3e994d9a47.camel@suse.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<d1d35f7dba3d0e887e7eac06a06ff2414a84c924.camel@suse.com>
	<20210607214835.GB8181@redhat.com>
	<20210608122901.o7nw3v56kt756acu@alatyr-rpi.brq.redhat.com>
	<f6b8c5b6c01ecef842eb711748a765f81b7f04e7.camel@suse.com>
	<20210909194417.GC19437@redhat.com>
	<20210927100032.xczilyd5263b4ohk@alatyr-rpi.brq.redhat.com>
	<20210927153822.GA4779@redhat.com>
	<9947152f39a9c5663abdbe3dfee343556e8d53d7.camel@suse.com>
	<20210929215315.o73j3qiewon63hqi@alatyr-rpi.brq.redhat.com>
In-Reply-To: <20210929215315.o73j3qiewon63hqi@alatyr-rpi.brq.redhat.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eff589fc-1eb6-4d75-f2ea-08d983e65394
x-ms-traffictypediagnostic: DB6PR0402MB2743:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0402MB2743EEBF7BCAB5CD2A5A6317FCAA9@DB6PR0402MB2743.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: LKI43pWH5PrK075E5uxCDQ2sOrSviKyW22wp4H3K5Df8WDBD7tdK6fb+tx9Q7KITqdD3lue0/cpPIsyjmVcKQh03zDumTD65eKrTOgjdZs/FQx5E7Gj96nq1ZS1ZZOsgPlLETCHq2qATmD5uOKdm92wPONdWjyamylPTbAMDsf9fPifzh+EmrdVODVkB8WKB5o0rDXLCgoIyx5VjRP45hdTyfpYuQQNc2eOY/AEgW5ZxGXxom0S1ANv2kmafobeEGClEY74Z/1dlL9BxJnK1fjDHxzXGcDJaL16CYbZRieIfB0nK890hub4+0Qw5Ql5gcHykhgmO5TRli5GsCPdrxj3VpSS/cMN4ii2UuR1ZA8Av1nmNGGxrrwZLIRbiNNN1KGE98NjGxATuoDmx1v4c9+t0ynLOm7egcvvNrDkaKjBuak61c58Kh3JsUgU0TpB2jtsPGZYvoAGMknH2RkIp/Dp9Cuz2ALz9sFRQuNeMrMEGYIGgkcfK6wZ+s81MM5MNITzC7J9LxE0vC56CCnA/cngQwOjPa5x8XI7Za9auzHRhkc/iTpiylCVnd7XWBd4FGZChISamFK+HxoIjPik6f2ctjI8ZC7o+oof1IZRH2vvPW8GZcZJQ/E3ihqPVI6lL3KV0Bb5SZydXa91OVAcJSELMAR/DJOHjqWOL5EmMBsrYpF3vfoaBdlKULwYlKrZ3f+7H/S80CHvlW3fNdvAxlQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(122000001)(6506007)(38100700002)(6512007)(44832011)(66556008)(508600001)(83380400001)(2616005)(64756008)(66446008)(36756003)(2906002)(66476007)(86362001)(6916009)(26005)(91956017)(76116006)(38070700005)(186003)(8676002)(316002)(4326008)(6486002)(8936002)(54906003)(66946007)(71200400001)(5660300002)(450100002);
	DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-15?Q?ZWpHaQB4K6hiyMpRolBxdRXIRGAHOQm2T8/ufDqriyqfDRvfjATOBcVGj?=
	=?iso-8859-15?Q?OW/isV6UUWgiOoazRZeaqoTelBVvVpw9XDatE09iTOGTJ47LsSRqu2Ga1?=
	=?iso-8859-15?Q?dFCZ2BCk4i7MBCAQT+STQydptMKOovbemdDxe3gq5nrKrB6k7njpaQIqV?=
	=?iso-8859-15?Q?QVocA1vgthbcmrCohX9vHplhJqoz0zJ1PKmNokbdfj0HAvePBk3RJ0QMc?=
	=?iso-8859-15?Q?0w4Iu0/YGM+58Qznq8WiBBK7znDMt9+/PtD2iPl5v/kdhF7sYK6kZ0qg3?=
	=?iso-8859-15?Q?C/hxXyET1CnUDY5wYKZaYJgcpPvMNxUMR6g2N4A0GvArBiIscUhiOkRn/?=
	=?iso-8859-15?Q?MRflUCShbE5ALGNe7VUqxYmRz5tegklaZbCaKSMjAVAdKUizDPj9xFSYK?=
	=?iso-8859-15?Q?kQYeZNNwVSo5n8Srb2yycBO59Mxj4TBizbqIKewOG7tNg6b1Q+N24Fq2V?=
	=?iso-8859-15?Q?SG2dVzc9zPn402Fm9093fUlHiEenZm/lgvf2acycQmTnWxL4xFyl7SoP/?=
	=?iso-8859-15?Q?bj/sp6dNFUCIZ7PvC7TbuS2/ETE4UYW4GjccL1dgb0yE/Y4Fmf0DAgFBR?=
	=?iso-8859-15?Q?ZWA54B3xV9/zN2cEteHt0JnXjC5bcfYynV1MGHlkFUkeD06eDuV0qH2Uf?=
	=?iso-8859-15?Q?vjrCIFrd1e7lH9zADbmvpsA86dJOfX9dgSlRYvhWj9y7iayu9b7eAZc4e?=
	=?iso-8859-15?Q?OfVpZRIcQx4lkFvfx0BNiKT1xiVTiee6USkKb/IZjAlFRvp4si5PJRjZP?=
	=?iso-8859-15?Q?KDJDPDde0lsQhmFTXRrul1xEsnO4jd1cRB6jaAPfpbyzZoJdi1oX1eEGo?=
	=?iso-8859-15?Q?YvqaeOH0eynzQbf+G9WaTbBBm+61OLmC5k9kVEhzkI3c0qoAIFSZGngC9?=
	=?iso-8859-15?Q?gmnn9z6lhrX6DNgPFWHftflWwl8QCZabtGc20eH9mkvXam/UaZk5s8tpg?=
	=?iso-8859-15?Q?dW8Lr8FL27/re9nGPXSDZ5xOzNcqVGEpTwsT+F3T42GBd6FwWEfUxlwC0?=
	=?iso-8859-15?Q?8El/+cH0vUmTYXITR5KTgaYnRGDEDoaYokKB3drV+bfRDRRHP99JXOMmD?=
	=?iso-8859-15?Q?wxCgXBBGuCH9wxVjF8imIoXgujzBXOy9hmTsYBiTExqvH6h6PWtSDpi4c?=
	=?iso-8859-15?Q?t7ZJsCgIJjbJ4YYzxAC/C3Qoyx0y7towjyI3reER0VQuoKbwyC1v3ytC2?=
	=?iso-8859-15?Q?a3vr/RDOr5l8DcwrALp3SwG5yjaFUoSo7tOlWLu8t0c10ZVkIBFlWs30Q?=
	=?iso-8859-15?Q?vFZ5E/oMZWwFlHkc0uAbIkqCPH/Mvow+3ROE9B+ltPyU6TKNORdidd0c6?=
	=?iso-8859-15?Q?AxMTWbocTDDJVBwLXpsOHyeEE1awclUz9pqqhJZHNvjNdVImzxW6XBKYF?=
	=?iso-8859-15?Q?AZrPbgYmjAFpcJqrLBE+8auucK+eVDzM+?=
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eff589fc-1eb6-4d75-f2ea-08d983e65394
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2021 07:45:51.6643 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oEI3tTAUtnDYif1TdJSpX5AF7KvwJy0cybq3/FyID1aI6qWyVnLzuuyKOdAyv8Pj/bCClIT8aX/kwtt0jCs6mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2743
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 18U7k5Zg000368
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Thu, 30 Sep 2021 15:03:51 -0400
Cc: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"zkabelac@redhat.com" <zkabelac@redhat.com>,
	"teigland@redhat.com" <teigland@redhat.com>,
	"linux-lvm@redhat.com" <linux-lvm@redhat.com>,
	Heming Zhao <heming.zhao@suse.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <E2701D14D88B5648AB74D9653C33B2E0@eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2021-09-29 at 23:53 +0200, Peter Rajnoha wrote:
> On Tue 28 Sep 2021 06:34, Martin Wilck wrote:
> > 
> > You said it should wait for multipathd, which in turn waits for
> > udev
> > settle. And indeed it makes some sense. After all: the idea was to
> > avoid locking issues or general resource starvation during uevent
> > storms, which typically occur in the coldplug phase, and for which
> > the
> > completion of "udev settle" is the best available indicator.
> > 
> 
> Udevd already limits the number of concurent worker processes
> processing the udev rules for each uevent. So even if we trigger all
> the
> uevents, they are not processed all in parallel, there's some
> queueing.
> 

This is true, but there are situations where reducing the number of
workers to anything reasonable hasn't helped avoid contention
(udev.children-max=1 is unrealistic :-) ). Heming can fill in the
details, I believe. When contention happens, it's very difficult to
debug what's going on, as it's usually during boot, the system is
unresponsive, and it only happens on very large installments that
developers rarely have access to. But Heming went quite a long way
analyzing this.

> However, whether this is good or not depends on perspective - you
> could
> have massive paralelism and a risk of resource starvation or, from
> the
> other side, you could have timeouts because something wasn't
> processed
> in time for other parts of the system which are waiting for
> dependencies.
> 
> Also, the situation might differ based on the fact whether during the
> uevent processing we're only looking at that concrete single device
> for
> which we've just received an event or whether we also need to look at
> other devices.

Yes, "it depends". We are looking for a solution that "works well" for
any setup without specific tuning. Meaning that the system doesn't
stall for substantial amounts of time during boot.

Regards
Martin


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

