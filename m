Return-Path: <SRS0=LwB/=L7=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04436C07E95
	for <linux-lvm@archiver.kernel.org>; Wed,  7 Jul 2021 06:55:30 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89CB261C82
	for <linux-lvm@archiver.kernel.org>; Wed,  7 Jul 2021 06:55:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89CB261C82
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-xChSZKidODujr53lUdLUVg-1; Wed, 07 Jul 2021 02:55:27 -0400
X-MC-Unique: xChSZKidODujr53lUdLUVg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B53610C1ADC;
	Wed,  7 Jul 2021 06:55:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3969E1017CE5;
	Wed,  7 Jul 2021 06:55:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 852161809C9A;
	Wed,  7 Jul 2021 06:55:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 162LMEx2006448 for <linux-lvm@listman.util.phx.redhat.com>;
	Fri, 2 Jul 2021 17:22:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9FDFB11D297; Fri,  2 Jul 2021 21:22:14 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 97A5411E1F2
	for <linux-lvm@redhat.com>; Fri,  2 Jul 2021 21:22:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0AA0E1064C8B
	for <linux-lvm@redhat.com>; Fri,  2 Jul 2021 21:22:11 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.111.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-471-izGWjgsqMa6_0ucOXrJ84A-1;
	Fri, 02 Jul 2021 17:22:09 -0400
X-MC-Unique: izGWjgsqMa6_0ucOXrJ84A-1
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
	(mail-ve1eur03lp2051.outbound.protection.outlook.com [104.47.9.51])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-8-1-1jG97YO4OMM8eOYiYjkg-1; Fri, 02 Jul 2021 23:22:06 +0200
X-MC-Unique: 1-1jG97YO4OMM8eOYiYjkg-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DBAPR04MB7317.eurprd04.prod.outlook.com (2603:10a6:10:1b3::15)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22;
	Fri, 2 Jul 2021 21:22:04 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::1061:e932:29cc:2a38]) by
	DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::1061:e932:29cc:2a38%7]) with mapi id 15.20.4287.027;
	Fri, 2 Jul 2021 21:22:04 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: Heming Zhao <heming.zhao@suse.com>, "teigland@redhat.com"
	<teigland@redhat.com>
