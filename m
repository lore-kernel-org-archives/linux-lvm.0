Return-Path: <SRS0=H9S0=OD=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A4C4C433EF
	for <linux-lvm@archiver.kernel.org>; Mon, 13 Sep 2021 06:39:58 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B02F60F92
	for <linux-lvm@archiver.kernel.org>; Mon, 13 Sep 2021 06:39:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B02F60F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-5EB_fo9JN6ifYGA5ihHjow-1; Mon, 13 Sep 2021 02:39:54 -0400
X-MC-Unique: 5EB_fo9JN6ifYGA5ihHjow-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 638F184A5E7;
	Mon, 13 Sep 2021 06:39:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DABFF2B399;
	Mon, 13 Sep 2021 06:39:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D004A1800B8B;
	Mon, 13 Sep 2021 06:39:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18AHcs6p012938 for <linux-lvm@listman.util.phx.redhat.com>;
	Fri, 10 Sep 2021 13:38:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E4E40119D32B; Fri, 10 Sep 2021 17:38:53 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E0130119D34E
	for <linux-lvm@redhat.com>; Fri, 10 Sep 2021 17:38:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC0B2811E80
	for <linux-lvm@redhat.com>; Fri, 10 Sep 2021 17:38:49 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.111.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-221-O3PUcl9dNju9XVmwQxU_Dw-1;
	Fri, 10 Sep 2021 13:38:48 -0400
X-MC-Unique: O3PUcl9dNju9XVmwQxU_Dw-1
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
	(mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-40-7KsPwzbDPl-eMMxRoyIpQg-1; Fri, 10 Sep 2021 19:38:46 +0200
X-MC-Unique: 7KsPwzbDPl-eMMxRoyIpQg-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB6PR0402MB2744.eurprd04.prod.outlook.com (2603:10a6:4:94::22)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14;
	Fri, 10 Sep 2021 17:38:45 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::5158:3113:295b:d9c1]) by
	DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::5158:3113:295b:d9c1%5]) with mapi id 15.20.4500.015;
	Fri, 10 Sep 2021 17:38:45 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: Heming Zhao <heming.zhao@suse.com>, "teigland@redhat.com"
	<teigland@redhat.com>, "linux-lvm@redhat.com" <linux-lvm@redhat.com>
Thread-Topic: [linux-lvm] Discussion: performance issue on event activation
	mode
Thread-Index: AQHXWptdVb+iQI7pP06gMwUhQri0uKsIs+kAgABkm4CAAPX+gIAADzyAgJKTMYCAAW9BAA==
Date: Fri, 10 Sep 2021 17:38:45 +0000
Message-ID: <d8c83a7f4368a9eb466fe78c98b5181ab9e80644.camel@suse.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<d1d35f7dba3d0e887e7eac06a06ff2414a84c924.camel@suse.com>
	<20210607214835.GB8181@redhat.com>
	<20210608122901.o7nw3v56kt756acu@alatyr-rpi.brq.redhat.com>
	<f6b8c5b6c01ecef842eb711748a765f81b7f04e7.camel@suse.com>
	<20210909194417.GC19437@redhat.com>
