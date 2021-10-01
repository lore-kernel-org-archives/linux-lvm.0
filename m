Return-Path: <SRS0=j0V8=OV=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D44D8C433F5
	for <linux-lvm@archiver.kernel.org>; Fri,  1 Oct 2021 08:09:28 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E198D61A63
	for <linux-lvm@archiver.kernel.org>; Fri,  1 Oct 2021 08:09:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E198D61A63
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-99PJarpOOQy12W2wEE9OYg-1; Fri, 01 Oct 2021 04:09:25 -0400
X-MC-Unique: 99PJarpOOQy12W2wEE9OYg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 392F48010ED;
	Fri,  1 Oct 2021 08:09:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FBAA19736;
	Fri,  1 Oct 2021 08:09:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 349684E58F;
	Fri,  1 Oct 2021 08:09:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1917fbDd012317 for <linux-lvm@listman.util.phx.redhat.com>;
	Fri, 1 Oct 2021 03:41:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 57DCCC211A; Fri,  1 Oct 2021 07:41:37 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 51496141948
	for <linux-lvm@redhat.com>; Fri,  1 Oct 2021 07:41:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 37CFD8001EA
	for <linux-lvm@redhat.com>; Fri,  1 Oct 2021 07:41:37 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.111.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-570-8dGIzpoyM2KUCeAh-wbpTg-1;
	Fri, 01 Oct 2021 03:41:35 -0400
X-MC-Unique: 8dGIzpoyM2KUCeAh-wbpTg-1
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
	(mail-db3eur04lp2053.outbound.protection.outlook.com [104.47.12.53])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-4-hy2CzCCsPCuI8Iso7FjyYA-1; Fri, 01 Oct 2021 09:41:32 +0200
X-MC-Unique: hy2CzCCsPCuI8Iso7FjyYA-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DBBPR04MB7580.eurprd04.prod.outlook.com (2603:10a6:10:1f7::9) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15;
	Fri, 1 Oct 2021 07:41:32 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::5158:3113:295b:d9c1]) by
	DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::5158:3113:295b:d9c1%5]) with mapi id 15.20.4566.015;
	Fri, 1 Oct 2021 07:41:32 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>, "prajnoha@redhat.com"
	<prajnoha@redhat.com>
Thread-Topic: [linux-lvm] Discussion: performance issue on event activation
	mode
Thread-Index: AQHXWptdVb+iQI7pP06gMwUhQri0uKsIs+kAgABkm4CAAPX+gIAADzyAgJKTMYCAG6beAIAAXmQAgAD6QwCAAIiSAIAACUiAgAAo+QCAAdwggIAAoz0AgAAElwCAADusAIAAQJOAgAEOzgA=
Date: Fri, 1 Oct 2021 07:41:31 +0000
Message-ID: <074e7d61fac100ef3bdb49edb2a29b4b6a666ef3.camel@suse.com>
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
	<7e91a1e8-2379-a33c-1482-b31adaa7bc8b@suse.com>
