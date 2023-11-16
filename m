Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2060.outbound.protection.outlook.com [40.107.21.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3475833061
	for <linux-lvm@lists.linux.dev>; Thu, 16 Nov 2023 15:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NUzz2P7p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GYRQcYF/5RVdjv8wTsuqdXPUaOeKt5TVQ4ju7dP16lbqM4VHsJM131g7eVatE2xXxt7N231nPyf/qvXTnG1jWqqJH1T+L9VK/0PIwaiqoP5xuOdgtjaDHhKSBjPby8Hy34nYZLLAtwQKAHu7g48AZ6PJR1YNXWwVRMMSpB+WK72wrMizB17h6/xR5S7c/NosamIOD1//dyRBcnDv9AROdhMtIKqdFCjIQBcNs2JKdWM87zIs7+pCT9bBpkaF3+aAb/uDFoTojQYP7IC6g9urdqo1woyXwZVZmY28qLbJagUE5CjCHLsSj2T8lUScSamsyZ+5xqjc/w1zxK9lzGXT4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ovuzFzyGtL6tQA0Opbt9kjudKdrk6IKze5PoYztExqI=;
 b=Rqztpm3ANAFCaWPiS4Hg5cnHEeHNS0JcxQcv9JqPjCuRIG4u/NZHY/xeuNdhkNgVeC5rWk8I0sjHm6iMDTHAEWdLKu+x1Mune0qkX7j0vmA+62hzDASRIOq+RK1Dl4d8OFCEtmVVQP6I9o4QNLy7Ux9/V0V8Z9gqw7W/88EQDZtWA92MEynRi5YHwqVZM8qDpSB3/46G9MuiEGbHSEF4c6y3zTVU4MBrZ9+klFFRjnteYihgQCtvIMUz3YN/0i86SiUopgO9Zjo+/02apK+0x8FkrugqeSw4DtpUtbHIdL1EC5pulTSohs/Y1LO5E0/DTqPDzHI7lqFovm0TiSBzBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ovuzFzyGtL6tQA0Opbt9kjudKdrk6IKze5PoYztExqI=;
 b=NUzz2P7pTwslUBP+EkkwvVXpb5jjZW5sMedwH0qmU8UdgOFMmoxBUsCyO+nhlB6sAxpioZn7NUsMy9NdFi7zhOHunNFaEfseitnmTagn0jrhl8aQSXZI0eZdpH4YiFpEzDl5ZaQ+DWIx28mxvVabI/7Yjwnsa2f08WEc2tpdMX2D2V20CsW7CYTRkoeXAbvB2hsDGgP+u5erevsR4okO2lVRyLcdGXx0SnOxeREdyDLg2RvJZgKpYsTZy1ZK9YABpOuSo3P+AEZwScmFo+x7Hmjh/sNdcUVGeDedqF0ekSYd3q6IWRG5YE3p0KHwVQkcxHHWhbwNeTdiJRUkxbKd+A==
Received: from AM0PR04MB6324.eurprd04.prod.outlook.com (2603:10a6:208:13f::12)
 by PA4PR04MB7679.eurprd04.prod.outlook.com (2603:10a6:102:e0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Thu, 16 Nov
 2023 15:29:43 +0000
Received: from AM0PR04MB6324.eurprd04.prod.outlook.com
 ([fe80::5c82:3111:897d:74ab]) by AM0PR04MB6324.eurprd04.prod.outlook.com
 ([fe80::5c82:3111:897d:74ab%6]) with mapi id 15.20.7025.007; Thu, 16 Nov 2023
 15:29:42 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: "zkabelac@redhat.com" <zkabelac@redhat.com>, Heming Zhao
	<heming.zhao@suse.com>, "teigland@redhat.com" <teigland@redhat.com>
CC: "bmarzins@redhat.com" <bmarzins@redhat.com>, Glass Su <glass.su@suse.com>,
	"hare@suse.de" <hare@suse.de>, "prajnoha@redhat.com" <prajnoha@redhat.com>,
	"linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
Subject: Re: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
Thread-Topic: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
Thread-Index:
 AQHaFJ3iDFYd3KQH70a+UW68GS9ZyrB4SCEPgABPtICAAN7ZgIAAj8kAgAESGoCAAC5HgIAAfyMAgAE0zICAAAem1oAAF8aA
Date: Thu, 16 Nov 2023 15:29:42 +0000
Message-ID: <cd0e67fb0712b803b835a0a82d5147b5175b65be.camel@suse.com>
References: <74b83545-abe7-432c-ae19-814b289a6ff0@suse.com>
	 <6c7699678ceebca58c56aaa769c2a7b9a6092883.camel@suse.com>
	 <23d98f61-f9e1-494a-be3c-df9531f4f70b@redhat.com>
	 <ZVJtCxq7XeCg_G-g@redhat.com>
	 <177c4b2f-3b4b-44e0-9391-3df007cafe36@redhat.com>
	 <ZVOgmGx-EIpMF54F@redhat.com>
	 <194d20b7-e3b0-43d6-95e1-1a7d56eab506@redhat.com>
	 <037a0ba9-76fc-469c-ac96-11981391903b@suse.com>
	 <ZVUYAJyEe5fNh4SN@redhat.com>
	 <e64bbbc8-1716-4739-a68c-2f92563a9c8d@redhat.com>
	 <12b4acebc76db5a3d85a2a9c9c275255a848f922.camel@suse.com>
	 <c1b148d3-d27e-4d94-aeff-a6bc13996005@redhat.com>
In-Reply-To: <c1b148d3-d27e-4d94-aeff-a6bc13996005@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.50.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB6324:EE_|PA4PR04MB7679:EE_
x-ms-office365-filtering-correlation-id: 61718331-42f6-4f44-151d-08dbe6b8db28
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Uw5pulBFmYIl5o+yEsm+akak9TtONXK7lQfmPbUDAtPiZcqWsR+UBsQgsCyIiD6I26MVeq0UnFmUZQEez/iL3pvNuzOr9Y2BvD25caguNb5Yehr3qGhOOrZKw6KfO820CPByXrk5rAFeitFikcuYEFJOWePlyKKpiAuOKSEK++no6jDO114yZps77CrKmtCyXEL08siBrkSi+zFqUY2vNH7ndMv8m8BD5Ly+UL0q2lpsBaiqYwYdwKMD+na9f3c0JXz8YtgQ7LPnvB1oM40VYt/wbIeOq1gsTDtBFHp3VcccOoKcCGlRwlHvDxrlM9+YeLCWuGwqGYAo8gKLixym1aIrx3UwWDjV967bxv/zo5CQ6RSxIJJBhvsBTqZ+THhD6cQeJDgJAas9OMAXDXYyVXrFfWAAaRAKBvwfVQN3ta2BT7W7fTRrCKXYRV8Y4WuZhOWLs5OS19W5GqFXsnJeQpa3ZiEHqy1qWSqnxHlzC1H7igZA5Z2qIqErmkxgXHiiFhLS+q1ylh4Dy0hrLVsnp4EunyB43xFdt2hOvKcVWZVAtRaVxl253Px/RqsJ3lvjZVCVkDGXywOxHPjGPogpCe+y39sfSv9Sv/FUojcPNsRNrL5inIOVmJhsgRp2oO3Z
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6324.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(346002)(376002)(396003)(366004)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(4001150100001)(2906002)(4744005)(5660300002)(41300700001)(66446008)(6486002)(38070700009)(54906003)(66946007)(64756008)(66476007)(86362001)(38100700002)(36756003)(76116006)(26005)(122000001)(2616005)(478600001)(71200400001)(6506007)(6512007)(110136005)(83380400001)(44832011)(8676002)(316002)(8936002)(66556008)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-15?Q?b6W4d9xKYNhZsrg2052sPas/UsT56tt7HvCk+F6PkCjWwLUVSC2A6TgDA?=
 =?iso-8859-15?Q?UreVWHx1p5Klc3nLGf8jfMSh7Nt7Y1UgRB/IdWZf6tvGIP23QUXLKNrmr?=
 =?iso-8859-15?Q?c9qru8gjvpd6S8JUE73l+wpyezASswjI+gm5DSrZJZ12uRMgc90IUjFoG?=
 =?iso-8859-15?Q?attSLFPEBLLUtSp61BlGwTx2OfqFwSVH1XemTKKIAQEO44O9G1LE/tCu8?=
 =?iso-8859-15?Q?vfQEpc7H7eAE5hyPNydXscZAZ2++5DcI4SwRI77JMMtUo3XOPzKkapmuf?=
 =?iso-8859-15?Q?MhKn9Rgan172WhvRJXulUTnhT4K76HCM1PnsYQNf8C93CABRTxASaiGij?=
 =?iso-8859-15?Q?8FeQknLX5vH47QqIhHO0umeIcQNPpxzSXZMehbKkGZU33rjr4fOMg9wD9?=
 =?iso-8859-15?Q?D0BfEJPMI1Gp9Htbna89P4LTNpNjBpr/tJ3js+ufJ+jhou+YWLmDXmtRC?=
 =?iso-8859-15?Q?pHaC5sesfDTiWxo4j1s5WxrSfWDod0/DCanvrrSmho/6zcTFb+LLwGKqU?=
 =?iso-8859-15?Q?JQPj+DYBZBhAHmTDIJ2jGmTXSW1wIJVr+aAlJ+SRzmpv8OcZBOLQWvDJ4?=
 =?iso-8859-15?Q?6MTj7evj3ikVzndbQMVweYg1qHyQ2S3YX/1zEQQsTAq7y8vszqpE8WnEP?=
 =?iso-8859-15?Q?ezeA0DS3eZ2AcCOwGgWPPhReIpU9xkRohcjuljDepAftI6w+ops4LNTEA?=
 =?iso-8859-15?Q?+pgtnQU/Q44hzj3eLhENJFHSyUOrsnpAnbk1RLEDQooiPnjuRS0SZPXRD?=
 =?iso-8859-15?Q?U/etPVJgKghhOKYhUxBG3qVbTrmxlcLwAufg9Lict9e5HlngnCt5tR2+Q?=
 =?iso-8859-15?Q?LO22tSnwbviQJy7gl3Fj1P3lu4KUv84Dgprs7c7P7vGmC22y84+TB1nr3?=
 =?iso-8859-15?Q?N1ZI6+sS5GMHdi/G/TPyKDhcmS3+tYSGgc+wBGeFkt8HYjpPqM9+21jNo?=
 =?iso-8859-15?Q?FCwpo1gJaGj7DFMjm5F9jeMiO9NTYOgQR05Ht2O/b6EwWJOszaoJjxo/Z?=
 =?iso-8859-15?Q?KDpb+/ntj+EWaa7jmCzgj/7QXcK07sCv7O2uuzG3N0nTN3EW0q+BjfhV5?=
 =?iso-8859-15?Q?xip3XlrSFrLuP0XQ/fjYkEcU9TlS1HA35vuqEFNqIi0HCkSehbpSA1WlZ?=
 =?iso-8859-15?Q?hzLRk4XTQiVl1IzTwKxn1ocOIW80JdjYSG3n5RqavxSMeOVwNdV39vM7I?=
 =?iso-8859-15?Q?UYrg8G8Nc7pDjgqiM3a9La0Uht0BoMQRJKTbOHQlWpM0QSe89NEM1qDCw?=
 =?iso-8859-15?Q?rFcFoW8d5FgE2eaQzvzTMCgOF3Hx/vHS5wKZVYnUG4Xe6Nvntt6zHmeS8?=
 =?iso-8859-15?Q?c3OoL98OnJn+W2uJ+GGW0+0USS675blxXxR0qbu1/z1uHSuBAWmFmjOGd?=
 =?iso-8859-15?Q?21uniX7TXvCMreysc5urOODCVihbg/DxVGsRxlcLZnw1UeYkBSZ/eUMkp?=
 =?iso-8859-15?Q?raf84YKCJ+JpZTzaKiyBqmNwp8RWODmrhwKOUjqkNTghrV1MATRIXIgua?=
 =?iso-8859-15?Q?l33VaXcB+w+NKpAoZcUYwnXTpndrAimu0UcsjHiSj2w8JVmGvr0+Ytw1p?=
 =?iso-8859-15?Q?vN4CLJBtHa9/7lFwvWBXSPNtkZLu624oXbZ6vxhRQPmxRLXxjx7kpBkR2?=
 =?iso-8859-15?Q?plPdhykBKTKO8Wb5PbTqUizdkP/UIlD6fx3LvHL66LrxPbEOLtUbL8Kub?=
 =?iso-8859-15?Q?rfOay2/rYivCxYSo8YgH79Qkqg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <B4F0F26DFCB8D444AEBF5BD8F0B1F6A0@eurprd04.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 61718331-42f6-4f44-151d-08dbe6b8db28
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 15:29:42.8120
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s56incLe3Z1Fd71rWrhH34YDYR1T/oSJDyxkQW/lDFla8V2vhhWL0IVcbY39+WWMjQlSfVBjDsGXMEBkP9OuKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7679

On Thu, 2023-11-16 at 15:03 +0100, Zdenek Kabelac wrote:
>=20
> Worth to be noted - existing filters are not going anywhere out -=A0
> devicesfile=20
> is jiust another mechanism how to limit device set.
>=20
> For some cases=A0 devicesfile present a more simple way - for some
> others -=20
> filters are clearly a better mechanism which doesn't require updating
> files in=20
> the filesystem.
>=20
> Both filtering systems should be equivalent and work equally well -
> there is=20
> no plan to phase out existing filter logic.

Good to know - that sounded a bit different one of David's previous
posts in this  thread.

Cheers,
Martin


