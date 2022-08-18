Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD22C32772
	for <linux-lvm@archiver.kernel.org>; Tue, 23 Aug 2022 08:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661243310;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=axiUjO4X6p/o2cSTxoa/Gp3AXDnnBQdP3r763D2jqLs=;
	b=EHtqVHm7FmpKh0GM6qj4WkNClAUGtGhsDyg8D/5xofkTJp5iwe73gFYHoIfQLTxtOHGft6
	Ap7slWAczR75pwRuh6iXcW3qTQSjn/N3Ua7A+ClpzBo50CT3xL+SkPwiCNu8JCrQQAdb6s
	PaUj9CT5aBHiAIx413KvOjAS5rg63mg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-a6lU_T5qOSOP9dtxj7RLjA-1; Tue, 23 Aug 2022 04:28:29 -0400
X-MC-Unique: a6lU_T5qOSOP9dtxj7RLjA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD27E1032964;
	Tue, 23 Aug 2022 08:28:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 958E418EA8;
	Tue, 23 Aug 2022 08:28:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 11F521946A7C;
	Tue, 23 Aug 2022 08:28:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A5CA0194E00A
 for <linux-lvm@listman.corp.redhat.com>; Thu, 18 Aug 2022 07:37:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4CC46492CA4; Thu, 18 Aug 2022 07:37:05 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 481C8492C3B
 for <linux-lvm@redhat.com>; Thu, 18 Aug 2022 07:37:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 312D7802E5D
 for <linux-lvm@redhat.com>; Thu, 18 Aug 2022 07:37:05 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2085.outbound.protection.outlook.com [40.107.104.85]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-328-tuWg0zDHNt2tPDst4FagUQ-1; Thu, 18 Aug 2022 03:37:03 -0400
