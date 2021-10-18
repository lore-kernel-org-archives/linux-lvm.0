Return-Path: <SRS0=tbfx=PG=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 948DAC433EF
	for <linux-lvm@archiver.kernel.org>; Mon, 18 Oct 2021 07:35:52 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E569610A3
	for <linux-lvm@archiver.kernel.org>; Mon, 18 Oct 2021 07:35:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E569610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-ctElBFtTMFCSC90plr5D7Q-1; Mon, 18 Oct 2021 03:35:47 -0400
X-MC-Unique: ctElBFtTMFCSC90plr5D7Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59B92801FCE;
	Mon, 18 Oct 2021 07:35:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FBFBADFA;
	Mon, 18 Oct 2021 07:35:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E9CB44EA39;
	Mon, 18 Oct 2021 07:35:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19I6OuQe010153 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 18 Oct 2021 02:24:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3DA3A400F3C5; Mon, 18 Oct 2021 06:24:56 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 382A840D1B9D
	for <linux-lvm@redhat.com>; Mon, 18 Oct 2021 06:24:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 201ED18A01A0
	for <linux-lvm@redhat.com>; Mon, 18 Oct 2021 06:24:56 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.111.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-474-QP8BnvVtPWGsiBmRkfXbzw-1;
	Mon, 18 Oct 2021 02:24:54 -0400
X-MC-Unique: QP8BnvVtPWGsiBmRkfXbzw-1
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
	(mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-36-mHYBlfc8PceQ2ptaUhg0lA-1; Mon, 18 Oct 2021 08:24:51 +0200
X-MC-Unique: mHYBlfc8PceQ2ptaUhg0lA-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB6PR0402MB2741.eurprd04.prod.outlook.com (2603:10a6:4:98::14)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16;
	Mon, 18 Oct 2021 06:24:50 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::6075:6202:39bc:3258]) by
	DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::6075:6202:39bc:3258%6]) with mapi id 15.20.4608.018;
	Mon, 18 Oct 2021 06:24:50 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: "teigland@redhat.com" <teigland@redhat.com>, "prajnoha@redhat.com"
	<prajnoha@redhat.com>
Thread-Topic: [linux-lvm] Discussion: performance issue on event activation
	mode
Thread-Index: AQHXWptdVb+iQI7pP06gMwUhQri0uKsIs+kAgABkm4CAAPX+gIAADzyAgJKTMYCAG6beAIAAXmQAgAOJqgCAATIsAIABBvEA
Date: Mon, 18 Oct 2021 06:24:49 +0000
Message-ID: <418b2bd497a3a4cd76840b3cceb1955ba7e9ba01.camel@suse.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<d1d35f7dba3d0e887e7eac06a06ff2414a84c924.camel@suse.com>
	<20210607214835.GB8181@redhat.com>
	<20210608122901.o7nw3v56kt756acu@alatyr-rpi.brq.redhat.com>
	<f6b8c5b6c01ecef842eb711748a765f81b7f04e7.camel@suse.com>
	<20210909194417.GC19437@redhat.com>
	<20210927100032.xczilyd5263b4ohk@alatyr-rpi.brq.redhat.com>
	<20210927153822.GA4779@redhat.com>
	<20210929213952.ws2qpmedaajs5wlx@alatyr-rpi.brq.redhat.com>
	<20210930155542.GB32174@redhat.com>
