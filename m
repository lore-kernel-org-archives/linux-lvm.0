Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2065.outbound.protection.outlook.com [40.107.22.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5330171DC
	for <linux-lvm@lists.linux.dev>; Tue, 14 Nov 2023 10:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Rm3rmO2i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SDptgh1OM263eoJJMZrWOezitEENPV2VQ2vYOLZTAAvf1j7/O2Q97SbQpxN4q15uHPRafcDyHUcrCADkiXVFkxYY2MDdkapmxPASyLlXfy2mAKvC/+2B1hZYE+Avj8jY9QqI4kEnpPzTn92r6+xGtiqujqbVUkojCORG/a/A3S9v4wI0gDowUSSGAJxMJ0DMbtbaLx8aHK2EflYX0vOU8o8ho9UECZOWFa4st/++2WOX92dkU8aD/7xFHs5gbwKqbom+MiDhcSSCx8czonZLiagql+0fGEx0tvYFVmhT9X2T0wWiOONOCePM53Ke0hNP7na5WHw8C94cKSGxq2QXHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XK5aHS1KHQoDuhuQlz6DTCev7/ZJjCRDy+t9MbCcpzM=;
 b=GjWXLVB5o5b3Lt1jnYqzAqhpSoyf8QvVW6jTEUlGWR0kYaU7CuiFIRGd2b5UA11SZtc1uZ2bqPGJhxu4JHrpvQ1QCPpmG3A8q3mAa5+PD37ATkqlUF2BliVlCxLWZAY3Epc8X3qBr7yKj+qSgRc/xC4ETozswDQhi39/U98DsiRDGW7uL/JfcCKz/2r43a9yJo3Ns1aiZadEj4ztOq4OiNcie6V0/+1E00TzFrsELQRJq7wCPSRaV6kc5lEALv9TikQcNh7BvqRL9pejNTjPMYR6sRyo9quBfOM4QTotrTT1K883IBeLEjft5iYNogmzpJ/n0JpEewMXP8j5m5lHkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XK5aHS1KHQoDuhuQlz6DTCev7/ZJjCRDy+t9MbCcpzM=;
 b=Rm3rmO2iPaeAoHRBa4D/AMBifWg7VleV88ZN5IUDAcm+NT1ZEEyTibySDD4L3EGmapOnBKoHvT3fbV3Ir4nPctI+ACkBHBYnc1BH1nrYX15MBb7LF/7i8yDH2SgbTyYcxamsV/4108dvwmbUev8pwcRSXE+G5yekZjGhnpKYyaPzpbXhX8WCrRKKKQiSnfiVficBliO6+XhlVvqOfnOB7dDptfUyNVnSgK2sPWL18M5SfMaIIIfY9WeDbi+G7mC6EGnhhgUpjqSQoM+SboKJKEPqqasp9VwqkDK1uPI33gUWrq7NMbQ7yRRxnKzv0Tthj2gKC8Y+uHwZk9t2PT+i6w==
Received: from AM0PR04MB6324.eurprd04.prod.outlook.com (2603:10a6:208:13f::12)
 by PR3PR04MB7275.eurprd04.prod.outlook.com (2603:10a6:102:8d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.15; Tue, 14 Nov
 2023 10:44:02 +0000
Received: from AM0PR04MB6324.eurprd04.prod.outlook.com
 ([fe80::5c82:3111:897d:74ab]) by AM0PR04MB6324.eurprd04.prod.outlook.com
 ([fe80::5c82:3111:897d:74ab%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 10:44:02 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: Heming Zhao <heming.zhao@suse.com>, "teigland@redhat.com"
	<teigland@redhat.com>, "prajnoha@redhat.com" <prajnoha@redhat.com>
CC: "zkabelac@redhat.com" <zkabelac@redhat.com>, "bmarzins@redhat.com"
	<bmarzins@redhat.com>, Glass Su <glass.su@suse.com>, "hare@suse.de"
	<hare@suse.de>, "linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
Subject: Re: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
Thread-Topic: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
Thread-Index: AQHaFJ3iDFYd3KQH70a+UW68GS9ZyrB4SCEPgABPtICAAQ3kgA==
Date: Tue, 14 Nov 2023 10:44:02 +0000
Message-ID: <0bad121644deb8bf67329f111f0ba34ea261e988.camel@suse.com>
References: <74b83545-abe7-432c-ae19-814b289a6ff0@suse.com>
	 <6c7699678ceebca58c56aaa769c2a7b9a6092883.camel@suse.com>
	 <23d98f61-f9e1-494a-be3c-df9531f4f70b@redhat.com>
	 <ZVJtCxq7XeCg_G-g@redhat.com>
In-Reply-To: <ZVJtCxq7XeCg_G-g@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.50.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB6324:EE_|PR3PR04MB7275:EE_
x-ms-office365-filtering-correlation-id: 7a71e711-cc68-46a7-4a4a-08dbe4fe9dcc
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 cIltIuS9E9fQgtTa3tkNyOkaX+eQT9+Urs0MWGJPuen8x7fNu0WoboRpT2tRX415iQwlMylYoGyAzg6NL21EKtDbMnZ4XG4s6FoB/y8ctDeQgVV08/YaW5N/LqBAkoko4ZtC+FAuUpJBByialIi5Qknjf8ooujnvJ5zMV3OLIwEy1XORZF4/YMWn/Sqy4MgoBBBrZpv8FSOA36N+h93nCo7cVkprSRV9XAA2ixgz61TjF6DUXUJ4D889Yds1DqXJ1LrYrTjKPJ0tMfjEl25x+FT1ziZVjHqjayy/Ea46z5WOFWsj0NlH1s4Hfk+gGT3F+jghnvkmOPUh8OVoPk+P7JGKs4j2gi2sfpK52VhFremo10/NIlijkFVqbUpDL0+J4r19YcVvurFwligOA18EDCHq/R3o0QOWB6nEqRNJwdcz3D4ITxG0sxz5yyljxUNilsR951Wbgm3oST5Vo7CIp9sMy3ybEmMnF5ua7dCwOsQUf8+SrSTzrLELWSXFxeHnfTJoFJXsCOo6CPmHxePlrdd9nRuxm2zZNdLOrU6QnsKWnU9a5C8PhpunvfxQ16d0kbedKYDvrOa6EEt695u1qpa/p5aU8RVBWc36i5EhQBLSP8zobELC4BhOCPwphQLdTAAJ9gE9l79/QEPKnVvDty0aSWbhIsLBVZh9LXCZl3HBFkXZdn6zEpEuGcmeop+bRzEOrL8dwfi6gkIGDM6EVw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6324.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(396003)(366004)(346002)(376002)(230173577357003)(230922051799003)(230273577357003)(64100799003)(451199024)(1800799009)(186009)(2616005)(38100700002)(44832011)(53546011)(83380400001)(122000001)(26005)(6512007)(6506007)(6486002)(478600001)(71200400001)(110136005)(66476007)(76116006)(66446008)(64756008)(66556008)(54906003)(66946007)(316002)(4001150100001)(36756003)(41300700001)(38070700009)(4326008)(8676002)(8936002)(2906002)(86362001)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-15?Q?25NBaSGo6HCKWwspRrj5vuQE6dh6qxINDTzgT4l1xUSDDO6BE5+DonjCw?=
 =?iso-8859-15?Q?1EdcGEo8iPaPHMzxS2ucdp0FKO0aG4rB1n4cMFlEGNkQWOS2KkCZYwfmt?=
 =?iso-8859-15?Q?vz9UxII24y4Xe92LTcO7hghDr6vHOoUN8R11z8B4XfAqsxZ8HlBbJTqPF?=
 =?iso-8859-15?Q?jpx1z3zArnz3Y1y/YMiyBVhtWm17p+N/Ow/jzO3YBkeGmeslSOxFKcEr6?=
 =?iso-8859-15?Q?PbiaKfR2V03/WbQRRx2wUxneFtcmcwdIBEF0cgwJ9b+0VyFaSYWoq4Wgs?=
 =?iso-8859-15?Q?jCSAUclweEJX9Ixh/AO4rFqDrHwZCkr50C4QgeAREMYSbxbB3Hgk/2nqy?=
 =?iso-8859-15?Q?1rCTozVj81ubfVII4PMoPestWNkZKPSC+CA+Jc8CaBBe5eQA6t0veN49T?=
 =?iso-8859-15?Q?rq4LT4w995u82eOIJ8ENsY22GpZ1Bf/wPkCDymx6R+G0B9761k/4MNax4?=
 =?iso-8859-15?Q?si5MGionR2um6l2NcIYTdpb/8dxQXrNni+XL0d4PNFWy6E006sZcbtlZb?=
 =?iso-8859-15?Q?XJ0oaP/G39om4U7ba61pi/0slz8Y4Mwv+ERquJdi96vgDRTS3m3vriKbD?=
 =?iso-8859-15?Q?H+1MP5gIaGCi2HNYP6cEYKzCYlH51HxKzqykGNuHttVBzaJrP8xNPNAZc?=
 =?iso-8859-15?Q?4yy7CMA1zDcM3JYzEIDBxAbRSWmBRntPpyho17V3tNKw8fiBya1OjMpX3?=
 =?iso-8859-15?Q?6VIwzkLzKqShXTrrEtKBIbIGw2I4xax/SeFxD0odvLJUHe9YXjrueq8g+?=
 =?iso-8859-15?Q?2Sud4v7AQw5Y0JZdXJYgYe22uMsgCPC5PfhenGxoVfdpVbc5d65HNpnd3?=
 =?iso-8859-15?Q?YKgKp07XpMQ83Eeign9YZg5/b8mwRhor1fVQKuxzSUuCgfzTPWrD/Ptm1?=
 =?iso-8859-15?Q?DGq6SDx9vp7Rbz5uFLFAWzxomq0X7jg7ZdNrzdi8vMr63dGLUc2UxwabM?=
 =?iso-8859-15?Q?3R6XdDZVnLmd8cmONHWBDZ4vkJ+mzpH5Y//D3f/YCjQNJQMDA9JIkpA/L?=
 =?iso-8859-15?Q?1LRWcN8cOriSUWNkPwYVGE2yBvnEE8DfgCXFA1gTmg20FETFO/ZvxEXhk?=
 =?iso-8859-15?Q?RJoTepS9Uf3RbBJP7x/wWF8CwA/xJmNR8rxcANUhYGYxS2OLqXuNLIp9I?=
 =?iso-8859-15?Q?m8V+ITC/O4ZX8oRfyXNWBQWocqvj/lxsbAC1YkejZFPIkQB8Li2LFjO2+?=
 =?iso-8859-15?Q?5guCrE5ao1Cbvq6+dV6JMiyZGe8MFJyT/bLoVAxpfqm1Twox8PpddMSH0?=
 =?iso-8859-15?Q?752L05RFvYu0xWRbX4g4TCOF8hySaOTVK6RNW6RHISd6qRrxTkkDu+7cy?=
 =?iso-8859-15?Q?mX/N0VThE+ucTT+Ub9/arYn4HUrgVoRy2A9M7tl8KyUGXSMld1bZN3sM8?=
 =?iso-8859-15?Q?9qYWGZLDVX6ltRT+7mvgRGhMw631uPc70rbjngXLMRWNB1msZiycwjCv1?=
 =?iso-8859-15?Q?fvNwaARXKGGrqnYZMWOyl6tq8tzEK3X5gKq8z97VNk5mlOqBaVzXEkc+s?=
 =?iso-8859-15?Q?VeGQUvkxbrYuHohemCq0aQEF3uarrj7biw9KkWrL32TTJOGPjSvV/Kqxh?=
 =?iso-8859-15?Q?Zhb+hx9MVLhhXW5hHbgPf6tsr/mveg3oS8OVF6ZwXhECYjE+zxHEKxnCb?=
 =?iso-8859-15?Q?C0+gm7b63bLuqlrkBwQLY+NQTo/w6phU2npB3NsO7BPfcEV28zw9gdJH/?=
 =?iso-8859-15?Q?0/8DbCoDUsaLqz04D3D6duMpCw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <34B53E08E57E4044ACE27A679E69C23C@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6324.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a71e711-cc68-46a7-4a4a-08dbe4fe9dcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2023 10:44:02.3063
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QfhD0FIDreq6V21UFRt1eM6zYwd3HGCcR9hXgTs0zNG5P9P6Z9gWsBo53rjeeMyAevdQ3zviE8ViE1wjXTKOTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7275

On Mon, 2023-11-13 at 12:38 -0600, David Teigland wrote:
> On Mon, Nov 13, 2023 at 02:52:39PM +0100, Peter Rajnoha wrote:
> > On 11/13/23 12:52, Martin Wilck wrote:
> > > I can't stress enough that this is *the only mechanism* that
> > > works
> > > correctly. udev serves as central hub to retrieve device
> > > properties
> > > from, and this is how it ought to be.
> >=20
> > Indeed, that was exactly one of the primary reasons the
> > 'external_device_info_source=3D"udev"' was added. Reimplementing
> > other
> > subsystem's logic is wrong because there's always some intrinsic
> > logic
> > there that may be omitted. Sooner or later, such approach will
> > fail.
> >=20
> > I agree with you here.
> >=20
> > If not sharing information through udev due to various kinds of
> > hatred
> > about this part of the system, then alternatively, at least,
> > calling a
> > multipath library function from LVM to do the job.
>=20
> Hi, a number of things haven't been mentioned or noticed:
>=20
> - In general, it's old versions of lvm that we're discussing here.
> Current lvm uses system.devices by default, where none of this is
> relevant.=A0 We can just turn off a number of filters when
> system.devices is
> in use, including filter-mpath and filter-md.=A0 It may still be
> interesting
> to look at improvements, but the context for that is older stable,
> released versions.

I haven't looked into "system.devices" so far. Is there a high-level
description of this feature available somewhere? A link would be
appreciated. On (open)SUSE, afaik, system.device is not used (Heming,
correct me if I am wrong).

> - In RHEL8 (no system.devices by default, and some older
> systemd/udev),
> lvm can't touch udev without causing timeouts booting with many
> devices.
> Nothing I tried apart from reading wwids would help.=A0 Boot timeouts
> were a
> big support burden, and the motivation for the changes.=A0 (All of this
> added motivation for system.devices.)

We used to see such phenomena, too, but haven't seen them any more
since SLE15-SP4 (~1.5y).=A0Perhaps the most important change at the time
was to start multipathd early, before udev, during boot rather than
waiting for "udevadm settle". But there have been lots of updates in
the various components involved (see list in my last post), so that's
just a guess.

> - To make filter-mpath use udev info, and prevent lvm from using
> wwids,
> you can set external_device_info_source=3Dudev and
> multipath_wwids_file=3D"".
> I think this will be an effective way to avoid any false positive
> problems from native detection.

Good to know, but that's kind of counter-intuitive. I'd prefer
if external_device_info_source=3Dudev did what the name says, and a new
mode ("external_device_info_source=3Dhybrid", say) was introduced for the
current behavior.

Can a distribution set multipath_wwids_file=3D"" by default without
undesired side effects?

Thanks,
Martin

