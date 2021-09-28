Return-Path: <SRS0=Ecxi=OT=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D3EBC433F5
	for <linux-lvm@archiver.kernel.org>; Wed, 29 Sep 2021 06:42:44 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F26B0613A7
	for <linux-lvm@archiver.kernel.org>; Wed, 29 Sep 2021 06:42:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F26B0613A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-47Z5-AzlPtqNDo-jZxxnwQ-1; Wed, 29 Sep 2021 02:42:40 -0400
X-MC-Unique: 47Z5-AzlPtqNDo-jZxxnwQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 678D48015C7;
	Wed, 29 Sep 2021 06:42:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D0F6D19C79;
	Wed, 29 Sep 2021 06:42:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7A2CF1800B9C;
	Wed, 29 Sep 2021 06:42:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18S6YGaA000920 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 28 Sep 2021 02:34:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4EA8320B1DA3; Tue, 28 Sep 2021 06:34:16 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4837E2142F4B
	for <linux-lvm@redhat.com>; Tue, 28 Sep 2021 06:34:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A43AB800B26
	for <linux-lvm@redhat.com>; Tue, 28 Sep 2021 06:34:13 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.109.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-572-Ko1l4OVaNaOTiVq2EmxyzA-1;
	Tue, 28 Sep 2021 02:34:11 -0400
X-MC-Unique: Ko1l4OVaNaOTiVq2EmxyzA-1
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
	(mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-25-68jJga3_OQqQJ19Fp-s_wQ-1; Tue, 28 Sep 2021 08:34:09 +0200
X-MC-Unique: 68jJga3_OQqQJ19Fp-s_wQ-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DBBPR04MB7964.eurprd04.prod.outlook.com (2603:10a6:10:1e9::17)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15;
	Tue, 28 Sep 2021 06:34:07 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::5158:3113:295b:d9c1]) by
	DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::5158:3113:295b:d9c1%5]) with mapi id 15.20.4544.021;
	Tue, 28 Sep 2021 06:34:07 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: "teigland@redhat.com" <teigland@redhat.com>, "prajnoha@redhat.com"
	<prajnoha@redhat.com>
Thread-Topic: [linux-lvm] Discussion: performance issue on event activation
	mode
Thread-Index: AQHXWptdVb+iQI7pP06gMwUhQri0uKsIs+kAgABkm4CAAPX+gIAADzyAgJKTMYCAG6beAIAAXmQAgAD6QwA=
Date: Tue, 28 Sep 2021 06:34:06 +0000
Message-ID: <9947152f39a9c5663abdbe3dfee343556e8d53d7.camel@suse.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<d1d35f7dba3d0e887e7eac06a06ff2414a84c924.camel@suse.com>
	<20210607214835.GB8181@redhat.com>
	<20210608122901.o7nw3v56kt756acu@alatyr-rpi.brq.redhat.com>
	<f6b8c5b6c01ecef842eb711748a765f81b7f04e7.camel@suse.com>
	<20210909194417.GC19437@redhat.com>
	<20210927100032.xczilyd5263b4ohk@alatyr-rpi.brq.redhat.com>
	<20210927153822.GA4779@redhat.com>
