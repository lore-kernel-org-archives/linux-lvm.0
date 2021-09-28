Return-Path: <SRS0=Ecxi=OT=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2941C433F5
	for <linux-lvm@archiver.kernel.org>; Wed, 29 Sep 2021 06:43:26 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AC68613A7
	for <linux-lvm@archiver.kernel.org>; Wed, 29 Sep 2021 06:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6AC68613A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-ejg6p7tYPB2YfFA3Fq3M3A-1; Wed, 29 Sep 2021 02:43:23 -0400
X-MC-Unique: ejg6p7tYPB2YfFA3Fq3M3A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03FBA1006AAC;
	Wed, 29 Sep 2021 06:43:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D49E6100E107;
	Wed, 29 Sep 2021 06:43:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 88F361806D01;
	Wed, 29 Sep 2021 06:43:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18SFGap8014730 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 28 Sep 2021 11:16:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 12DB6111284F; Tue, 28 Sep 2021 15:16:36 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 08E191112858
	for <linux-lvm@redhat.com>; Tue, 28 Sep 2021 15:16:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 56F7B10666A1
	for <linux-lvm@redhat.com>; Tue, 28 Sep 2021 15:16:17 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.109.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-87-nTiDVPNUNCGL0l_FrFFuMA-1;
	Tue, 28 Sep 2021 11:16:13 -0400
X-MC-Unique: nTiDVPNUNCGL0l_FrFFuMA-1
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-39-azwlwYoqPGaPAciJcHDYMA-1; Tue, 28 Sep 2021 17:16:10 +0200
X-MC-Unique: azwlwYoqPGaPAciJcHDYMA-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB6PR0401MB2360.eurprd04.prod.outlook.com (2603:10a6:4:4a::11)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13;
	Tue, 28 Sep 2021 15:16:08 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::5158:3113:295b:d9c1]) by
	DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::5158:3113:295b:d9c1%5]) with mapi id 15.20.4544.021;
	Tue, 28 Sep 2021 15:16:08 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: "teigland@redhat.com" <teigland@redhat.com>
Thread-Topic: [linux-lvm] Discussion: performance issue on event activation
	mode
