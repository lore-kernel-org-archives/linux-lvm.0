Return-Path: <SRS0=7RWj=PJ=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 881BFC433FE
	for <linux-lvm@archiver.kernel.org>; Thu, 21 Oct 2021 06:06:53 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0808E6109F
	for <linux-lvm@archiver.kernel.org>; Thu, 21 Oct 2021 06:06:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0808E6109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-Gjay_jcWPD61LOWpQD-OWA-1; Thu, 21 Oct 2021 02:06:47 -0400
X-MC-Unique: Gjay_jcWPD61LOWpQD-OWA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39B7B10A8E03;
	Thu, 21 Oct 2021 06:06:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 11E02100EA05;
	Thu, 21 Oct 2021 06:06:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D46BD4A703;
	Thu, 21 Oct 2021 06:06:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19KEt1Et000670 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 20 Oct 2021 10:55:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B3C1E40CFD11; Wed, 20 Oct 2021 14:55:01 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD6D740CFD01
	for <linux-lvm@redhat.com>; Wed, 20 Oct 2021 14:55:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F82A811E76
	for <linux-lvm@redhat.com>; Wed, 20 Oct 2021 14:55:01 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.109.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-149-8RG9fo6KN6a4d4e-vvfUww-1;
	Wed, 20 Oct 2021 10:54:58 -0400
X-MC-Unique: 8RG9fo6KN6a4d4e-vvfUww-1
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
	(mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-39-3jrIIznVPpen77EUvYz2FQ-2; Wed, 20 Oct 2021 16:54:55 +0200
X-MC-Unique: 3jrIIznVPpen77EUvYz2FQ-2
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB7PR04MB4617.eurprd04.prod.outlook.com (2603:10a6:5:36::23) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16;
	Wed, 20 Oct 2021 14:54:54 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::6075:6202:39bc:3258]) by
	DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::6075:6202:39bc:3258%6]) with mapi id 15.20.4608.018;
	Wed, 20 Oct 2021 14:54:54 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: "teigland@redhat.com" <teigland@redhat.com>
Thread-Topic: [linux-lvm] Discussion: performance issue on event activation
	mode
Thread-Index: AQHXWptdVb+iQI7pP06gMwUhQri0uKsIs+kAgABkm4CAAPX+gIAADzyAgJKTMYCAG6beAIAAXmQAgAOJqgCAATIsAIABBvEAgBs0qQCAAx39AIAAAuUAgAABKAA=
Date: Wed, 20 Oct 2021 14:54:54 +0000
Message-ID: <9ec85bc97fb23a0cf65d5241125ecca54ec47bd7.camel@suse.com>
References: <20210608122901.o7nw3v56kt756acu@alatyr-rpi.brq.redhat.com>
	<f6b8c5b6c01ecef842eb711748a765f81b7f04e7.camel@suse.com>
	<20210909194417.GC19437@redhat.com>
	<20210927100032.xczilyd5263b4ohk@alatyr-rpi.brq.redhat.com>
	<20210927153822.GA4779@redhat.com>
	<20210929213952.ws2qpmedaajs5wlx@alatyr-rpi.brq.redhat.com>
	<20210930155542.GB32174@redhat.com>
	<418b2bd497a3a4cd76840b3cceb1955ba7e9ba01.camel@suse.com>
	<20211018150418.GA3917@redhat.com>
	<ec784347cc8cf3530533701fd85c0e7825fd8a93.camel@suse.com>
	<20211020145046.GA22742@redhat.com>