In-Reply-To: <20210927153822.GA4779@redhat.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c73c0ccf-2662-4b41-20e9-08d98249f8f1
x-ms-traffictypediagnostic: DBBPR04MB7964:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DBBPR04MB7964BCC20FB3A1B3C0EEDF75FCA89@DBBPR04MB7964.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: YxV/kH7CrUrm8Lcg/RhGi5picYPAkXjl6vxe0hMHijCuOEFzFqij4odMn+srIbIh+1jkAZsGQf9LQOwsmytFIx4jBXcQcuEGoywTTImUjeYeCnfLy7L1oEGIxDpxqBLRw8U1Bg3AkaD/orDU79ipcbZ0AdMe6u0dIPTX/TRlc6hAFr9rmNglUsh3Xv/Bz74LE82GD6fbOJ5OWHjgfg+PIMF/boxSkCOAkP3VTEgKD+snoREieMGQOLLBsbudz9m0DMm8arOye3T4UC+lNTa2oBJjCGTglYNxRfX8JK1ufk2QNJK9xpmA5USHqEKp8/Kmx5vFstVkAZBZtIU+uR5/gy0yvWa+39cAo56ta3whN5jWj5sTfd06VbH7erXCMYgYl0nAoK68Z+sJnG0YUgbV/ndWVeXfCFU1w42g4cwONDiM24TNjWTBtjVFglcbrQyAew14jrRzJcKRcsSarpBFABFrhQ0iD2MnV873ZL7+pDWy/KmejCgOy30bh6OoGXnSxPWgu9YyTjWwqDAgIDRGiu2h/hU04onIHK5QB8PUu6ZG02zUryv3xH0ubJ/wAsarRLguPKNth2OHXAFqworh1SnMvqC5qOzGUFMpOM8U1LUKTHlA7VTyDXL9m1nrILXGevEwkP18x9gs28HU8ZrAu1ETVhsN6vD8smLCjUrGty8TlzMuSR+jDiugK5Tx3aKCC48ASZXbANmxxR7vtuNmA8JXOs0zY0duJFhGstpX9qiLcKwyd55Bgajlk6QXDfJjebszuvv0GIk2Ghm315fdcALyFAYLozCKSBfPQXdcsVw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(186003)(8936002)(2616005)(6512007)(26005)(2906002)(36756003)(83380400001)(71200400001)(6486002)(66446008)(6506007)(4326008)(450100002)(508600001)(316002)(54906003)(38070700005)(66946007)(66476007)(66556008)(44832011)(5660300002)(64756008)(122000001)(91956017)(38100700002)(76116006)(966005)(8676002)(110136005)(86362001);
	DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 9kWWq93prMqiJIykf6V18l6xtxFHIMxAV/KyXxhFDLcymiyjM6a/Oy0dhoDaNrXqPZmVxppTof+uu32OGzE/Grnur3zPH/Ck5+NoxoQeQPB29gH23lil/qIqN87rskFqPyIGxrwXdewrG0/q/ObqyAVvwUPRMuVmCY2YSHkJuGL0tGBnPoQIORiUDCPPG8Mjw6jChTvKh4L3AEboqA/LqkI1+oce+HQNDjnWpH9DKvCZF1zSKc/4vz9l3TUgeKkJfax4hiTB21db9OIeZykKPMSRZTJMaUQFpoI6zM33pqjx6AxoEJSDjGAVQz5EB1NpLc1/rkuE1+WMP3sRm8Lr5AR9Kcux3T6GJWMLgnY+JGD80IdFaUgzr5KA+kd+2SdLteQ9iHChEl/iK83gR8F1W8xYksinNfswkCiGAqF9hClr7SgjImNhbraKpTfhjdgjjaCU5t+Siz/Cuay6o15WlNiO2QNIgntLQvxo+CcRWGRqDTLx19/2gTkS8tIHGx2gPZVAbhfSPyIHUCYKll+Hj2rfdBmySquVIVTwh4DI4MtuhlkvZIPEIBevUIMjIx4Bhuj93/Ti5xiAOi4Blov10tx3LaCXnb+BKgWAl46mLv/zrkGMLsGODStnsAquR+wXQvIAdCd3AEtZuqZOzZReVKhrUr129swS78eQN9ttLh93ux54shFB/l5wzhDHjl1k/1JcCLXvpJmw3DwGwRQwbUV3MI6n+KKGXO2hcSORQzUkvtfbC95hb+uS0y6tHW8E
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c73c0ccf-2662-4b41-20e9-08d98249f8f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2021 06:34:06.9112 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J2H60oLQcxha19OCz58PaYyPDto70hv6IGOCmh0kaT/9UCJK0zggKXnoVpdUzli0hPDK/N4hTWg35QKpDJFcrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7964
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 18S6YGaA000920
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Wed, 29 Sep 2021 02:42:14 -0400
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <888CA5807F8D5447887F9D9F1DC7603E@eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

Hello David and Peter,

