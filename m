Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA8BAC32772
	for <linux-lvm@archiver.kernel.org>; Tue, 23 Aug 2022 08:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661243344;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3AM2f7j1kHL+/4792ztt6BAmWwc5+g4xQnX4F0FKeA4=;
	b=A9uwOFlZwK6RwmAu7nLUFdWZmja38bj4x8Xng6xJAzqccM/r+I/Mx9ws3nlcA3s5H+dMie
	fKaIaalH10PEFv9i+bnkGK8ENOsLXleKs6jE8T3qRFYevZSQWvi9TApqxM8cJb64URujiq
	CrDbvv1Ko/goFVG8CX798vNZ0wzdjgY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-ug0NzbyrNOqvR00V3QoXjw-1; Tue, 23 Aug 2022 04:28:33 -0400
X-MC-Unique: ug0NzbyrNOqvR00V3QoXjw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B23CA29DD983;
	Tue, 23 Aug 2022 08:28:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9CE874010FA0;
	Tue, 23 Aug 2022 08:28:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5B80E1947B81;
	Tue, 23 Aug 2022 08:28:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 158C21946A40
 for <linux-lvm@listman.corp.redhat.com>; Wed, 17 Aug 2022 12:39:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CAD5240D2830; Wed, 17 Aug 2022 12:39:20 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C5FEF40D2827
 for <linux-lvm@redhat.com>; Wed, 17 Aug 2022 12:39:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A64C63C0D86D
 for <linux-lvm@redhat.com>; Wed, 17 Aug 2022 12:39:20 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130049.outbound.protection.outlook.com [40.107.13.49]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-EPiV_VI_P-2eAZwqaFQsrw-1; Wed, 17 Aug 2022 08:39:13 -0400
