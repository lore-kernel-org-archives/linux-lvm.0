Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA06C3F6B0
	for <linux-lvm@archiver.kernel.org>; Tue, 23 Aug 2022 08:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661243346;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=X3PuIoWm4Mp9w4mK7PEoyotGDf88ZJiku4xCA01Pq2Q=;
	b=gF+/p0LPiy+Sc9NPOS48U0TqJhRlTrPsdwS/lSNiBfFUUB2O/5k1cUwK4Y/ZXbMhZW8d/I
	T+6/gdtbuZwx5wjUYEV9d/Cqf1Rp/0anV34rx0dUV2liKp9sTFNUN4aaqpB+dLqdYaXpRl
	NuOCyvKdLita/sJQWPKQSjGuJ8DIabE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-XCtUFyQCMRma1uRnaYSR2Q-1; Tue, 23 Aug 2022 04:28:32 -0400
X-MC-Unique: XCtUFyQCMRma1uRnaYSR2Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3744380407E;
	Tue, 23 Aug 2022 08:28:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5BF921121315;
	Tue, 23 Aug 2022 08:28:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F27CD1947079;
	Tue, 23 Aug 2022 08:28:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D9BB2194E00A
 for <linux-lvm@listman.corp.redhat.com>; Thu, 18 Aug 2022 08:06:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id ADB522026D07; Thu, 18 Aug 2022 08:06:52 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A8E752026D4C
 for <linux-lvm@redhat.com>; Thu, 18 Aug 2022 08:06:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 26B051881435
 for <linux-lvm@redhat.com>; Thu, 18 Aug 2022 08:06:46 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00068.outbound.protection.outlook.com [40.107.0.68]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-7cHYD50-Ns-0cLc3TGkbhg-1; Thu, 18 Aug 2022 04:06:44 -0400
