Return-Path: <SRS0=Ecxi=OT=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3490C433EF
	for <linux-lvm@archiver.kernel.org>; Wed, 29 Sep 2021 06:43:17 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3ED95613A9
	for <linux-lvm@archiver.kernel.org>; Wed, 29 Sep 2021 06:43:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3ED95613A9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-EyrnOPH1M6yChb2WajLKGg-1; Wed, 29 Sep 2021 02:43:14 -0400
X-MC-Unique: EyrnOPH1M6yChb2WajLKGg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E15991084685;
	Wed, 29 Sep 2021 06:43:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B7E351973B;
	Wed, 29 Sep 2021 06:43:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 41FAC1806D00;
	Wed, 29 Sep 2021 06:43:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18SFVhSd015599 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 28 Sep 2021 11:31:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 662EE1134CD0; Tue, 28 Sep 2021 15:31:43 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 611B31134CBC
	for <linux-lvm@redhat.com>; Tue, 28 Sep 2021 15:31:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A91C18A6580
	for <linux-lvm@redhat.com>; Tue, 28 Sep 2021 15:31:38 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.111.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-534-eZaL_2BGONeIlnKUti4OsA-1;
	Tue, 28 Sep 2021 11:31:35 -0400
X-MC-Unique: eZaL_2BGONeIlnKUti4OsA-1
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
	(mail-am5eur02lp2055.outbound.protection.outlook.com [104.47.4.55])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-8-O2BBF-SpNkyeWXsfrKywUg-1; Tue, 28 Sep 2021 17:31:32 +0200
X-MC-Unique: O2BBF-SpNkyeWXsfrKywUg-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB8PR04MB6475.eurprd04.prod.outlook.com (2603:10a6:10:103::16)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15;
	Tue, 28 Sep 2021 15:31:31 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::5158:3113:295b:d9c1]) by
	DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::5158:3113:295b:d9c1%5]) with mapi id 15.20.4544.021;
	Tue, 28 Sep 2021 15:31:31 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: "teigland@redhat.com" <teigland@redhat.com>
Thread-Topic: [linux-lvm] Discussion: performance issue on event activation
	mode
Thread-Index: AQHXWptdVb+iQI7pP06gMwUhQri0uKsIs+kAgABkm4CAAPX+gIAADzyAgJKTMYCAG6beAIAAXmQAgAD6QwCAAIiSAIAACUiAgAAEToA=
Date: Tue, 28 Sep 2021 15:31:31 +0000
Message-ID: <83e3b316022ff06f3b9f66cdd2f03ba7d2ac462a.camel@suse.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<d1d35f7dba3d0e887e7eac06a06ff2414a84c924.camel@suse.com>
	<20210607214835.GB8181@redhat.com>
	<20210608122901.o7nw3v56kt756acu@alatyr-rpi.brq.redhat.com>
	<f6b8c5b6c01ecef842eb711748a765f81b7f04e7.camel@suse.com>
	<20210909194417.GC19437@redhat.com>
	<20210927100032.xczilyd5263b4ohk@alatyr-rpi.brq.redhat.com>
	<20210927153822.GA4779@redhat.com>
	<9947152f39a9c5663abdbe3dfee343556e8d53d7.camel@suse.com>
	<20210928144254.GC11549@redhat.com>
	<138b7ddb721b6a58df8f0401b76c7975678f0dda.camel@suse.com>