X-MC-Unique: EPiV_VI_P-2eAZwqaFQsrw-1
Received: from AM8PR04MB8036.eurprd04.prod.outlook.com (2603:10a6:20b:242::13)
 by VI1PR0402MB3629.eurprd04.prod.outlook.com (2603:10a6:803:a::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Wed, 17 Aug
 2022 12:39:08 +0000
Received: from AM8PR04MB8036.eurprd04.prod.outlook.com
 ([fe80::650e:243b:14d5:4593]) by AM8PR04MB8036.eurprd04.prod.outlook.com
 ([fe80::650e:243b:14d5:4593%7]) with mapi id 15.20.5525.011; Wed, 17 Aug 2022
 12:39:08 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: Heming Zhao <heming.zhao@suse.com>, "zdenek.kabelac@gmail.com"
 <zdenek.kabelac@gmail.com>
Thread-Topic: lvmpolld causes high cpu load issue
Thread-Index: AQHYsVgWNV1O3wjOPkulMZVFmhWK/a2xUrWAgAEFrQCAAGV3gIAACmCAgAARegCAABEeAIAAHy4A
Date: Wed, 17 Aug 2022 12:39:08 +0000
Message-ID: <b36cd2879a9ccaf25d0bb0389291e331adcc68c6.camel@suse.com>
References: <20220816092820.6xbab36dcmxq5hfm@c73>
 <be332c6b-4b65-6462-c570-ee6d0e81b985@gmail.com>
 <20220816100802.yy3xqvynil4pcspb@c73>
 <204c332e-2a30-b17a-ecc1-58025454eb00@gmail.com>
 <20220817020225.gf6ooxobdf5xhpxe@c73>
 <6fa27852-e898-659f-76a5-52f50f0de898@gmail.com>
 <20220817084343.33la7o6fdh5txul4@c73>
 <27cd8fd6-1058-fe18-dab6-847d41bf894d@gmail.com>
 <20220817104732.jhu3ug6ahep3rnpq@c73>
In-Reply-To: <20220817104732.jhu3ug6ahep3rnpq@c73>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5fa88932-3bfb-464b-b58c-08da804d7ab8
x-ms-traffictypediagnostic: VI1PR0402MB3629:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: 1ckiNDYTZdJBw7vKBMi+0LvxB7pxoFKsQeuB7AbchdXZUsBRALxYAAsLeoV341FA2/chrUWvusXUE3j7Ds4H63LmUTICRMHcBin83mWSJohNYb65zU+7lfaCGg0yxwNekf13RrIbCXzSGEk1nJtAIbUVvZBA+5TzsvwQJyb0HfmXYrpNzuc6LLe2ftdq2ylmQWYoFMTikzQKFF/7eQW9gnc2fvQ/i3H+ymA/8wthlQ6lvXtb1qGcx7ItyoWjwNq2Q9nAnJejTeDBUFP+SVb4QLDcpSfWmJWjcnuOailFiIm1gn38JauehEBuvYJ59QxM8cz9Xxhkyjj24Pv1qdKmAJoR88EoF4zz7kCmATpxErtxgl4t6SLLoHwW8CNWiR7TxkJhnVFx/vWiEwcLJfOCcNsb6ZQXLy6Xq4+ePuqRm6ooRypAQwriAIYv0q7+61PEYl2U37xGS6cibqxAvt4uwPDF1fcVwBsIR1DnkY3F3MT9MyvyVPngdwoUKkVOv8tPgrt9DavAVnahezg2uJFPn7SljwWsTNaxuDAAOk0s6AsI5B1P3UvmQvWPZwupsbT5TubRAdwnQOunYNcLJmACisr4nZs2PRygQJdTAw5oez1gnL+zs/n7g23vPU1O9D+ag7RdyTv/a3BKQcu/iezfIgXLV52aYYYBzzbKXKNDrLBsFQUjz4omhj074/n0d3QDMPBdzzo8S+ydCmhkP1SujSSBzC9yVnAlpREKDiGPPuRCSkz83atpQZioZbQH1fUHp2dLV/xqs/6RaXCzWAMqsRY8dxwopknyXTfcIxSLfOSbTAvoNim0Zuz4yfrO2mD1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM8PR04MB8036.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(136003)(346002)(396003)(376002)(39860400002)(66946007)(38070700005)(316002)(122000001)(91956017)(2906002)(86362001)(66476007)(64756008)(8676002)(66446008)(44832011)(66556008)(478600001)(6486002)(4326008)(5660300002)(76116006)(83380400001)(38100700002)(6512007)(2616005)(26005)(54906003)(8936002)(41300700001)(6506007)(110136005)(36756003)(186003)(71200400001);
 DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-15?Q?xMtGw/fn6ROAPDKyDbiIH0NaQDvQQONAj5FMOruO6vB2NnDIbEh5wxb8c?=
 =?iso-8859-15?Q?7qpjhxtYhTJmiwafv2T6YKLxPn7cyJxcovJpWxiy56ISXLYxp828Vcar9?=
 =?iso-8859-15?Q?addaABDiPy8S8BU8OdXrdjXRRiS7j9aroVRcyE93qoCAHCOn+4kwLBJwr?=
 =?iso-8859-15?Q?+1B8nSWbLorVJL4gf2Vd2/qjesoTcFBN5VLiZ0AHGijRePY1az0nC4DP0?=
 =?iso-8859-15?Q?ULNzuMNqQAGeFa9I3yJhCR5j1kigHcr1csYPpMx+OdPOsuHNfHYRNLe8i?=
 =?iso-8859-15?Q?4asN/4wXhgADO9owE9xFkJ4xqoozzXM58bsew+Elf6kuVcgc8nxj8ny7n?=
 =?iso-8859-15?Q?xZozC+mEJFS3qcYCvpmt0RrvvqFDhyKOm3rm69RBrgBmSNGtdYI8NFsUb?=
 =?iso-8859-15?Q?+5xUI/Cq1EK4oc8VUf8KqFfP8aPTjRMeC8h3jxufLLAroOhoyA5ifesp/?=
 =?iso-8859-15?Q?HjfDNZo0qo31Cn5DzVCZPMYAHMRWJ6kDklK2S06iGlHA+JvqC5vMm+LQN?=
 =?iso-8859-15?Q?DI22d/sEHjL2gkpj6UwzQd7uryzWFlt4UWe4fp8ryKW2t6F7XO6SnNPez?=
 =?iso-8859-15?Q?6ZimzYo3wFg+xQ75YTaCePryvLvxB67O+EpcoIEQM8hPnHgTbSCujgkJ1?=
 =?iso-8859-15?Q?CfznrcyNNgl7sD/BSvv7OaEAha+apdtoIwZkrLGK56/1NM6XhoP8SZkPI?=
 =?iso-8859-15?Q?5p7WXusBXLQpTcxxEHBmQ/faweH358I9wsx3w0EGasoi5O0df3paB6Wh6?=
 =?iso-8859-15?Q?LSFBbzNgXPC0VFTA3ltmHMy5iexhNuiLLBupeFVeQRx0vvJjVScjin3Ww?=
 =?iso-8859-15?Q?TB7gmGYJpbAHT/Y3rDBKV9vZhbEPvaBit/1jJdZttrre7jXrKNfYHFGkC?=
 =?iso-8859-15?Q?7GNbJBLqrPF10N7UFYnxUaxfjlpS5kYUNUiOZEWZs85j+CXlRzXhWpozQ?=
 =?iso-8859-15?Q?QkrIjF5vpwRt3U+Z5yxLmFiB1jYizfiWBS+iFuvJB7q6Jlhsh0NRjXLMj?=
 =?iso-8859-15?Q?M95IhzC1g4P413Yrwr0bu21QXekK787HQSlg4l864CA5o91MErTdipdnu?=
 =?iso-8859-15?Q?LaL/L8qKALNG8Drpvs5BE6PQBWj2lwPnIApNdydLvy4UA06awC3v8PZgh?=
 =?iso-8859-15?Q?rBEGgi4cYrlCn+1PAnyGnmNHnhTIFffseVyObdU6z0MOxOdYHPrzHOKtf?=
 =?iso-8859-15?Q?O1/IM6IQWbo7t0TotQnmMPwFsVSqHJwSfKBqEoX+PEEkF+YdJfR0d99TR?=
 =?iso-8859-15?Q?z8TiajwCn72fzHCswHg+NlxuY6DQ1RdPDF+ZOl64Lp+swB6EKBnqtfOPR?=
 =?iso-8859-15?Q?jLwdZf90oYkHJKT8I8WdQrGjj1DQ7RNXlcaY5yPeMijIb16duK8iSmSks?=
 =?iso-8859-15?Q?GkUHbJy4nR+c+orsHuY87YB7gC74JZlPz2dWYrW0exQYu5EtrABoPnYyt?=
 =?iso-8859-15?Q?QjBmQUbOFt+93FgOBn1Bwytmcnlau1L9t12zF95KRtuDgNzf8RXwQVYcN?=
 =?iso-8859-15?Q?rgZ9l+Qd1KyX3ypojV1gVGJLTpZ0wVWpv/L/6Zjm5UXJpXS11VAExhc88?=
 =?iso-8859-15?Q?3nD7HGgrw4ApWzaNU0vyXOnpgw3lcw2+UlW7nf43dtI1bwfWbAYyr3swf?=
 =?iso-8859-15?Q?4nrRsFWZubC9nMumFjTQujHnwqHLbvDDzqFPhqNNJzVHjfS0HndOLmSrX?=
 =?iso-8859-15?Q?3qqSmoB11/j/TZUm/l/eFlGXwA=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB8036.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fa88932-3bfb-464b-b58c-08da804d7ab8
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2022 12:39:08.5952 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6YqcH+KFT09m5cj2Ui4kWWakWC75/00Vq5NN9rI1EEdLCl1UbHNwazqwkDSZL2XhEACFqVIO6cDEqf3XIh0oYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3629
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
Cc: "teigland@redhat.com" <teigland@redhat.com>,
 "linux-lvm@redhat.com" <linux-lvm@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <B1ECF6F7448FD0499C99E6605365C763@eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Wed, 2022-08-17 at 18:47 +0800, Heming Zhao wrote:
> On Wed, Aug 17, 2022 at 11:46:16AM +0200, Zdenek Kabelac wrote:
>=20
>=20
> >=20
> > ATM I'm not even sure if you are complaining about how CPU usage of
> > lvmpolld
> > or just huge udev rules processing overhead.
>=20
> The load is generated by multipath. lvmpolld does the IN_CLOSE_WRITE
> action
> which is the trigger.

Let's be clear here: every close-after-write operation triggers udev's
"watch" mechanism for block devices, which causes the udev rules to be
executed for the device. That is not a cheap operation. In the case at
hand, the customer was observing a lot of "multipath -U" commands. So
apparently a significant part of the udev rule processing was spent in
"multipath -U". Running "multipath -U" is important, because the rule
could have been triggered by a change of the number of available paths
devices, and later commands run from udev rules might hang indefinitely
if the multipath device had no usable paths any more. "multipath -U" is
already quite well optimized, but it needs to do some I/O to complete
it's work, thus it takes a few milliseconds to run.

IOW, it would be misleading to point at multipath. close-after-write
operations on block devices should be avoided if possible. As you
probably know, the purpose udev's "watch" operation is to be able to
determine changes on layered devices, e.g. newly created LVs or the
like.=A0"pvmove" is special, because by definition it will usually not
cause any changes in higher layers. Therefore it might make sense to
disable the udev watch on the affected PVs while pvmove is running, and
trigger a single change event (re-enabling the watch) after the pvmove
has finished. If that is impossible, lvmpolld and other lvm tools that
are involved in the pvmove operation should avoid calling close() on
the PVs, IOW keep the fds open until the operation is finished.

Regards
Martin

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