In-Reply-To: <20210909194417.GC19437@redhat.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 401486f9-2cde-4277-2a4c-08d97481d6c5
x-ms-traffictypediagnostic: DB6PR0402MB2744:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0402MB274410BBE77DA4A4D170099DFCD69@DB6PR0402MB2744.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: YWMjDjtdG3jx9bqt+X799nDVZ1IA3ltTsJ8yKDmAgBYoG57NxV0jxjkygv6zZ+4iPy+17lEJoBEh/Ns3Jhtue3NgcTg5+RkDnXSKWZLWaNqdui4UhIBF5B04192+0Psuxd3vzVcDHY4K6MBXgXHpwfACwzfpAGJuVIKyJYs8E71beBEZc0yWCLG5Dk7Mx7lSuv3EC+K/JBpOtIE0gVPFv4orwxS7m9TaZjtTVwgwZ22YkpuSpHDERUzemEaiQkNbY8A/6mghTdxYJ/lC8S0siOqrUpK5G5y3pZkExsBBdbIAgMiXcbqSu+78la0chSxrH+tlw62QvHj7HvbOipZuMlqJPfIaApNuFvVJ54aubdrcwHBShNlYwAarrfXencpFjN3V/Yu7Bvk52X5VXotZIsNS1ZogP6YmiXA1wtyMssHnSA2dWn9li6qSkX5ijpArz7+rt6Wdt2XZQmsoYQ/u3jAgB50v8GYUG3n9dtQmHDzH4CPycJffA8OWo+vqMUHYfZT8Zl7PLS6X1EpGi7g4gQiFST4bTwzzN6lW5BN/m3t5nD8GBhRzOFDj3XCZrc5KJyfhISSheyMTQ3rIvFoSRlrdY11r0I0TGs0fr1e3hoE173TmbktY6bYjNZzTiJ5GbVtrKs5tFi54197NEXs7+ZIAjleHHcCATdxiRlPR1o5zmBCnGg3ShDVZpbpHVZvOggqC5oBol5++fdHE8AfO/6O/7+J6ns8zmdcOPsU5JhWQyLfLVR0CHZjosN77Jk1QXLh1WGhYV2rYnekPYNaAlpw4tFx3FVP9BeA4kVJg5ZM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(396003)(346002)(39860400002)(136003)(376002)(8676002)(44832011)(450100002)(86362001)(26005)(186003)(316002)(5660300002)(4326008)(66446008)(478600001)(71200400001)(2906002)(2616005)(36756003)(6506007)(64756008)(66556008)(76116006)(66476007)(8936002)(66946007)(91956017)(110136005)(122000001)(38100700002)(38070700005)(6486002)(83380400001)(54906003)(6512007)(966005);
	DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-15?Q?GDhSfVmMUhqs+KIdwsQ56IzFLygehjRAvOYyFQsfGesKS1GcgJnXQoE+b?=
	=?iso-8859-15?Q?0AoYXL1s4s62h7/X7HAFKLlsc15kH/jHHERek/W7pwDzDdl0RKp1MCU/o?=
	=?iso-8859-15?Q?EX2cfa+O2Fog4OMVbOGA7/Y5E6EoMD5jpz6tQf9nxikllYoARnT0LyX5/?=
	=?iso-8859-15?Q?5ByEFERn2uJDCLOFB/8vEcrdaRI33Bp/VwKnSZ+tuiROyFChG8u3IZJty?=
	=?iso-8859-15?Q?sSfytDaDzgjH42jSrwwdCHmqfudq660mv9NM1BR/Pfwj2nJvQ7rW3spR5?=
	=?iso-8859-15?Q?DogeHBlyRXaBLkfp9rO0xp6wIv0xBU2hioE5BCSb2PO6vAfq2BG3jfIKp?=
	=?iso-8859-15?Q?2ILA+o589Yks0essXwNEqcXwXCv+5sRhb9S4jUCcZ4+DRi0RhbwPw3iNM?=
	=?iso-8859-15?Q?HdawPzNoZCgqll/vELRgyUy9DORDJee4pIavG7454HgtWLTyG4tJfGbZU?=
	=?iso-8859-15?Q?nxuvqVhWfAS/eh0Z7NHzxi/qdND5SowgKy9eDDH1rAy/vl3zsAwLITcBN?=
	=?iso-8859-15?Q?B7DsiJ5PXoCX9vqWt6wWFNf9XyYxmxuHmT0qwfVtQ//VxozCBJchz+vLX?=
	=?iso-8859-15?Q?OyNsP4Bf1/8hiC0yHHwZ21+2lk7/Btnnxf5fqsceHkqfZhQv98nR+gr0M?=
	=?iso-8859-15?Q?+AyQ8bQwGdV1Zh+Kqvp4C1VJlMEOImTGz6eU6SHGoo8QxeTZEhZx121Wv?=
	=?iso-8859-15?Q?UqIVM7l5i/TDAiZYOESSunA610UzfSCbqjUtygKAZPLdZkcZxpIwJlHjN?=
	=?iso-8859-15?Q?ULffUImeJm4eGzV6PvuYa+iwLJMknUcUDF9kr55Gi8m/3JcaXaiCw+IxQ?=
	=?iso-8859-15?Q?ly0vHG2zdWyJvtFxfyQb5l3Zrehda7oIcQIsnMIhvlVMcVX5ZA5Jhm/eA?=
	=?iso-8859-15?Q?BPPOxugP++PWhipYKrj0OGJFBHYXheV1T3lAAPIMMTzhVFVLFhrdZWHEz?=
	=?iso-8859-15?Q?gw9Vy9kfzfz88ZGQAkec1tzRDWjH0iHLA8ODBF7FEhdHQUJt4ShZn+xzp?=
	=?iso-8859-15?Q?hElIu0/yiTArwFeOcilqtx6yGrRjiiqRV5KxYvRYWtLnc0arSA8rhyKIW?=
	=?iso-8859-15?Q?2DiulEoClOKrBiv6nv2mil1ORSC6X9nvTIFQAX9roD6fVW/pIVBMNqoyV?=
	=?iso-8859-15?Q?CnLOw9eNUd/BzgqBK4w3TUH+fdZb5PipKHQhFS7f7PSwFYUAZUTJNhlL8?=
	=?iso-8859-15?Q?E4tGko/gUNF+vNXA98HOW/lNvjy4hmqMnt0ZbO9G3Ha8kKk4hTC6t/C2A?=
	=?iso-8859-15?Q?hITvTf8NI9z6iypYMd3xP/WgBsmz1+tipcdVKTrxTyUUavqdR7fL0dKQY?=
	=?iso-8859-15?Q?CDQMbOoBTdtyNjDb68aAUBDZes1KU8X/S+Is/+bH9ioII+eTkqNK5OgEx?=
	=?iso-8859-15?Q?lUfuuZl4DFGBOkm7BmET14uUqFZr0hbBA?=
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 401486f9-2cde-4277-2a4c-08d97481d6c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2021 17:38:45.1185 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dld/Xnwv/+EM5YUP28Zwnzhtm5dgKJEE2PUWV/gynSJAIKFwZNhitDJmRjcqFyRXEZsB6bDDP5M1850WRVkthw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2744
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 18AHcs6p012938
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Mon, 13 Sep 2021 02:39:33 -0400
Cc: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"prajnoha@redhat.com" <prajnoha@redhat.com>,
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
Content-ID: <A263630435979F469889AE282C63032A@eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Thu, 2021-09-09 at 14:44 -0500, David Teigland wrote:
> On Tue, Jun 08, 2021 at 01:23:33PM +0000, Martin Wilck wrote:
> > On Di, 2021-06-08 at 14:29 +0200, Peter Rajnoha wrote:
> > > On Mon 07 Jun 2021 16:48, David Teigland wrote:
> > > >=20
> > > > If there are say 1000 PVs already present on the system, there
> > > > could be
> > > > real savings in having one lvm command process all 1000, and
> > > > then
> > > > switch
> > > > over to processing uevents for any further devices afterward.=A0
> > > > The
> > > > switch
> > > > over would be delicate because of the obvious races involved
> > > > with
> > > > new devs
> > > > appearing, but probably feasible.
> > >=20
> > > Maybe to avoid the race, we could possibly write the proposed
> > > "/run/lvm2/boot-finished" right before we initiate scanning in
> > > "vgchange
> > > -aay" that is a part of the lvm2-activation-net.service (the last
> > > service to do the direct activation).
> > >=20
> > > A few event-based pvscans could fire during the window between
> > > "scan initiated phase" in lvm2-activation-net.service's
> > > "ExecStart=3Dvgchange -aay..."
> > > and the originally proposed "ExecStartPost=3D/bin/touch
> > > /run/lvm2/boot-
> > > finished",
> > > but I think still better than missing important uevents
> > > completely in
> > > this window.
> >=20
> > That sounds reasonable. I was thinking along similar lines. Note
> > that
> > in the case where we had problems lately, all actual activation
> > (and
> > slowness) happened in lvm2-activation-early.service.
>=20
> I've implemented a solution like this and would like any thoughts,
> improvements, or testing to verify it can help:
> https://sourceware.org/git/?p=3Dlvm2.git;a=3Dshortlog;h=3Drefs/heads/dev-=
dct-activation-switch-1
>=20
> I've taken some direction from the lvm activation generator, but
> there are
> details of that I'm not too familiar with, so I may be missing
> something
> (in particular it has three activation points but I'm showing two
> below.)
> This new method would probably let us drop the activation-generator,
> since
> we could easily configure an equivalent using this new method.
>=20
> Here's how it works:
>=20
> uevents for PVs run pvscan with the new option --eventactivation
> check.
> This makes pvscan check if the /run/lvm/event-activation-on file
> exists.
> If not, pvscan does nothing.
>=20
> lvm-activate-vgs-main.service
> . always runs (not generated)
> . does not wait for other virtual block device systems to start
> . runs vgchange -aay to activate any VGs already present
>=20
> lvm-activate-vgs-last.service
> . always runs (not generated)
> . runs after other systems, like multipathd, have started (we want it
> =A0 to find as many VGs to activate as possible)
> . runs vgchange -aay --eventactivation enable
> . the --eventactivation enable creates /run/lvm/event-activation-on,
> =A0 which enables the traditional pvscan activations from uevents.
> . this vgchange also creates pv online files for existing PVs.
> =A0 (Future pvscans will need the online files to know when VGs are
> =A0 completed, i.e. for VGs that are partially complete at the point
> =A0 of switching to event based actvivation.)
>=20
> uevents for PVs continue to run pvscan with the new option
> --eventactivation check, but the check now sees the event-activation-
> on
> temp file, so they will do activation as they have before.
>=20
> Notes:
>=20
> - To avoid missing VGs during the transition to event-based, the
> vgchange
> in lvm-activate-vgs-last will create event-activation-on before doing
> anything else.=A0 This means for a period of time both vgchange and
> pvscan
> may attempt to activate the same VG.=A0 These commits use the existing
> mechanism to resolve this (the --vgonline option and
> /run/lvm/vgs_online).
>=20
> - We could use the new lvm-activate-* services to replace the
> activation
> generator when lvm.conf event_activation=3D0.=A0 This would be done by
> simply
> not creating the event-activation-on file when event_activation=3D0.
>=20
> - To do the reverse, and use only event based activation without any
> lvm-activate-vgs services, a new lvm.conf setting could be used, e.g.
> event_activation_switch=3D0 and disabling lvm-activate-vgs services.

This last idea sounds awkward to me. But the rest is very nice.=A0
Heming, do you agree we should give it a try?

Thanks,
Martin


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

