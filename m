Return-Path: <SRS0=kfxi=LC=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,PDS_BAD_THREAD_QP_64,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6683FC47082
	for <linux-lvm@archiver.kernel.org>; Tue,  8 Jun 2021 12:58:23 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1B3560241
	for <linux-lvm@archiver.kernel.org>; Tue,  8 Jun 2021 12:58:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1B3560241
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-9HOKsnW_M_Snn7UsmqTpyA-1; Tue, 08 Jun 2021 08:58:20 -0400
X-MC-Unique: 9HOKsnW_M_Snn7UsmqTpyA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1ACF1107AD68;
	Tue,  8 Jun 2021 12:58:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FD775D9E2;
	Tue,  8 Jun 2021 12:58:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F20551800BB4;
	Tue,  8 Jun 2021 12:58:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1588QE7K005467 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 8 Jun 2021 04:26:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6D2FE207A6FD; Tue,  8 Jun 2021 08:26:14 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6685C207AD26
	for <linux-lvm@redhat.com>; Tue,  8 Jun 2021 08:26:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A79E090DE21
	for <linux-lvm@redhat.com>; Tue,  8 Jun 2021 08:26:11 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.111.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-122-NCp3vrpsN3Sa4AmEHfM-mw-1;
	Tue, 08 Jun 2021 04:26:09 -0400
X-MC-Unique: NCp3vrpsN3Sa4AmEHfM-mw-1
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur03lp2059.outbound.protection.outlook.com [104.47.10.59])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-16-G1MHHX3dM9i2lThzkojUxA-1; Tue, 08 Jun 2021 10:26:05 +0200
X-MC-Unique: G1MHHX3dM9i2lThzkojUxA-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23;
	Tue, 8 Jun 2021 08:26:03 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::1061:e932:29cc:2a38]) by
	DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::1061:e932:29cc:2a38%7]) with mapi id 15.20.4195.030;
	Tue, 8 Jun 2021 08:26:01 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: "teigland@redhat.com" <teigland@redhat.com>, "linux-lvm@redhat.com"
	<linux-lvm@redhat.com>
Thread-Topic: [linux-lvm] Discussion: performance issue on event activation
	mode
Thread-Index: AQHXWptdVb+iQI7pP06gMwUhQri0uKsHLrMAgAEreYCAALkqgIAAt0YA
Date: Tue, 8 Jun 2021 08:26:01 +0000
Message-ID: <1760ea9715bc7a16d4efe10dd95105d663a07228.camel@suse.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<CAAMCDef6sSy5X2+-WLR3wx5m7dx9bhmN3EKWyPa31SebS=wRGQ@mail.gmail.com>
	<dd395e820a4cf9b5e807e8de1e456786eebd2044.camel@suse.com>
	<20210607213003.GA8181@redhat.com>