Thread-Index: AQHXWptdVb+iQI7pP06gMwUhQri0uKsIs+kAgABkm4CAAPX+gIAADzyAgJKTMYCAG6beAIAAXmQAgAD6QwCAAIiSAIAACUiA
Date: Tue, 28 Sep 2021 15:16:08 +0000
Message-ID: <138b7ddb721b6a58df8f0401b76c7975678f0dda.camel@suse.com>
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
In-Reply-To: <20210928144254.GC11549@redhat.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a753157e-40c8-4c76-4164-08d98292e5f4
x-ms-traffictypediagnostic: DB6PR0401MB2360:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0401MB2360E501C9B610EA8A05AEADFCA89@DB6PR0401MB2360.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: YaBlWkOENjDTzTwfg/Vy5He1OUO0rnKeXv4MHUd4mt3y55Sqye2iBsTQv2XXTMt2UgWvyk72ihZTw7xrl+hiF4cn59TUUT50HLHxlNldCY/ZN7dOioWKm8xWjXyK3tVUEehzMzuS2Jh/lIw/KZYHdT5dmq0w9gvJF/CVhTMe07LhNziVUdJ0lGWEG080Zl3RrAsXRwJG72Xh+TtzzNkIDmWAeaSuJ3xTyQdSRNsNJqNWLYYo1polrmzvrafrOyhHZIg2ZWOLwxvmS2ybjXMumL2TYqh09fyCl/i/I57qWls7jVLwzAqGflbXjpiUKbEq+rBBSlXA5ITNBKz3Elm5N8mZzmzTCcGafoQdnI3BFkkNko8uhfrff9v5vPRvO91anNRN7cbyqG6SWcgpsg31Ag/ASRzeTJgEm1SkqGyfsN82AL3D1KqAL/OS9qM3u7xRr2Dr6KeEq4Gy2IAKUiHxJeNDKIW1BSElhlOpWiekfK9JSQ1NF+bB/JzPaod6PLVX9tR0uqeVeqzTma3Y/IlSl8FTx8I8YVEed4yy5fA7+dlRL7SwPp4i09wGSzM/Pp1EO1wJci2Kpyo4V2dBmanG9HeyslQLxRiqpyW5Lo96p7UNWoBqupoOfzYqiDcOy4eOJzR4EIokdNzXhCLaVmUPV9GedamscKh6BgG0sQRaTj1DhW/yrlf11wCufWTisP6q3iVxcAS5D7qTmF91ScrIwA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(6916009)(38070700005)(86362001)(26005)(186003)(6486002)(122000001)(2616005)(6506007)(450100002)(36756003)(44832011)(4326008)(91956017)(38100700002)(83380400001)(508600001)(2906002)(8936002)(6512007)(54906003)(71200400001)(8676002)(66476007)(66946007)(66556008)(64756008)(66446008)(76116006)(5660300002)(316002);
	DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-15?Q?WwTxur9UrTMVOcV8DQ3TWQiln8TwRtxalRPxAUeGncwjtJNFJHS31exwd?=
	=?iso-8859-15?Q?69NqbbSUXjXpebewParqBYkRflfCwZKiHJ2thxXtMq+qbTxEnS5uWN5K7?=
	=?iso-8859-15?Q?hIJSn2ls6v8lP+/HTmlKaN3ckRzpn0eNSWbojJYnAckgA9YGvEfFz4jbF?=
	=?iso-8859-15?Q?kjnOnIqj4FYwGO9achOvQI1LzzxNWDwhkSrN5bjq9toGmyoRqUkCAdE4d?=
	=?iso-8859-15?Q?8umft2u7oNYw4DSkVI85b+DhEx/u6Tfj/OrkDU+Jxh7dI0fKWA3xg6ODW?=
	=?iso-8859-15?Q?l8cTnI9yVQTi2xtOvaG14wcHkcx0gkBotCqqZiPnIX39qfIi+cMpNesBH?=
	=?iso-8859-15?Q?v1XTJHA4x2FbE2gglmYF3PqSe71TLPkERrQMWtTjGjw1g3IWAfahdNzRZ?=
	=?iso-8859-15?Q?JzsMjy0R03ZA/9OhuqCASqFaT+4UJKzbSA0ASwoau4bT7W7WV4q4p6P9r?=
	=?iso-8859-15?Q?y0ReP1IDT3x9coJSB5KMmwTjH6d6dbW+r9qXeaG399DW/g+ylUBB76049?=
	=?iso-8859-15?Q?bYiwEPNlXdQYHKgrnUcsyg+JMXunVp9Qvb8LmT8g6VjtVl9z14IjzE6fC?=
	=?iso-8859-15?Q?PwUmzPbfU8+dUCecyWRt3TfF6bdgJcVtHepcoMbyrWCBrhd5wySCVuJbr?=
	=?iso-8859-15?Q?Ry0/OFlBYeMK9SsNdzkqvx+LuEiFtY3OK5zWhXQYWql3otuqB7Jzd1IYK?=
	=?iso-8859-15?Q?FM1QiECOTW0vyoLWwm4PrhCeR9VbZ/ttKZ0g2sfIHugWEDMoVEDOFWkgL?=
	=?iso-8859-15?Q?dQBvKYv1Y5UPgKFcOV6bi+fXR9L6YFEolVYstNMGHDzbmLZ0OUOcw4pYz?=
	=?iso-8859-15?Q?6DR6qjv8o3VPzJIi8BIleKsyJ0Ayydg8KsMF9Rq0Xlrhvt778Q8ZsJXmg?=
	=?iso-8859-15?Q?0JfLD+hDMd+tsGGxhHWxvvUrlYbtzry2GtCzkBQl/dF4QNfaeJxessAGE?=
	=?iso-8859-15?Q?enV0so2yMLnudXxNd7rIC0DuxElirY5Pw4MUlBX5IP34WYP/nSCVGiAgV?=
	=?iso-8859-15?Q?mXW5pPghsXK91whNbMfcyk0rw+iJ4YKnbB0sbGxgwEJYnJ5GJNAjGppwk?=
	=?iso-8859-15?Q?2aEpNnLUiWImRZRQNTTP+aaKVpPKFCuO8iJMRxrpBAN1FhxpREuZ7Pzjb?=
	=?iso-8859-15?Q?4rFrMVbcn5UObHcSjr38mtuqqDo1cNwl4nmBjhpR+EuKsnT1OhNwIMAcy?=
	=?iso-8859-15?Q?XY9h7mARmA2LGHoikS28fuGgIBGc0E9GhmZC2w99HBN7LjwnEf1Jc6XXc?=
	=?iso-8859-15?Q?FLQnN/KA7e3tEKwtW75KCUiwdggUJrgEGziXN0OrHkLvhiVx5bhY439nH?=
	=?iso-8859-15?Q?/D5fndMqhSALucuz7lXi3C1KKjY4havREsku5mReFXt6sIVtrakQFvIPp?=
	=?iso-8859-15?Q?bZm5xA2EFn9otuz4U7p5ABuTg4ZEjNaLv?=
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a753157e-40c8-4c76-4164-08d98292e5f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2021 15:16:08.3592 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QpyfFPpwtyVIocFT6i5LoyOED9m1UQKLInBGzc7Y9D1HOViNxOo30/+VwocBwfio/AtpNr6w8Nqtumhs/sK+hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2360
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 18SFGap8014730
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <5B1E1EE5CEDB404683C9634B21B18306@eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Tue, 2021-09-28 at 09:42 -0500, David Teigland wrote:
> On Tue, Sep 28, 2021 at 06:34:06AM +0000, Martin Wilck wrote:
> > Hello David and Peter,
> >=20
> > On Mon, 2021-09-27 at 10:38 -0500, David Teigland wrote:
> > > On Mon, Sep 27, 2021 at 12:00:32PM +0200, Peter Rajnoha wrote:
> > > > > - We could use the new lvm-activate-* services to replace the
> > > > > activation
> > > > > generator when lvm.conf event_activation=3D0.=A0 This would be
> > > > > done by
> > > > > simply
> > > > > not creating the event-activation-on file when
> > > > > event_activation=3D0.
> > > >=20
> > > > ...the issue I see here is around the systemd-udev-settle:
> > >=20
> > > Thanks, I have a couple questions about the udev-settle to
> > > understand
> > > that
> > > better, although it seems we may not need it.
> > >=20
> > > > =A0 - the setup where lvm-activate-vgs*.service are always there
> > > > (not
> > > > =A0=A0=A0 generated only on event_activation=3D0 as it was before w=
ith
> > > > the
> > > > =A0=A0=A0 original lvm2-activation-*.service) practically means we
> > > > always
> > > > =A0=A0=A0 make a dependency on systemd-udev-settle.service, which w=
e
> > > > shouldn't
> > > > =A0=A0=A0 do in case we have event_activation=3D1.
> > >=20
> > > Why wouldn't the event_activation=3D1 case want a dependency on
> > > udev-
> > > settle?
> >=20
> > You said it should wait for multipathd, which in turn waits for
> > udev
> > settle. And indeed it makes some sense. After all: the idea was to
> > avoid locking issues or general resource starvation during uevent
> > storms, which typically occur in the coldplug phase, and for which
> > the
> > completion of "udev settle" is the best available indicator.
>=20
> Hi Martin, thanks, you have some interesting details here.
>=20
> Right, the idea is for lvm-activate-vgs-last to wait for other
> services
> like multipath (or anything else that a PV would typically sit on),
> so
> that it will be able to activate as many VGs as it can that are
> present at
> startup.=A0 And we avoid responding to individual coldplug events for
> PVs,
> saving time/effort/etc.
>=20
> > I'm arguing against it (perhaps you want to join in :-), but odds
> > are
> > that it'll disappear sooner or later. Fot the time being, I don't
> > see a
> > good alternative.
>=20
> multipath has more complex udev dependencies, I'll be interested to
> see
> how you manage to reduce those, since I've been reducing/isolating
> our
> udev usage also.

