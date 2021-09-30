Return-Path: <SRS0=XKGo=OU=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4FE8C4332F
	for <linux-lvm@archiver.kernel.org>; Thu, 30 Sep 2021 19:36:50 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40A1961214
	for <linux-lvm@archiver.kernel.org>; Thu, 30 Sep 2021 19:36:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 40A1961214
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-5X2xplRcPOSVQtHCnO78BQ-1; Thu, 30 Sep 2021 15:36:45 -0400
X-MC-Unique: 5X2xplRcPOSVQtHCnO78BQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EE591006AA3;
	Thu, 30 Sep 2021 19:36:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA7FF10023AE;
	Thu, 30 Sep 2021 19:36:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0FE681832DDF;
	Thu, 30 Sep 2021 19:36:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18U7MYOM031477 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 30 Sep 2021 03:22:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A9E0620285B6; Thu, 30 Sep 2021 07:22:34 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A314A200BFCA
	for <linux-lvm@redhat.com>; Thu, 30 Sep 2021 07:22:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 856F080B90A
	for <linux-lvm@redhat.com>; Thu, 30 Sep 2021 07:22:34 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.111.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-355-pprn03S1M06yLBFz_QNmFQ-1;
	Thu, 30 Sep 2021 03:22:32 -0400
X-MC-Unique: pprn03S1M06yLBFz_QNmFQ-1
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur03lp2055.outbound.protection.outlook.com [104.47.10.55])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-14-rj7d9d9IPZO6KjrzdRQ-7g-1; Thu, 30 Sep 2021 09:22:30 +0200
X-MC-Unique: rj7d9d9IPZO6KjrzdRQ-7g-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB9PR04MB8348.eurprd04.prod.outlook.com (2603:10a6:10:25c::7) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15;
	Thu, 30 Sep 2021 07:22:29 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::5158:3113:295b:d9c1]) by
	DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::5158:3113:295b:d9c1%5]) with mapi id 15.20.4566.015;
	Thu, 30 Sep 2021 07:22:29 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: "teigland@redhat.com" <teigland@redhat.com>, "prajnoha@redhat.com"
	<prajnoha@redhat.com>
Thread-Topic: [linux-lvm] Discussion: performance issue on event activation
	mode
Thread-Index: AQHXWptdVb+iQI7pP06gMwUhQri0uKsIs+kAgABkm4CAAPX+gIAADzyAgJKTMYCAG6beAIAAXmQAgAOJqgCAAKLHAA==
Date: Thu, 30 Sep 2021 07:22:29 +0000
Message-ID: <700af71c5293946105c779dbf9e8cd95344fc7af.camel@suse.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<d1d35f7dba3d0e887e7eac06a06ff2414a84c924.camel@suse.com>
	<20210607214835.GB8181@redhat.com>
	<20210608122901.o7nw3v56kt756acu@alatyr-rpi.brq.redhat.com>
	<f6b8c5b6c01ecef842eb711748a765f81b7f04e7.camel@suse.com>
	<20210909194417.GC19437@redhat.com>
	<20210927100032.xczilyd5263b4ohk@alatyr-rpi.brq.redhat.com>
	<20210927153822.GA4779@redhat.com>
	<20210929213952.ws2qpmedaajs5wlx@alatyr-rpi.brq.redhat.com>
