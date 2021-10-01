Return-Path: <SRS0=j0V8=OV=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00ABEC433F5
	for <linux-lvm@archiver.kernel.org>; Fri,  1 Oct 2021 08:09:33 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5225D61A57
	for <linux-lvm@archiver.kernel.org>; Fri,  1 Oct 2021 08:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5225D61A57
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-1MhBgXw9NquUSdS6qZA0yA-1; Fri, 01 Oct 2021 04:09:25 -0400
X-MC-Unique: 1MhBgXw9NquUSdS6qZA0yA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43B2E1808313;
	Fri,  1 Oct 2021 08:09:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 257D05B826;
	Fri,  1 Oct 2021 08:09:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 33F581806D00;
	Fri,  1 Oct 2021 08:09:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1917gb1W012425 for <linux-lvm@listman.util.phx.redhat.com>;
	Fri, 1 Oct 2021 03:42:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BB84D101F0C7; Fri,  1 Oct 2021 07:42:37 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B665010A7E3E
	for <linux-lvm@redhat.com>; Fri,  1 Oct 2021 07:42:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E2832899EC1
	for <linux-lvm@redhat.com>; Fri,  1 Oct 2021 07:42:28 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.109.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-307-nd5ObGB3MlivOCuJMmfdxQ-1;
	Fri, 01 Oct 2021 03:42:27 -0400
X-MC-Unique: nd5ObGB3MlivOCuJMmfdxQ-1
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
	(mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-37-aWqjq0yuOWCNAmlwVIow2A-1; Fri, 01 Oct 2021 09:42:25 +0200
X-MC-Unique: aWqjq0yuOWCNAmlwVIow2A-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DBBPR04MB7580.eurprd04.prod.outlook.com (2603:10a6:10:1f7::9) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15;
	Fri, 1 Oct 2021 07:42:24 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::5158:3113:295b:d9c1]) by
	DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::5158:3113:295b:d9c1%5]) with mapi id 15.20.4566.015;
	Fri, 1 Oct 2021 07:42:24 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>
Thread-Topic: [linux-lvm] Discussion: performance issue on event activation
	mode
Thread-Index: AQHXWptdVb+iQI7pP06gMwUhQri0uKsIs+kAgABkm4CAAPX+gIAADzyAgJKTMYCAG6beAIAAXmQAgAD6QwCAAIiSAIAACUiAgAAo+QCAAdwggIAAoz0AgAByrACAAR03gA==
Date: Fri, 1 Oct 2021 07:42:24 +0000
Message-ID: <95e31e5bb7bda456894e62d624250f512dc98ad8.camel@suse.com>
References: <f6b8c5b6c01ecef842eb711748a765f81b7f04e7.camel@suse.com>
	<20210909194417.GC19437@redhat.com>
	<20210927100032.xczilyd5263b4ohk@alatyr-rpi.brq.redhat.com>
	<20210927153822.GA4779@redhat.com>
	<9947152f39a9c5663abdbe3dfee343556e8d53d7.camel@suse.com>
	<20210928144254.GC11549@redhat.com>
	<138b7ddb721b6a58df8f0401b76c7975678f0dda.camel@suse.com>
	<20210928174246.GF3087@octiron.msp.redhat.com>
	<20210929220653.p45cvgzdhlbnp4gy@alatyr-rpi.brq.redhat.com>
	<e8459ca73b148e9ba20cbde0041f6e5f4093699d.camel@suse.com>
	<20210930144134.GH3087@octiron.msp.redhat.com>