I have pondered this quite a bit, but I can't say I have a concrete
plan.

To avoid depending on "udev settle", multipathd needs to partially
revert to udev-independent device detection. At least during initial
startup, we may encounter multipath maps with members that don't exist
in the udev db, and we need to deal with this situation gracefully. We
currently don't, and it's a tough problem to solve cleanly. Not relying
on udev opens up a Pandora's box wrt WWID determination, for example.
Any such change would without doubt carry a large risk of regressions
in some scenarios, which we wouldn't want to happen in our large
customer's data centers.

I also looked into Lennart's "storage daemon" concept where multipathd
would continue running over the initramfs/rootfs switch, but that would
be yet another step with even higher risk.

>=20
> > The dependency type you have to use depends on what you need. Do
> > you
> > really only depend on udev settle because of multipathd? I don't
> > think
> > so; even without multipath, thousands of PVs being probed
> > simultaneously can bring the performance of parallel pvscans down.
> > That
> > was the original motivation for this discussion, after all. If this
> > is
> > so, you should use both "Wants" and "After". Otherwise, using only
> > "After" might be sufficient.
>=20
> I don't think we really need the settle.=A0 If device nodes for PVs are
> present, then vgchange -aay from lvm-activate-vgs* will see them and
> activate VGs from them, regardless of what udev has or hasn't done
> with
> them yet.