In-Reply-To: <20210929213952.ws2qpmedaajs5wlx@alatyr-rpi.brq.redhat.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7617b86e-4f39-4881-0a9c-08d983e30fb6
x-ms-traffictypediagnostic: DB9PR04MB8348:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB9PR04MB8348A669BAF96A9AE9BA6F30FCAA9@DB9PR04MB8348.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: g+0DAgPde8RkYa8O0q6EAyncQNpmCoqSFFC+LwO6m7/4vlqQXeOcWeWfGCvlXfXJzCJ1xzUZ9KKx4IbmNMvvmbB8tHXDqYBYtOSVtZ15Tf99Ih/a/v/vcWPT5hekqroniYSZZQIHEBPfAXN2RnjT07Q8TnGqutjwLtrNp0vtISflwbWq8blug+Gj3RTyOJz/dGgwL6I5n6J75N7p59xOj1qs9AAk3F7jb4BIPqw6MCUyqaG+fuTBaGN4RSFpuO15DuttefTNyQErjA7FdwjdMkQP3G5SYlPkdyaJWMpIfC/FZqok7bKNwOUv85BXCp+CxLFWz9vkePpop8/IF7bEolVJ/0VTshrJ3Ts1O33hdEkg8U/jtWIa7lLlpoTbP8kT4hh4DwOIQvtSmTuIXjLu/OS5Ddv3U3iG7BZReDAxLVl+JdZYIVtVEVh79OyebQAzrFGLMC125IT40bs4qghs4dXMAv2CkcbD67YV0ROI8j/l4OaqFrVOMF56rF8j2i0B6qiADNF1Qpid5sJ71Olcb+1gNCaA6XLmvdHzvA6DGuaosYU3G1xsRsIKor37iMXnP9Y1i28XSNr80jufrypqpgSeOzVidzqr8LHWiDW+TPQvFZ943HZezkgcRcZrlLbzEosQEhIkiXMKD6kwCzKH0uE5Zobo7syG/1iCxSYGYueU14LGrxh4y1wexVelwBrGVGb+FDdUUN67VCwKovvd2Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(66946007)(38070700005)(66446008)(64756008)(66556008)(316002)(450100002)(91956017)(54906003)(110136005)(4326008)(86362001)(8676002)(8936002)(66476007)(76116006)(38100700002)(71200400001)(6512007)(6506007)(26005)(186003)(2616005)(5660300002)(508600001)(36756003)(2906002)(83380400001)(44832011)(6486002)(122000001);
	DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-15?Q?eZTZUM2lYc20kuFukCrEWMJEOZkmhSMgzwk6eCfLdXJK4aQ6CnbtKOgAQ?=
	=?iso-8859-15?Q?3RBJhXziKLPm1knKdIpm0vyCiL2ZLnF4jLSArP1TQWgAK7A5dFl64/jrm?=
	=?iso-8859-15?Q?Ny9FGdAnNwYp4IfF7F3SCvbhmsBpiiE3HD9s9pcVA+UGTdMiQYRZ+x0uS?=
	=?iso-8859-15?Q?dSzFptKDHaU48exJT8nlmTeH8xM1iQYOTHYkSkWvIqViVLn6VYTr7ji6C?=
	=?iso-8859-15?Q?WETyWbqVMCxnj5qaFUvHsGNCbysUR0Vl10R1nwDWWKmmgipPDOCVW6rEH?=
	=?iso-8859-15?Q?C7u/vS1ju+wa1Ff8YmvwPyUuTUgXxWcX8BBf31AQZ1V7+nlGGgzYz8iDG?=
	=?iso-8859-15?Q?qYi96Iry5RYHXjb5yrKF8ra1abgvkztQesVC38HpPoqZ2CjEsZnxzzzFw?=
	=?iso-8859-15?Q?fuvNc7CKtZEN0LTSTYX3TBQsAw+8uG7aqx7ybfYLU9QaN3rs7oFRbvc05?=
	=?iso-8859-15?Q?hK0zj1NyMlJvqJr1Kfua/FAEHI8/8LyRYLTgPqL6kIjr/vASZkfMsxgC4?=
	=?iso-8859-15?Q?dKuRJUF3irRVCaU4/XJh/9jq4OxMrykDNfn1hKlph2iqRPzWeUMPjtP+L?=
	=?iso-8859-15?Q?yMNa5sVIRNC3RhcjLLGmcDAW3N1zqZEWdyKqhczGUkeMmsIWcm90DA7lO?=
	=?iso-8859-15?Q?/xt/yxfho1GfW4g4j+qHTaIAEb1Wy1j0GHv4gMI6LQt/xASPVJEu3ZueM?=
	=?iso-8859-15?Q?SO6C3JHzDiykUzvN0oimRjjwjDCFCrmzIgvq5MC19cTzBFvrp36i808w3?=
	=?iso-8859-15?Q?WngYSOxTYg+pcYisZyfh9L+MM3+cJaq9i5eS9+YOzgMnEvVxNCiEdIhOF?=
	=?iso-8859-15?Q?Gzer3AdewXdWN6XWoCu4XlJC4+wHsnbr5zMo1m8baFto0EKW+2MszeOiu?=
	=?iso-8859-15?Q?eFfskoeptTtGRLhnmWhU0BIfSLUqP0dlv/kxUsq6OmP/06EOCf9vQE5jb?=
	=?iso-8859-15?Q?qAymx1iDd27EDvNS8ZVE1TGKPbwqATK4hHrBsTeHuzxv9vHBzdnmJjDmV?=
	=?iso-8859-15?Q?ha85udh3QsL38/+TKMYsVapsmn8FkFNmQUjLVYhobWMTjPlik0V2xfbOb?=
	=?iso-8859-15?Q?lj+U1tQITslBEWlCSi84B3F6E9u/TvaOOFKm41CJo7tzlge4xi4lzrqVY?=
	=?iso-8859-15?Q?Qi1F0Y5TdDDmQa6KQbJZnx3Pqr/K+qQjS1cPtwx3fH0ZE8F4Mnir8mD7x?=
	=?iso-8859-15?Q?STMGBeOSSpMcgwgi6NyTl3mls9toqnnkUCh3m1BrCHDcZzlUKv3R9AS+z?=
	=?iso-8859-15?Q?HXR2U4zCIkqw4sYxLz7aJWnfVFi7cTgiI440KS+EBRrSulyp1nIB7osB3?=
	=?iso-8859-15?Q?/foF0RiJ7sRGfpOkuNugdxx559lb8kE/hpIdm25fXDNM9ocuxGZcn8y7I?=
	=?iso-8859-15?Q?oLRR6tqOATXbihmaOynS2d58L+l2L/1dm?=
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7617b86e-4f39-4881-0a9c-08d983e30fb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2021 07:22:29.2949 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z11XYUzKn9J761rc0VHNwbxg1lyWMFIEwKOxCUvF7V4YZ1xnp0ZBR0/Cfb8icwCPDwJBKGf+q/cgC080/kQQkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8348
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 18U7MYOM031477
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Thu, 30 Sep 2021 15:03:51 -0400
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <EB39F263E25D5E479BD96191757AC833@eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-09-29 at 23:39 +0200, Peter Rajnoha wrote:
> On Mon 27 Sep 2021 10:38, David Teigland wrote:
> > On Mon, Sep 27, 2021 at 12:00:32PM +0200, Peter Rajnoha wrote:
> > > > - We could use the new lvm-activate-* services to replace the
> > > > activation
> > > > generator when lvm.conf event_activation=3D0.=A0 This would be done
> > > > by simply
> > > > not creating the event-activation-on file when
> > > > event_activation=3D0.
> > >=20
> > > ...the issue I see here is around the systemd-udev-settle:
> >=20
> > Thanks, I have a couple questions about the udev-settle to
> > understand that
> > better, although it seems we may not need it.
> >=20
> > > =A0 - the setup where lvm-activate-vgs*.service are always there
> > > (not
> > > =A0=A0=A0 generated only on event_activation=3D0 as it was before wit=
h
> > > the
> > > =A0=A0=A0 original lvm2-activation-*.service) practically means we
> > > always
> > > =A0=A0=A0 make a dependency on systemd-udev-settle.service, which we
> > > shouldn't
> > > =A0=A0=A0 do in case we have event_activation=3D1.
> >=20
> > Why wouldn't the event_activation=3D1 case want a dependency on udev-
> > settle?
> >=20
>=20
> For event-based activation, I'd expect it to really behave in event-
> based
> manner, that is, to respond to events as soon as they come and not
> wait
> for all the other devices unnecessarily.