In-Reply-To: <20211020145046.GA22742@redhat.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1e249284-0c2a-47d9-f9b3-08d993d993f0
x-ms-traffictypediagnostic: DB7PR04MB4617:
x-microsoft-antispam-prvs: <DB7PR04MB46176C3C719A67AD25B16CFFFCBE9@DB7PR04MB4617.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: 5VU+A59FaoeAnHjf0NgbU+DnJM/xcn8RcAwZShYT+oJm4LgDXURKu67poE5kXwPqXnOSraiISAkl0reb8NKCvyG8TC3ntt8HkLxsWQBrVIfS2q5OVrcXqFUnHCuYLQqLHDBHV9PFtSDDLMeW9bw74aneiiKKW+7EL8Wo78GWDvvLSTh409f7IJu6phY9GnmC4CbAW3WfhCktjRy8hGya2DXA/J+nueJloGqI55eLWfCwiEBTifSynfJ3GCAz4GULZLHgl1VBVWJ/CiZBX30XcIzKWGNFNvlhz49i/exmPC2aRiihl6OqblcKiuoWM4JUVrJRIKZG/oAUlCpi0B+K+zQTlfkYEbM9jDtjwtFbuBSQw95GPuGVFoUG9J36ry08tvcJr7Af22Udm7Gd6ujMahk5rlSdMagbld49yc5amUbBbLge3gBsxnyZ+YfoQBQybKYlVOYM/Iv6YUNYqlzYrXfObLBkixTRsM/MfyTjh5Q/o+nrVPlgUJ2mEeEM7HEIqvn6b3AciDB+0pJWWkUF6PNJSxOhsyPe3htjx64GuIdlIgGFhKNjUdXSymwCZw6xYCWwQYSVV31yygyFXk495M+twpJviyJGQRQB3J6zCISLnC/GUm814UsFxg7wWOj+D85+CTmEZxOkXUcLNT0S3XyGn/v459xWy0Jdo/qlzxaBopfwFA4c5y+1vcjLSJeNS/APFfZ7g4eqfsZEyAtAdw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(2616005)(4744005)(76116006)(6916009)(122000001)(6506007)(38070700005)(186003)(5660300002)(26005)(8936002)(6512007)(91956017)(8676002)(54906003)(66946007)(38100700002)(66476007)(64756008)(66556008)(66446008)(36756003)(2906002)(71200400001)(316002)(86362001)(508600001)(6486002)(450100002)(4001150100001)(44832011)(4326008);
	DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-15?Q?ZrsFPkgoigWMsn2OYANdO2Dvek+bp0XrRpH22+AXUgtkiAl92CrZBI75Y?=
	=?iso-8859-15?Q?xmWEKgFbSGdDfZLxLIU/7zgmovvyPbHSc8nuynG3W+QBYDIVycb3bZzN3?=
	=?iso-8859-15?Q?D+hzOGhINOGVk6+Zmi/mOL5nnF6A71RCxJQNePIgHtIUv0DGt/XOvRu9c?=
	=?iso-8859-15?Q?mXg6+ZohN+gYuxHybHYp2wfH9Vp2lGJMdYTIa3yYqCDiNS2x7Q6HlMikj?=
	=?iso-8859-15?Q?0vTrveounHvUeJGaU2faJEsPXhI0HniRWAFRVq3d0i92CXl8yYb846Asx?=
	=?iso-8859-15?Q?8ZlBu3gNk4OnblKQcOP+lxPV1ImY85VHsgoLN1vigoq0ysXS7YbQTvUSJ?=
	=?iso-8859-15?Q?v9DS6n3Sc6cQsVhtDdapPrv+wdLgdPnCsLEgs8rqDbfzFQXsEZQ1BtLbO?=
	=?iso-8859-15?Q?h5GPksqpcjwSE0GFstiT2l6dtOogaiy0gvAnk8yIVfM3NXM+tcFVskeh0?=
	=?iso-8859-15?Q?/zx9mYGCfaDMOjpDSU5m4r705/i38jFA6etp2tbU32whUN68kZRgQev3g?=
	=?iso-8859-15?Q?MD2WTIF4jDLCbezfHDrIqg8YA+vR+ZhgZY0PZ6V+qHBtBDMbagOOu2SMD?=
	=?iso-8859-15?Q?lA75XSVDaImI+hX5gGnM5VuNHwUF7XS0cnud53HVcHpG00HoKxmqqV/4Y?=
	=?iso-8859-15?Q?nCXbSZzYaK0BG/t7NjlJVnhZ8uV6XOptCgRyBAFAnkM7MgSoQtCwONCZ1?=
	=?iso-8859-15?Q?9zlmEAup0LR7VQhFwiOqAcNmZ5bHb5Dvdjc5PBOxo9SMP9K/KWoqZQm9x?=
	=?iso-8859-15?Q?1ZqjdhHpQTGDd2yJKKUiWzbS5S4IJvkCh7rTvXFXlfn7vKzybpYCwpHIS?=
	=?iso-8859-15?Q?WPwAdU16kObfzTtspEKxgkBttKavVxH3908+CrmpN4g6dRcy34JnJf/6a?=
	=?iso-8859-15?Q?LGtpWkDO52Vzfm6GW0XgJi3g+0Pz5oYcevr1/7izr8MFFKspHkyfeWUru?=
	=?iso-8859-15?Q?DyUsDtHDCxmf2UbJ/s98GDHeRebBTfNp/Y7Cg+QBLaIZH9OTZ+9gQXuVd?=
	=?iso-8859-15?Q?2MwMaK952FmegmijgowHL6v0y4hWl3yAHbNip/sTF5E56kFnVeZbaFstw?=
	=?iso-8859-15?Q?crTBMmMoeOjAyssv2OZT69dXStEtBl/A29tEzQ5dAZAL2do4P22Yht8NC?=
	=?iso-8859-15?Q?sHHbmbjHrluxvBTlWQzvN2BdQyiKVDoHj18vtFyvFRXPT9ipxw/TuCEjp?=
	=?iso-8859-15?Q?s3YjGGn0pcqvx4/lNeCUaaj48YIUVpVMGUmjmZJbm5tDqQ5gxtwtbjkcT?=
	=?iso-8859-15?Q?pbBiNCOcsdsjQETQCSxwrmM8UaLbT/Z+rsqgV3ghOF2t/Kp9exemF686T?=
	=?iso-8859-15?Q?WlXFIyOwWTaKrLgDHuHW6mBnqUMpwPxz6dnnwhTlg+DDx/y2FHS4wVrBV?=
	=?iso-8859-15?Q?mrXnZi3TBtckDllNvkYWclv7oPb9nVbCTJgchoLSVr+yakkIYFtI0qWqD?=
	=?iso-8859-15?Q?eayaiAnK+dDE++Dte1tRHv+p7JzFYl6XcfSF9JNBC+EgrSDIJmjPaTOQ+?=
	=?iso-8859-15?Q?ypSZLkp7sYhXscErAf9QpVge9XnUEQC+gn64VJYOlDir+LH?=
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e249284-0c2a-47d9-f9b3-08d993d993f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2021 14:54:54.7366 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: martin.wilck@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4617
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 19KEt1Et000670
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Thu, 21 Oct 2021 02:06:26 -0400
Cc: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"zkabelac@redhat.com" <zkabelac@redhat.com>,
	"prajnoha@redhat.com" <prajnoha@redhat.com>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <555AD015A4B85747914C03A9222587F8@eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-10-20 at 09:50 -0500, David Teigland wrote:
>=20
> I was just providing some background history after you and Peter both
> mentioned the idea of using RUN instead of IMPORT.=A0 That is, I gave
> up
> trying to use RUN many months ago because it wouldn't work, while
> IMPORT
> actually does what we need, to produce the vgname variable inside the
> rule.

I see. The problem with IMPORT (like RUN, actually) is that it's
required to finish quickly, which might not be the case if we encounter
resource shortage / contention as observed by Heming. If that happens,
the programs started may be killed by udevd, with unpredictable
results.

Regards
Martin





_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