On Mon, 2021-09-27 at 10:38 -0500, David Teigland wrote:
> On Mon, Sep 27, 2021 at 12:00:32PM +0200, Peter Rajnoha wrote:
> > > - We could use the new lvm-activate-* services to replace the
> > > activation
> > > generator when lvm.conf event_activation=3D0.=A0 This would be done b=
y
> > > simply
> > > not creating the event-activation-on file when event_activation=3D0.
> >=20
> > ...the issue I see here is around the systemd-udev-settle:
>=20
> Thanks, I have a couple questions about the udev-settle to understand
> that
> better, although it seems we may not need it.
>=20
> > =A0 - the setup where lvm-activate-vgs*.service are always there (not
> > =A0=A0=A0 generated only on event_activation=3D0 as it was before with =
the
> > =A0=A0=A0 original lvm2-activation-*.service) practically means we alwa=
ys
> > =A0=A0=A0 make a dependency on systemd-udev-settle.service, which we
> > shouldn't
> > =A0=A0=A0 do in case we have event_activation=3D1.
>=20
> Why wouldn't the event_activation=3D1 case want a dependency on udev-
> settle?

You said it should wait for multipathd, which in turn waits for udev
settle. And indeed it makes some sense. After all: the idea was to
avoid locking issues or general resource starvation during uevent
storms, which typically occur in the coldplug phase, and for which the
completion of "udev settle" is the best available indicator.

>=20
> > =A0 - If we want to make sure that we run our "non-event-based
> > activation"
> > =A0=A0=A0 after systemd-udev-settle.service, we also need to use
> > =A0=A0=A0 "After=3Dsystemd-udev-settle.service" (the "Wants" will only =
make
> > the
> > =A0=A0=A0 udev settle service executed, but it doesn't order it with
> > respect
> > =A0=A0=A0 to our activation services, so it can happen in parallel - we
> > want
> > =A0=A0=A0 it to happen after the udev settle).
>=20
> So we may not fully benefit from settling unless we use After
> (although
> the benefits are uncertain as mentioned below.)

Side note :You may be aware that the systemd people are deprecating
this service (e.g.
https://github.com/opensvc/multipath-tools/issues/3).=A0
I'm arguing against it (perhaps you want to join in :-), but odds are
that it'll disappear sooner or later. Fot the time being, I don't see a
good alternative.

The dependency type you have to use depends on what you need. Do you
really only depend on udev settle because of multipathd? I don't think
so; even without multipath, thousands of PVs being probed
simultaneously can bring the performance of parallel pvscans down. That
was the original motivation for this discussion, after all. If this is
so, you should use both "Wants" and "After". Otherwise, using only
"After" might be sufficient.

>=20
> > Now the question is whether we really need the systemd-udev-settle
> > at
> > all, even for that non-event-based lvm activation. The udev-settle
> > is
> > just to make sure that all the udev processing and udev db content
> > is
> > complete for all triggered devices. But if we're not reading udev
> > db and
> > we're OK that those devices might be open in parallel to lvm
> > activation
> > period (e.g. because there's blkid scan done on disks/PVs), we
> > should be
> > OK even without that settle. However, we're reading some info from
> > udev db,
> > right? (like the multipath component state etc.)
>=20
> - Reading the udev db: with the default
> external_device_info_source=3Dnone
> =A0 we no longer ask the udev db for any info about devs.=A0 (We now
> follow
> =A0 that setting strictly, and only ask udev when source=3Dudev.)

This is a different discussion, but if you don't ask udev, how do you
determine (reliably, and consistently with other services) whether a
given device will be part of a multipath device or a MD Raid member?

I know well there are arguments both for and against using udev in this
context, but whatever optimizations you implement, they should work
both ways.

> - Concurrent blkid and activation: I can't find an issue with this
> =A0 (couldn't force any interference with some quick tests.)

In the past, there were issues with either pvscan or blkid (or
multipath) failing to open a device while another process had opened it
exclusively. I've never understood all the subtleties. See systemd
commit 3ebdb81 ("udev: serialize/synchronize block device event
handling with file locks").

> - I wonder if After=3Dudev-settle could have an incidental but
> meaningful
> =A0 effect of more PVs being in place before the service runs?

After=3Dudev-settle will make sure that you're past a coldplug uevent
storm during boot. IMO this is the most important part of the equation.
I'd be happy to find a solution for this that doesn't rely on udev
settle, but I don't see any.

Regards
Martin

>=20
> I'll try dropping udev-settle in all cases to see how things look.
>=20
> Dave
>=20


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

