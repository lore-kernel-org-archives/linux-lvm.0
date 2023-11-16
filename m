Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2067.outbound.protection.outlook.com [40.107.247.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A92FBF0
	for <linux-lvm@lists.linux.dev>; Thu, 16 Nov 2023 13:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KUodUxyx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CqolW52WLjuLbIPAM//mrhDZv6uXy9iwuqr7JGGapivmd3XM8x0jtDTlvLSnfLVeJ49JOxzVhPV+BzalSZbgswN4Jvzg02eqkGnRfBGRqU2iAi9uLMgYXpQJ41pF9tgI1BVv/6bSJmjeIoCGZVyZ05MBzvVzraswmbVyvCWgFUnkotdKXPPESgCAD5HqIcL9h/egNZGp7sz0J+nbJMJM2sCLlA8MvRxZnp+lzNzJjcCtYqHLS60WN6GJ5Qqy9s38A9VFGxVm06uLFQiXbG16O62N45NDiXzmOwhlEWY7GFwe6gzH3CO/UV+GMCGtITLaudvyE1ummfowtt1OqxopLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P3grsu2XlZAAkcEAq5dqOESBefSpl9coam11EQWweIo=;
 b=ndzGKO4CalpjTitEQnfCVRF5BE6C0ubEJK0DDg9f+5k/AiSnvQgFgEjcH1t8UFyDQ5A5Z6HrPG5aFVpmhnWjCBPUfYcC/oL3HrD/CcNXzdfRGtdw8STWZaVr9x3jRXi8j2TWnzJYFujQWFaceaLiYbGM90sgBSfpclHRf7+OmbeTq5zgYrYsU3bTwSBzgZNJXoYpgn4JnOWihTXN+E68fiJRejScAUOxDH59Jxs2UkfvO5C01lVyajxnVA1BXKzyb8373btq6U+SHzSJb4LnTckLbNZO3oRiHpghMbESMghnWkh+JVdd9zZt6fEintSnKUqX2cOr2OiB4SIE1WUGKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P3grsu2XlZAAkcEAq5dqOESBefSpl9coam11EQWweIo=;
 b=KUodUxyxH0nKRYh+kHTzk26OnLaBJH0X0X5JbJ10hIXJoBG3qJ4PlArNlQc+XUJZbP/Q4dKxxqx4dMpkn/xjQwpMWE/MsmJ8jopPbG7Q1fZj0wVPsVcA1Xy/Df0WhSG9dMdd/dx4jBclWOSusyF4lDrF8ZIinvkFKUDRZ2hq1KFL68vdwFLT8qa2KWxoGw/WL0ycxcZWbQwbTI2dGugpmFLeIwJ/Ndl54aIyrUmygbh76NWaWzN4Td+FDSJdI8XsIAqK+3tMMVFmRgyxsskFT9IEcnp0o6y1tprC/b11bFQBv+UrLwg1viHiTIn0CZIKsiVNZuZoKj9jX4Zj1RAr4w==
Received: from AM0PR04MB6324.eurprd04.prod.outlook.com (2603:10a6:208:13f::12)
 by PAWPR04MB9718.eurprd04.prod.outlook.com (2603:10a6:102:381::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.15; Thu, 16 Nov
 2023 13:46:43 +0000
Received: from AM0PR04MB6324.eurprd04.prod.outlook.com
 ([fe80::5c82:3111:897d:74ab]) by AM0PR04MB6324.eurprd04.prod.outlook.com
 ([fe80::5c82:3111:897d:74ab%6]) with mapi id 15.20.7025.007; Thu, 16 Nov 2023
 13:46:42 +0000
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
 AQHaFJ3iDFYd3KQH70a+UW68GS9ZyrB4SCEPgABPtICAAN7ZgIAAj8kAgAESGoCAAC5HgIAAfyMAgAE0zICAAAKlgA==
Date: Thu, 16 Nov 2023 13:46:42 +0000
Message-ID: <12b4acebc76db5a3d85a2a9c9c275255a848f922.camel@suse.com>
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
In-Reply-To: <e64bbbc8-1716-4739-a68c-2f92563a9c8d@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.50.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB6324:EE_|PAWPR04MB9718:EE_
x-ms-office365-filtering-correlation-id: 1ff37948-f7d3-424e-faca-08dbe6aa7784
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 z3byb8jyJV5l+oHwpaA9G46+bAeinTzKizTiZbB1eN4uryot4r2Qba9zb2/XWPX6+Ke5ssIcbfAmxFS6wS/KA9i0BczfobFj/BF+/YrJavsLCGQ6WEvhCfnYTDs4pcjefbNm8w9fMvFNqkurLsQyLsYeQnRlgexqnfRzXUav/jq1kSmN19ph4q4J8pH7CWP5CMwA6bJDR7ESygo+6CAEReTpgfPLZ27SbXrpDJK4PIblPv7/fjwqTqmE7ZGME95fOE+q+YRbmp/khbvjiucFe0CYpD7u9WZb/g8z/xuEqyypBbORdP1qZxajuKwRxO7VikmVdpdPMYNIC0pdCCR8XoxwmJ6Kbl9u/lW/qvnwXk4ChIK+/ux27dJfZ68VRuMQTrUG2ObFwiOQT+uBR7rn5Ez9HOKYYlLfpwSOIzHb9SU40Vhs3b+6TYA70GIDncsk5WBMuV2sXccx2xpaPcm2ONwiAcMY1ok8phgTpH4e35nooMdanU2vV33J73c3CdbtzsjycBkqIAAsgd8xNaMXyCyZP4m0LZrTcLiW51UEgwOuqLg9fcZE036cgtBCbJlSTGYDq8AmSWqMaNRF207dL9TJqCxV8HE3BTNzBym5z9L3W6ntc6KGpgB32B7cXorJ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6324.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(346002)(376002)(366004)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(36756003)(122000001)(41300700001)(83380400001)(26005)(38100700002)(4001150100001)(2616005)(6506007)(38070700009)(6512007)(8936002)(2906002)(6486002)(5660300002)(86362001)(66476007)(64756008)(316002)(110136005)(66946007)(76116006)(66556008)(54906003)(66446008)(478600001)(4326008)(44832011)(4744005)(71200400001)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-15?Q?mKVrW4lv21NxvZW0lIarKPNmoMV9pU+6P+H0PaDND48JE9oEGOX228Ynr?=
 =?iso-8859-15?Q?Tw2Mw+PCjPcIl+i+mreIkCN5qzSB12tfQfauwkipnPDDcMHC0x3fJZiRs?=
 =?iso-8859-15?Q?35o3Ij2ltgLptUz49u7h2Bscjk6Jl0bh0oQKhtNqFc/cfFs3tegCWGD6J?=
 =?iso-8859-15?Q?o4EUMTbaAMneIHD/8DqmQaVwnMnIldZ/u8A8VR3G+lXSA+CeFN7g36mWY?=
 =?iso-8859-15?Q?g5DrMVQ6otdDNRJ4Tje9u2boTHET34kXY053lVfjd+FaP2ioGaywy56FB?=
 =?iso-8859-15?Q?jUF/YOB+2HQC3D862en8Vsb/pU1pTLiFsn0z7Ucd8rFXGQYC7BY+KyJ/7?=
 =?iso-8859-15?Q?dlBLilaN1MsMLO7eEbYsXT+JMzlT1JJuMTj1y46LdSkdB7ZF5ORr9CHA2?=
 =?iso-8859-15?Q?7wziuiyXBMPSdRd8v0+HxgJNkv1OlKXe2TPHQ2ysH1xELXV3Vg88WZhcY?=
 =?iso-8859-15?Q?5I4W9ImgNKWyR/LP8lBr1toy0gEOdUHSdn57BJ7MOOXZ8XQ4jkj0K1Pjn?=
 =?iso-8859-15?Q?lP+HNPhIX2IwDsfHsJMe/NWXwsfjUyJQzIv3Deh2Yff+YB2gTRn5ObuSM?=
 =?iso-8859-15?Q?MieAwmnmqnub92Y9Fv+BA7UqeZf1PUhO1qN1Ns9uDgNx5SyYp2a9oyxad?=
 =?iso-8859-15?Q?ZUhWOpHFF4+bQYB/r8fONmSS0gAWRp8GCBLcuRpC8koP0j3ajvuPJhAeB?=
 =?iso-8859-15?Q?9RLyNaV1leP8ZaYsNLfkM8xT7T2kS1jvpBrON3Fis16L/IyOQCPuSq3s5?=
 =?iso-8859-15?Q?Srzs2fBzmzbmYSuEyplrTuc39rY4CMD7JPfOgaJO28ktPpiQ4apfxiG88?=
 =?iso-8859-15?Q?4fRFVtf1Ptqqf6OoXv6Ugj6AhtX22j9kydyConut+pni0XE90ASRoOcal?=
 =?iso-8859-15?Q?DtdBEvi+Zukfl0KRaWFt0wCTy5smIF+JGlYJsEm8fKiYxhKYKpGQ3CI4M?=
 =?iso-8859-15?Q?fF6FqQh5ERIedDobCI3nUCp8N2OBQkZI0v0EGmmfXtZ0ZrdMQ3jbLLScW?=
 =?iso-8859-15?Q?DvSN1nWubO2n0M6ZGODkJUx+KLiKvMp55ZUHc1LfXS7PEqxIU1A8nIkZS?=
 =?iso-8859-15?Q?k1C9yTBC4tzYFVfZq3jgK4RVLTdNAYoN1x0ZqpA32BxJ3OSTcQLupyMAq?=
 =?iso-8859-15?Q?JMtxzZKIPUShHQMhqiYLR4IUxR5K9SCDgBfb6goMPjhSSsCjIWrebIZw+?=
 =?iso-8859-15?Q?qLhHt0pFbmEdP8XMRmQG1silFlw+aHHvKgYmbBHdCCZI5JDVSV7Xt9ktL?=
 =?iso-8859-15?Q?ZG5/WwtNOshOSfiaakolhjsj5mhbTPjcd4mqyKSPFIfzfyV+k0a66trb8?=
 =?iso-8859-15?Q?BOrBVPXAntKthd2d91vyN1kX09qehCX9XZNXPtGck3DBK6Beq9AG+lp5y?=
 =?iso-8859-15?Q?zNCRPov/64dzxn3QmF6e1fmFgmkwQ6MJxV7cVf+aVanS4oJZU2HiFAbxA?=
 =?iso-8859-15?Q?1eSQg88nXUsD/OM0fpeFotvjJtv0BCgcMAN5AmFt1mu9AOqJ0e+wIUfh6?=
 =?iso-8859-15?Q?szlFB7rvt7N4VTe1mIAr4Q/yVKXnonvz+sMI9U/cMhAuWgl9XjNULqURF?=
 =?iso-8859-15?Q?JTiImmkpj26H2+FpZVSBz2jYLYYjR07oguml0VSk80114fKakKam9eXO9?=
 =?iso-8859-15?Q?2eDZGWxrLdz08NS2v6rx/Ha8WbUSIgWJbtN8TgcRYMWezJJJmDOmWa3zn?=
 =?iso-8859-15?Q?NmwNR5Ujn29MmKUp/yoCjd/6yA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <897C60E52DCB884CBCAF752C976CFC07@eurprd04.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ff37948-f7d3-424e-faca-08dbe6aa7784
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 13:46:42.7074
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9080BWRrRUIK1E3uYUpKmwMlHxRlNUOSWnXLVjxYIc43ZzyevdFzl58Xg5jdhTRw+5nFLde8NWEOqpKZEyzX3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9718

On Thu, 2023-11-16 at 14:37 +0100, Zdenek Kabelac wrote:
>=20
> Current upstream has set this default value as 0=A0 (in configure.ac)
>=20
> RHEL builds use this setting as 1.=A0 (Possibly even Fedora nowadays).
>=20
> The major problem with turning this=A0 to 1 is the distribution must be
> 'ready'=20
> with such relatively invasive change as it changes also requirements
> on how=20
> the boot image is created=A0 (devicesfile must be copied to ramdisk).
>=20
> So Suse=A0 may try to set this setting=A0 to 1=A0 and see what all breaks=
.

... and the man page may need fixing?

Martin