In-Reply-To: <20210607213003.GA8181@redhat.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.1
x-originating-ip: [2.206.153.60]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ab054bde-e733-49fb-27a0-08d92a570d0a
x-ms-traffictypediagnostic: DB8PR04MB6555:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB655505FA2BD2CC0D4AF3BC7DFC379@DB8PR04MB6555.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: 1blZy0X5z89qMqb+I8CdV2JWngmEEqosgO6kmKxSRoTRTn3RP1R3xlXfdUgLFbjhmbakkoG3pA0uk7qDI0T7sFCJtuy3gWwCx/sNQ8bN+pcbF2UD7nPZ0nRgQCkatiq5igyu+NblXtNF7vmWarST1MxIgLRsSVn6YN2wkuMy+jfp9G0gPEVV0/gl+lWRNgEKp5PraklwmijjT0EAu6xCCExseHFcrlFxKY8ooFVEu4O6L9ls5Fq7z1dSNmvOcPrszGJimYraaulVzn3abJRZ/xHOI2usf/X2+UvKn7SEY60YSbZ0he7HnYGbjy4DTJy4g4oNZ+xeQmel+brfwxkjRqgaPsyWQkPVQSYCE9LCzD4t3TwZYOZ968HmPyRDsfXJbs3GP0ELOx4h2lvR7XbPwl1i5yesN5+v8awDqPaJlZPYiUDTVyJ7bnEvdSQm/MMjCHAB7jT9/PsfOkCHbQiYZC/UaZ05dsVgA9fntUvhSufwEknJbfStiMlSfXQxn9VWdj8g3xziKb+Q7s+ZG4hhi5P7k1mvVGCm2F7tNobJzWjhjYevET/jjmxAuR/+aLXMWn8h6DkdPjM40vyQ/sR2YsWfyJJDbPw9eE8IH6SMG9E=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(346002)(396003)(136003)(376002)(366004)(39860400002)(8676002)(2616005)(66556008)(83380400001)(66476007)(6512007)(478600001)(44832011)(86362001)(8936002)(91956017)(36756003)(2906002)(316002)(6506007)(26005)(5660300002)(54906003)(66946007)(110136005)(64756008)(66446008)(186003)(122000001)(71200400001)(4326008)(76116006)(38100700002)(6486002);
	DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata: =?iso-8859-15?Q?i5MSq80fTnhtAMJ//7c+i0qH5WDy8wOkrBdNgBKg/y1Z6WDmscAkgXbsw?=
	=?iso-8859-15?Q?yPGJ+QUaPcIBtyoTceF0wyZqEI3XqTliv+XF5fWCZIMbMDDqCL9MqhWXP?=
	=?iso-8859-15?Q?j4BzzbvrU55/pQELM39M63rZD8fZYxg9O+4+oU29k8iYET9r32eiZQNsM?=
	=?iso-8859-15?Q?HpbcqkGnR9lW5nTuYCkTV4YVTQDK8Kw9Hq8fARNGhUuSHJqEeodrZq4Dw?=
	=?iso-8859-15?Q?WzYESf1O7jFTsbsuLCHo9fIV4cbze8p149kI83N4u6aP9WIJhRMzscUkx?=
	=?iso-8859-15?Q?DrdzL/H2E4U4xq/XQdhQqcNUkQ5Dd+7h0jvE9BJieY5qxoR95nLT82/Nm?=
	=?iso-8859-15?Q?DzLKPssy3i+gvAASuo9g0FajZR9CPbsuzDWMi6ZaFZemjv0+7aGWe7UP/?=
	=?iso-8859-15?Q?lamn5RV3jg3PquuXh+XkPVCwO3ftGTlYQ0l/HfnJ6lIVZRLMKRuMWMpFP?=
	=?iso-8859-15?Q?urAnNLlrTr9ypRBpzS2Af0iFyGeKM26AbbIYFls+Vl/Qpd885JHGGQGBA?=
	=?iso-8859-15?Q?obKJ1EfYal4Dihk/5wO9ZhAbg0mdS5LL8vy9WH3AZvDThEMooAi4UN5eN?=
	=?iso-8859-15?Q?D430LbtMksJ2S/GJeGboLyDB8fCIxFiPUg/MtKjs4cqUsfeGMRqMWIAi3?=
	=?iso-8859-15?Q?vl7Szb0kFhsO9gok6VtBuQRe20Dk3ZkkUqqGoq8deKciBszPVeufVE3kv?=
	=?iso-8859-15?Q?bOhzVnE4fzlvaPTt5bFOBVBKPW1OgFTp3EaKuSVbCgKwRQpq/aRc2qp42?=
	=?iso-8859-15?Q?JTLQS07QMorviMnznxHF0dHm7YyZc3YWfgcHu1loF1df2186kfThxN9YX?=
	=?iso-8859-15?Q?UTZf8nv2ki+NdG87bYluQg5tKXwy5Si24HQIyPjJQSnaHO6hsvPDRI/su?=
	=?iso-8859-15?Q?+OXNjKnIeUbZtqBJpA43DovUBkFkQY1LnvUO6ggvcymNmGDNPoJ2eslQA?=
	=?iso-8859-15?Q?wC4d/e14jefjH3RkKfrjjNwrj8O7d4TS364zSv5njzDigXS5v2S3fy3Kj?=
	=?iso-8859-15?Q?jqlZLoXWRk6USJ4UsmzysjCeGnRfKncW/K9y45DsvumDg4AH9aMlqQ6hV?=
	=?iso-8859-15?Q?ONkyPajCiARrYLqtXT18QRsdPuUx6XlUusgSbM1Qm2wiHMJk4uTamBl5v?=
	=?iso-8859-15?Q?tuSB/hZ+oE7WaxTngak95MyAyqms2xN6OnlOhW0mqCcZoPez9Zwhri+wc?=
	=?iso-8859-15?Q?4tzTBKXCJBllp+9D5vDebikfh0g3pAJVZGcFKWDrLfCgYbEi1m3GyuLXb?=
	=?iso-8859-15?Q?1hDpHcX0P+npzU3FeBS63a+qnFh3l3MHkOwk4rhuAnxtRRzYaUcj4XvSG?=
	=?iso-8859-15?Q?lGJiOeN2m0XYeQoi1QsIbOdu8bdltV1yVQ3Iqy0RY0g2zv5RfLwEBBFdU?=
	=?iso-8859-15?Q?n2wVDeL26tx0cfUUafqvHn6QUBIiduquY?=
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab054bde-e733-49fb-27a0-08d92a570d0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2021 08:26:01.8256 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c2zJbTa2RqdING2cuMMOJ/CGpJD4bgLyiHYPib9SCWi6PfVZsAntMTdEkDHghFovUx94+k2NgQOW6iGYv7P7MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6555
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1588QE7K005467
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Tue, 08 Jun 2021 08:58:05 -0400
Cc: "rogerheflin@gmail.com" <rogerheflin@gmail.com>,
	Heming Zhao <heming.zhao@suse.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <0DB8488E4CFABC4680E8C2D7072EB9E0@eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Mo, 2021-06-07 at 16:30 -0500, David Teigland wrote:
