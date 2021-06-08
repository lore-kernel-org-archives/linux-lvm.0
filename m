Return-Path: <SRS0=kfxi=LC=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,PDS_BAD_THREAD_QP_64,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE5F8C47082
	for <linux-lvm@archiver.kernel.org>; Tue,  8 Jun 2021 16:45:01 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65571610F8
	for <linux-lvm@archiver.kernel.org>; Tue,  8 Jun 2021 16:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65571610F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-oOVR3t34M5mY_kmZ4vq1Eg-1; Tue, 08 Jun 2021 12:44:57 -0400
X-MC-Unique: oOVR3t34M5mY_kmZ4vq1Eg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51E47501EC;
	Tue,  8 Jun 2021 16:44:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 239115D6D3;
	Tue,  8 Jun 2021 16:44:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B88171801266;
	Tue,  8 Jun 2021 16:44:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 158G5ulA019109 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 8 Jun 2021 12:05:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2887EF8A0F; Tue,  8 Jun 2021 16:05:56 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 220E2F8979
	for <linux-lvm@redhat.com>; Tue,  8 Jun 2021 16:05:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 616F190DE21
	for <linux-lvm@redhat.com>; Tue,  8 Jun 2021 16:05:51 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.111.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-517-aC3-s_gvOCCftvxWcDNk5A-1;
	Tue, 08 Jun 2021 12:05:48 -0400
X-MC-Unique: aC3-s_gvOCCftvxWcDNk5A-1
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
	(mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-18-AjQRNXiEMw-SLpKVOHSnng-1; Tue, 08 Jun 2021 18:05:46 +0200
X-MC-Unique: AjQRNXiEMw-SLpKVOHSnng-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB7PR04MB4220.eurprd04.prod.outlook.com (2603:10a6:5:27::18) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24;
	Tue, 8 Jun 2021 16:05:44 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::1061:e932:29cc:2a38]) by
	DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::1061:e932:29cc:2a38%7]) with mapi id 15.20.4195.030;
	Tue, 8 Jun 2021 16:05:44 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: "zkabelac@redhat.com" <zkabelac@redhat.com>, "teigland@redhat.com"
	<teigland@redhat.com>
Thread-Topic: [linux-lvm] Discussion: performance issue on event activation
	mode
Thread-Index: AQHXWptdVb+iQI7pP06gMwUhQri0uKsHLrMAgAEreYCAALkqgIAAt0YAgAB5JoCAAAI+AIAABDeAgAAA1oA=
Date: Tue, 8 Jun 2021 16:05:44 +0000
Message-ID: <4f43ee5b76ab6ecdac9bd538626eb1fa46bd1820.camel@suse.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<CAAMCDef6sSy5X2+-WLR3wx5m7dx9bhmN3EKWyPa31SebS=wRGQ@mail.gmail.com>
	<dd395e820a4cf9b5e807e8de1e456786eebd2044.camel@suse.com>
	<20210607213003.GA8181@redhat.com>
	<1760ea9715bc7a16d4efe10dd95105d663a07228.camel@suse.com>
	<20210608153937.GA21355@redhat.com>
	<cbca76c688270279a290568918b70b20c03e48c2.camel@suse.com>
	<8df4f1b8-8ef2-455f-de81-ed0dda70a6ea@redhat.com>
