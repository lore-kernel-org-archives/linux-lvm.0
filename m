Return-Path: <SRS0=XKGo=OU=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93ED4C433EF
	for <linux-lvm@archiver.kernel.org>; Thu, 30 Sep 2021 19:37:26 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0149860FF2
	for <linux-lvm@archiver.kernel.org>; Thu, 30 Sep 2021 19:37:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0149860FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-hk08KzjLOEODYnYwbLZhgA-1; Thu, 30 Sep 2021 15:37:23 -0400
X-MC-Unique: hk08KzjLOEODYnYwbLZhgA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9382919611C7;
	Thu, 30 Sep 2021 19:37:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 74331102AE42;
	Thu, 30 Sep 2021 19:37:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 241791806D01;
	Thu, 30 Sep 2021 19:37:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18U9W4Np010208 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 30 Sep 2021 05:32:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1FEF4D74DC; Thu, 30 Sep 2021 09:32:04 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 16C9DB9CDA
	for <linux-lvm@redhat.com>; Thu, 30 Sep 2021 09:31:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 26274899ED9
	for <linux-lvm@redhat.com>; Thu, 30 Sep 2021 09:31:55 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.111.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-373-O-pYw0gRNBeYlA-LgS1uag-1;
	Thu, 30 Sep 2021 05:31:52 -0400
X-MC-Unique: O-pYw0gRNBeYlA-LgS1uag-1
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
	(mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-40-u621VGa3MkiA3nwFAK9gYg-1; Thu, 30 Sep 2021 11:31:50 +0200
X-MC-Unique: u621VGa3MkiA3nwFAK9gYg-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DBBPR04MB7577.eurprd04.prod.outlook.com (2603:10a6:10:206::10)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15;
	Thu, 30 Sep 2021 09:31:49 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::5158:3113:295b:d9c1]) by
	DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::5158:3113:295b:d9c1%5]) with mapi id 15.20.4566.015;
	Thu, 30 Sep 2021 09:31:49 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>
Thread-Topic: [linux-lvm] Discussion: performance issue on event activation
	mode
