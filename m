Return-Path: <SRS0=kfxi=LC=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,PDS_BAD_THREAD_QP_64,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5A5FC4743D
	for <linux-lvm@archiver.kernel.org>; Tue,  8 Jun 2021 16:44:51 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FD05610F8
	for <linux-lvm@archiver.kernel.org>; Tue,  8 Jun 2021 16:44:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FD05610F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-a8SnYJMrPrG63GFv627cRw-1; Tue, 08 Jun 2021 12:44:48 -0400
X-MC-Unique: a8SnYJMrPrG63GFv627cRw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C847501E6;
	Tue,  8 Jun 2021 16:44:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A28B6091A;
	Tue,  8 Jun 2021 16:44:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C6FC944A5B;
	Tue,  8 Jun 2021 16:44:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 158Fln4r017448 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 8 Jun 2021 11:47:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 68244208AB8B; Tue,  8 Jun 2021 15:47:49 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FFED208BDF2
	for <linux-lvm@redhat.com>; Tue,  8 Jun 2021 15:47:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F45681D79F
	for <linux-lvm@redhat.com>; Tue,  8 Jun 2021 15:47:46 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.111.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-49-dGeSrvrxPwyhSwkmYz92eQ-1;
	Tue, 08 Jun 2021 11:47:44 -0400
X-MC-Unique: dGeSrvrxPwyhSwkmYz92eQ-1
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-38-BuKLAfIEN8O481bGJ0qo4g-2; Tue, 08 Jun 2021 17:47:41 +0200
X-MC-Unique: BuKLAfIEN8O481bGJ0qo4g-2
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB7PR04MB4074.eurprd04.prod.outlook.com (2603:10a6:5:25::27) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24;
	Tue, 8 Jun 2021 15:47:39 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::1061:e932:29cc:2a38]) by
	DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::1061:e932:29cc:2a38%7]) with mapi id 15.20.4195.030;
	Tue, 8 Jun 2021 15:47:39 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: "teigland@redhat.com" <teigland@redhat.com>
Thread-Topic: [linux-lvm] Discussion: performance issue on event activation
	mode
Thread-Index: AQHXWptdVb+iQI7pP06gMwUhQri0uKsHLrMAgAEreYCAALkqgIAAt0YAgAB5JoCAAAI+AA==
Date: Tue, 8 Jun 2021 15:47:39 +0000
Message-ID: <cbca76c688270279a290568918b70b20c03e48c2.camel@suse.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<CAAMCDef6sSy5X2+-WLR3wx5m7dx9bhmN3EKWyPa31SebS=wRGQ@mail.gmail.com>
	<dd395e820a4cf9b5e807e8de1e456786eebd2044.camel@suse.com>
	<20210607213003.GA8181@redhat.com>
	<1760ea9715bc7a16d4efe10dd95105d663a07228.camel@suse.com>
	<20210608153937.GA21355@redhat.com>
