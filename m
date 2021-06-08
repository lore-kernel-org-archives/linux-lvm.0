Return-Path: <SRS0=kfxi=LC=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,PDS_BAD_THREAD_QP_64,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93027C4743E
	for <linux-lvm@archiver.kernel.org>; Tue,  8 Jun 2021 14:02:24 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23D4760FF0
	for <linux-lvm@archiver.kernel.org>; Tue,  8 Jun 2021 14:02:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23D4760FF0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-lSur5WczOq60z2TJjlrgdA-1; Tue, 08 Jun 2021 10:02:20 -0400
X-MC-Unique: lSur5WczOq60z2TJjlrgdA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09A9E107ACE4;
	Tue,  8 Jun 2021 14:02:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FB6510016F4;
	Tue,  8 Jun 2021 14:02:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8F04D44A59;
	Tue,  8 Jun 2021 14:02:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 158DNiIq001674 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 8 Jun 2021 09:23:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7A9B021DE6FD; Tue,  8 Jun 2021 13:23:44 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 757A921DE6FE
	for <linux-lvm@redhat.com>; Tue,  8 Jun 2021 13:23:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C6C8680D0E4
	for <linux-lvm@redhat.com>; Tue,  8 Jun 2021 13:23:41 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.111.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-425-ihEVw2ZRMkiVvop7dOdthQ-1;
	Tue, 08 Jun 2021 09:23:37 -0400
X-MC-Unique: ihEVw2ZRMkiVvop7dOdthQ-1
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-ve1eur01lp2055.outbound.protection.outlook.com [104.47.1.55])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-22-uiKFh7NEMeC7u4Ud9tWndA-1; Tue, 08 Jun 2021 15:23:35 +0200
X-MC-Unique: uiKFh7NEMeC7u4Ud9tWndA-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DBAPR04MB7463.eurprd04.prod.outlook.com (2603:10a6:10:1ad::10)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24;
	Tue, 8 Jun 2021 13:23:34 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::1061:e932:29cc:2a38]) by
	DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::1061:e932:29cc:2a38%7]) with mapi id 15.20.4195.030;
	Tue, 8 Jun 2021 13:23:34 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>, "prajnoha@redhat.com"
	<prajnoha@redhat.com>
Thread-Topic: [linux-lvm] Discussion: performance issue on event activation
	mode
Thread-Index: AQHXWptdVb+iQI7pP06gMwUhQri0uKsIs+kAgABkm4CAAPX+gIAADzyA
Date: Tue, 8 Jun 2021 13:23:33 +0000
Message-ID: <f6b8c5b6c01ecef842eb711748a765f81b7f04e7.camel@suse.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<d1d35f7dba3d0e887e7eac06a06ff2414a84c924.camel@suse.com>
	<20210607214835.GB8181@redhat.com>
	<20210608122901.o7nw3v56kt756acu@alatyr-rpi.brq.redhat.com>