In-Reply-To: <7e91a1e8-2379-a33c-1482-b31adaa7bc8b@suse.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a3fdd0ba-cd9a-4c51-73da-08d984aee331
x-ms-traffictypediagnostic: DBBPR04MB7580:
x-microsoft-antispam-prvs: <DBBPR04MB75803D8F09DB2ACAFCE24CEEFCAB9@DBBPR04MB7580.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: /TexUpE03BoNHZK5N05ZivHZZLIHnhWI63apHiaFLYQvx6zsVWBD6B6D8fL2Ge7IpQfmHLqzwKxYsFQqlIeg0cQArDKETZE/Y1F75BbNSFJ6C5RHmXcgFKJoFa/CrRkLg2/r88/f+BfXAt4rSPqYpad9lCG379vqUjVW4vm5UJDVUr5EGonPRDC/sBeSKfxfnYVZWbpc0zJSTR/tQsF082FZvskS+taluWJT/YfLC4KZ8XHjtC9trH/0tFWMrTUtwnlgAzL/TuxxiBUJmrxNqajXTp0kNOzn55BpFNFQ8TJQ8lynA9ZLCBFmz1GJV2JVKcQJpl6o91u34kkmJMv+lVZ7yVmWWbq6/9SK9iH/oWtjgJ6scAP9SGFI7Vo3OxH/nZQsFt5oL3YUisSkO0+LJhDpR91YBQrCWTgtk50dl1lTEO9b4IxttCdho6V6sYtUkCb51/YMMicyK6mQD5A3/q5O4CusfUHhJccgZf1Soa+BLZsHgkZ6yvv0gT31IhhmCkGI+KfxMfVAtNXPLEOh4a7XbFa2zWmE0olXzI1sGaKkhEkZ3/P8a28gfwRS7jzSLb0mquskU9Ct8vUQUO9DAxi2mqhulzNpAodQ/4JshIszR5mgTk4auNh9pdpDS3AaAWGNMQOsPpHDzmWwWiIIusLPm6XvdFecu7VQYavg4D5E4JWF2fbDbDGmwWNiUChv2Ca8IT9S/j/wlerhl+JfO1gFn6gS3+heLYkh/Li8Hwi6X9of9f76r5iOJrgN/h1hChXZ1a64nir1BiDIycUP2ehMXlQNpvYS0tP3X6tjmls=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(186003)(44832011)(966005)(38070700005)(508600001)(8676002)(26005)(6512007)(6486002)(36756003)(8936002)(2616005)(5660300002)(86362001)(450100002)(38100700002)(4326008)(122000001)(76116006)(91956017)(316002)(66446008)(6506007)(66946007)(64756008)(66556008)(83380400001)(66476007)(110136005)(2906002)(71200400001)(54906003);
	DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-15?Q?Y5lvvmSbwDzw6AHlWSt+kkNnVyF4+ZT+6GbITf27oWN4N+GiD1WdNx01s?=
	=?iso-8859-15?Q?QsjlIRu7VwjDy/OIBXw8Y4/H+KFDRxlLbvwA5xpgG+mBm4R7UyGXvG3UF?=
	=?iso-8859-15?Q?hB+4qRKWOzPxYay9J54fldCWBAnV0jj8lkdaoraVsviywMNo2Vipj+kDk?=
	=?iso-8859-15?Q?iKGtXUGPXJCl6n86o2Swe5a8BsRJSYT4T4mqsuf2gj8z3En+osbWFjE7O?=
	=?iso-8859-15?Q?CZuEsB5K3PCDx020sl6n6ocYvHquvKFa9lY+PMgsI7GaurgOvFk+XCIu9?=
	=?iso-8859-15?Q?nqJOUkUNinTLdjY2YHtD0QikZX1Qdg8YHrf/0BQQ2fdjsJSPCViaZ+cvt?=
	=?iso-8859-15?Q?Kw6Crs28URvw0N+s5YNysOIANEhww7X76hRSHMWBJJ8vmFSpiXRKreX4i?=
	=?iso-8859-15?Q?sbB1lhROoIEhlCsIsjLAJqLaVDxKZRHqNaf+n2uYW66A/lMvH4y8aWAuA?=
	=?iso-8859-15?Q?SIH5MDURWzB4bWZgj5B7iLW/9/HqCzT5bEOHTqm5ZAa9TpmGBzX+SdDpt?=
	=?iso-8859-15?Q?joqEiw6ac3BgLvhNo4qTKhmnDH5fmH7GM5YdFaLHFoUHc7gaVUXj6PFv6?=
	=?iso-8859-15?Q?naeCDiqe7xuQaryk25PBwZHziIuucXimTq/ABEbZ+hmZ5+gRS6cdNO6Qv?=
	=?iso-8859-15?Q?vLQR9vkF+O+uYpoFYfuRrgapkOIZ3KfTprM8o4igIjOe2kiB72KrmSbMe?=
	=?iso-8859-15?Q?AucDhzHARahzi1O4+4rm/bS6N0vR59GpwffzKy7C+cdOpa3LLARBxyWvv?=
	=?iso-8859-15?Q?PjYY7bWN4hSpddrtrIsTtTNonkYK5Pe6qAQZC1qpEg7XKgaX7I4E3+JI/?=
	=?iso-8859-15?Q?FJxFdg/l2vVHqggEYFp+lFC2CsM2YEGx8RyBMK60/ASFGDEbonEQB6F0/?=
	=?iso-8859-15?Q?RbgCfS6qlpQEcBKAI3o+EO0Ja+qPgaV0YgMklavtK5gMvW/WOKyrxVHjW?=
	=?iso-8859-15?Q?FSmsE5pdgJ6FYMOQY8LKyhd/qj0Q24zLFTqVc7ybrUuX3kxrct5EoDGgK?=
	=?iso-8859-15?Q?xzJvW0ERyW/uWfuhrAy9Vey/+5n0t0Av4lun51LIwj8MlCrOgcQetqfPI?=
	=?iso-8859-15?Q?QhtknTsbC9/GCz1jcFRiRfSNHaOE40mMCyIz379th24yYeRy32VmuDKgE?=
	=?iso-8859-15?Q?jJonAWN65swj6gzU/SiZLOqxQKwS6K0lfbOzKIOAC2fWUvdc5uEkdR4lf?=
	=?iso-8859-15?Q?lHrkn68VQpJLye1H34gxizoEZINtQu2XFpX6+ajgO7tVYkRabOqAJ2Lyz?=
	=?iso-8859-15?Q?Sw/S6rS1fgOfkym9L0cqzvwFqKT6rBuhjGJoOj7Mg1ebTc9rEl/cBCUL2?=
	=?iso-8859-15?Q?do3+/vodf8FjPnB7ArH7qoNVuYG0l7i6B5PPDGmTK6PsVGqOoLrdiu0V3?=
	=?iso-8859-15?Q?iCqqsqmb2/xoaxa/lLQBdIjo6w7e2AiBj?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3fdd0ba-cd9a-4c51-73da-08d984aee331
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2021 07:41:31.9281 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lak3F6qT4bNoPi5+sLBFMnwpnjzdzJGd6LGs5B2RomGEW3jAFhjHK0dS8yd57fn0BpT6JrKIFHIZDa9+pfBQiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7580
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1917fbDd012317
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Fri, 01 Oct 2021 04:09:17 -0400
Cc: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"teigland@redhat.com" <teigland@redhat.com>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <DF36EF44C5CDB74899607D9C5477BBC9@eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2021-09-30 at 23:32 +0800, heming.zhao@suse.com wrote:
> > I just want to say that some of the issues might simply be
> > regressions/issues with systemd/udev that could be fixed. We as
> > providers of block device abstractions where we need to handle,
> > sometimes, thousands of devices, might be the first ones to hit these
> > issues.
> > 
> 
> The rhel8 callgrind picture
> (https://prajnoha.fedorapeople.org/bz1986158/rhel8_libudev_critical_cost.png
> )
> responds to my analysis:
> https://listman.redhat.com/archives/linux-lvm/2021-June/msg00022.html
> handle_db_line took too much time and become the hotspot.

I missed that post. You wrote

> the dev_cache_scan doesn't have direct disk IOs, but libudev will
scan/read
> udev db which issue real disk IOs (location is /run/udev/data).
> ...
> 2. scans/reads udev db (/run/udev/data). may O(n)
>  udev will call device_read_db => handle_db_line to handle every
>    line of a db file.
> ...
> I didn't test the related udev code, and guess the <2> takes too much
time.

... but note that /run/udev is on tmpfs, not on a real disk. So  the
accesses should be very fast unless there's some locking happening.

Regards
Martin


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