> On Mon, Jun 07, 2021 at 10:27:20AM +0000, Martin Wilck wrote:
> > Most importantly, this was about LVM2 scanning of physical volumes.
> > The
> > number of udev workers has very little influence on=A0PV scanning,
> > because the udev rules only activate systemd service. The actual
> > scanning takes place in lvm2-pvscan@.service. And unlike udev,
> > there's
> > no limit for the number of instances of a given systemd service
> > template that can run at any given time.
>=20
> Excessive device scanning has been the historical problem in this area,
> but Heming mentioned dev_cache_scan() specifically as a problem.=A0 That
> was
> surprising to me since it doesn't scan/read devices, it just creates a
> list of device names on the system (either readdir in /dev or udev
> listing.)=A0 If there are still problems with excessive
> scannning/reading,
> we'll need some more diagnosis of what's happening, there could be some
> cases we've missed.

Heming didn't include his measurement results in the initial post.
Here's a small summary. Heming will be able to provide more details.
You'll see that the effects are quite drastic, factors 3-4 between
every step below, factor >60 between best and worst. I'd say these
results are typical for what we observe also on real-world systems.

kvm-qemu, 6 vcpu, 20G memory, 1258 scsi disks, 1015 vg/lv
Shown is "systemd-analyze blame" output.

 1) lvm2 2.03.05 (SUSE SLE15-SP2),
    obtain_device_list_from_udev=3D1 & event_activation=3D1
        9min 51.782s lvm2-pvscan@253:2.service
        9min 51.626s lvm2-pvscan@65:96.service
    (many other lvm2-pvscan@ services follow)
 2) lvm2 latest master
    obtain_device_list_from_udev=3D1 & event_activation=3D1
        2min 6.736s lvm2-pvscan@70:384.service        =20
        2min 6.628s lvm2-pvscan@70:400.service
 3) lvm2 latest master
    obtain_device_list_from_udev=3D0 & event_activation=3D1
            40.589s lvm2-pvscan@131:976.service
            40.589s lvm2-pvscan@131:928.service
 4) lvm2 latest master
    obtain_device_list_from_udev=3D0 & event_activation=3D0,
            21.034s dracut-initqueue.service
             8.674s lvm2-activation-early.service

IIUC, 2) is the effect of _pvscan_aa_quick(). 3) is surprising;
apparently libudev's device detection causes a factor 3 slowdown.
While 40s is not bad, you can see that event based activation still
performs far worse than "serial" device detection lvm2-activation-
early.service.

Personally, I'm sort of wary about obtain_device_list_from_udev=3D0
because I'm uncertain whether it might break multipath/MD detection.
Perhaps you can clarify that.

Regards
Martin



_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