In-Reply-To: <20210930144134.GH3087@octiron.msp.redhat.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b45aae5-0ea5-4b75-7f9a-08d984af0263
x-ms-traffictypediagnostic: DBBPR04MB7580:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DBBPR04MB7580039D821509CAF8433C3AFCAB9@DBBPR04MB7580.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1751
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: zYA7E8KszgzMT+w+ingcGzgvcIqnMjIFfusl+8XCk2dhLyVYXfXNRaeDqUott4svJfXZtxCqOpjAbe+PfeRS1SbrEQ1BkMI7gfrQE4y5WtkGj0UCW+exkjehYs0sRW/9mMLH/mCB6WmAz3R9gZMNB7jvOh1zmGzVMjw7YPr0mXVwJLPyHQUkU7JSk1VslwGlKORNi1b2RKUW/LKMeX3MOb1SDm3ddAoD7/Rerh12/qU4HaNGSuXKgNwfANgwX8l2+n5xwCuqmIkiMeSFT4khOWP7IizSPRBY6wHWXR5gI6PZcY+GDKIQOAORMxCQ3Cib7VPm2VVaEjx5FhpkmleuQxs8BHlXXboazBY/IEwlipwYYCdYEXTgsdBhBI6UtBZ2UK0S7kQnZYfzuH9DTBpllpXDJuHmFkuYWRaxp2BHjs0hSUBjCR25VKak1SBMQDhW3sbZsZNgn538rQAH9TcS/xNl0gaFjutxCoYBDE6hTuVGiuyg7eupqALMwh8ZKWQo4Db51Zmn0hxqWGfrqnbQoWW5rZ502fFiawzn9CORCa/z7PEbBmEBj5wG3ptLtd2LGAMrvZovwFktO2saJVLpzPz3xRWdOL9Q+Adwf/adLGtmmqsdAP+kJNYeJFwsjQ0pcjNIZ/5NNFd17xhhSZ/iCK0upautZedZ1Zow6duAoJsrJGJszLD3hMamJpiZtwF/HHysdfNs9I8/ST6kz9e8uQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(186003)(44832011)(4744005)(38070700005)(508600001)(8676002)(26005)(6512007)(6486002)(36756003)(8936002)(2616005)(5660300002)(86362001)(450100002)(38100700002)(4326008)(122000001)(76116006)(91956017)(316002)(66446008)(6506007)(66946007)(64756008)(6916009)(66556008)(83380400001)(66476007)(2906002)(71200400001)(54906003);
	DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-15?Q?kE4cOgVRo2pz8+aFQl/t0Z6yA9czZJV9wNSCUzMGWFWN3QZjA0lQJq1rs?=
	=?iso-8859-15?Q?H1A8RRDNWSNMskJUiSh66Afj1Hl4iTYZrFnER54zkz3aMyszcMAnYsVs1?=
	=?iso-8859-15?Q?WcL6tpeL7RTCE124OodtpsLR7b2PrP9o5tXVBhLk7z79AV1Ff6SrJkVZX?=
	=?iso-8859-15?Q?EXxKGY2IvuqlcNY5MBB0qnOi5eDpqvqy6lmGWdSLAC53+xIXstW/3Mb5S?=
	=?iso-8859-15?Q?Y4JgeU+uNm3aOfsun/iuUItn4UT7jG6pEV2iIGKmVvxIn6mKH2EGkf/VV?=
	=?iso-8859-15?Q?ObH81ll+5ubCyEeYezjyzjS890StSSQfIspUV8YASUm2p5qLfn7JzUsL5?=
	=?iso-8859-15?Q?Iunluu8bZfojbjNk4bxKv0unMJ3AOsYl3zlTgMMRWpJy21XtetOAysihf?=
	=?iso-8859-15?Q?Nf86IZcZoebRehicDJ6XA62KM7oekXUxHtTCBHSmDcbkZCgJiXf0+Rryp?=
	=?iso-8859-15?Q?xKQQRu+3eeo4H4YNohCi3QdYMmFaMigi2+6icoVXFq0Mz07OJllv9ZfPu?=
	=?iso-8859-15?Q?3INUFlVjufao1YnAtWlw1Eaop8A7Fnc3MI+XROrF3S35IwL5LJIR3uH4u?=
	=?iso-8859-15?Q?UShGvNPxH669hiSUYnewrPwVrcx5bfc4H5giHst/5XuQuyaN33ZvcUcO2?=
	=?iso-8859-15?Q?RdxG9EzPyH3ygcGFLOJv7OsOiIl179FEPR7RjgoPglyMdh3my3QFgfTjH?=
	=?iso-8859-15?Q?mcecPjPtoJ4XHjue44qynyFGzYvG4hGzt7ahNXPjKS5TkPihVimLRD1rR?=
	=?iso-8859-15?Q?7dbUtSs5LAQgsXAlggUI746FvKY4ARWsqkMyubIfVG00GjZ4jsEiRY2gi?=
	=?iso-8859-15?Q?XnCrYfCNxg6ImbJTRsZ1600gEpg9fVxj4MPd+clUbYHDQARIdPhwj9BHk?=
	=?iso-8859-15?Q?efhwG1IBsHbRtG6aN4PsltXh/StK6OaHjAubxSJ46Hw17Abv93CubP0DF?=
	=?iso-8859-15?Q?cFTvMX2X8mQufmcKVHB24OhD32SlRBl3yufKEpdJXE9pvNAv6bNrSHmTo?=
	=?iso-8859-15?Q?JHqeIjwHjV6r6qFVi2xZAkUu8q8iWlVFQpND73PzjQswVvT2sqRTelh8Y?=
	=?iso-8859-15?Q?rG+haNfOkIKqYYBqTFakY6Ag9C01vBxHNTHp2oDYTfbJnAhGTkSSOFo7q?=
	=?iso-8859-15?Q?iQf1VJDRSbF2sKIqg/REJeEnHOXiFzAeEgZg6fK2WpNRgTtXyUk+pCmBy?=
	=?iso-8859-15?Q?yep3n+peCyzQ8GR+w/KVbiFbMubUUUyfd/c/rOPAkzNOWC5AJes3TfO8C?=
	=?iso-8859-15?Q?zxV55wQijtyh/70SMwhI7GCspGuOiWbwXtq96Pt5/ChqaqkL2NIKyh4D5?=
	=?iso-8859-15?Q?AZTa38laDtW9hLQpeq6+W0R7DGtf7p07hpFHN06js12oyFdpbDrFitUVu?=
	=?iso-8859-15?Q?zxjdGDKK+BbB5YlSv2IEIRjz/8YtyRsVc?=
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b45aae5-0ea5-4b75-7f9a-08d984af0263
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2021 07:42:24.3364 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pKR8OaiVUt85AWH1WE7O1DbgEHhVekThEfpsHhxPx1J6RMEiX1cTlIzDCKpkPCR/rOgkKeCFStIQ5PRRyfQnVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7580
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1917gb1W012425
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Fri, 01 Oct 2021 04:09:17 -0400
Cc: "prajnoha@redhat.com" <prajnoha@redhat.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <8F749835C0258448A3F058F7A2C62BEE@eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Thu, 2021-09-30 at 09:41 -0500, Benjamin Marzinski wrote:
> On Thu, Sep 30, 2021 at 07:51:08AM +0000, Martin Wilck wrote:
>=20
>=20
> For multipathd, we don't even need to care when all the block devices
> have been processed.=A0 We only need to care about devices that are
> currently multipathed. If multipathd starts up and notices devices
> that
> are in S and not in U, but those devices aren't currently part of a
> multipath device, it can ignore them.=20

True. Sorry for being imprecise.

Martin


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