X-MC-Unique: tuWg0zDHNt2tPDst4FagUQ-1
Received: from AM8PR04MB8036.eurprd04.prod.outlook.com (2603:10a6:20b:242::13)
 by DB6PR0401MB2438.eurprd04.prod.outlook.com (2603:10a6:4:33::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19; Thu, 18 Aug
 2022 07:37:01 +0000
Received: from AM8PR04MB8036.eurprd04.prod.outlook.com
 ([fe80::650e:243b:14d5:4593]) by AM8PR04MB8036.eurprd04.prod.outlook.com
 ([fe80::650e:243b:14d5:4593%7]) with mapi id 15.20.5525.011; Thu, 18 Aug 2022
 07:37:00 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: Heming Zhao <heming.zhao@suse.com>, "demi@invisiblethingslab.com"
 <demi@invisiblethingslab.com>, "linux-lvm@redhat.com" <linux-lvm@redhat.com>
Thread-Topic: [linux-lvm] lvmpolld causes high cpu load issue
Thread-Index: AQHYsVgWNV1O3wjOPkulMZVFmhWK/a2xUrWAgAEFrQCAAGV3gIAACmCAgAARegCAABEeAIAAI5IwgAAqTdqAAAkkAIABBhYA
Date: Thu, 18 Aug 2022 07:37:00 +0000
Message-ID: <d8233dee5724f77974790d8940ef33518f037d42.camel@suse.com>
References: <204c332e-2a30-b17a-ecc1-58025454eb00@gmail.com>
 <20220817020225.gf6ooxobdf5xhpxe@c73>
 <6fa27852-e898-659f-76a5-52f50f0de898@gmail.com>
 <20220817084343.33la7o6fdh5txul4@c73>
 <27cd8fd6-1058-fe18-dab6-847d41bf894d@gmail.com>
 <20220817104732.jhu3ug6ahep3rnpq@c73>
 <b36cd2879a9ccaf25d0bb0389291e331adcc68c6.camel@suse.com>
 <727dcd28-99a2-739b-debd-a921e477e0d3@gmail.com>
 <4e0551e18a28ff602fae6e419dc746145e5962d3.camel@suse.com>
 <6be41a4e-9764-03ba-7231-911c733ffecd@gmail.com>
 <Yv0QQrK/B23/06oC@itl-email>
In-Reply-To: <Yv0QQrK/B23/06oC@itl-email>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 557d5ed1-3603-48c4-e36f-08da80ec702d
x-ms-traffictypediagnostic: DB6PR0401MB2438:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: oIudtGrAmCKx+e5dGlCZTu8rJZeGtDJ/NcJm9nbwwkirBesAnmWoYrA/Kwuk2L4OIQ06zoE6JMgqqdsMo/5YL93JwmLRkGKhVBE91JO4ljWKetzY3r5IkQxuk13UHZkCE5/dsSDB/1rz8ys3t4sUB0FFCHYvmgaF2z15UYSTMFhhVqpxT0BLHaBrxfZQKL0zGwVzQNapNy5yxzqcjnsTHYiVuXqRAuG+KTHB/SOrMmiA/YMhKIjBp4euG55fI8BkCNy85yLpifmQwMOHaMw2CeOMq4B9sHVx9m7XuzrgEkuJd7cgRSOlW7iCPozIRV51aN8OxQJKXtRi3I4J6i8lE9D3Mj+miQO1MYDQjKnuDhzqZgWrSPLbi9riYaJKFy9buj9TnlnrXoauLX2+7YFcs2e0eDR8AHNfVhpdMTzDAu5KyUiiSezkJTTdWv3GJJi7QTozq8sZ/lE+RjQZ6A3Dy8qC1DroGg4yLWAw9SsVXxgC8j5uhVDO+7gyNfmB42BWoUuJFpJCxIXUYc+JUQVU5l9+/37gwVXz2veANv+cj+/CPEOohzMoGJFGuqUD9dxxhtAR8bXxKEUBOreg1lH9PyCXPoYaPMEdISs1MrxHF+9JUzx0h/jVXLE6W0JCASJAaSJvvZ7KoHbInUYaW1kcHvMHU3CbYhoZKKAJKvObqkV0O42ClK1bk/iyNDLAwW6zj5B1wjRDSXrdYy82KNg0e9lb/zqDkmDAbLfP2Dh8wHu0YUCYgQLbtoEJE/5TY6IGFVXoxQ7E81D6IqhG86Aezg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM8PR04MB8036.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(39860400002)(366004)(346002)(396003)(376002)(186003)(6506007)(6512007)(86362001)(2616005)(26005)(38070700005)(38100700002)(122000001)(478600001)(71200400001)(36756003)(41300700001)(5660300002)(44832011)(4744005)(91956017)(6486002)(66946007)(64756008)(8676002)(66476007)(8936002)(76116006)(4326008)(2906002)(66446008)(66556008)(110136005)(316002);
 DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-15?Q?g1+K24QXOt90aYrup/NlvFtf+FDpKkpRcTPbOwC49NfQSzH2CxBcqEJsx?=
 =?iso-8859-15?Q?1dGEr0eD5QN0LMF2l4qmZG5T79Twn+IbhkWD4uPdcIxViWdzXooJXgU5Y?=
 =?iso-8859-15?Q?h/AM14OjeYfVEu7ackW1GfbXcKs2EbdJE7xS5Ez0WUUbpGq8VeCQWfr94?=
 =?iso-8859-15?Q?p/9pNl2Hxpp5yV3KKMA8FDdxXt8IISf6x8uuDWrIeRiOy/JJ5cKETau3f?=
 =?iso-8859-15?Q?Bmikiu/GXiOCTSQqGO2CncIhrfrSUmBE/YSBiX4yhJZlDijSN1J3tQ+Um?=
 =?iso-8859-15?Q?xwlFU9jeqaCQOSsow6r2wEDDqHXajeh1RoTp8XTRMIg9XZO9QjrNx99Vp?=
 =?iso-8859-15?Q?4OVABmhp4wpdk0D4Osdp1N32tgC7xVhB1dCggwqRWcDLfhqK16OWiz3Zk?=
 =?iso-8859-15?Q?XTcna1B317FRUzLouAcw3IK1nfYcT1qZ8c2r5SGQLQJ/d0F02z/JGjra+?=
 =?iso-8859-15?Q?m6P4I4Qy+caNmfBZSvlpBQoh1fJqpYUdUlXjLPYGYia7P2nhmO8dUa1VI?=
 =?iso-8859-15?Q?ffQLWTLTG5Ng9Qm3j7zbwstb+w/x8EzW17y+pElWzPvCYKi6LeGzte+hG?=
 =?iso-8859-15?Q?ETrq/hqJ7BCFcWMnrDxBBVZUXYpq0M95T0N2BSsUu0NitzMNBuw/ny5/L?=
 =?iso-8859-15?Q?HcXd0rH+GMvxh63cDKpu5eTqIcWQKnDTR5vG1zR+biaw7m6Qu3g0Ldoyr?=
 =?iso-8859-15?Q?Y50d571GCweV6DBDfZF1npOUHSRFc3mbCXc+a8bpPLKeG+tG6pM/VXpDI?=
 =?iso-8859-15?Q?/TntjD3Il9oNOfyyHRmhfcc9iN7/uTwYV844EDIT5ZSXgYWrmwvrw+h39?=
 =?iso-8859-15?Q?rVWBMchL1rEjalct4nHld7EEZ07VlFo4t1F7ideMjlufj2HN0fdqeRL4E?=
 =?iso-8859-15?Q?7P0pZ30jEJB5d5PXZ2yk0FonX6VOAYbGr+mt4YkorONQZZdO9HFXQ5tIB?=
 =?iso-8859-15?Q?fdPz6Em6cG52IgGz3X3zaxvSkB7gjoveL2QkAj5VBWO3QB4We8x9N2DWm?=
 =?iso-8859-15?Q?2k+JC3Ok8a68dOVFfK0SiNwojLmXhIsPLhnX6SJrZlfpHzf0GwMGeO1Zp?=
 =?iso-8859-15?Q?EA7krBAsvzEG630O+w3V4lcbqkvxIyQgq2fmPH5KHxsrqKsPpefGhtmck?=
 =?iso-8859-15?Q?g4hUNVoHx70/ry0Dd29WJrdqWpyuNhra7pCAPb2z7I7kX93CnNhrCCAMV?=
 =?iso-8859-15?Q?Y+jA+1d0Q5lIv/UAkRi2Zq+YY9/stRJbcaDOoURc/zc/vr1wB/hP7qrGu?=
 =?iso-8859-15?Q?wN9tQu7Ic191vb3OsPj8mCMndnFQzkG4OpLGJX+75yOVPvdl6QhZpCbgd?=
 =?iso-8859-15?Q?bcRgvzl3K9c/T8fIWhClKpniYhyW1WhV51/K8ocrZy/biJ5RBvnqh/4Jv?=
 =?iso-8859-15?Q?WpqNKMuTgggfWGeUkTdRoO1d/mBXdydGZIwAf47ZrL3vFGxIBc0DRpa0d?=
 =?iso-8859-15?Q?hIDt3+078qc2jvgHUvkElP3dAA8uJs8rBWvheshhj2UP/5Ett6CQU+SUZ?=
 =?iso-8859-15?Q?LbO3UEjCE1wpb954DmNQKjkIEb89RF1wlzptv93UTdcum/3mqT2WiPGHT?=
 =?iso-8859-15?Q?QnBFvUv3vmSmeE1biKSapBAkutlBa+0v7ABckpLpzbe9S0BqnG7qpXLei?=
 =?iso-8859-15?Q?kQKMizUbHS1lB4rEZ+gde13LxsgMmmx9XDvfp0y3HC0JZF3rs1lAawtMx?=
 =?iso-8859-15?Q?QcXivjqgfXIcLq3xqYariwhWJQ=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB8036.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 557d5ed1-3603-48c4-e36f-08da80ec702d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2022 07:37:00.8726 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7y10xyLlVXFP32j96Dt7NjthFKGBdxOEGzhPEVd5HBxiON9unjxyIZN6bUWnK/0SJxxI6+ThJD87euTw2JLi7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2438
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Mailman-Approved-At: Tue, 23 Aug 2022 08:28:22 +0000
Subject: Re: [linux-lvm] lvmpolld causes high cpu load issue
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
 <mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-lvm/>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
 <mailto:linux-lvm-request@redhat.com?subject=subscribe>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: "teigland@redhat.com" <teigland@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <2AC7B659E51C5542865201DCC715FEA6@eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Wed, 2022-08-17 at 11:58 -0400, Demi Marie Obenour wrote:
> >=20
> > Dave is a complete disliker of udev & systemd all together :)....
>=20
> I find udev useful for physical devices, but for virtual devices it
> is a
> terrible fit.=A0 It is far too slow and full of race conditions.
>=20
> Ideally, device-mapper ioctls would use diskseq instead of
> major+minor
> number everywhere, and devices would be named after the diskseq.

This is almost guaranteed to open up big can of new issues. I can see
that diskseq makes sense for loop devices, but general dm is a very
different issue. Not to say that changing the device names would be
nightmare.

Martin

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