Thread-Index: AQHXWptdVb+iQI7pP06gMwUhQri0uKsIs+kAgABkm4CAAPX+gIAADzyAgJKTMYCAG6beAIAAXmQAgAD6QwCAAIiSAIAACUiAgAAo+QCAAdwggIAAoz0AgAAElwCAABeJAA==
Date: Thu, 30 Sep 2021 09:31:49 +0000
Message-ID: <2c2c7063eb6715bafa0c0005e19a9ee882304b6b.camel@suse.com>
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
In-Reply-To: <a3ef9433-ccab-68ea-de00-caebd74e81dc@suse.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: db837b5f-4827-4b54-e2be-08d983f520fe
x-ms-traffictypediagnostic: DBBPR04MB7577:
x-microsoft-antispam-prvs: <DBBPR04MB7577AD334C5437199B2C30ECFCAA9@DBBPR04MB7577.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: W9kX5+4JdNM+QzAjoPvuraPswDIZVYYFvXaZv9y5PU5KXf5ormS17g+4YOYnbqrWo4/2P6TlWxY+6XQu7ejJl/peC1qvRuKlXU5gmYsSLQ0M7OGqEPSMlhJxPDWjcr7ZuJHxhmlK/CRnj2/oP5DJM1nWAqlbL59U3dWNzjZO16Naaio3uW7lhML1r05CLwGLwJU6YA1GFq74oaTvz6miaglHo0c69XM7ijjjXrd/ZcsWciTsBbSdFn6u1O7UbpY4ChewXSoQwNIcNmRwZLT6kHEp2dQrDfuqCejGkAfE68ogysDO7n9pDwL9dE9y6QOizgJUAQadCO9GOyqweHq1bJquIlsWLlT+J3OBY1cFEmpe8mI0DwWazpxr76FLv8FFeIy2WpeVlZYwJcA7T4VUZ9YrikLxB3Z+uqAxYFClb3GBgoKZWJYtIhusQGT3m556p0AGuxAnyohDBmulLwGEaNTLDHMvgZl20pPJ7INBUF9n4KJX/cHJ47SJU43007Zuym5At1svUzNsPmep9hgbX7igZoHBi5J9Y1wQO1Vo4rWOm3sAk9elJ4TU/hBkHNTHlCB5y4YE77VsLCmojhhdaWxlXbGWUkpv2JDAekaoFFUXN0DFGmPyRgILvjdQivtpsUfCyU8+Y/+lsojiff0mmuPb8wozNRjbk0DT6WD6xpd3tsIaG1yMwjKPH0pArBbAiXZTfS8+18grVPY8pnKaQQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(86362001)(8936002)(66946007)(4744005)(64756008)(6512007)(91956017)(76116006)(53546011)(6506007)(66556008)(66476007)(66446008)(26005)(83380400001)(186003)(2616005)(8676002)(38070700005)(5660300002)(38100700002)(122000001)(44832011)(36756003)(2906002)(508600001)(6916009)(71200400001)(6486002)(316002);
	DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-15?Q?fxBdSh0fwVjKRd+mtVRrKvIT6GBcz//OaXtGLgGh64zAVxfIynXuLUn3u?=
	=?iso-8859-15?Q?CyykLBgweLB35ivOMgv/AkWdgaLCEyOZOSpZ4EVZAGlLTDzQpgq+lJuV3?=
	=?iso-8859-15?Q?HK1eFAbXaYXB/NFrTFosMfvipg7axBlgi/IMjrMaLILc5NAEumdSQtSwO?=
	=?iso-8859-15?Q?6ScMLrculH80vADdul0iMbUck1v6Il9Ni3W7VwtyZztNFExGUB1dgUQIt?=
	=?iso-8859-15?Q?bv1WoX7s3ZP16BOHLwP6W0Ged0umx0n7PhtLjFzasj1qui/IUcW95MK4u?=
	=?iso-8859-15?Q?Uy5ag8nV2JjADPrzckZrgNZnNOemoGz4bEoKfvUq+QTBQtdSNKs9SNvRt?=
	=?iso-8859-15?Q?oL0hazFHsQ14IneICY1AWJbazH0pa5KdGDdzC9pPrMHbGgJUADglsYDQS?=
	=?iso-8859-15?Q?wU2c+aWq+x6YS0Nt/Z0idu1TYBhDgvQnxyhrnV6xBIPL11gH0w2nAP4AD?=
	=?iso-8859-15?Q?o450F1nXZ95ftukfgdtvD1ElDkGTshqRpuvGMo5JOHtfdXX4QiRb1Uoq9?=
	=?iso-8859-15?Q?GUlkjs6rx7d++rLgyZAAfFuVvFllvNHWmP+Wqz4HmngrZRnUgsO0OsuYz?=
	=?iso-8859-15?Q?xmKPmGD0RQ0ri84C70Xc1cDgQiFENLpAEsKXqM3FVm6IWpBJo61YscsyF?=
	=?iso-8859-15?Q?K4klf3K5i3mZIpBk/B7m4v7aZBunkeygl5hf+m63Ylxrj+XJ09xz8LDmf?=
	=?iso-8859-15?Q?wvuxkPrIIAZTd+DK4Lef7A0ptvb196jEmFkqMj+RHRZqR0CJCTnhFGa28?=
	=?iso-8859-15?Q?aQFmyLHqJvtgCa6tLKJgoV4MGKINpRQ1qdkd+pRsfHxiyqrIIwQIMFdke?=
	=?iso-8859-15?Q?aUhoEM9fTgVbWETQDe3rEiBM6NMWrw8+StAaKf/VBBOu9u2aVeNFbGmUW?=
	=?iso-8859-15?Q?naXRronX1cVS8dixqojlhdu9MxcL+COLzonrsijD2K3vaJs8DYVa9iOMH?=
	=?iso-8859-15?Q?wu0NKCWPRZ7GMh4MWGcnTEEEPs5iJ9+AykycY1j3tJhtB3qt4o6lm114+?=
	=?iso-8859-15?Q?fNyTKIXtlKjXZLSxx3UBdZA/7FomQThkV0e646tSESnfV1FuLrQF3x0Ta?=
	=?iso-8859-15?Q?a8tcK8imLLGJpiCSs9TecptZUuGR3MDGnqOQutAd9Xj7Ym+EmdjvBJSDL?=
	=?iso-8859-15?Q?PCQniHXrl7teVn2bJKbZGBorzRMpOGkieuBO0/cCPBcPGXItqE5VBBVOG?=
	=?iso-8859-15?Q?cTwRpGG6ezeJpShxqbxea1t4mu0q13WusIOBiKWCrp27AdjRbuGUYk8Z7?=
	=?iso-8859-15?Q?HfdP4d/N4ESIucsgIm+UMR6WKoF3LhJpyFt8KSPjmI0QaG+nXWbRG6IDU?=
	=?iso-8859-15?Q?ZBqrb+YwTkM/ebeleJEUG8X1YC2HE69eHV6bf/WR4yz7zD7+BPhSJboEj?=
	=?iso-8859-15?Q?cHhHXigqMu0+v4XrrABqjzPEtoSfugrBH?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db837b5f-4827-4b54-e2be-08d983f520fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2021 09:31:49.2697 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oZvon7f2oHynKB9B/4N1Ou8kyzcap7bANutZvpnVVKXf3DRnRoPivDhtePwZ+VgxhilAQpes7WfnPECjWhWGZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7577
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 18U9W4Np010208
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Thu, 30 Sep 2021 15:03:51 -0400
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <B11EAD2004722A4F817821C95A4477EA@eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2021-09-30 at 16:07 +0800, heming.zhao@suse.com wrote:
> On 9/30/21 3:51 PM, Martin Wilck wrote:
> 
> 
> Another performance story:
> The legacy lvm2 (2.02.xx) with lvmetad daemon, the event-activation
> mode
> is very likely timeout on a large scale PVs.
> When customer met this issue, we suggested them to disable lvmetad.
> 

Right. IIRC, that used to be a common suggestion to make without having
detailed clues about the issue at hand... it would help more often than
not.

In theory, I believe that a well written daemon maintaining and
consistent internal state (and possibly manipulating it) would scale
better than thousands of clients trying to access state in some shared
fashion (database, filesystem tree, whatever). I have no clue why that
didn't work with lvmetad. It had other issues I never clearly
understood, either. No need to discuss it further, as it has been
abandoned anyway.

Martin


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

