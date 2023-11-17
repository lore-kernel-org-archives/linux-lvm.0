Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2087.outbound.protection.outlook.com [40.107.105.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A702130FAE
	for <linux-lvm@lists.linux.dev>; Fri, 17 Nov 2023 21:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="peZukznR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T/UzwH2m7iipofA2ZINURU1mUZKc9zBDgAJmYfLvs6DCsMAOIpImW3exPtyI9ammCzjm4PcZ3f+2hR017uznJannu2JyBwUgVPn5Qm2HwY52AIk0OAmd+WtSOArvbDgPf/eggfZRWbyvU3OPvczRRReNmgRXeFaK6jKoYJu3jHVqEVD5rUMTy6mWy+P+DsnvbrnGN5CGL8J+ONh/XIWWNzjyjTUxkbAntcs7aZaGzzO3WlmQn6qlJF78jzcyUrsgsFUEC+0YuFNwwW/F+kPpTukL6/vIsHBgofxPT0NpG97VYW/IcJfQfT3gU/69fKtC/52brpMiofk3bD0N/kV7tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W17c+CN92JBi3NN+tskCI0J1nESgWW5BH1VYdce6FrA=;
 b=HToARmszVG/kFSiFMf31pESHvYUiQyzmFUrITlJIxYb2QcM5Vign0MMz9yWevO+PU/JiYor+6yaUgKh/viJokbB6i9ddtwIQSIO5ItGDGAo16PsC2ZAaP92H5q8GoX0oOog99Yu04g1YO01cbyCF3Q1aUnsu4pmcnrU2lEUt2Y2iMesMsyvxP3MlSkbtilf/zj7okZ9gSoNDr+8O2wOMYASIB4N6TpqR4+AlKgx9fI33yDSajFMuKNJ5oH5NswMsr001oAQM/QYNNFRGq+WBIo4DlLrz1VYMlvg3TDU7KTvoQxhji3C8G3jRL9Ujuz15pN1T5tekdkVfzrU+yWGTVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W17c+CN92JBi3NN+tskCI0J1nESgWW5BH1VYdce6FrA=;
 b=peZukznRcM4e2KxAPcB3RgjJkbNjbEizpoTcVfEsMNBjn19zzmSb/fJf1uxPV6tpOoiVe6xp+jiPr3Xu1mWQ7IFJPa1EaGOANURxh/vadE8GutE88cCwuPaEwr5q4YSG++YtDEtmgdYENIrRRa7pxeAx40gT7bBWIrY5E46h7eta/gQrMvrJ8W85LEb2UF+ba/RHeC53L3ZtNZl9suFhze2y03rj72k9HrwKs0xjWjRzv7R05ZHDn8RS5qqgK0K4iJXY8kGp/WO2MOMWaUHE354kMSkezVROyUlWIUgJhzxTfWt22QgFJvxwg7KvLrtFBt7JnJvDDhqQyPuPU+HX9w==
Received: from AM0PR04MB6324.eurprd04.prod.outlook.com (2603:10a6:208:13f::12)
 by DB8PR04MB7018.eurprd04.prod.outlook.com (2603:10a6:10:121::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.11; Fri, 17 Nov
 2023 21:05:23 +0000
Received: from AM0PR04MB6324.eurprd04.prod.outlook.com
 ([fe80::5c82:3111:897d:74ab]) by AM0PR04MB6324.eurprd04.prod.outlook.com
 ([fe80::5c82:3111:897d:74ab%6]) with mapi id 15.20.7025.007; Fri, 17 Nov 2023
 21:05:23 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: "demi@invisiblethingslab.com" <demi@invisiblethingslab.com>,
	"teigland@redhat.com" <teigland@redhat.com>
CC: "zkabelac@redhat.com" <zkabelac@redhat.com>, Heming Zhao
	<heming.zhao@suse.com>, Glass Su <glass.su@suse.com>, "bmarzins@redhat.com"
	<bmarzins@redhat.com>, "hare@suse.de" <hare@suse.de>, "prajnoha@redhat.com"
	<prajnoha@redhat.com>, "linux-lvm@lists.linux.dev"
	<linux-lvm@lists.linux.dev>
Subject: Re: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
Thread-Topic: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
Thread-Index:
 AQHaFJ3iDFYd3KQH70a+UW68GS9ZyrB4SCEPgABPtICAAN7ZgIAAj8kAgAESGoCAAC5HgIAAfyMAgAE0zICAAMwAAIAA5K0AgABL7YCAAAVfAIAADPcAgAAAmoA=
Date: Fri, 17 Nov 2023 21:05:22 +0000
Message-ID: <2e718cd763c6a69162be0d6d7e5211f73bf84a19.camel@suse.com>
References: <177c4b2f-3b4b-44e0-9391-3df007cafe36@redhat.com>
	 <ZVOgmGx-EIpMF54F@redhat.com>
	 <194d20b7-e3b0-43d6-95e1-1a7d56eab506@redhat.com>
	 <037a0ba9-76fc-469c-ac96-11981391903b@suse.com>
	 <ZVUYAJyEe5fNh4SN@redhat.com>
	 <e64bbbc8-1716-4739-a68c-2f92563a9c8d@redhat.com>
	 <ZVbGObxAvSsYqvvo@itl-email> <ZVeF_vUYxaRLLJbv@redhat.com>
	 <ZVfGLbjio7PEWG/L@itl-email> <ZVfKMHFtaG8UyvwG@redhat.com>
	 <ZVfVE4IYDiePcHDo@itl-email>
In-Reply-To: <ZVfVE4IYDiePcHDo@itl-email>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.50.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB6324:EE_|DB8PR04MB7018:EE_
x-ms-office365-filtering-correlation-id: e35c43cc-dbc2-4396-9224-08dbe7b0e9fd
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 UhLBBa1TmomHseWj8q7oT/AEBpcRvyRdWqckUVB/LiXS0gCDtvnBzEgtKrn0/UoYBx86/2dSbVW4wxvWfdZLiPG1lXHEm650ZiJCDTMM1BQODyVNJrfNV838fqUvQNJmV9bxJfgtvxfC4K4z0gnMB3801gl8lwEwmSo0RA05P+R+FpNvF9s+DpD8yzIauQ5xGOWXfaAq9mOwcYSX+RDf6B3/b0bp0AHxAYij183bJind6W1fF8dwQjMf9HfVa+qKk85dLIfnFF1phu/xxhBGDgxVFfksybZCWE1mHDTSp5ZxEgBJdCi9r6/0CZVHJIgw7gepqzd+Izq5h3Qku5nxfvNeNFKqDlHiubmj8jJ2l3sg1kTz+/X3zZ7HyXyPv/6b+iHdmK8AFBk18LjPyBQbTd4qrsy8GgpQuiuA03HzPQbZfihqavEjCtQs9GTbj/EXacIRnOw5gsDHCIKLar0mSp6WvJnZIyfsnI9S9kqsgQk+7ucG1l12j/I8am5Mgttyd5zyiTL5kTDWm8zNj7PBbGWiU05Xm7P1bzPrm2dbk0QHBdgb+huyh8KKNj6V3j65rWEpU5j971lyiGURWcaUna6vffH+sH+VnKTmADMxEavgOdDtbmJdvnk05dOe2VRWpZKyG/ONZOZSJYEtHMy0m0beKvS7RpAbuO47PAgViF4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6324.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(396003)(376002)(366004)(136003)(230173577357003)(230922051799003)(230273577357003)(186009)(1800799009)(64100799003)(451199024)(6486002)(478600001)(6512007)(64756008)(66476007)(66556008)(316002)(54906003)(66446008)(66946007)(76116006)(122000001)(41300700001)(110136005)(36756003)(2616005)(26005)(86362001)(4326008)(5660300002)(8676002)(8936002)(44832011)(38100700002)(83380400001)(4744005)(2906002)(4001150100001)(38070700009)(6506007)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-15?Q?NTRxvYswfpdL3FobY8JS77sIAbgIiOUfAolK3TuvWzzKa615qvKx27GjR?=
 =?iso-8859-15?Q?qbH+SBCFFCQ7I8Ra+xIa2uy4vRbU71BO/WlNO6wpgzev1cnntrm4mJtyA?=
 =?iso-8859-15?Q?zPPPl9Z6JyPHvfjMgtXAAX31xRO2nz8fIKgaYGuL28wmy5VbO97BBx/Mp?=
 =?iso-8859-15?Q?EB19KJy3dsq0F9oeOOSgraaktqcd4+HQWguJfM4gv01ww6sMdaTFmHubY?=
 =?iso-8859-15?Q?QgA3UBLEGkgxizJV6KoefHRtDV1G4LqHx+IIIu4IzTbPinsD5GLrs4KZf?=
 =?iso-8859-15?Q?OoEBhR41BXV5QKxaDL8Nem0II2kY2RjF24Fjj8GSJoQtJVm0ZJsFxYkk5?=
 =?iso-8859-15?Q?/tUlMQaTyjRzsCGjzIJ0ME/ymTxk6jMiZnZL4IhwJoZ37LanazDZzOksj?=
 =?iso-8859-15?Q?pXSCMSQvoYb6t6fvr7pP7QkUHnNJVimcsRTB4dMkdIl5zk1eNYl5qPfy8?=
 =?iso-8859-15?Q?Xv1ILihVHh/AfAxfGP4I0hgmQ4Ctcz7LzM/AE899tci/jz5+duCxbT3mX?=
 =?iso-8859-15?Q?mYXLEitYFrEjuIyLaM45sIHkjtc7o0onXWi0mb0KjXc4Gi7rfcgR0RArD?=
 =?iso-8859-15?Q?7oa2J0o4br832LYyQ7H99j1fqdLwbf8Ti+/q1hY5sSyr/6vDnXNLLmrnY?=
 =?iso-8859-15?Q?Msu/4dc0Khwq+RsQPGbH1Nl0RH2qxBFikuPb1/hQ87cDK/UaofoGjSogG?=
 =?iso-8859-15?Q?in1cF0AVjekl9SuFgMhCEBPsYP8KZHGhsng9N0i1/NO3HP/k9S1LB7RPA?=
 =?iso-8859-15?Q?Iu2L7SuD0aV4QPMdH12BZg22FtAVV1dx+wVBWqoINUKO1PBefFazRftov?=
 =?iso-8859-15?Q?ORlFrXZZFaFoZB8MLN+FiiRxhfXAt7gTMjxKiXCMkw6m3EEBAyp8LxxbZ?=
 =?iso-8859-15?Q?m21/UaW55WsqkFC1trRsMrMKFTAxNg1eCSZS1Jv2MGKWv2EXXK75FR6yI?=
 =?iso-8859-15?Q?nw1xkVKZAf8ySTzxZnPOzk9BMfXI/D7TSMVLhwOqmmimD8OKQ4TOtRLKg?=
 =?iso-8859-15?Q?AJdC+G9JZvN25lO2w+ZwSRdB2dGBw1jkmev7A7A+DcboFeNAuuEAQVTUU?=
 =?iso-8859-15?Q?etY5+ZWekEIbFAzeLp5Z8ATtgjk9pJkgPKXt0kyb6nYcs0RBjCCDpBxtO?=
 =?iso-8859-15?Q?Y+nTU45EnfC7p4mkqFFRx75dIfYGrnwjjIPgyiiXzlTOBR0NjaDu9uCE/?=
 =?iso-8859-15?Q?edsYPkmdR+62bQFum/7Ak7u6CU0DfsMsF1Xu3YGYhXDDKaaVxx3r6Z3xZ?=
 =?iso-8859-15?Q?SKxLl5Ax7H3OA6vyB2PXB9/3g4yKHlU6HBOpSrxqZ9eBS3hc2LXC3PkE1?=
 =?iso-8859-15?Q?wNsDFLQGNvUKjgvLVpI4IUOfjZG/FGK+peUsQyEdgi7XIwpeqtIBppDvd?=
 =?iso-8859-15?Q?rl/3757w0MZUPuWlFKyq1z0YJSHiGXikyO64lcVy8nkGmERHE8kje8MTk?=
 =?iso-8859-15?Q?7esxEu3DxDGPngR4g0yNWwB5WTqsDgKl0KWNeEpBFl2V8JRawrdEaDad3?=
 =?iso-8859-15?Q?bcYdNZ6uqVcOs0Iqb6OM7NngxjawymSNH/uUAKrzJNh7Z9I4qiZew4ePl?=
 =?iso-8859-15?Q?WxMe2Y0GWhZd4SYG+JaFqNu/W9giIoK8RCtLOBEaL7+/MBabtIntF2edk?=
 =?iso-8859-15?Q?Oqb2x063JTknkgloS3A7h0dkReYIxsq1lqfT73nxnMKcp7jWkQF3xNXQy?=
 =?iso-8859-15?Q?eW9Gw4MgHLFWW6qbRcRCisqc4w=3D=3D?=
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <25C94FF25C1E58408F38CA7BD7A09CF0@eurprd04.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e35c43cc-dbc2-4396-9224-08dbe7b0e9fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2023 21:05:22.8730
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1j9fcphM0jTp++0d4Yngrfqq7RWazf2YUoT5xlJ0L1oNPzOhec9fS3ZGIWgRXRmNc/q7RWKApiJdw7R/Vp9X1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7018

On Fri, 2023-11-17 at 16:03 -0500, Demi Marie Obenour wrote:
> On Fri, Nov 17, 2023 at 02:16:48PM -0600, David Teigland wrote:
> > On Fri, Nov 17, 2023 at 02:57:35PM -0500, Demi Marie Obenour wrote:
> > > > Yes, the devices file is intended to be a default feature of
> > > > lvm since the
> > > > commit above.
> > >=20
> > > Could LVM issue a deprecation warning if DEFAULT_USE_DEVICES_FILE
> > > is set
> > > to 0 or system.devices is not set at runtime?
> >=20
> > No, deprecated implies we're planning to remove it, which we
> > probably
> > never will.
>=20
> Still, distros need to know that they should make the change.

I think David and Zdenek did not say distros _should_ make the change.
They can, but it requires substantial adaptations and testing.

Martin