Hm. This would mean that the switch to event-based PV detection could
happen before "udev settle" ends. A coldplug storm of uevents could
create 1000s of PVs in a blink after event-based detection was enabled.
Wouldn't that resurrect the performance issues that you are trying to
fix with this patch set?

>=20
> > > - Reading the udev db: with the default
> > > external_device_info_source=3Dnone
> > > we no longer ask the udev db for any info about devs.=A0 (We now
> > > follow that setting strictly, and only ask udev when
> > > source=3Dudev.)
> >=20
> > This is a different discussion, but if you don't ask udev, how do
> > you
> > determine (reliably, and consistently with other services) whether
> > a
> > given device will be part of a multipath device or a MD Raid
> > member?
>=20
> Firstly, with the new devices file, only the actual md/mpath device
> will
> be in the devices file, the components will not be, so lvm will never
> attempt to look at an md or mpath component device.

I have to look more closely into the devices file and how it's created
and used.=20

> Otherwise, when the devices file is not used,
> md: from reading the md headers from the disk
> mpath: from reading sysfs links and /etc/multipath/wwids

Ugh. Reading sysfs links means that you're indirectly depending on
udev, because udev creates those. It's *more* fragile than calling into
libudev directly, IMO. Using /etc/multipath/wwids is plain wrong in
general. It works only on distros that use "find_multipaths strict",
like RHEL. Not to mention that the path can be customized in
multipath.conf.

>=20
> > In the past, there were issues with either pvscan or blkid (or
> > multipath) failing to open a device while another process had
> > opened it
> > exclusively. I've never understood all the subtleties. See systemd
> > commit 3ebdb81 ("udev: serialize/synchronize block device event
> > handling with file locks").
>=20
> Those locks look like a fine solution if a problem comes up like
> that.
> I suspect the old issues may have been caused by a program using an
> exclusive open when it shouldn't.

Possible. I haven't seen many of these issues recently. Very rarely, I
see reports of a mount command mysteriously, sporadically failing
during boot. It's very hard to figure out why that happens if it does.
I suspect some transient effect of this kind.

>=20
> > After=3Dudev-settle will make sure that you're past a coldplug uevent
> > storm during boot. IMO this is the most important part of the
> > equation.
> > I'd be happy to find a solution for this that doesn't rely on udev
> > settle, but I don't see any.
>=20
> I don't think multipathd is listening to uevents directly?
> =A0 If it were,
> you might use a heuristic to detect a change in uevents (e.g. the
> volume)
> and conclude coldplug is finished.

multipathd does listen to uevents (only "udev" events, not "kernel").
But that doesn't help us on startup. Currently we try hard to start up
after coldplug is finished. multipathd doesn't have a concurrency issue
like LVM2 (at least I hope so; it handles events with just two threads,
a producer and a consumer). The problem is rather that dm devices
survive the initramfs->rootfs switch, while member devices don't (see
above).

Cheers,
Martin


>=20
> Dave
>=20


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