In-Reply-To: <20210608153937.GA21355@redhat.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.1
x-originating-ip: [2.206.153.60]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dc5cc434-13a0-4347-9d68-08d92a94beba
x-ms-traffictypediagnostic: DB7PR04MB4074:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB4074B0DE583182DFA49F21A0FC379@DB7PR04MB4074.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: nf+KvVZqABwOaHSx/Y7Kyseqw0IzPaCeDjqatSGn0zOmm2VG8AGMoauODKax38M8XH/jQfe2AgfDCEga0+hGjrvisCJqYv1y0MrTClLh1yOfM71eE9qSulXbDVzunWhEkVWQWlELp5XLC+bZwVvbSfEUUHzC4+OQZbQyvHqzzeajv+x9txzRPWts6AQlNvSgp3EGH1nIV39hSZKu6kseDom6KQkcv66FumMEG3j5aoHg3mpmmm+5/NVi6HG0gIH37Tie3F+/MgQYa2d6k8DSmiaYRvg24h2M/LNZxOPxHcFt7DpyQGhvBm4oVd1vQ1WScY54u9sp3WgvUy9z5zSoNlz6sLsrkWvfWH75oap++AIfyaOuA6Dun6lSsNinmKXHcvb+/uH7Yyb3T41imxQHpdTGdW9dB1lGtv6zl7BNVvlM3FoqJcvDTKLEU2MlesvJbHKtdcvlp3B229vjmkqqT/AtzqU01/uQRH7ejLPVTaP4psuBhCaKAssPp5nv+Zcmv8TsF+cGhK/PNcKiuBQSMSj4e3xiFcXolRtevYYR7Ri88qbc0OnSlVqxscxsMMwj/mZkUlcJ8U2EDvwVDuxMP5feY2sazYGharApD57HldQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(136003)(346002)(376002)(39850400004)(366004)(396003)(6512007)(71200400001)(6486002)(76116006)(2906002)(316002)(8676002)(91956017)(8936002)(122000001)(186003)(478600001)(83380400001)(6506007)(38100700002)(26005)(54906003)(2616005)(66946007)(64756008)(36756003)(66556008)(66446008)(66476007)(86362001)(5660300002)(4326008)(44832011)(6916009);
	DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata: =?iso-8859-15?Q?O+L+dB1Vo3HS9YM9/5rqRYgeWpS/McIM7M+/jY6j5D3rkGSANweO30t77?=
	=?iso-8859-15?Q?w1s66t13qb0NrQH46UTJpuW0MbDjxy1HAFjN+9NTTTGe54on+xiBMVoks?=
	=?iso-8859-15?Q?JP+nV83p+T7iOnaRcoFuWa93vWbgb+mV2pkYdq7Yi3YeDJId/EuFKzmPd?=
	=?iso-8859-15?Q?WNX5QfYlZVo5YttL00DomHeAhqt5qGQ8zTsUo4z5EoR0OsjJmNJiTXpgK?=
	=?iso-8859-15?Q?yg4D5LWMzwwN0bKIuCEkAfIDVkUUbQYPFVI2CQbWTgSyCwgTyBFIaHlkM?=
	=?iso-8859-15?Q?HaybgMVVebAjonC2qzlc4KYxgCY19I8vpA427aP8ZdNskLuD2POsCRufI?=
	=?iso-8859-15?Q?ynK6le0X8a0NiX5+u5fO9iY5c5eu3xYo39wFlfZwBkLnMPpOpE8DeNuwg?=
	=?iso-8859-15?Q?aH/eCOr866ffeF7JShfK+5x9RWpbGvVxjEV6wjKuJ+GgUTEwUK380sca6?=
	=?iso-8859-15?Q?/zsGPkTqI5+cw1w8t9o/JmNA+bceqPORGhwYfKdgcgC/T04BVizb8lxtR?=
	=?iso-8859-15?Q?H1P9lL0yvJiTKe67m5seQo+y9deAywS2QeukO9PJAoNrlA7dGQCkONtJ0?=
	=?iso-8859-15?Q?gucaloSesCg+5uT5cwCRIrQDpWQ3dxOWAmctewf9WeHEkEaaeXXXej/N4?=
	=?iso-8859-15?Q?Mv1Frc/aGdppA3OGPMVWbzNvUm9p3rYyzgXHhSgims+SjpHgg5yK2NLnC?=
	=?iso-8859-15?Q?JiOI6r2XVB8wezjhYhdxtx+yOT+D9Wk/THI7eb2hrwD5TKOhrLAyNLqoq?=
	=?iso-8859-15?Q?mjnnV4IV9VRsqXxlPa/ZKSmVs6Gi7+OhzuMkRB5olfgwtXd4r4xMZNQZa?=
	=?iso-8859-15?Q?piXsA/9JH1uzCgD5HlRwDcMHKVN4dI//oiFAkjNdpRaH2hYvzK70oSJqC?=
	=?iso-8859-15?Q?kr6NKgp92xE2zacIFbQj+t3DHRA30XfjgEpSiHvxUN+Ojqua22D9JAFoz?=
	=?iso-8859-15?Q?13csSZwPWznNWlTFzRTGWzVhrg2mtN0CnYCf/fr6+iywLExbD0HzHE7l+?=
	=?iso-8859-15?Q?7gRYnAl2V1jgNvuWGJ1LZUZfZr9Gdd3gspotJCTdwOev6rM3CdP8siyU1?=
	=?iso-8859-15?Q?iKf++jG6vToh3nM3qg5tKy0NrmL+9AmoqXzGVGLjKJgiHALINnVZpcrPY?=
	=?iso-8859-15?Q?N3Sk0YJ4E+PlFhyjvOFKZF3UxQPh7xkBKl5+9qKRCogHGw/bhWaeWp8tb?=
	=?iso-8859-15?Q?9QZH8H2QvxTA5BGESSlCP/XQGP0ACctSNvnbEaeA+zple5WDYl0basTPJ?=
	=?iso-8859-15?Q?BSplRxH7Y7OWnkXke9HjAKs260z8KRa7DHeTU5A5tFuV0XQdDWRssrT1S?=
	=?iso-8859-15?Q?EqGQAt6OpC3JAlv27h67qRdNdiaI3QQCxPP2ygAV1tRO1xit97zsRlxDr?=
	=?iso-8859-15?Q?HzisJKlCV9CF6sOQreONxT5+Ni90chLu+?=
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc5cc434-13a0-4347-9d68-08d92a94beba
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2021 15:47:39.2343 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u4eYlkS5a80fgNYl07Mb/71hJeL4gXUmLv/fWVjN1wgA0pcW30cxPweXLaJCfSXr+zcHIO8PY8KsF/cS00hIaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4074
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 158Fln4r017448
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Tue, 08 Jun 2021 12:44:07 -0400
Cc: "rogerheflin@gmail.com" <rogerheflin@gmail.com>,
	Heming Zhao <heming.zhao@suse.com>,
	"prajnoha@redhat.com" <prajnoha@redhat.com>,
	"linux-lvm@redhat.com" <linux-lvm@redhat.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <594ADC13E05E294991AE297AC4BAC426@eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Di, 2021-06-08 at 10:39 -0500, David Teigland wrote:
>=20
> . Use both native md/mpath detection *and* udev info when it's
> readily
> =A0 available (don't wait for it), instead of limiting ourselves to one
> =A0 source of info.=A0 If either source indicates an md/mpath component,
> =A0 then we consider it true.

Hm. You can boot with "multipath=3Doff" which udev would take into
account. What would you do in that case? Native mpath detection would
probably not figure it out.

multipath-tools itself follows the "try udev and fall back to native if
it fails" approach, which isn't always perfect, either.

> A third related improvement that could follow is to add stronger
> native
> mpath detection, in which lvm uses uses /etc/multipath/wwids,
> directly or
> through a multipath library, to identify mpath components.=A0 This
> would
> supplement the existing sysfs and udev sources, and address the
> difficult
> case where the mpath device is not yet set up.
>=20

Please don't. Use libmpathvalid if you want to improve in this area.
That's what it was made for.

Regards,
Martin


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