Thread-Topic: Discussion: performance issue on event activation mode
Thread-Index: AQHXWptdVb+iQI7pP06gMwUhQri0uKswV8GAgAADooA=
Date: Fri, 2 Jul 2021 21:22:03 +0000
Message-ID: <831e213cc0c54476d053ab230df29a4cb386d784.camel@suse.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<20210702210903.GA15057@redhat.com>
In-Reply-To: <20210702210903.GA15057@redhat.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.2
x-originating-ip: [88.73.133.95]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d973b915-105a-41d2-fd6b-08d93d9f702e
x-ms-traffictypediagnostic: DBAPR04MB7317:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DBAPR04MB73170982D9BA1C8778D29F66FC1F9@DBAPR04MB7317.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: vSIukSRm15U35rd6rAl9u3eclie/NePdtgwu3fQfkoVmXZnFQU5B5gi3SVbTDt3Gb3eiJtCywwSFbtVdxdvn7LMkCm1tCSwBqrph4QuytmdU/Sf6l5N/jL9o40wflUbjXu7nRaAGxcBWmwnHzf/nv6Y6v8ZIGP/YbCtqF0FRdJM+BmvTHkSuudj3BlbJQEpxmS0A/fy6zy7tY3DRruMb9ydE9MK4+KL+JMF9Z39WD2GaL3t4tGd2xspZZDJ+e0LDDL5XHqMY9HxVeBIaPfXlm6u1yttmrLRffZ0yu1QTZLPacsmG/UUNIW6PoONNGwGWz3/taUOVaKibaKDN+pXGJIw8BPro6YFuvkvN9shqVpZxv9eDPVgltgB/tVflxIzeLWovoc2ClMaohz9VlSQC3Ag5RbYRlop+4CvzW6p+Fo2vrODRhFEn+DyIoay4/ESPLk+9tYQuc/qGoG9wYHDXDGy2KwhcUcgNm1mO3AlH2zHAnLb6JxWvEeM1aJpvk0nFQ59stIYfrkrhfjdtj4c7FYe0Rbr2bMxEm4GErj6O3Dxj1hx/GqDx2ku4cjvwO8F7NubYaOctYqnKdvIjXbplB4xwU4x3JVdpHfaqrz92FUTaO1KpoSf4ahNZVWXBVc3WvvHS5C1U8ED69lmLg9hSag==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(136003)(376002)(396003)(366004)(346002)(39840400004)(8936002)(54906003)(8676002)(6512007)(478600001)(66946007)(66446008)(5660300002)(110136005)(122000001)(186003)(6486002)(2906002)(64756008)(66476007)(66556008)(36756003)(2616005)(38100700002)(83380400001)(316002)(44832011)(4326008)(450100002)(6506007)(76116006)(71200400001)(86362001)(26005)(91956017);
	DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-15?Q?0uSgIq5WWaynm+5l1fDtgf1o/vr0/PKuGiMJdDiObB+6qgY2xdbG/1NIz?=
	=?iso-8859-15?Q?Ofip6pbH5pvGPLsIDE2wuNE1PenDfsFGNbQQvmzAXwzoYknSJcDrKuZYE?=
	=?iso-8859-15?Q?rkOYo3+RZVRCo9aGvbBeObOKBxpECNPjybvL3qPcWHcQVCfMRNhfbugKk?=
	=?iso-8859-15?Q?/KZY7RwHpfVEjfghP9UMzQWjWWDP+0oWRsGYGKG6hNlpzXf0sVAiGyQRP?=
	=?iso-8859-15?Q?/GvB5H4pxG6ZRkm0lR9JYa39OMremoN/eylxgkxbiy8CKZpX78nIuEaXr?=
	=?iso-8859-15?Q?ueatfeviZoyyFPR6EoKQJlBbPIu0IYn9K44ODohGk08H4r7yWlgPMxaE7?=
	=?iso-8859-15?Q?6BCODpa1Jvz6XOhn1xftag8wVd4NQkq5GSRmWjxLBNL/Z6sc4UYmqyWpN?=
	=?iso-8859-15?Q?hs9m8h6iodRf5TlfToqjEL2vEY/L6RRaewWKpkBkWmdfQz8osszLX1StR?=
	=?iso-8859-15?Q?aZRqnA7rldL1407i6eqGDZAcy9klnqt6QvdQRB9cNXbkQUbGmDaX4omeK?=
	=?iso-8859-15?Q?0nr/+C5qTMIUHjXD8Al6NVWgw6iuSJ4y51knii9iAYY2d4U+czirrV3Yj?=
	=?iso-8859-15?Q?Hzlw4jJuhhwpy/2WfcSL8B9tjqcDdRAxy/4IDVEfZRzo3R83C6z3eKav+?=
	=?iso-8859-15?Q?zgCFyxmQ8noUGBhhC/ijpIUtw74mMRBDOStVbUE85uK9OxsRwzK6vA7ZN?=
	=?iso-8859-15?Q?kl0+WmrcjepGf9JkXCY+GHSiqVh9Jop4lrr2eQWC0L+5Ju0LGZO7RmZZR?=
	=?iso-8859-15?Q?tfMGnW+vMOwfdN0xPXUzY2PbJLEuorvV3G3aLCFbkJRJkmmIeweeCfyO6?=
	=?iso-8859-15?Q?7Gb7kRlaLHU1l9522lqbPpkbDc8uHMg16tlI+hN4fKuXkxIY+GtUlkbET?=
	=?iso-8859-15?Q?TIqY/hF5lwX0vF3+vja7jEGAL+S5tRIa/ZkIQID03p2tZdw6+9nwpIEyq?=
	=?iso-8859-15?Q?IovxSMy+jyl1iRCvO8bCuBAE4+BHtmRXbeFcVsKBGXr+VUrbd9eRYbCM1?=
	=?iso-8859-15?Q?b+iNSqE50+BBYKnRMfGQF1dL5xhst+Z7QnZ2wmJikYpsJW2/8VKsAYwJL?=
	=?iso-8859-15?Q?siq3wBTEjCgJJWLlMEU6lX9/5jH1yqgdkd4CawP6662SAkXxlAhcXjhA2?=
	=?iso-8859-15?Q?938BGyinOD79u5RHOE/nb/SHHQ7lMhGABi6ScYzQs7VfOchRkm7SN5JRW?=
	=?iso-8859-15?Q?RS6oSlVbuqtWRJPXV84x1OUsmrsoSo29kxALJGfsq687BfNKYYlXvEVi6?=
	=?iso-8859-15?Q?1QUtk7N0EsPkx6+TGH5FFCygTEykOMJNDqW4fY+fXeV3OicEb/K85wnhr?=
	=?iso-8859-15?Q?vNEExELufzjz3WUC0ZGRQCiEF8wlQ/S5bz3GDgdxMRsjtet6RDEc4JXpR?=
	=?iso-8859-15?Q?24oLI+TRkZUdFguHG6LAh0bclg1wzNT1T?=
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d973b915-105a-41d2-fd6b-08d93d9f702e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2021 21:22:03.8029 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H15LXK9PZeIJVtfvfI3rSMakGV74yYFVVM6sEgMOfIGuIDy/3iCEmZYwbwGaV0qOieYXK3t1300VLT8OK6x4Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7317
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 162LMEx2006448
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Wed, 07 Jul 2021 02:55:02 -0400
Cc: "linux-lvm@redhat.com" <linux-lvm@redhat.com>,
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
Content-ID: <35124E58F600F141A2891859CF9B2B75@eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Fr, 2021-07-02 at 16:09 -0500, David Teigland wrote:
> On Sun, Jun 06, 2021 at 02:15:23PM +0800, heming.zhao@suse.com=A0wrote:
> > dev_cache_scan //order: O(n^2)
> > =A0+ _insert_dirs //O(n)
> > =A0| if obtain_device_list_from_udev() true
> > =A0|=A0=A0 _insert_udev_dir //O(n)
> > =A0|
> > =A0+ dev_cache_index_devs //O(n)
>=20
> I've been running some experiments and trying some patches to improve
> this.=A0 By setting obtain_device_list_from_udev=3D0, and using the
> attached
> patch to disable dev_cache_index_devs, the pvscan is much better.
>=20
> systemctl status lvm2-pvscan appears to show that the pvscan command
> itself runs for only 2-4 seconds, while the service as a whole takes
> around 15 seconds.=A0 See the 16 sec gap below from the end of pvscan
> to the systemd Started message.=A0 If that's accurate, the remaining
> delay
> would lie outside lvm.
>=20
> Jul 02 15:27:57 localhost.localdomain systemd[1]: Starting LVM event
> activation on device 253:1710...
> Jul 02 15:28:00 localhost.localdomain lvm[65620]:=A0=A0 pvscan[65620] PV
> /dev/mapper/mpathalz online, VG 1ed02c7d-0019-43c4-91b5-f220f3521ba9
> is complete.
> Jul 02 15:28:00 localhost.localdomain lvm[65620]:=A0=A0 pvscan[65620] VG
> 1ed02c7d-0019-43c4-91b5-f220f3521ba9 run autoactivation.
> Jul 02 15:28:00 localhost.localdomain lvm[65620]:=A0=A0 1 logical
> volume(s) in volume group "1ed02c7d-0019-43c4-91b5-f220f3521ba9" now
> active

Printing this message is really the last thing that pvscan does?

> Jul 02 15:28:16 localhost.localdomain systemd[1]: Started LVM event
> activation on device 253:1710.

If systemd is very busy, it might take some time until it sees the
completion of the unit. We may need to involve systemd experts. Anyway,
what counts is the behavior if we have lots of parallel pvscan
processes.

Thanks,
Martin





_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

