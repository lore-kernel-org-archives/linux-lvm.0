Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2048.outbound.protection.outlook.com [40.107.247.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA53249E2
	for <linux-lvm@lists.linux.dev>; Wed, 15 Nov 2023 21:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="kwHvn8du"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y15njEIcdlbiL46fSSXJB5UMkQ0eHihnxWlWOJ7z+R6yQE4JaMf1DZO4SmD2B7h2/667FQq/CTJLEbntWG7WRKxLrddKnV7vJNBnIpC5R0736Uhz8/rhce0uyZCZBgGa/8X2+7NPh/vd3cuOGg/ux7zjhmXRU4S/PvHKI2tVrsMWcDXIcSTn8A97nKvtVmYKLfRGwtqoUmAfYCK8vGf753/Hq79rjRHkPhLGCQaKevemUHMYfPAzJUAeKBXtLmctOqF1gaCMwlEQt4JjeaECyP4T7zzjlFkTCkghZ2lC3/Bub3N8CegNJwEppnACXu9DLziACPJVvoFjuuOV2VuLDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j75KMi0Ts9o0KsnJOf3s2ZpShIzB108a5cKia8if+is=;
 b=iblnmDzU0Z6Ze6iYHg0F/oc0SlR6Ua91FjQ2/BkWpgCvkA/3TOadm2bB20Uf/u/2BOE0oRGANievwL9HpiL+HgNuaWu4fTPG1gN0bh16C+6hMigU4SzFOIoeqpL9mh/ehzHKpiX2FhNOm1oHN7Q3JZawX2nhKisuu1ihOijVj1u8qPkyO9FiGYd/wmMDaXugw3JtYgJPD7q8+RbaGRlmINk9N8L3qJTgprUOft1YTJN+s9BXHpIk0HnL8ZtNNYuHoqWVWmPWqO5T/m0nBThwkTShzxCA+14bJbSuRLP5tDJcWMxdJ2EHrzlxXNhlk/m3eZepqAX1iSPs/fXUxcA31g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j75KMi0Ts9o0KsnJOf3s2ZpShIzB108a5cKia8if+is=;
 b=kwHvn8duraAj1RlLsTA504PtsdUE8f9eFEeJHoftCGcKicVpZImYsO8OcBCGFzdveXzTEnPgj7SmnIRsAs6RIEppgrbbowisFI6p28cAoPhoLdVtKbvfs0g7OBhzga0o/tsiAna3l2GbbtaI7Ouo3rxspteR/rhH1iR95y6f+zoS4QUc9gfhx0ZVvKZgy+3miMQv6GtevG+2qtqzv0G4L7DIiV+KBYZUpEWYVok5cOI2JowfeLMxwTBHmcoDsJrtwJ3cntVAN3emR/8ittHqavkTET5ebbVEQ3pxy8MmVAD6sJLGc8ZhgCWhKu/QVk7AqXysNblUt1We/qWbbFJ4AQ==
Received: from AM0PR04MB6324.eurprd04.prod.outlook.com (2603:10a6:208:13f::12)
 by DUZPR04MB9898.eurprd04.prod.outlook.com (2603:10a6:10:4d2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.15; Wed, 15 Nov
 2023 21:46:36 +0000
Received: from AM0PR04MB6324.eurprd04.prod.outlook.com
 ([fe80::5c82:3111:897d:74ab]) by AM0PR04MB6324.eurprd04.prod.outlook.com
 ([fe80::5c82:3111:897d:74ab%6]) with mapi id 15.20.7025.007; Wed, 15 Nov 2023
 21:46:35 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: "teigland@redhat.com" <teigland@redhat.com>, "prajnoha@redhat.com"
	<prajnoha@redhat.com>
CC: Heming Zhao <heming.zhao@suse.com>, "zkabelac@redhat.com"
	<zkabelac@redhat.com>, Glass Su <glass.su@suse.com>, "bmarzins@redhat.com"
	<bmarzins@redhat.com>, "hare@suse.de" <hare@suse.de>,
	"linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
Subject: Re: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
Thread-Topic: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
Thread-Index:
 AQHaFJ3iDFYd3KQH70a+UW68GS9ZyrB4SCEPgABPtICAAN7ZgIAAj8kAgAESGoCAAMxRAIAADEiA
Date: Wed, 15 Nov 2023 21:46:35 +0000
Message-ID: <96926c3355266affd7fc170011d60be15d5c56b0.camel@suse.com>
References: <74b83545-abe7-432c-ae19-814b289a6ff0@suse.com>
	 <6c7699678ceebca58c56aaa769c2a7b9a6092883.camel@suse.com>
	 <23d98f61-f9e1-494a-be3c-df9531f4f70b@redhat.com>
	 <ZVJtCxq7XeCg_G-g@redhat.com>
	 <177c4b2f-3b4b-44e0-9391-3df007cafe36@redhat.com>
	 <ZVOgmGx-EIpMF54F@redhat.com>
	 <194d20b7-e3b0-43d6-95e1-1a7d56eab506@redhat.com>
	 <ZVUx7KjZKGqSuWxo@redhat.com>
In-Reply-To: <ZVUx7KjZKGqSuWxo@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.50.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB6324:EE_|DUZPR04MB9898:EE_
x-ms-office365-filtering-correlation-id: ba18d90f-0f6e-4f5c-fc0d-08dbe62456e7
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 TNlmfrs2+gzAGRTzGJU6wqLlJYbvLLsPJQEU2fgKdhroBzaG/RNBycJcyQ3WsX7FvpakRmGTVIOcx0CNrpEpUs6IGU4JW0EKpjkTjVOEZaKJlkpPB+hpOcG54evOa5ZRJRdCOOqjFZi9In9qW5KHfkki1wSVLl4VVVuvVOG5sDZoK66xAyZScsQRPYsTa1QXzhdLtNuv3xB//rf3MAaG9BzoHBFVRSfh19wTVykcKKZt5y8LhRjECloGO3Wbp+wETNU8buA0EppXakrR88FWAkJsSOwri+Vn8qGB+5ecxulrKNnq+NLff4rKZz1WrDGBPqaXDp+g3Lz96ZUzFrMXprLffVNuUFDrPqrBKp9baz3vUwfQAAbNnWC+Tgly5miAWTVce+UItdy59G3UkwVzQy/Is8o8YX1u11bfTiPSRFB0G6D2Elh3iYk1tcn4xtkutxIcSP27yVHjDlqP3Y1+yUlT1VdQP1iwIcnUVZIyZCJfkv7eon6pwL7vNJsJCtZ3W17syHvP5PBiDhyoCOzTnlBgKj79k/APL4rZb9GD/t3mHgAbFdUW+kSpGYHBUdhTk7PDq5EA4+a4KgHB6eJysptAiVo+k8zv6WaGt1p2qLLNYpa/FIeOD+o+lWPhswD7
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6324.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(366004)(396003)(346002)(376002)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(66899024)(110136005)(38070700009)(54906003)(64756008)(76116006)(66476007)(316002)(478600001)(6486002)(66556008)(71200400001)(66946007)(66446008)(5660300002)(86362001)(36756003)(41300700001)(4001150100001)(4326008)(8936002)(8676002)(2906002)(44832011)(26005)(122000001)(2616005)(38100700002)(83380400001)(6512007)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-15?Q?VJkD65K2Rm06JX8JlDihfEv96pIl7bs4vQsq5rZzgTCf0OPgw6XDjka0C?=
 =?iso-8859-15?Q?qpyQYBqtBo3/Wgv7IvxZc0MvYGPRudSxpDNOlho0gcg+IlcfOe23l6F0z?=
 =?iso-8859-15?Q?Zs4pU7mq05Q7hDxNiuLAibD46224ELGxu0t4lfbG3DG/OnDLxrlZa22fU?=
 =?iso-8859-15?Q?+my31i3RoE7rLjTC+mF2nbskGaPcY5vjCik9CGlH+0wsplDVXkzkv3DES?=
 =?iso-8859-15?Q?J8v5ebgzbMK2zhpmXNgt5pOi44rr3SGITQ80uTYVYXwCiWbxxQadGQdGt?=
 =?iso-8859-15?Q?RCl8FQFCmXRXgZpVBaE1LhnqFqYAXvLR3eYuljef3ywpjiso+SDnpU/5P?=
 =?iso-8859-15?Q?RVDzo/Cvrx2pT6qgs+PAf6l9/zwO8IP86I+zOA9CjJ1jsBx4tenFL19yk?=
 =?iso-8859-15?Q?/6ycnKiGCrxL5rWbjYcN3Tw9owUG5/uSr3fL7gj6B5kGm0eSvlnW1oa8A?=
 =?iso-8859-15?Q?118kk5bjl1B4gVcMvkIAWj5QIA7ohObtR/b7hOqM9J1O3jECCpYsraBFC?=
 =?iso-8859-15?Q?z3ckPt+uMC0qlftUkmazWk5DfXJgDCXSca+pxVCJn8wojAiTq6jj/eF4V?=
 =?iso-8859-15?Q?A1/IWThc5nqMN5UZ6odHXTkGWtcfG4N6d8bspb8pX4LioCdU7hELcejX1?=
 =?iso-8859-15?Q?DsQ5E5A3MfzmVNS+sJrLVPSeqW68aZochbPDSmaDrOG1EKbn3Od4WBvJz?=
 =?iso-8859-15?Q?cU7X6Z5C4OdJaQHrlEU55dD/tZs46mZ58pTiv79QxINBrdfSiKIo0iDub?=
 =?iso-8859-15?Q?F9GCU7qMdO7fE3NWf0NtdaMUfI2eQiC4No9EpTYazFpkUcH1ya1AhWnPv?=
 =?iso-8859-15?Q?7gy/l2GsEJ+gL9Wk+eCRM4scBkrgiRc9kOsoyeau0+YmqCx+qAdgl6jVa?=
 =?iso-8859-15?Q?dO35p8lC6Lq2LKztqHR3bJamOgbuCQSonImlwoBfQtwMQnENt1mjA1oSP?=
 =?iso-8859-15?Q?xsnO9G/xDHaBvtJktf9KnShwzxM7uytGYwdLuJaROBvXBwouvSjmdA4Mh?=
 =?iso-8859-15?Q?WVNNwOys3i3Mng3Fm64sLz79JxnbyZQk2TcODXt1FIW9QOdFJLPmSbrKH?=
 =?iso-8859-15?Q?G8zq+mKZVnkg4jFY6x9Xihg1+DEwbplQPP1y17qmnPxqaZ/iCNxGOhjUe?=
 =?iso-8859-15?Q?huJdV6Qy+qggxbuot4mIcQaskOme79HLAq5bAi+obHRFvFph/N9MsVhUN?=
 =?iso-8859-15?Q?Gz6ROo/X1A0ios3DJVunjGG8ARFmpVmeGjhGlr+abqZRrzX4igYbjC8Nm?=
 =?iso-8859-15?Q?Yw9ObFUpqVqgoXbhfDXQWEVvMGternXtQ1cyRCUrwWDY/ApVSu76tFNQG?=
 =?iso-8859-15?Q?HXhYae11ZdWAEX+W7mGoMWTswMM6u/iz5WIn3pZn/r66taGXddnQYb3pf?=
 =?iso-8859-15?Q?lqq3sjdDfuX3S6eQ0A8+R50bhW6kFSFw1woZ3r3q65wMMZvTt3+Yu78kJ?=
 =?iso-8859-15?Q?nGAnHODaBRCl62LgmmvpVamIamRBpq2cgLx0kqrxZYGoskk/Tx9TMxZP2?=
 =?iso-8859-15?Q?p7SgMbJ3miRNNO9q93Rlkyi+smm6MuKlgWDg162k5sDpGTKDQi89ZewqJ?=
 =?iso-8859-15?Q?p1f9d+ME56GY10XH8W7tDn+BNogj8s4FQOT1eCad7f9kZTi6CqfHa5gJY?=
 =?iso-8859-15?Q?qTWJN8Lzu8tg4PZqgPbD2AQHvbGGHlsB6VgMOY/tc0JOWBJrtJAAAk261?=
 =?iso-8859-15?Q?bBuZy+Fq5Wk6QKCGGyZVoaweeA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <625FF10DF4C99B4BA04619DD309CCF3D@eurprd04.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ba18d90f-0f6e-4f5c-fc0d-08dbe62456e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2023 21:46:35.3764
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nErYrM+eXduhRZgf/S+uDMR1AAAYnAwEBpkhFYcVN43Dro5dNUlS9C8jkBVJXDeaPEIMPvt9mgTqrI7+QV88uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9898

On Wed, 2023-11-15 at 15:02 -0600, David Teigland wrote:
> On Wed, Nov 15, 2023 at 09:51:19AM +0100, Peter Rajnoha wrote:
>=20
>=20
> I've suggested another way to do that which could be more explicit,
> and
> gives more control over exactly what info is used for multipath, e.g.
> =20
> =A0 multipath_info_sources =3D [ "option1", "option2", "option3" ]
>=20
> where options in the list are used in order, and can reference any
> number
> of methods... udev, sysfs, wwids file, some new multipath lib, etc.

Ugh. That adds even more complexity without improving matters.
How would a user make a reasonable choice for such a setting?
I think even you and I would have a hard time suggesting the "right"
setting.=A0
Well, obviously my personal suggestion would be to use udev, and udev
alone. :-)

I guess it's too late now, but I'd still be willing to try and help
sorting out the issues that you guys were having with udev's multipath
component detection logic.

> The context of using system.devices or not also makes a difference in
> these choices, and I haven't thought through that entirely yet.=A0
> Perhaps
> different defaults should apply when system.devices is in use (i.e.
> that
> multipath_info_sources list may want to depend on using
> system.devices.)
>=20
> In principle, the multipath wwids option is an unfortunate, temporary
> workaround we tried to avoid.=A0 Principles sometimes give way to real
> world
> problems like systems not booting.=A0 Ideally, a multipath lib API
> would
> have been available to check the wwids (which didn't involve udev.)

There is libmpathvalid which was created for this purpose, have you
tried it? AFAICT it should give the answers that udev would (Ben would
know better though).

Regards
Martin