In-Reply-To: <138b7ddb721b6a58df8f0401b76c7975678f0dda.camel@suse.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 57028bae-9294-4e07-45b9-08d982950c46
x-ms-traffictypediagnostic: DB8PR04MB6475:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB6475D74546476EB760707C6BFCA89@DB8PR04MB6475.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: VqC9mmg1RjSzh7XyZ3ZE6kSQc9shnr6QcSFA9CVFcwKhfDKVb5DAvz7J/R/U74o8NHhPXRTv1r6pnZippoKpm3mb7KA5Pp1bMttzq1AFVnjDU8WYfugr3mLgDOze5k8CMoGR5UBfV9NIyFBpGY0hAayKwikPPB5jhdh3/p3x/137Lyuvxjnh+y/ILZdg1d+eMc961MVCST2CynGwzVJXEvuLFx7gviuUkMdCtKq3lW5txvo5Gb6vyyA65l5L0e43hCM689dITGLpS0/jTgh9dEnccW4hoKxvyJDoBGZlCCTBoiU/c35BXtORY7ObDEGMxiofefV426Odu9gI0nlWQP7NMsvUw2jgTZk7HizUlYO44HF06GkxZE3B9NfHWTev5nGNmECK3ia0sicntBnsqf7bE5ZqpEGWmtbi2WwBQMqCdrsdbZZ9C5tzy5MC/OknC+84lCg29xi+k1pjJ7JZZocsWmfyhg2MxoDrt5vl7Q1JhjLveCpRoI54PcszxxIga8nayeIg7YwkNE4KmqMaP+8M7PSguSiMNxvQByPFc/u12cM1oUufquSOyQ1bW/29RafS5hMR8l0lrPVvaXoXR7JyVcWxbqSP7RXci74KQZhxMjdoQZ68+dLok3OY3QfEODDztB2LwMUfhmdO0B2qWFMTV5HEPTBx1H/HXe6KHQJjWvQcqkpiwXp40M8xZ1NiqCVxXeS0poMMawMXsNXkfw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(76116006)(316002)(66946007)(38100700002)(91956017)(64756008)(66446008)(66476007)(66556008)(8676002)(71200400001)(26005)(6506007)(38070700005)(6512007)(44832011)(54906003)(450100002)(4326008)(508600001)(5660300002)(36756003)(2616005)(2906002)(8936002)(83380400001)(86362001)(4744005)(186003)(122000001)(6486002)(6916009);
	DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-15?Q?zNkHk9ty71Sne8C71wcIS/SSdNeU8MQCJZcvjJ+hBjfvFpWuB2v3x30eZ?=
	=?iso-8859-15?Q?d8+IVufGkQvyluevkdx/oBsDe1hMTpNd9kKQt5I49HRaBco6USbWQHLiZ?=
	=?iso-8859-15?Q?WXyf3GbbEhgB0aqorh809aJgHBCMUoFrSwou50QrWcoKCDbV0SKrk1q4r?=
	=?iso-8859-15?Q?PF/rR05SWgSCh+WiABIT7HQNbH88ouIi5webJrT0ZuOmHWJFhuNo9LknZ?=
	=?iso-8859-15?Q?1rtUZrsBP1j0WUzMvS5TtXR864wSL+ZMHnpSNzdYg8perF5rAaUgtKXz0?=
	=?iso-8859-15?Q?q/LqJoD/rFE+rhzzeXimryHt6Uh0CrSNKkaZ25S73cgvAIJ/qjq3bng+d?=
	=?iso-8859-15?Q?eNbXzwhVMv6bYhPmLBwMXXNq7oLsCBT49gWq4tDjld80xy3QAzIdDomWF?=
	=?iso-8859-15?Q?PqxDpjk5M+F+nc8A60zcfoypbtaA2kvdrhnrgazqUMO+qsLA8mcyAJySK?=
	=?iso-8859-15?Q?Iz6CFTjvONHkiq3xKjtxNNoeEBRaeavdo7GSAN+f1/U6szs/2z5mlhyFd?=
	=?iso-8859-15?Q?UKO4sYJLFV7be7fw7bpYy3UE6hZ59TF6OM9FjfnZNpx9bjAY4f98Cm7Ja?=
	=?iso-8859-15?Q?qZVwX+ezCvnZtmoYfPza/+Oy1vvKU4rayXXgwj8UrEEU7/Pj81i/WS1TV?=
	=?iso-8859-15?Q?MttAXjhVhBKz41VLDFh2TzEq9LU9uP0coVQKCmmTxObCJOxithl9An44t?=
	=?iso-8859-15?Q?Ftpe3NxU4NRCQl+YAFTXZkYNZ0yV8zv1Oxe3+3VfZlTcJnATIgIyFnQ0T?=
	=?iso-8859-15?Q?/DeANICpPNRGcNQi/dsZkXXUkUSsxjzARWBwG501aOq2wFM/gZVMV9F47?=
	=?iso-8859-15?Q?9IG2FNyClnyt58GivVKIfR0HYVDpSugXCd+LKn21qXoqKDkL/QJkkUCu1?=
	=?iso-8859-15?Q?QkhiZ+pZwOdoJcpKKn80ANA8oSmXW8O4WLL8OazaXNCt2gqUuuc3A80Sv?=
	=?iso-8859-15?Q?IZ+6Vffpz5wJzeD6DtFfCh0SJKH8g5KL49RgpkleJAXeLcvNcLxw+4nAC?=
	=?iso-8859-15?Q?Ybimrw6s0sLwmW1j4e0NwTc4ovNo5RC5vBfpKggFepFhVHm4I9wzjz2Xl?=
	=?iso-8859-15?Q?xvqPoUdbkYg6fAqNh8SGPlb24AdgcYA3vtHt8bDpw5dzD/SNGCQ/IoREm?=
	=?iso-8859-15?Q?io0BULg1imopPPho4kcxuK8ZZOIGZAvc1FLP3Tz8sKO+ndE2bX4+84olt?=
	=?iso-8859-15?Q?owFQ1xCCKeWhlpLGUyTm5bBr3HiLD0cwfz47O8ZyFCJ27+kYmgnS4gT8H?=
	=?iso-8859-15?Q?VxPfPuWF7IhdDb5H6nSeS8UOjMzzN+XtTdlvX8P/e4SumXP7T0t+bLa7P?=
	=?iso-8859-15?Q?nNprnTzezXKSpk7RN23TDFUWhQM9NlQK1Y36rKKcd6U14eL4jtxHymMnA?=
	=?iso-8859-15?Q?DmPmCuZY8Sb3t+mYn9vemXAFtxLHMJY+I?=
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57028bae-9294-4e07-45b9-08d982950c46
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2021 15:31:31.6886 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XQIyg3hGi9ic9i4t+KPzeXTZJJ6RfrTuxRGj8fRGmkEYP+qnqpA0ctd+aAyTWNNPDehOtlOkkdfi0HXnOn5K/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6475
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 18SFVhSd015599
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Wed, 29 Sep 2021 02:42:14 -0400
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <EB53D96F01236841A0CF81A85D0579DF@eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Tue, 2021-09-28 at 17:16 +0200, Martin Wilck wrote:
> On Tue, 2021-09-28 at 09:42 -0500, David Teigland wrote:
>=20
> >=20
> > Firstly, with the new devices file, only the actual md/mpath device
> > will
> > be in the devices file, the components will not be, so lvm will
> > never
> > attempt to look at an md or mpath component device.
>=20
> I have to look more closely into the devices file and how it's
> created
> and used.=20
>=20
> > Otherwise, when the devices file is not used,
> > md: from reading the md headers from the disk
> > mpath: from reading sysfs links and /etc/multipath/wwids
>=20
> Ugh. Reading sysfs links means that you're indirectly depending on
> udev, because udev creates those. It's *more* fragile than calling
> into
> libudev directly, IMO.

Bah. Mental short-circuit. You wrote "sysfs symlinks" and I read
"/dev/disk symlinks". Sorry!=A0Then, I'm not quite sure what symlinks you
are talking about though.

Martin




_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