In-Reply-To: <8df4f1b8-8ef2-455f-de81-ed0dda70a6ea@redhat.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.1
x-originating-ip: [2.206.153.60]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c05c3580-c999-463a-a2c7-08d92a97456d
x-ms-traffictypediagnostic: DB7PR04MB4220:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB4220BDD916277802765D2549FC379@DB7PR04MB4220.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: u7a+V7WwO1u9fDzk3SOH/2NR7DQs6Fqi1yrLcULWZMZop2jvxLFRiJAcEzHcK8AkjGnmy+YUQFVglcKX1S5DwMVxJkueeL1KTT3cqUUUHfwrNifZ8QBIncF77SYdrRwLBTdV41wdzoT5hwucxHy2xEE9IHuBZ19O7cHH4nqLYNg54HoTqlSpv+gl1+F5Y9kuyqNLF0k7fZqm5iSHkPS3Tvm5WUEJb1qpwD9T0POtKjJS80FT1vRNd0DmnphsBBXrBlrvSqWzDy0Fbj55pwLCPSLlLgMYjg5R1iQ+AZPSB+kz7oKIKhAlkRsTKkzPhDEMnzmEsuKrlaKOf+jxhxY9X22lhI4UW1k5mzUWaXbR5pjLTDDzQAk5BnES1Irwx+8CfzYy2Zp6ikYN8EQN6V9AEhKcMbsPhfMSI98q8ZwPXjxSyiO8pqXY57XGsJAgO349KGDmcfZuSYPDoNvZX52Sa2aFeZ82G9Hw6IA9zh9rEYDk1JihLEkg0/a91V/q0exLvthpKYB8Eif5Cm5Ip9DktOnrTS1GWk8bvfGLvgpY3lKgvq2btLqgJAuZL6zXmcabTVp8Hz2xBg5+xBGFba0b0H9hMl9wja7z3Iht3Szo71U=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(136003)(39850400004)(346002)(396003)(376002)(8936002)(5660300002)(36756003)(6512007)(8676002)(66556008)(122000001)(76116006)(66446008)(54906003)(64756008)(110136005)(66946007)(4326008)(66476007)(6486002)(478600001)(2906002)(71200400001)(44832011)(2616005)(6506007)(186003)(26005)(38100700002)(316002)(86362001)(91956017)(83380400001);
	DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata: =?iso-8859-15?Q?isU9okskroOzQAEPin3qR8A7GvMObVrwsmWTuKTiuRWZeBQJ1PrID+a1V?=
	=?iso-8859-15?Q?7j5iuKZsPiQBtwOYfeLSGIyRnWEO36wkgE1vUOmc/rr+jgqjq/KYMIBYN?=
	=?iso-8859-15?Q?uDsycO2wk0h/1OJAsJKhQcQuUgJfRsHsjrtcg5uacnTGAQwZj8IDYcycr?=
	=?iso-8859-15?Q?eM3ab9JKk5Vzdmg7pU65CLnnRs9QzOObjkHTagejJibVTJQqOiCmbP40n?=
	=?iso-8859-15?Q?AlwlsWToLSev7oZrUMiMdybIHG1zEcRN4p7rz8BSJeZ0mi7Lc//aOZBA6?=
	=?iso-8859-15?Q?aCq9l9sZwi9DUgDk049TWXl7f5V3/dgJPgCU3B+4cdTJHc0hUjzFcMFci?=
	=?iso-8859-15?Q?9qLPLcY0jUvbePIAkL4UdJ7ymTEjGU7ncCsnZ7OsCKaTxwqYEyXfTq7kF?=
	=?iso-8859-15?Q?qCOXdoaErUujhXiSlHn99JepDl1r3NjcB8flFT1i6bomMS2wM4I4LItFg?=
	=?iso-8859-15?Q?fVX9lEqy9QzVqRxzIjnvD4UqjIq3j/hQxorQ//PSQX4PMVtdqp7YqR8ZI?=
	=?iso-8859-15?Q?5C/hDml5LG+NiDFyarXyWwf1LjzRQ53BBH89GeRJV3iJ4+JY4Y4MldEuI?=
	=?iso-8859-15?Q?6DU2rQKNgpath2GlstYQIugBpCNLmpnrvZzh3uZYfCxdq+86tGKkB2I9i?=
	=?iso-8859-15?Q?GiwN2n23Npsi6sUrpJLVin0RtmBifZmYZ8Pstm8CU00TLPWcjHoD4cgig?=
	=?iso-8859-15?Q?q7qqGS6zl5ArdEnMHG8gU1BQnNx8QJ18KfNHiRmVYvf46lVVhsR3Yq9Pn?=
	=?iso-8859-15?Q?HiyjeJef5sR9yHuTxHnGc7+xg2oASKFZW/Uy6z4cp/lf3CTk2fQ4+o6F3?=
	=?iso-8859-15?Q?Sy/s0FONzKDG/+DSSbmaYVwkcGFFFduJzrRVfqKZM6neeRmFPqnmzStxX?=
	=?iso-8859-15?Q?LpuTINAhQGAfEPy+NCVqTkg2IG/xvVjzZpMXVOjaWpZRWwlV25rJANi8H?=
	=?iso-8859-15?Q?pl8KReUWgcojgS4Ykrgr3wgUa7QM3CU7rnrFFhX1GB5yvBfjBG4Wy1iaH?=
	=?iso-8859-15?Q?ghPU+KHqt1CFPM7Mp6jBjKHdM0A3MREY+r/5lDlw5BVRMS0evzTkVb3T0?=
	=?iso-8859-15?Q?t/67gXxyCYteSAfRd9b08H/LH0lzskmuWDaRxtMz+7swEEIat1hHtrovW?=
	=?iso-8859-15?Q?66psnRNX7nJtAfX87X17maeIsC3c1Smt7/Ia3g4oNCcBgy+Ahebysm2Jz?=
	=?iso-8859-15?Q?Yi3hQpRNGmo6pJiuVtarCDhK2SDf8gxl8w06IOavOxXsiCwTLSrqErhvl?=
	=?iso-8859-15?Q?XPesG8Ll143dz14GfuE9ZRz7LL5JQD5QBSg+iVyNHZYijmxQWDEq9sAs5?=
	=?iso-8859-15?Q?T0QMid4uQ8NxCBEgyewo2HYw8pCkvvsLBEKyAhcaEOZU38pOlQxWTOaGy?=
	=?iso-8859-15?Q?zUNRTDhnEzwxDmDyoK5Y45slly/EjIdWr?=
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c05c3580-c999-463a-a2c7-08d92a97456d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2021 16:05:44.2187 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vqtrZHajlYBBenaTMHtEjqhuugw5TKsvoK/MVSj7OdMf7C+Oxp/syQ8f8YnpwL5hc+nZL7APDYbhNRqWPCXZ8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4220
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 158G5ulA019109
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Tue, 08 Jun 2021 12:44:07 -0400
Cc: "rogerheflin@gmail.com" <rogerheflin@gmail.com>,
	"linux-lvm@redhat.com" <linux-lvm@redhat.com>,
	"prajnoha@redhat.com" <prajnoha@redhat.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <59482CADAC01F64E93F10D0AE864E38D@eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Di, 2021-06-08 at 18:02 +0200, Zdenek Kabelac wrote:
> >=20
> > > A third related improvement that could follow is to add stronger
> > > native
> > > mpath detection, in which lvm uses uses /etc/multipath/wwids,
> > > directly or
> > > through a multipath library, to identify mpath components.=A0 This
> > > would
> > > supplement the existing sysfs and udev sources, and address the
> > > difficult
> > > case where the mpath device is not yet set up.
> > >=20
> > Please don't. Use libmpathvalid if you want to improve in this
> > area.
> > That's what it was made for.
>=20
> Problem is addition of another dependency here.
>=20
> We may probably think about using=A0 'dlopen' and if library is present
> use it,=20
> but IMHO=A0 libmpathvalid should be integrated into libblkid=A0 in some
> way=A0 -=20
> linking another library to many other projects that needs to detect
> MP devices=20
> really complicates this a lot.=A0 libblkid should be able to decode
> this and=20
> make things much cleaner.

Fair enough. I just wanted to say "don't start hardcoding anything new
in lvm2". Currently, you won't find libmpathvalid on many
distributions.

Martin


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

