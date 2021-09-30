Return-Path: <SRS0=XKGo=OU=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C5A1C433F5
	for <linux-lvm@archiver.kernel.org>; Thu, 30 Sep 2021 19:36:50 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AEBB61214
	for <linux-lvm@archiver.kernel.org>; Thu, 30 Sep 2021 19:36:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7AEBB61214
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-d8gSLN2iMv--w3SXTOCWsg-1; Thu, 30 Sep 2021 15:36:45 -0400
X-MC-Unique: d8gSLN2iMv--w3SXTOCWsg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDDC584A5E1;
	Thu, 30 Sep 2021 19:36:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD17019C59;
	Thu, 30 Sep 2021 19:36:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 01A2357DC6;
	Thu, 30 Sep 2021 19:36:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18U7phen000746 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 30 Sep 2021 03:51:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 273A120962F8; Thu, 30 Sep 2021 07:51:43 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 19300209A529
	for <linux-lvm@redhat.com>; Thu, 30 Sep 2021 07:51:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74A97833966
	for <linux-lvm@redhat.com>; Thu, 30 Sep 2021 07:51:14 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.111.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-586-Dx-agHkIPnGwV-xWEIpiXA-1;
	Thu, 30 Sep 2021 03:51:12 -0400
X-MC-Unique: Dx-agHkIPnGwV-xWEIpiXA-1
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
	(mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-6-D57YR5TBP22fsyJRB0DucA-1; Thu, 30 Sep 2021 09:51:09 +0200
X-MC-Unique: D57YR5TBP22fsyJRB0DucA-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB6PR0402MB2743.eurprd04.prod.outlook.com (2603:10a6:4:95::8) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18;
	Thu, 30 Sep 2021 07:51:08 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::5158:3113:295b:d9c1]) by
	DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::5158:3113:295b:d9c1%5]) with mapi id 15.20.4566.015;
	Thu, 30 Sep 2021 07:51:08 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>, "prajnoha@redhat.com"
	<prajnoha@redhat.com>
Thread-Topic: [linux-lvm] Discussion: performance issue on event activation
	mode
Thread-Index: AQHXWptdVb+iQI7pP06gMwUhQri0uKsIs+kAgABkm4CAAPX+gIAADzyAgJKTMYCAG6beAIAAXmQAgAD6QwCAAIiSAIAACUiAgAAo+QCAAdwggIAAoz0A
Date: Thu, 30 Sep 2021 07:51:08 +0000
Message-ID: <e8459ca73b148e9ba20cbde0041f6e5f4093699d.camel@suse.com>
References: <20210607214835.GB8181@redhat.com>
	<20210608122901.o7nw3v56kt756acu@alatyr-rpi.brq.redhat.com>
	<f6b8c5b6c01ecef842eb711748a765f81b7f04e7.camel@suse.com>
	<20210909194417.GC19437@redhat.com>
	<20210927100032.xczilyd5263b4ohk@alatyr-rpi.brq.redhat.com>
	<20210927153822.GA4779@redhat.com>
	<9947152f39a9c5663abdbe3dfee343556e8d53d7.camel@suse.com>
	<20210928144254.GC11549@redhat.com>
	<138b7ddb721b6a58df8f0401b76c7975678f0dda.camel@suse.com>
	<20210928174246.GF3087@octiron.msp.redhat.com>
	<20210929220653.p45cvgzdhlbnp4gy@alatyr-rpi.brq.redhat.com>
