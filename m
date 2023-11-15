Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2083.outbound.protection.outlook.com [40.107.247.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B804419
	for <linux-lvm@lists.linux.dev>; Wed, 15 Nov 2023 07:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="w7JeFFho"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dHAD34xXC8X3rEx6LUN0gbvq4r3VRAiW6TB5e8UU3Vv2fvlsiLOy2DnYXTHmWOJBINScAZ9DcohSndi9CwsGxHTimgAk5dJRQgAgfE2bQg4WMv1YS03jjChAh97UlK5ART5Gwqsg5FvWwHt6nxRkJbWs/cJJ+AinOu4Z3q34hSJWgEtzWZossBowdQcD03LCtZ/OOzX64eqvSNjFSPVTt+LbgzJADuZbBFkx0vdQYV/5lAf+iwffd7wq+QuuEpitghPFQJrUg/Xr3ev/eTFWUhvwUdBB4A8n5FxCl61FVQJEthAk9zNzdz5S3ZMNOv2UeZLcNmlwgKemxkrFtkSCKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gcrMtoLAGdg2PwVKURXLlM1HS9hDhEtX7+HaPpAd/Sc=;
 b=Nv9HU41QpbJpPP3RtVyWKOrUMx7xoSJGPkpGjOjEk4CxwNvw8bVDiu5XSLqc9N+djn4iC4xgmNDG6ZSi+dEsAVfweQ5PLFzmsehkCq7CAifFjEYBvSNI0b/QGoL9Dml5XFICdeQNHZGIBlF8KtvSBQ4Ke3UvQ9HBmA4LK43E4zn/Gf1RzPf13PoOVTxG6MZdtkTkgaDZ4puRMmBM9RXX4vplrCmRTSbCUFF5qCn72xlYuzym6lPze1y9YWsWOIJh1I2yI/Ag0WrSCaqv06lkrqvGjGVM+TDKRq2xV2aWLRDlg9T+POeeqLt5UExjy+orwUT13KRiEaYaYppZppwpGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gcrMtoLAGdg2PwVKURXLlM1HS9hDhEtX7+HaPpAd/Sc=;
 b=w7JeFFhoXLLa66HpLAhA9iRyr/yEbzvUfOxsJs3lFObYpXIFyU5yfz8tHGHwcx7ssppplxmYIpBn6wU8u7osM81naEZFWAJEXC9ILexlag9LMdXmheYfD8aQYUG9yG9wzFPMhhQDRfKdkLjDGa5YzbUTPNhufJwu8GHOWDwYZTM7gDMHw7nuliAOFW+4tehQ/ri211BxpriRLtbXvy5DrWL+/Mkt7RQ5vCX3CbiF2wpwV9/B7sBSazE0dumZZOsaupyQA1Bxc0YWHJW+IYU6z+IjdlOEFmmcMsHcnqLFgnHuRUg1pGoO8SueJ83ztZwyEiBfnw8fc0KMATqiJpzAyg==
Received: from AM0PR04MB6324.eurprd04.prod.outlook.com (2603:10a6:208:13f::12)
 by AS8PR04MB8295.eurprd04.prod.outlook.com (2603:10a6:20b:3b0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Wed, 15 Nov
 2023 07:39:18 +0000
Received: from AM0PR04MB6324.eurprd04.prod.outlook.com
 ([fe80::5c82:3111:897d:74ab]) by AM0PR04MB6324.eurprd04.prod.outlook.com
 ([fe80::5c82:3111:897d:74ab%6]) with mapi id 15.20.7002.018; Wed, 15 Nov 2023
 07:39:18 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: Heming Zhao <heming.zhao@suse.com>, "teigland@redhat.com"
	<teigland@redhat.com>
CC: "zkabelac@redhat.com" <zkabelac@redhat.com>, Glass Su <glass.su@suse.com>,
	"bmarzins@redhat.com" <bmarzins@redhat.com>, "hare@suse.de" <hare@suse.de>,
	"prajnoha@redhat.com" <prajnoha@redhat.com>, "linux-lvm@lists.linux.dev"
	<linux-lvm@lists.linux.dev>
Subject: Re: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
Thread-Topic: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
Thread-Index:
 AQHaFJ3iDFYd3KQH70a+UW68GS9ZyrB4SCEPgABPtICAAXcNEIAAQJocgACMtQCAACg/gA==
Date: Wed, 15 Nov 2023 07:39:18 +0000
Message-ID: <96641feb19e8cd9d04c5318dd8ba59f85fac3131.camel@suse.com>
References: <74b83545-abe7-432c-ae19-814b289a6ff0@suse.com>
	 <6c7699678ceebca58c56aaa769c2a7b9a6092883.camel@suse.com>
	 <23d98f61-f9e1-494a-be3c-df9531f4f70b@redhat.com>
	 <ZVJtCxq7XeCg_G-g@redhat.com>
	 <0bad121644deb8bf67329f111f0ba34ea261e988.camel@suse.com>
	 <ZVOnoCjNmOYToBpt@redhat.com>
	 <38458148cb14bf398aa3c6912842ddda79b81115.camel@suse.com>
	 <ZVPd0NyOgJjRTzvi@redhat.com>
	 <f4a4eccc-7093-4804-aabe-7d8dbcc993e0@suse.com>
In-Reply-To: <f4a4eccc-7093-4804-aabe-7d8dbcc993e0@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.50.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB6324:EE_|AS8PR04MB8295:EE_
x-ms-office365-filtering-correlation-id: bb759dce-cc27-4514-1f4f-08dbe5adf9b5
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ap2NwjHFymrlaFlF8AGvRwQvUNGSkJY9meqjcaMvmsepUuPQ5Ib4FolOJSyr6aNdCsipzusdCAUA6XXzGWOoQBLTXPXn601ydAiUKfW2C/Df3PncnmJxUxCMPA3GWgZgPFXpZijwswS22B8Oeo5x++k4pW0ORZSowqnVxtg2od/LfmQAmT/VH8lYWXmdILFafNOHc6Abrmt1ie6nZ5cOat4o35nIyI2JSXLq/Zc0iw0j24wIViTfon5jiG4Ewv/xlmuYwMlKMjRLczKE9qdotQzCW+/qKDuBu4GlYc/754OwhdgIXuMXgZPDVSzODtw6PrhRPP8cJobE1ZMYek1zarC16bjOZN3D12jr/auhASUubTEtrodon151jLbQDDOfFquDh4OjxRsPgx4hOG0sCASw/HoebwjOWM/ID32+wFQEgs/saAdYfabTY8bf1XjXWuYvZeH44Ti6+LY9bgvkh5jcd1ouqlzaBsWoYG8DCRE9wBNz1kSMTg7ZsmyPl7yuVxGaOyaclWCM1NzrYwQ5i/1oUknBvExLBIfIrOHiAVlEaKNehrEa51U6T4FRt4seDOTfLKk9wrLDqgol4geTjaBVYjkVhIZa3AdVhX065t/+ZO+VjjOTv9/NfH+qzah8
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6324.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39860400002)(366004)(136003)(396003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(2616005)(6512007)(8676002)(26005)(38070700009)(6486002)(4001150100001)(44832011)(8936002)(86362001)(36756003)(76116006)(5660300002)(41300700001)(2906002)(4744005)(66446008)(64756008)(66946007)(54906003)(4326008)(110136005)(316002)(66476007)(66556008)(53546011)(71200400001)(6506007)(478600001)(38100700002)(122000001)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-15?Q?/O/JFh1VLWW+MNs4yNob0y+Uggw3yNa1HAElo+oDS3aTtr+9cwRKFCJIt?=
 =?iso-8859-15?Q?Ehgs53gCer/UpMy2KETKITPLGrp1ve5gR39tTpG6jN0Ymm066pZPiBdQe?=
 =?iso-8859-15?Q?xBp5aTo5X3HP9lPDjzQaxlvQEc0s4Ia9ehRUH9KDgUBzvJWrJP47kSLhx?=
 =?iso-8859-15?Q?+xemFZh/Y75YQ3kdj4efBl6t4nUPd/uBcwg5CY2CpzeaibYV1B/4Sg6f8?=
 =?iso-8859-15?Q?VjSL/tLTnKplX+90s1CLFcn47/N+oOBJrSykcZ6w5Sh/rX/5YmB76ptOj?=
 =?iso-8859-15?Q?MgsNHLYkyOKef4IhabKc6W1QahuvT2fLcwrRZn3PE4dFce3y2h7FhapKW?=
 =?iso-8859-15?Q?0j3WVqqp05z0cUKAwZK4KplyJq5/uNvHx4W6oOKQgmG1k2haX6k8dtQpH?=
 =?iso-8859-15?Q?/p3/bLkbmetEucZi9Jtn1xzCRBlTn+nw2nynmOQ34GO/bQea1fJ+zC9GG?=
 =?iso-8859-15?Q?JvrvUSNZMSpRuZiamZKeEm5+mJynO7sm5bIPIUOY7tgZ7YM4y/c+yMJLL?=
 =?iso-8859-15?Q?JXwDsXYHB7QOWIH7RwaKmic9bWRNYJK4qvimqFB7KS7nFWNPC0MyJ4fgC?=
 =?iso-8859-15?Q?qzxqFW5Q4MctXCgJGUa+wcIqPSVltl7j0OFijxVOuiCCnBV0VGXmeyEhN?=
 =?iso-8859-15?Q?Z7s4+FBm0MlxPTQL02ixLUQLeswVcSOdwigUoVOIPpPsWocpxovOJ2BnP?=
 =?iso-8859-15?Q?LPyJByFPX72DL+jvoEMCUUxA+/jMq5DZfoj1p3udj+kiwnUdKUiRm4ZIQ?=
 =?iso-8859-15?Q?W4+klL9SY7v/FTjEaVVDn1m2VPfjCS90OsDPHbbXlFNsn1zC7nKMO5Haf?=
 =?iso-8859-15?Q?wE7XFCA6MERDbpQSRTOHGbiOpsq694o3TEXjqLZMan1da/fR4Y+LlqldO?=
 =?iso-8859-15?Q?ngKNZqA5/jynb/LleCMPbQeuw1acvoZ/1+EbnyY504NkkDxFjBbxBGIpo?=
 =?iso-8859-15?Q?kNHhrtF5+uSmA/8mKJ5hUXUwaJiYEHkp7Ud4u9wAyjA4PE3YhoBxAEgc+?=
 =?iso-8859-15?Q?V/H8lwgogiHBn6VHd2R3L705QZSDeO0Y873PdgYCJv/i3RRuxUtLb4svE?=
 =?iso-8859-15?Q?LseJi2vQ2uoqJ6u7J1kv2DFNIBOS5QVw3PyJdcRePslrJwanxOk5gpQ+Z?=
 =?iso-8859-15?Q?HfuyanZvCt89DDUw/8dk9zvTNcZ1uV9e0u+zYwmPq+xdh7yOBic+VUyjE?=
 =?iso-8859-15?Q?36gbR9Ieby9UjOrVN+kVh4d9c4nvJgEQxeBnMbFM87l+iXwcXmmZRcAdZ?=
 =?iso-8859-15?Q?YGeHH7U4PhE7SXPXVKb7oiAcR6YRh6ReBtYzndSyYM3J78zs8uO6Qw9dM?=
 =?iso-8859-15?Q?XWSPgoa5Gu3muzmqcNaHiPJtfgr8Ii/2MjTr1AA/5FjT4HgXLL7j5Pk1l?=
 =?iso-8859-15?Q?gfnHNRQU8ITRZfdTWV5dUq/aELfEpofcg9VNA2eaP0PvkF/OnymLfz4w2?=
 =?iso-8859-15?Q?HXx88zGOE4tTgHX7GYvW4zHThdxwDEwbNvhowvxiqHsabwAff50j1QZQF?=
 =?iso-8859-15?Q?EazBqRTnqvi+3Zw+Ij3jHSzv1ID8HWtiZlYcxOfy50ILbd9DuIunCl9zx?=
 =?iso-8859-15?Q?SINhspkGBRlWPzyjTM46vDJ6AFl+7XE0jb6bGVJ+JjvCSj6aWVPD+HUy+?=
 =?iso-8859-15?Q?QAJhtTimFiYLCXZWS3/D7hVDOi0syniXxWx9Bb4BfCD1xIopA60Jw3p9X?=
 =?iso-8859-15?Q?DqnyVMrfWtQ1UP3Jo1xwShX9OA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <AEECBB35E87871499BB6C456B2D4C822@eurprd04.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bb759dce-cc27-4514-1f4f-08dbe5adf9b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2023 07:39:18.4011
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2KiioHAqUZ6LHQ6bpGNa5ITg+wEyYejncIskDchegqm6P2kAKUws9kJL+6iUjtWuvtuYeNWTlkBNpCscynjyMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8295

On Wed, 2023-11-15 at 13:15 +0800, Heming Zhao wrote:
> On 11/15/23 04:51, David Teigland wrote:
> >=20
> > >=20
> >=20
> > Could you try multipath_wwids_file=3D"" and see if that's sufficient
> > before
> > we add a new setting that's nearly the same?
> >=20
>=20
> I did some test.
> 1. multipath_wwids_file=3D"" failed boot if without commit
> 17a3585cbb55d9a15
> =A0=A0=A0 So empty value is not enough, or some code logic changed which
> makes lvm2
> =A0=A0=A0 denying multipath dev.

Well, 17a3585 ("pvscan: use alternate device names from DEVLINKS to
check filter") fixes a different issue. I had a remark about it in my
first post in this thread, but nobody has replied to that yet (hint:
I'd appreciate if someone did).

The "multipath_wwids_file" test makes most sense with an existing WWIDs
file and "multipath=3Doff" boot parameter, or multipathd disabled in some
other way.

Regards
Martin