I may be missing something here. Perhaps I misunderstood David's
concept. Of course event-based activation is best - in theory.
The reason we're having this discussion is that it may cause thousands
of event handlers being executed in parallel, and that we have seen
cases where this was causing the system to stall during boot for
minutes, or even forever.=A0The ideal solution for that would  be to
figure out how to avoid the contention, but I thought you and David had
given up on that.

Heming has shown that the "static" activation didn't suffer from this
problem. So, to my understanding, David was seeking for a way to
reconcile these two concepts, by starting out statically and switching
to event-based activation when we can without the risk of stalling. To
do that, we must figure out when to switch, and (like it or not) udev
settle is the best indicator we have.

Also IMO David was striving for a solution that "just works"
efficiently both an small and big systems, without the admin having to
adjust configuration files.

> The use of udev-settle is always a pain - for example, if there's a
> mount
> point defined on top of an LV, with udev-settle as dependency, we
> practically
> wait for all devices to settle. With 'all', I mean even devices which
> are not
> block devices and which are not event related to any of that LVM
> layout and
> the stack underneath. So simply we could be waiting uselessly and we
> could increase possibility of a timeout (...for the mount point
> etc.).

True, but is there anything better?
>=20

> Non-event-based LVM activation needs to wait for settle for sure
> (because
> there's full scan across all devices).
>=20
> Event-based LVM activation just needs to be sure that:
>=20
> =A0 - the pvscan only scans the single device (the one for which
> there's
> =A0=A0=A0 the uevent currently being processed),

If that really worked without taking any locks (e.g. on the data
structures about VGs), it would be the answer.


Martin


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