In-Reply-To: <20210929220653.p45cvgzdhlbnp4gy@alatyr-rpi.brq.redhat.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 97e41ca0-b333-4a78-1aba-08d983e71075
x-ms-traffictypediagnostic: DB6PR0402MB2743:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0402MB27434EB7744CC06DDDE882C7FCAA9@DB6PR0402MB2743.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: 3HqqzcrkMRQomstGo1icEiJP4s0fFbnF5jlbtMF24HoifMm5RDUVu302IFZYzC2J759hAOGiy7ZP5HW9Jj4kwNvH6dRFhk37CA/b2/e3PzXH2vZD8KfHYTCCNJwyDQSGM/lpqOx7/D8kGaZJG2uFCRyj0SRmy5LpnCVDuUmBpCPcE4RfrnTgwGltWcyJT9q1+bAsTEz3fSB6oU/pjiW9bRm+ge11P+I9IwBiBmoUpjItxOdfIgyjA7RIbKlFvd/1ZRkU0IGiw3WDrfnK/utc7UsQdYbXmOvkV8z+4Xu7cRSL4v/7yl38Q4x7+k9vN40Vzp/8r3rtbvO3AbjtaY0tWQYeFCrA0FzrtJHcPOqiOk4ZT98UxqTK9BScenYahbHnSAsoywfO6ZMrLeaEV/DL3ctwEyFKTgrCo2eW9og4i4bjFFaPfLK4/X8rVbZ1LfXw80E101h22oKCjyKfq6t87yCoQdDKgdZMOZFnyHvspuvaWJJLMdLdQxr5rWGYvsOBK/1paH+xKJpoTPQ5bbOrC/bNoZgpnnfA2yGOuJn3Tqrw8l7Cw78+rQdZ6wBQ24WLp0B8QCUSTncJvJjjhMC+KcE2ulNT/BKXoBcHFF1kB0e3RgrRmU6h6Z8ns0Ir6auJ+SH/cpCTUdw4xzv8rvbgIUwWNPy5ZSDaqg99oJ8lGJnoBKsOnRV2/td29EVxhFhEgnPCUqLA0BT0MjBAe8eH5Zd8YTpw5eusAPzZu0JsAEwd6BvoxV89JFcCzqEtJbRd1Nwffl1tvRCGSfbcaPvDGC/1F+bvUQCXRBH43WSPVdQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(122000001)(6506007)(38100700002)(6512007)(966005)(44832011)(66556008)(508600001)(83380400001)(2616005)(64756008)(66446008)(36756003)(2906002)(66476007)(86362001)(26005)(91956017)(76116006)(38070700005)(186003)(8676002)(316002)(4326008)(6486002)(8936002)(54906003)(66946007)(71200400001)(110136005)(5660300002)(450100002);
	DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-15?Q?KFjkjar0D2XT8xDP8usmaBnbkW9f4cD15N+nnF+uu7NyRVRmWaw2jaowh?=
	=?iso-8859-15?Q?OR1LqsSVbGQb9FosBVDr805Axt9yA6m+O8H2MTbGU0RX2DSmzUK+80Glq?=
	=?iso-8859-15?Q?+eYx0XKWIlTtpa7j1MvsjOELqCv55gACckqErUkB+1ltZ1IbiUpzsYc0f?=
	=?iso-8859-15?Q?ickP9OSLe6wyo7fwHI/sVEoKpaxuFDqa72p/Skok1cJJW3zMTdQDi/kLi?=
	=?iso-8859-15?Q?Vvrq6+wvuIwxquRrNIrbQ9+1BDjxb2PDixH21ShEORe6eCeg6Xpak4l+U?=
	=?iso-8859-15?Q?HxPg/oRaOPsxVCsY7WYfjdo1bY7qyRUiJc+k8fhFLEskBm3PX4L4n72Q/?=
	=?iso-8859-15?Q?yjh9EdmAzZPRYL5VHP0Aj6IKGyKVa0Ka8OksEcPbGfWmYsvMm2MlYqbvC?=
	=?iso-8859-15?Q?uTbbVgEChnIlk49T3azflJmzyEPiGfHsaf2OkCZHR22VwrXgCVTiXqnJa?=
	=?iso-8859-15?Q?nG6eFFlJV0rRR2eHOnMf+ftN0zIiQTIccRWgG/j30qTeaL5tH25pDzScP?=
	=?iso-8859-15?Q?SCtAXKIo90YmYH9dHRP+man3KPXt06SUBdpO44Uo2vaCTF8C7Qn1HhOAv?=
	=?iso-8859-15?Q?D5Wd3ZfKhVdgav4dNZXJH6LTbXDjpJKP7OdZWuH/cuWEzpQv4F4NTwQo9?=
	=?iso-8859-15?Q?gHq4fy0F3LmmYTaT3/kKFyIUmkV44wRmPmjG/LVhAnOup6SqA77GzNnF5?=
	=?iso-8859-15?Q?srR3kU//jgchAtLJNNMmb3XVQv4QY4uNmDKjIZwTtXgvIXBy2iI8BQpel?=
	=?iso-8859-15?Q?p1KQIyEkjFW6/cBStcSaHIlnUYwkOa35LyCpOuwNBWMYBa/Q6jNDIGK2Z?=
	=?iso-8859-15?Q?Lc3vUg5ZzWO+I+s50t3m36V49nwfSulvu6aROJ4rLdgtyWnqh+W5L/2Ik?=
	=?iso-8859-15?Q?weVCJHTX+u2K+l1XWm+nvrP5Ezdpv2uDOtPNr4GbCDCFcm/M+2LP3ziNa?=
	=?iso-8859-15?Q?DZ2ACdnpGc0+pPT5usgsk51P9Hy7yqbzyCilWNlnNPOKYBttj4UYH4ZkR?=
	=?iso-8859-15?Q?JirpiAF7fIFLRYkODlOt7xrwmAWFJvNY4kXRf6FgStMDG4zaGdKoNjlQ4?=
	=?iso-8859-15?Q?E5bfLrYYv5tzpWtzfIbd2GOM6g3hvJdpGEha2BxqKp0VKNZQ6RT+xuPca?=
	=?iso-8859-15?Q?ZBikuokMW4S86rdjLje06P4zUewrcXXdRBX6Xm6XGb+w7x28+s0bAh3X9?=
	=?iso-8859-15?Q?u31Mvnb+1HF1i2oJEJnPUZXKy5O9vSyF8znim3WtRcC2GhqbAosDN8S71?=
	=?iso-8859-15?Q?XK1IO6SvUsL8ayjeCeEcEu/ZK63JlUQweQFCBvAhoHVqwz5vbjvcUT4ox?=
	=?iso-8859-15?Q?49fVcY5RfMuBFakdnu68+GXZcF6BzhwFLteyX1d10KT1wSznRMvLAVK9E?=
	=?iso-8859-15?Q?MrEyaMa5BcRIVGtLSWZz0k7Sdl44y1w0K?=
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97e41ca0-b333-4a78-1aba-08d983e71075
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2021 07:51:08.5700 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CJ+arMaln8be0PXDERzhn/LSNvk7dQ1j5QPA0GiH3V1VyRW9QF1W5p/0jGEO3pvezW0HEsz+mqQBdTDAD6gmOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2743
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 18U7phen000746
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Thu, 30 Sep 2021 15:03:51 -0400
Cc: "zkabelac@redhat.com" <zkabelac@redhat.com>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <E2BDCB7E4F3B1346AF9CA7822CDAAF10@eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Thu, 2021-09-30 at 00:06 +0200, Peter Rajnoha wrote:
> On Tue 28 Sep 2021 12:42, Benjamin Marzinski wrote:
> > On Tue, Sep 28, 2021 at 03:16:08PM +0000, Martin Wilck wrote:
> > > I have pondered this quite a bit, but I can't say I have a
> > > concrete
> > > plan.
> > >=20
> > > To avoid depending on "udev settle", multipathd needs to
> > > partially
> > > revert to udev-independent device detection. At least during
> > > initial
> > > startup, we may encounter multipath maps with members that don't
> > > exist
> > > in the udev db, and we need to deal with this situation
> > > gracefully. We
> > > currently don't, and it's a tough problem to solve cleanly. Not
> > > relying
> > > on udev opens up a Pandora's box wrt WWID determination, for
> > > example.
> > > Any such change would without doubt carry a large risk of
> > > regressions
> > > in some scenarios, which we wouldn't want to happen in our large
> > > customer's data centers.
> >=20
> > I'm not actually sure that it's as bad as all that. We just may
> > need a
> > way for multipathd to detect if the coldplug has happened.=A0 I'm
> > sure if
> > we say we need it to remove the udev settle, we can get some method
> > to
> > check this. Perhaps there is one already, that I don't know about.
> > If
>=20
> The coldplug events are synthesized and as such, they all now contain
> SYNTH_UUID=3D<UUID> key-value pair with kernel>=3D4.13:
>=20
> =A0
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/ABI/testing/sysfs-uevent
>=20
> I've already tried to proposee a patch for systemd/udev that would
> mark
> all uevents coming from the trigger (including the one used at boot
> for
> coldplug) with an extra key-value pair that we could easily match in
> rules,
> but that was not accepted. So right now, we could detect that
> synthesized uevent happened, though we can't be sure it was the
> actual
> udev trigger at boot. For that, we'd need the extra marks. I can give
> it
> another try though, maybe if there are more people asking for this
> functionality, we'll be at better position for this to be accepted.

That would allow us to discern synthetic events, but I'm unsure how
this what help us. Here, what matters is to figure out when we don't
expect any more of them to arrive.

I guess it would be possible to compare the list of (interesting)
devices in sysfs with the list of devices in the udev db. For
multipathd, we could

 - scan set U of udev devices on startup
 - scan set S of sysfs devices on startup
 - listen for uevents for updating both S and U
 - after each uevent, check if the difference set of S and U is emtpy
 - if yes, coldplug has finished
 - otherwise, continue waiting, possibly until some timeout expires.

It's more difficult for LVM because you have no daemon maintaining
state.

Martin





>=20


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

