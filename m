Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2058.outbound.protection.outlook.com [40.107.8.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAE34683
	for <linux-lvm@lists.linux.dev>; Wed, 15 Nov 2023 07:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BivK6ozl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nJaeFGF5xrfHvTBtG6QPaWYS17HmJrsHxiI1qKrr7Kwg9X8Ia87/zIlloU+TieSrOJdl3VXs9qys7JOQmyMT8Rpr7VdTfeq5tXnkV2V56nlAl4Dh8XO0cKKZGioz5o76XboBGn6IKJQXZa1A992dlW3ZAj4RshxsO/1rSr/q/dyzX9VUNSQ87nOEPYU2FLGtwMRjW7ou6OEv7IjawVV4GpSFvk7nMa3ln3BR/D66hMYUdb+f3JrMEYTwvlRVLS8VC8LHl4dJLFtscSn0Xg/juW8G92dzfM0ihhU09/sB+pCd7vGc+vkZeHdwdckqTqY5ycptk1R6FbMH2L+7ltcEFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f918+n8tQaZ4kG2ozj/Ue+DHWaesIXOddL4yew3v6uQ=;
 b=nJZEbIDCZ+QqlCzSZltJxRsLGhOeTDFIcM2r95NupWXN/em5PpPWEa09wqpRW/qHHTq1SFmEO/rLl8Ep1DwDnaGJsh0AidxNq19sidV+v0HojXcpA19QgO9HOMutHvLftGepwsKIqdXAVT6SbP/phQz3NTgW7HD05eTjBZTo546hWc+tT0Sfsxfq/SwgNGYMv/g0GYlfnOeQ1lYva/xsIk804BqeauBo8DXy9qETEwhfFbxbnoyenDXd8a4ayyrKw9yaWUnrGyxjowmaD9c4+ZdXYs71E8HtPJ8c3O9ik1/3pmGqFARHfhVAuqTrn/16/oT9M1XmXP2FQHexG7LoeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f918+n8tQaZ4kG2ozj/Ue+DHWaesIXOddL4yew3v6uQ=;
 b=BivK6ozlulIwSh+GNSuHqX5oUHXKIbhAhAmlWqZvreZVlTW4/0g4tYqJ0vKgzXa1gTFs2v0gwwUzfEKHW1BU2uRLrd2t6w/ecFE78aiVCXHVu/U+1jb4xNtG+8/KAkfSy7bWjUDkyTMajHhE96Pp4YDBQgvhY9bmOE8wWw1gUBp4/WP2p4XNS1e0WE4iSO07cakOdWXqjYq3gUPfb5VdgWtD+FsorCLnu2EPfQM+CkleU5kwdIRBaD1wdX/41gsDWMF0ca0fjNpJSKwdCSK7C7cF0pIJYiCGmbv/twNTIIk1JMEGOolq1yccdEyKQoumJg0aiSW6Q6r+ZU3FC6GjSg==
Received: from AM0PR04MB6324.eurprd04.prod.outlook.com (2603:10a6:208:13f::12)
 by AS8PR04MB8295.eurprd04.prod.outlook.com (2603:10a6:20b:3b0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Wed, 15 Nov
 2023 07:35:49 +0000
Received: from AM0PR04MB6324.eurprd04.prod.outlook.com
 ([fe80::5c82:3111:897d:74ab]) by AM0PR04MB6324.eurprd04.prod.outlook.com
 ([fe80::5c82:3111:897d:74ab%6]) with mapi id 15.20.7002.018; Wed, 15 Nov 2023
 07:35:49 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: "teigland@redhat.com" <teigland@redhat.com>
CC: Heming Zhao <heming.zhao@suse.com>, "zkabelac@redhat.com"
	<zkabelac@redhat.com>, Glass Su <glass.su@suse.com>,
	"linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>, "hare@suse.de"
	<hare@suse.de>, "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"prajnoha@redhat.com" <prajnoha@redhat.com>
Subject: Re: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
Thread-Topic: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
Thread-Index: AQHaFJ3iDFYd3KQH70a+UW68GS9ZyrB4SCEPgABPtICAAXcNEIAAQ7ZogACw3wA=
Date: Wed, 15 Nov 2023 07:35:49 +0000
Message-ID: <b98eec68190ca5f615cceb041a3a7b9b3f0bebb8.camel@suse.com>
References: <74b83545-abe7-432c-ae19-814b289a6ff0@suse.com>
	 <6c7699678ceebca58c56aaa769c2a7b9a6092883.camel@suse.com>
	 <23d98f61-f9e1-494a-be3c-df9531f4f70b@redhat.com>
	 <ZVJtCxq7XeCg_G-g@redhat.com>
	 <0bad121644deb8bf67329f111f0ba34ea261e988.camel@suse.com>
	 <ZVOnoCjNmOYToBpt@redhat.com>
	 <38458148cb14bf398aa3c6912842ddda79b81115.camel@suse.com>
	 <84c0588a5b6a8142459a482c25f82bc6d15b19c3.camel@suse.com>
	 <ZVPgawjni9m6vYd9@redhat.com>
In-Reply-To: <ZVPgawjni9m6vYd9@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.50.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB6324:EE_|AS8PR04MB8295:EE_
x-ms-office365-filtering-correlation-id: d9079c73-21b5-42b2-7145-08dbe5ad7d4f
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Sp4sUlBBVP5XkGIYZZ3eCH/WxazSnYG/RgGlSgvnTgh8YTasfgI6Sxzn/E/eCQtH++yL0uJY1ikp9/H/NQImWLH0eVY22+ZjeJvtE9hw4fcrpOBDVCoMBxMAskvVrDx5IKmnEmfn+gHBTvu0/zrVAv3+NfDy8lAeCX4pKVlmgR6GI8MBUxGl1fuqXyVV4lwi5hTbswPqVCv4WoHKv0DEKnDvn+3Rj26Wb5K0jiMQg6D04JH0U5J6lMV0e3oD+2Bu8xghHn37b3h11KvZ6RiPuwDirurFBUCJkCz21l7BFJwYoZ2n3TITae83lLdCAmiTGpT+lrnannxV/f6bpELLJPWrOwEtOewe6EEKZ7QMo0wz4CfBrdfUwys3o2qvjKEUA/+kokmj+H9ghs1q8gjFc4rupSqF6HulKUJTMRk9eNfXJy2z2oqEp3ZGhr/8NkuB+0HHNN/Hq4/XM2ropribSsJa9piJmE8Jyp1I0SyrbU8cahivLF3dX5TT91C4ZelDEeLHXkZkrPOcRpm6BpU4aQsHArImLGA9bmj4GNB++hC/A3CWGzFiRyqJXvNmvQbK7KO2qwZXKwn5NaYDNMKgTipCkm2enk5zRzRQCJqNHegEjEh8j24qDmftNfL69dl7
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6324.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39860400002)(366004)(136003)(396003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(2616005)(6512007)(8676002)(26005)(38070700009)(6486002)(4001150100001)(44832011)(8936002)(86362001)(36756003)(76116006)(5660300002)(41300700001)(2906002)(6916009)(66446008)(64756008)(66946007)(54906003)(4326008)(316002)(66476007)(66556008)(71200400001)(6506007)(478600001)(38100700002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-15?Q?JByhcOkV6r7mIlveZwsKdk7IB6XdPmlcSrQJkOzZYu8KOOQ3F49pqgj3W?=
 =?iso-8859-15?Q?PRmw7vygvDB0LnZcdeDrKFAev0HlFCsLyl3uA0R1Bce8MMbUewM1eZhVl?=
 =?iso-8859-15?Q?VpnXCnBI5VHP3Zu2WJXgH7wp0F/wjMlbw3RM1BjC/Wz3OecHroIib8dYX?=
 =?iso-8859-15?Q?uK0CRnl0zuneZXdqC5f/gE4NUW1rVy/v8MJxDyQePpiKrvoNpc2EQB/nT?=
 =?iso-8859-15?Q?QafDRlofstdlxD3wo9YgsotVXN3xJxi9QwXfWFYtvmkp7iBVIQJR0Y6G2?=
 =?iso-8859-15?Q?858vbXqBEZgwqXM3sGk22cWDmVq3kQ/usUuEitnG4b9T0Gu4QhytV4Dtb?=
 =?iso-8859-15?Q?CKtpcoyk4gJ89GAr7+j9txs6Hyb+t9Ps9W7ch3ZV3xdw6tC+ob1omHdbB?=
 =?iso-8859-15?Q?8px0aWSLWHK1Pfte1lgGptr8+BaK1CP9tM4oZicpgFpeRRD3LvrL/3qxP?=
 =?iso-8859-15?Q?nX9KfrrbMTQjsJ0Hgf5d8cPeHoK1jdT3YE3KD1NsyHDY4Antvzs6jnC5D?=
 =?iso-8859-15?Q?37MiLg0gh74mlvp2X6j7L7BM5Vb78FGdeKIvAEG/RVDulYFMYJFsWLoM7?=
 =?iso-8859-15?Q?U6+5bh15flgKgaT2aoaCpO2z1eAFhQrN7HwtoQ7NOJSwBqEreSupEQd3W?=
 =?iso-8859-15?Q?cZtMLqmjAv2zqLsuZeZnciiO/Cch1fMgLxWBRuP6vcovPc9w/XfVhkr+O?=
 =?iso-8859-15?Q?9BhXQY6M9eKI0vQldqm//tld5n+830gBYAGdDHHkXIX3nFik+wyQwiCRl?=
 =?iso-8859-15?Q?/I/ZUfvMwd9l0Tc71zYlrd8EBuDdKnCZySaiQ8mbsdN0ZNMCfU98doUam?=
 =?iso-8859-15?Q?ph77Qce3cVktAU/xROQbtQzcEWX16GT7vVfY0fWoKE9uZmxKhSWlqpRrP?=
 =?iso-8859-15?Q?PCy+zvYQm1or3RaMsAOiquDHUz9+nL76LYVLLo2IWPdah35Nt1rKbsSey?=
 =?iso-8859-15?Q?C0qXsJBUfdq7DDTLoQ7PFf3zM3Iuuo22KpngGnQVgMmtAZedrnIxv2dAI?=
 =?iso-8859-15?Q?7etYddidbTwOtOIXUQuhNjtM7y2yGdKmul9Fxfv8mDfAH4Cy7SvuTmOde?=
 =?iso-8859-15?Q?vXnkB/fzEm/WW12bCykhmS5bKSU4l3JUa8KY44JjgyXNrS2FYsOL0pBF5?=
 =?iso-8859-15?Q?x6AfmF6JAHlQpoFEFo6ikptyCBlOf66rNRtE6hLnjU4vYMekZRakMDioW?=
 =?iso-8859-15?Q?QeeYHj241of9I7L3y4XC6pMjCK4B+/VJyQ84AodI34ufV5nf3bJqezdQB?=
 =?iso-8859-15?Q?Bu71IOgh39iSDFDAA7FkhPZNEJ25LhgcjSwKmYuny2o8dRMYkYbWlEaE1?=
 =?iso-8859-15?Q?+kTEeA53f7neEdjtoeC0s73WADD1VSRRbR8d+raJhbgX5nb++RDE0Qbji?=
 =?iso-8859-15?Q?uoU+S7K/BmxmXT6em6TtmUgwllINx14eiFqYhcBf5CjVz8AfP7l9vuzvu?=
 =?iso-8859-15?Q?I4FfPe5LdfBJSuB+tRQyrqBmWom057ZKiYd+FKibV5sBVY9izfmdjDudY?=
 =?iso-8859-15?Q?RjOdElvjIAG4HdG556NSNVdfhwBLzz1VGX/Xeo7U+nlV2yE9IuV8h2VNX?=
 =?iso-8859-15?Q?RS1usBSErbtTnAuMey/Bx4UScX87f7otyh4UGQAyhBjWQnV+9MFbmF7jS?=
 =?iso-8859-15?Q?0N6q4FYRdwyLpIsVt+rUoswjsl7HNx4CiaTSZ2MWb0k07ZAIb1CuuXhki?=
 =?iso-8859-15?Q?JT1PDKmsAPa2a/+X27lv3HZYwQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <4726E14EBCEA8241A497E5D8E7C7CBE2@eurprd04.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d9079c73-21b5-42b2-7145-08dbe5ad7d4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2023 07:35:49.7114
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6cTfS4f7SZD3YnfPwHaEdvy3eqf+5rGCdQDaIEcKOW853fcS1PZvsZZHzp9lyajRFmhR8dnorxQRlQ7N81Kayg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8295

On Tue, 2023-11-14 at 15:02 -0600, David Teigland wrote:
>=20
> LVM will automatically, and only, allow mpath_uuid for multipath
> devices.
>=20
> There is a special case that we look for in which a device is used by
> itself originally, and included in system.devices with its wwid.=A0
> Later,
> multipath is set up on that device.=A0 When the multipath device is
> added to
> system.devices, the component device is automatically removed.

How would that addition of the multipath device come to pass?
By someone explicitly calling "lvmdevices" on it?

1 - someone creates a PV on a normal single-path SCSI device
2 - on subsequent boot, a new path has been added (e.g. by a Fibre
Channel zoning change)
3 - what happens before the user makes any change to system.devices?
    a) LVM attempts to add one of the SCSI (path) devices as PV
       (which might be grabbed by multipathd already)
    b) LVM attempts to add the multipath device automatically,
       somehow figuring out what happened
    c) neither is attempted, and the PV is missing

Thanks,
Martin