In-Reply-To: <20210930155542.GB32174@redhat.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ed3aabc-434b-4c56-3c8e-08d991fffd40
x-ms-traffictypediagnostic: DB6PR0402MB2741:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0402MB2741109362854C90AFE1BA6AFCBC9@DB6PR0402MB2741.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: 8ffgab1hKK7+hFuyhX9JvtQD/AwRbZy1dwEsJG4jWMPTYVcIyYp98ktvqSJu9AHv8ZgM6yLPPFPTjEk6bTFUoS9NnvRFB2NohMnfR2yRx8scnJ1vWHPqPT74N+6m8p0+Rq2sDasvMjKWYvP620fqC8N8yRYDh1nA3PloA7BIkQplQyE4ijmvzdweH2vgFDLZdDlSnSY2Y4Ce3urbQxPei1q/NuFep34PliPTiPrZvBwc6FVTwUbPndIEAXUCeuwzvPr1cH1hXA/CgUU86Je7vj0ziFHwi6dq+e8dJGz/O+nIkrRhUp0GVwdPek07HXrKjI8nZ9ulnrqqZQA4f9AABK4FC+rYwZDpxe7NLuThmNwEzP9PowiU4QpzIRNqGPU6fDKvuoGcnNZtEX009XiN36VjYhZaAH5943kEE6U4QRLhWRKp+1GuHrPskykg0gRLzDKoRdnFRWhrK0P0aKrpDhWru6HrkHtwG83umWkFJ/DkAgxsYcF2e442jYeL8z9tKlOCPUzf79F4jfmWSK5RI9AWH8A4U2ZkVVstk0fOnqkXfBrGmgp1IRY7iy6RuFPbsUgx+X31HfwOMGxfo6es8yJ4AVijKaiEqYK+0/F1fbxSinJZev4Cg/abvIArMrJfyocGK/RBDVMtF6GNP3T0v6OV0f7CL0cx8DpJlOkofND3tm2nNg+JSfi7Q0p5Jqmc+y+tiD5YZMsgBkIWbkBf/Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(2906002)(6486002)(86362001)(44832011)(316002)(71200400001)(6506007)(26005)(38070700005)(66446008)(91956017)(76116006)(6512007)(186003)(4326008)(66946007)(66476007)(5660300002)(508600001)(83380400001)(64756008)(450100002)(54906003)(8936002)(66556008)(2616005)(110136005)(8676002)(36756003)(122000001)(38100700002);
	DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-15?Q?InYOfuWgJ5x3LIh+OohM4kiHQ1MPS2FAASMcLwStqDlLGtDupFOBG4uVE?=
	=?iso-8859-15?Q?9ghEo0AjNAzUTouyv5f2wD+cHOBsVhsxaYPHY0deDsnlfhdm6WlsRS39E?=
	=?iso-8859-15?Q?uAuBk0BW9ZLCnuKYrsYxFk+i+PC87IYaIjZX5a1Mrrm6LeVraeYSKN0vS?=
	=?iso-8859-15?Q?+EYz+j/wQneTAab64zG50z76yrzB1JQJMrV+fTjb5WGj2cNQmvA4Srl7n?=
	=?iso-8859-15?Q?Lx2yWrYuTzzKoVBGQF95eqRvXlOHfspI3p8TFHmJErBivaOwrnd95emvt?=
	=?iso-8859-15?Q?e9GFClHTMkgTryWJbWwXtfu9iZYZecMeBEFymC7+p00wHCV3BINUc+slI?=
	=?iso-8859-15?Q?9OsTfZPct49GpTus8UTgwualFoJHFUiz2134eHVaSFj+THWsVw6WlpGBL?=
	=?iso-8859-15?Q?u9+9WzKA2xPVm3G80i/ArbiyPPRMS/tOXR/p8gaop5U1+UtpCLWoxdLz/?=
	=?iso-8859-15?Q?0r4IWy6cAIKMrDy/SrlpqfkL7lg+WaBe69MM3TSJy0Cm+kfqEQVpNqpEA?=
	=?iso-8859-15?Q?W2Mhq7ao1vA6JO9tpHO0B/4+/KZ9renthKR3PX+Otfon54ukQwMekY6+P?=
	=?iso-8859-15?Q?kEnCkLHl/JDHLlstAADfxWCYJgQcB/34nASp7XyGGl9d1UGgzOulExff8?=
	=?iso-8859-15?Q?gkM5boMY+QxDEwGjH500r8BAh4SiZx6z61sQJ+sFmEqTHde0EUrHacm6N?=
	=?iso-8859-15?Q?e6ykkAVVxw4eeHrAjExvmOOyhI+u71X6McLaZPgwHnI/5JgRZU12jCkJi?=
	=?iso-8859-15?Q?POvlZgC5OHs0uVwfeCQXc5sltwtRQ3OF80Y8YA2Dk0htP4tvddPB3Ic4G?=
	=?iso-8859-15?Q?/gQgdyDgWwOoGio34KDNfjVRG8GdsigA5UrW7/CGzGl4CONMJRgIA8TNz?=
	=?iso-8859-15?Q?C9Ne8zJWzsI7QhVEs3TLkmYgQMkwo6woji72wccwbO5psWZRyYfJpp14K?=
	=?iso-8859-15?Q?XjQKQRMBHMqCNREVVgkArAANBE6c6Bdwe1XFzxwcFPXrq9+gTiKOai61J?=
	=?iso-8859-15?Q?5chtUynAcGLD+PGuNRSgw0klnd9M6+89dhT8kh2aCCjZ25S9lv/n0ZnLP?=
	=?iso-8859-15?Q?Dw/4ixGupJnyNbXiT+4jpJWQet4pYTztAyFjsZRJcYcX1/dL+H2yDvr+F?=
	=?iso-8859-15?Q?a+09jsOeVrmeHAntTheEAqQY/7CPEkzr4pXomkV0j1xqDgi0FV2rnUh4+?=
	=?iso-8859-15?Q?vq8SeqfwkwLD+Y7HLV22QjEMGG3avQ8VmbitITR2giVdXhyPi3eWTPhbP?=
	=?iso-8859-15?Q?3FGBXkwp/ZJ6GzzRd6WP8eJenZebwLZ2p39eZX3ruIlQcHeR5kwPX8YNl?=
	=?iso-8859-15?Q?fcy0dwp9rdN1AQsUdW1HCqJ/S2wTzSKl2h97Xr4ip8nFkDBBH1iMAmjem?=
	=?iso-8859-15?Q?JlHone8PtoBXAV9KE+pEqkn4K9uc79o4I?=
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ed3aabc-434b-4c56-3c8e-08d991fffd40
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2021 06:24:50.0329 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RT+Z7uaBGfZSNb973104TQOJhBW+BwiqLgpgijV06MexgNiTeFK0QjXAVoAdtey7b6ub2BxfyGqvHSgKVxBrqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2741
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 19I6OuQe010153
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Mon, 18 Oct 2021 03:34:48 -0400
Cc: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"zkabelac@redhat.com" <zkabelac@redhat.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <C6C9C236EAE3B04CBD2B6FF528E7F41D@eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Thu, 2021-09-30 at 10:55 -0500, David Teigland wrote:
> On Wed, Sep 29, 2021 at 11:39:52PM +0200, Peter Rajnoha wrote:
>=20
> >=20
> > =A0 - For event-based activation, we need to be sure that we use
> > "RUN"
> > =A0=A0=A0 rule, not any of "IMPORT{program}" or "PROGRAM" rule. The
> > difference
> > =A0=A0=A0 is that the "RUN" rules are applied after all the other udev
> > rules are
> > =A0=A0=A0 already applied for current uevent, including creation of
> > symlinks. And
> > =A0=A0=A0 currently, we have IMPORT{program}=3D"pvscan..." in our rule,
> > =A0=A0=A0 unfortunately...
>=20
> That's pretty subtle, I'm wary about propagating such specific and
> delicate behavior, seems fragile.

I'd like to second Peter here, "RUN" is in general less fragile than
"IMPORT{PROGRAM}". You should use IMPORT{PROGRAM}" if and only if=20

 - the invoked program can work with incomplete udev state of a device
   (the progrem should not try to access the device via
   libudev, it should rather get properties either from sysfs or the
   uevent's environment variables)
 - you need the result or the output of the program in order to proceed
   with rules processing.

Regards,
Martin


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