X-MC-Unique: 7cHYD50-Ns-0cLc3TGkbhg-1
Received: from AM8PR04MB8036.eurprd04.prod.outlook.com (2603:10a6:20b:242::13)
 by VI1PR04MB5149.eurprd04.prod.outlook.com (2603:10a6:803:54::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Thu, 18 Aug
 2022 08:06:41 +0000
Received: from AM8PR04MB8036.eurprd04.prod.outlook.com
 ([fe80::650e:243b:14d5:4593]) by AM8PR04MB8036.eurprd04.prod.outlook.com
 ([fe80::650e:243b:14d5:4593%7]) with mapi id 15.20.5525.011; Thu, 18 Aug 2022
 08:06:41 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: Heming Zhao <heming.zhao@suse.com>, "teigland@redhat.com"
 <teigland@redhat.com>
Thread-Topic: lvmpolld causes high cpu load issue
Thread-Index: AQHYsVgWNV1O3wjOPkulMZVFmhWK/a2xUrWAgAEFrQCAAGV3gIAACmCAgAARegCAABEeAIAAI5IwgAAmW2KAARt2AA==
Date: Thu, 18 Aug 2022 08:06:40 +0000
Message-ID: <4307fbab8a849460d3810b15f522ed888d5e6711.camel@suse.com>
References: <20220816100802.yy3xqvynil4pcspb@c73>
 <204c332e-2a30-b17a-ecc1-58025454eb00@gmail.com>
 <20220817020225.gf6ooxobdf5xhpxe@c73>
 <6fa27852-e898-659f-76a5-52f50f0de898@gmail.com>
 <20220817084343.33la7o6fdh5txul4@c73>
 <27cd8fd6-1058-fe18-dab6-847d41bf894d@gmail.com>
 <20220817104732.jhu3ug6ahep3rnpq@c73>
 <b36cd2879a9ccaf25d0bb0389291e331adcc68c6.camel@suse.com>
 <727dcd28-99a2-739b-debd-a921e477e0d3@gmail.com>
 <4e0551e18a28ff602fae6e419dc746145e5962d3.camel@suse.com>
 <20220817151158.GA27556@redhat.com>
In-Reply-To: <20220817151158.GA27556@redhat.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0b7540c9-74bc-4519-ff13-08da80f0952c
x-ms-traffictypediagnostic: VI1PR04MB5149:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: Kf1SGXf/ncjyvfycJTHcWuog59+kE8u0E+6r3ffwG09b/DyEPcKeYMbgkAEJLrA9h+m3ZYSPvHaspoK6hb8EOzduxmJBWwYuA/2QLWSZOABpimSvDDQV2NHtczvPjfOp24anePho9ZbVZN0xUzEx4Qskv8EED9CDUhaSeuIb30xDeLe77aUHwrAMQDiCJACgLUMWbzqF94SSLCj2LwV6eiS8L6Tt6PATTPYF1HxsirNiCxNi3e7OXhT+qG1jIqwGYuukPU4BlMz3xovx7TRAo5FFGT6JYmCJOocv/Z/lxIux3CR0b6GgsC3ta+Z+Qu7zTJW8xgyUTU92EcTd0oyf9i4vFEY6r47fmPTIz0Ji6lDIP37MNOaL5coAp5SA8xBQQ+NwzMmqAJGHnZYEMB1ttThk8LRDnoKvGiQzPAsb7nF5/JzYeHpzevki7FLP4aMaoN6KEDkisQg/9IFX00jNYK8x/q5jOoW+tochcIaKwEuXihRK8pa8tabQqA/j5vhtJtHlplTag3FLbEm5NgbGZtXYWWRDXiQ65GkwuVy7Iwr8tdY7SsOJkgD+SlXz/Ky7sL+0apoyxMg1b1d7Y029N4bvYmCF2afpJ0M6sEMd++iQu+UJ2COJ/ibUAO3RBxhUXUZ7bwA+YLzBTOOfcLa+HUP8rFoDhQQbR7Swl5Bs5fELasiGVObT4Dd5PDavvToczrbUAhG6GvOafXgMH4PZbNRwaCybMhPBsBG3Qls6rsmypGp/LuylL4A3bi/wCps/bChDXZLEi5k0ArISdzyVsw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM8PR04MB8036.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(396003)(39860400002)(346002)(366004)(136003)(478600001)(6486002)(71200400001)(2906002)(86362001)(110136005)(54906003)(38070700005)(36756003)(41300700001)(316002)(91956017)(186003)(38100700002)(2616005)(6512007)(83380400001)(26005)(6506007)(8936002)(5660300002)(64756008)(66446008)(66476007)(76116006)(66946007)(44832011)(4326008)(8676002)(122000001)(66556008);
 DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-15?Q?I2nhkEtkKTpXE7lnro6Gd8ktlWu68ty8GFxEQ7Aw8vhuwcyrAaV49SjE9?=
 =?iso-8859-15?Q?yivAL6R+8bpmNB16/SAMmTnsAV3gZkwrhwie+N4Hm5ygGMipthsoYo2SH?=
 =?iso-8859-15?Q?eVHaOH2TeWB6QMOkDdzwe3MfZ4W0Y/smmTo0Jfj5fZuHU5itifCQu3T/b?=
 =?iso-8859-15?Q?x11y5QEROloGJ6kHfdETX+RuOTSsMNp75N+PblY/DDWDmI8NAFZ39Ak45?=
 =?iso-8859-15?Q?u+jFGjb+yxTAeV8caPaRR5LmgqZ9xIkFyWHhOfLxlkrhe2+hKl1U+mVFD?=
 =?iso-8859-15?Q?uDfjrL8mt4FDWzijp0+LBlbzJ1x3Eaoj2c4qoyb7P+5AbQf9Bs1wrybLu?=
 =?iso-8859-15?Q?DShn58RlFpv8eeQgiTZqFp3Ctcgi7OkfkNKPJPMXuTwzY/u76PDcKQjM4?=
 =?iso-8859-15?Q?Yf9AU3HxV4y+05YLd2bKWQ1WLPwhJ86+5hkxHTYzrMPwHgysgQa+v3cwW?=
 =?iso-8859-15?Q?/3LIOt+C8nw2k8LVASSPmkHw2zCJ9ufo6tLSRBk33KbfCG6bfVt4oEu7v?=
 =?iso-8859-15?Q?hzBHZcORvbXeeCzxY3ezz+H5xxOtgQoHahRqBW3J6eTQXgsh+1DB7sEX+?=
 =?iso-8859-15?Q?2vr+slhr0Q/a1uIP9+CBdaDdi/QgVye5Y6KSmagyqo+0ROMzHtCNW4Uw8?=
 =?iso-8859-15?Q?uWqTeLkwrUoqoVktjWGMrN0kIEpWEglY/v0Cef3OMPq7hC4Z2DfBR3zqy?=
 =?iso-8859-15?Q?+bXX7SL2Trux4Gvs/rfk0nTyq6WpXJT7WKY0jOQ1RzW8gvmYbmu8935s/?=
 =?iso-8859-15?Q?zoCefCGWH4Qv3ToKfwqlRFzWccbBM04vd+8bp+VpX3LYml/KnzMewivx2?=
 =?iso-8859-15?Q?ouqF07XqPsUWIC38cZ6F2KWeYExv6xcVtSZTbMoEQV/exMPmH1HenYy8T?=
 =?iso-8859-15?Q?Qnkqcbf7gvNxPuy/BMMD2YrJGusD+VJbDWVGeW6Z6wSbdwdYNxRJkzSQn?=
 =?iso-8859-15?Q?nfcM9OcGIzoMBz69P+0LnvsAoZZnDpppjf+rKnx2x22o/wxoUdPZzI6hU?=
 =?iso-8859-15?Q?v36BJfoNy0wBgNgtDXSRqokoOeprRPZnTI5bOUo6rud9z84uIf6++Bo4c?=
 =?iso-8859-15?Q?rp86mAj+T8oFxNg4wqCPP2mMXvDSleW8K2SeyTbJsVM2uG+hwJ9MPehkS?=
 =?iso-8859-15?Q?MtUc64dZGsttbOCVvgfkvaEHI2ik4zqFgT0zXhtJwUPDIK3ayBlNpvju8?=
 =?iso-8859-15?Q?FtDHucLSb9OjPj9uZCFym+2R3SP0VOgfNxSU8HkawJNRlaKMXyys848Tl?=
 =?iso-8859-15?Q?ETw0NLFqx/XBHsM8GgFaGeia9cGtsSXnBcaMl81E6YC/LnlTe7+Y+Bqro?=
 =?iso-8859-15?Q?/SIK48o167PvwkGW5C0zQ6l72p1+dgdi3SjWCF6l00wAdk6AmRgetEzsM?=
 =?iso-8859-15?Q?wJ7djHMu2eVT29cALPub3IP8VUELZM57uGKpfJr73V3FyMUipWRHmqtnX?=
 =?iso-8859-15?Q?H6ek3ihdhd2q7HEawDH2NE/RNSApIfSQIBzP3Q9+aKu4P92FYKvmuBLrY?=
 =?iso-8859-15?Q?H4mtbBBgbuDOkzMkLXRiKeHNLILp74dhNJKIPfg2vPmC0q1IQ8YubMRge?=
 =?iso-8859-15?Q?djiYuIbbAV6yQdts/YaHmIXEapERHxxhJof2QkuzUA7U9+h9z9xhcRrN1?=
 =?iso-8859-15?Q?99Xc3Dwz8LzTj1Qg2m4WAr0MlGZtdVK1roQsJc1XYyy7LBAaVdcaiiuaO?=
 =?iso-8859-15?Q?QSniKhYSOhcrl92WjZYOa2KFng=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB8036.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b7540c9-74bc-4519-ff13-08da80f0952c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2022 08:06:40.8982 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EjW1Ni57DFbg8gyt3Dtb1w1azCKgVNyNicZzCP1eWZH0zHLAW3Jqr7EXlZz36vuBylsmhtWpfWLJU+evQRABhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5149
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
Cc: "linux-lvm@redhat.com" <linux-lvm@redhat.com>,
 "zdenek.kabelac@gmail.com" <zdenek.kabelac@gmail.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <9EDD18820345F143ACE7AB282E499355@eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Wed, 2022-08-17 at 10:11 -0500, David Teigland wrote:
> On Wed, Aug 17, 2022 at 01:41:17PM +0000, Martin Wilck wrote:
> > I like the general idea of the udev watch. It is the magic that
> > causes
> > newly created partitions to magically appear in the system, which
> > is
> > very convenient for users and wouldn't work otherwise. I can see
> > that
> > it might be inappropriate for LVM PVs. We can discuss changing the
> > rules such that the watch is disabled for LVM devices (both PV and
> > LV).
> > I don't claim to overlook all possible side effects, but it might
> > be
> > worth a try. It would mean that newly created LVs, LV size changes
> > etc.
> > would not be visible in the system immediately. I suppose you could
> > work around that in the LVM tools by triggering change events after
> > operations like lvcreate.
>=20
> I think it's worth looking into at least.=A0 udev causes most of our
> major
> problems, and causes things to fall apart everywhere at scale.

My first proposal for a quick workaround for our customer looked like
this:

echo 'ENV{DM_UUID}=3D=3D"mpath-*", OPTIONS+=3D"nowatch"' >\
    /run/udev/rules.d/90-dm-watch.rules

It made the issue disappear. This is obviously not a general solution.
Rather than applying the rule to mpath devices, it would be useful to
apply it to PVs.=A0

lvm could create a temporary rule similar to this one before starting a
pvmove operation (and possibly other operations that involve a lot of
metadata writes). It could actually create a rule specific to those PVs
it's going to change, with minimal side effects. When cleaning up after
the operation, the temporary rule would be removed again, and one
uevent triggered in case some other process had made changes while the
events were blocked. IMO that would be quite a simple solution to the
issue.

Using --vgmetadatacopies is also a nice workaround, but apparently the
default is storing metadata on all PVs.

Regards
Martin

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