In-Reply-To: <20210608122901.o7nw3v56kt756acu@alatyr-rpi.brq.redhat.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.1
x-originating-ip: [2.206.153.60]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3eb71337-27e3-4863-0da7-08d92a809dc2
x-ms-traffictypediagnostic: DBAPR04MB7463:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DBAPR04MB74635461D161E774BD9806F4FC379@DBAPR04MB7463.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: Bb3ZqF/1mE2waDikJOZPijWj91GkhjgXjIqW9qj6cZhkvDHndDmX2L74qkYN2+/ctV56ojBY00EbQLdLYP+dXEGZZLowfdc2y8lF6N2hzqOVKO/YYjAIxoa4AM2/tU1TIND/cTjUnJLWg4puZoKLuciCE0+0yKf06TZLtQAEXCK5dWvQruleRKlLpOlVAAMVNbqYuwiNpdVpiA3OXBNvZaanOW1YPst4lzpduw8e2VY1X4o7QDbbOVIrCBfl6JXgZQl+qptDfJtffG0vuFwa7zGYPgoMwXlsSLYzsKUWdKKE10EWpcwF5KMGOihRoMEJjsKv9agys3eiydiuF807IX6GfCg/n51f0yVYntk2F8ztCFXGUZt45eBtJYi5y2JKhU4n5UaoDj+/0oUMmbuKmJ9eYCWgEFZ4K7k6r8GVKCoJOjxzxalnvWIVGHEVMmZAjKIKuVYX2TEtG/EB9nKo/oKuJT3uEPBjEo1jxvyWbqBwA8K6ceLtNXM7ZL9Z7QxG51YF1hXek8gWHCmpUSfZZW4RbddfFsT276gxr/N/RA9kwg0zCRd2O+mvXSRbWFA0beVatuIZVuvhkLa88dup7WgwCcAuDc3RSNiXEhdHMPI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(39860400002)(136003)(396003)(376002)(366004)(346002)(107886003)(91956017)(86362001)(8936002)(6506007)(186003)(122000001)(66476007)(8676002)(36756003)(450100002)(66556008)(5660300002)(2616005)(316002)(66446008)(64756008)(110136005)(2906002)(76116006)(83380400001)(4326008)(54906003)(26005)(44832011)(38100700002)(71200400001)(66946007)(478600001)(6486002)(6512007);
	DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata: =?iso-8859-15?Q?bEWG2tfWcnS71kp94t/hG58ZYbAXGU/xbC65REWaPJVcsaWGwFbiXJ6NN?=
	=?iso-8859-15?Q?C4twqZpAf7gRXsDvjNWrDvAdXAtr7Znxas/Jjmh6vwZwNTJ4MNkjZ2vsq?=
	=?iso-8859-15?Q?nvZKkqw4roLYY+Wzo6RjeYwbB2rMVG37sNQGaztSLYYCOoDcIzDiWdc9C?=
	=?iso-8859-15?Q?6FnDUDoVhE57aYMTBvJf0NAJoMqQ85a/Z2l4ADXc1v2nzTRp3w+uiwVCM?=
	=?iso-8859-15?Q?Ubn3aI9FH4pZ7bv3NfNL9CxyzbTKiKIRLpD+clQLlvXXfNX7ahBvauTjl?=
	=?iso-8859-15?Q?5aqwWhIKFys+B/d6jcihdxpKdR8Fu7tMVID+sksWATlRR3KkZ65n9atqU?=
	=?iso-8859-15?Q?LfgPJmoRFndlx4MPk3qNOUV/6bFjnkdBpYpsjcbSMrVWI7tJ3aqLcxwgZ?=
	=?iso-8859-15?Q?SVIeAfG9iaDcldnFUMjoqEgyYo6/Q8N44/Jfl0JQCKy/WMbHYytHOTjV3?=
	=?iso-8859-15?Q?oRM6YELVhKZE0b6FzVeHXgmFbpAScMg/EpFwY0S3zP7nSfqROHTmjVWSM?=
	=?iso-8859-15?Q?Kb7xZuvPfQgb5WT9mL3dsR4ASgYjS901LSnmcvsuPXhrZsWSLq1xZhBG7?=
	=?iso-8859-15?Q?gsP7zK5IQpscvJ8ONeTUyUsKU7ULsC4Rk5Gyraheow6ulai3zIjKMTWAu?=
	=?iso-8859-15?Q?qvM3VeCoNqia+N5wki0fNykfjRzSCbpepBlmX7aMJ+ceccA05C+P7PDX6?=
	=?iso-8859-15?Q?bHSD/n7gWCPFlzCGwczgRxCZkwIxQuG54hN6rEs5cbZDAd8h6lDUSwONg?=
	=?iso-8859-15?Q?uK/gV06JXPW+3zpPWn/QwMQrCBWJY/2oR/HA5R2OgN0Jfqt7+/IpCe7D5?=
	=?iso-8859-15?Q?UCgxHSAk6t7sex9y7awc8wFeXfXKt2f6XAjzOF9vDWf/tApUydSN2/ml8?=
	=?iso-8859-15?Q?XxXSW5RfxBRZ/glT5Am5LhTs9798m8xkVHFsrT+ixZ1bRUJ/srkomznQN?=
	=?iso-8859-15?Q?oxXp3YoPJr5li2uLSOixLYYkp6tkTUpfFQUgvDff4i6+XUSTBWn8OpyLi?=
	=?iso-8859-15?Q?O3vMsPapgf957CsnVZoVTy+hZXpl1uxPuylTMj75Bw3fVru1Ec1fWzDAC?=
	=?iso-8859-15?Q?H8AVa+ur7oUVSGK0pkHqyXYYct9pg7tGvr8NreJzrJsQfJMnJ1ub7uWB6?=
	=?iso-8859-15?Q?WJ6gdwLXI4g6V8v+IbnCIwHbGcgoSH83jnhMqEwGyvUPoUsMQx0itYYl2?=
	=?iso-8859-15?Q?lfH2E0409wMBuYB3ahpjgffMdlYDMDvZ6co/vuczvpR1vN7QAtIyMBPgG?=
	=?iso-8859-15?Q?O65Sr5hfcQaw8BuJqoY96bYnhOkMVn1wAXYsivfAA4G7Z2KL1wdg4jCU+?=
	=?iso-8859-15?Q?NW3QEOGVrh6RHn9MM9fVQbynm7I0to8lGhKsqvXTjINd0BOQsccKQvTsl?=
	=?iso-8859-15?Q?7k2EImky+91B9SphhljxUmG/grd7Zy3xN?=
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eb71337-27e3-4863-0da7-08d92a809dc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2021 13:23:33.8728 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yu9GDJIc0e2EydAMaxqTqHDuLeTcEmdOZ3/cGQn5kuK1aIJupuQH9pfACEmRGafS9kHfE7e6JjkZ/3UgDUSEVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7463
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 158DNiIq001674
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Tue, 08 Jun 2021 10:02:08 -0400
Cc: Heming Zhao <heming.zhao@suse.com>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <2C63E5CB2A1C79419D62C814AB8D1B0E@eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Di, 2021-06-08 at 14:29 +0200, Peter Rajnoha wrote:
> On Mon 07 Jun 2021 16:48, David Teigland wrote:
> >=20
> > If there are say 1000 PVs already present on the system, there
> > could be
> > real savings in having one lvm command process all 1000, and then
> > switch
> > over to processing uevents for any further devices afterward.=A0 The
> > switch
> > over would be delicate because of the obvious races involved with
> > new devs
> > appearing, but probably feasible.
>=20
> Maybe to avoid the race, we could possibly write the proposed
> "/run/lvm2/boot-finished" right before we initiate scanning in
> "vgchange
> -aay" that is a part of the lvm2-activation-net.service (the last
> service to do the direct activation).
>=20
> A few event-based pvscans could fire during the window between
> "scan initiated phase" in lvm2-activation-net.service's
> "ExecStart=3Dvgchange -aay..."
> and the originally proposed "ExecStartPost=3D/bin/touch /run/lvm2/boot-
> finished",
> but I think still better than missing important uevents completely in
> this window.

That sounds reasonable. I was thinking along similar lines. Note that
in the case where we had problems lately, all actual activation (and
slowness) happened in lvm2-activation-early.service.

Regards,
Martin



_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

