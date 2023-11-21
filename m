Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2079.outbound.protection.outlook.com [40.107.104.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E50537F3
	for <linux-lvm@lists.linux.dev>; Tue, 21 Nov 2023 14:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="kBWWMfr/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sjj8itRKhMyU8dCiFO0j2BqBUmV+vq/6k1i3y7cqJFP99mQZz6SdLyXB5CqQ+FFjYAJ1jKFrt7yG89i2T9eyKXs38fqMzI1Kn/S4NksMs0iSapiEP7jebQ/8xutF0GAtoJhY5ieyohvaCX0qpRK3o6HZg1cJSB7CWe3aszOZQWkYGwNpvAQ7KVmZJeZurBq2biChVio0QOLYM1UcAzuTRuteHgGRH6hM7OWDF5AmqRL/EX8t83srols4VFrV1otfEQewhnKn+n42kFDEB0PkA1LeGE+kosYqs69eoahNmHvgshJi1w8XWgIPar80jLTawoXxSlILAGrFV2LVhsNiDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uu29fWM7lngikmfvMeYFxAa7+D9FtK6U9rqoNrgPjUk=;
 b=MblguU5GPy74Zr8WE2Mk8vrk+yeir89ztMJQ8b3n51KU2kA9RSej39Cm31fYijQlcuWUjsTLxy2kkOxNvuGDCnvJUm8n8DKKsoZ6yz3DRVuTWvy3kT1des1k3DrD1+j+boDm6WCoiTkjEC4RVc/GQqvaS0wRwW280fKd7apl4JS7Ysu8vpJjKmWieQ3d9B1rLU/oQEV+zj6sWRBM+Z3KYuwXQg6fUDygLpuZ6BRuJShx7bRWerfrWC7aGQddX3iwLuAviSr8bELZahVHKl/6CXJxdcjOavCmBlOgdSDASNmEBIoV7t4xEjTxfeCMyxI7aO+sr2POV2hxb+Jkif6y3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uu29fWM7lngikmfvMeYFxAa7+D9FtK6U9rqoNrgPjUk=;
 b=kBWWMfr/Ugk7jYSY2rO+tbradDAH0aoHAcZPxmJSKOoOsi6sZEROjZwXwCE760U+2EpDG+OzNJrcdJBNDhIfuP7TOA9DUoKedcFPzPkL7zzu88TOBp/lRTeL1HD0qUo77y2E8tOujjGDBUZN9oB3VEoZFyxnlWjeGqn8VT4qlCj9W9gSJ9hgLCc26VMWAkWX6WuZVJEdDOXHPYHgivDpIZQthkx5Xwln2lAoT+MCAVM3TLd+VKW1dqt97XIN4FviRhjgxWCOaaELskGh1dlna/LBe2dde7RX4Ro7iCgnBryInghHPrsJpioMHKRWCfrRVyqrSvlP55ej5OcgycyVHA==
Received: from AM0PR04MB6324.eurprd04.prod.outlook.com (2603:10a6:208:13f::12)
 by AM9PR04MB8700.eurprd04.prod.outlook.com (2603:10a6:20b:43f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.17; Tue, 21 Nov
 2023 14:39:12 +0000
Received: from AM0PR04MB6324.eurprd04.prod.outlook.com
 ([fe80::5c82:3111:897d:74ab]) by AM0PR04MB6324.eurprd04.prod.outlook.com
 ([fe80::5c82:3111:897d:74ab%6]) with mapi id 15.20.7025.017; Tue, 21 Nov 2023
 14:39:11 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: Heming Zhao <heming.zhao@suse.com>, "zkabelac@redhat.com"
	<zkabelac@redhat.com>, "teigland@redhat.com" <teigland@redhat.com>,
	"bmarzins@redhat.com" <bmarzins@redhat.com>, "linux-lvm@lists.linux.dev"
	<linux-lvm@lists.linux.dev>
CC: Glass Su <glass.su@suse.com>, "hare@suse.de" <hare@suse.de>
Subject: Re: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
Thread-Topic: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
Thread-Index: AQHaFJ3iDFYd3KQH70a+UW68GS9Zyg==
Date: Tue, 21 Nov 2023 14:39:11 +0000
Message-ID: <5a9061d0f7e287993b127641cc11d7a15d442803.camel@suse.com>
References: <74b83545-abe7-432c-ae19-814b289a6ff0@suse.com>
	 <6c7699678ceebca58c56aaa769c2a7b9a6092883.camel@suse.com>
In-Reply-To: <6c7699678ceebca58c56aaa769c2a7b9a6092883.camel@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.50.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB6324:EE_|AM9PR04MB8700:EE_
x-ms-office365-filtering-correlation-id: 9aefa239-693f-4a27-35fb-08dbea9fa0a6
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Y1yqd0K+fCl0LgtVy6CdRZ8aot0Ocf+A4AfMXHQ7G+Ot3Nvc6iD9cV3hQO2RKNukbZTy20L3siAsNx0evEzILzcmj2w3lyTY0GMfP15Eqm9jrNNGAgNRo8NWShjcIePcZuQaSF+KeXaTCS09xX4kromJwhoyVLvC0iyBP2ttOfJ96fOBHZAPYcMTBBucArSiJ1GGPXZ3dHqoCJ843YHobu0pvmoFPVOX4dmfhT+l3dl9DnqIfYE+yQr4yBMMrthzcez4nUC3lKANE41/Xpnjazd+3Fj3n9IWUv7rbs6C7SwZ0eaNfvs+dnGU7iNFNFg+zy83O9+HVAWxs8Bbmu5p4XxrZcWJseEzh59p6rW1ASxxY2f1RJWN8DgVj2fS/nlDoB9EIUlluZyloOBxNjTpjWJC9W05d71FxN4kEDivri7f4ku4gtMakJJgWCFBFl0oIsCd75J/KNvUYKhCCFgGdf4Z8vWapaH/UqbZae0Ioxj11K/EyCQjOuBThjexvrdAYJcIYEk0C0vsiCfzIgTdMwk82rZziOklBaM3PGkvsvGPlPBWFNgdc9CxujHXrmgdAj2pm42NByhE+kArEK+9EcPAnoK6vjaXIYgSQ5mH16Gf6eOY/35WxQLvswleZDwi
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6324.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(366004)(396003)(376002)(136003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(41300700001)(36756003)(86362001)(5660300002)(4744005)(2906002)(44832011)(4001150100001)(38070700009)(6512007)(71200400001)(6486002)(478600001)(122000001)(6506007)(8676002)(8936002)(26005)(4326008)(66946007)(38100700002)(110136005)(316002)(64756008)(66476007)(54906003)(66556008)(76116006)(66446008)(2616005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-15?Q?XyvE1Rduk3TGdxcO4SN6x4w6vpFPIdVYli0fuvORJ7ZFCusuXMGwqm3gX?=
 =?iso-8859-15?Q?9XA5/pPjX/VWwICPjRtbFtstoVyu1zrv+Z80TQxuwNDVerOZf9wH4/kc8?=
 =?iso-8859-15?Q?W2SLQe55oqdd1ePmFBXDzNLYO/567ZLJbP33CRvcSUdxu3kpjOhvMQZQg?=
 =?iso-8859-15?Q?18/ijXY+D8ku8gmRuFxlbcJzo2y/6U3OI842URcWkVKF2vD9S0z92Apde?=
 =?iso-8859-15?Q?s/NN2vcbZilbZ3uUdSA30sBFBny3pyeMjnzE+pcf3M6kfY90fW0xfA1Dq?=
 =?iso-8859-15?Q?rk1VHn0Z1GPhFztzpjKYb9QZi8OcnVhF9l8gYl68/tBrH7r2kUYwzKsAW?=
 =?iso-8859-15?Q?OR+TMF3v8y5ZddXHXW3YnM5OdNdk9KUxluoTekbfTVEQfTECLQwfz8bVz?=
 =?iso-8859-15?Q?qtzn+vf1grd7KoRxDMmkGYAQc/Jgs4JQ7zspK5Opage2qL0XxBbCIBdt/?=
 =?iso-8859-15?Q?EjyE2WqwDA1BCrFXDtwsvwzxg+9GnkTHHcDMdWr6J7e9njWjkhx1xh1W0?=
 =?iso-8859-15?Q?KeNVJpKInqtsVRf3Pndwsp2sbjrQ7FpPyWs8xPvjGl6Q07mekq8APuM40?=
 =?iso-8859-15?Q?kZJ6icybBAFCE2yB1QmyCmEtlDaxgV4lwSWWTh4SXg0xI/WXWwAiNTXEP?=
 =?iso-8859-15?Q?w/GRkT3kWd0g79h6teXS2NYcXTtLXS0BPj5qyNCMKQeF5S8beat9Wv4cm?=
 =?iso-8859-15?Q?iFfqZk+FEhn9EpzHxcvndrG/PtM4tYr5ivCRZz+gdYbD2vKI8k2PdZwHL?=
 =?iso-8859-15?Q?WSTmrGz8579bnOutAeh0bGADfqmUodwNZEu1aGdRn0ouRHHvUKCBfovAe?=
 =?iso-8859-15?Q?2USS5WiANrTsQ5GkGEyLuuou8HeuFo+T8rgXkL+u//5knPeySwfuRMohs?=
 =?iso-8859-15?Q?zK82jc0e5V6I9lswnX8CNK9BrkaWwE7yDIZnY/ar+23VNlkriysXfJklw?=
 =?iso-8859-15?Q?kf087iC6nKLsYIY11lJ3Art1fljTS86RIMp8G1FnPjPUb2yNDbyRR2frN?=
 =?iso-8859-15?Q?I0Aj4m1szzZKWHR5dYC7hkLEBTOVsya6rZ6sk5ZfhcKxQOXQAnM9MWbTd?=
 =?iso-8859-15?Q?QVYHkmYyQuPp3FFRLGGxAvR96S3GY0t7FNqaqrEi8oCzOQIcC2C1CovwZ?=
 =?iso-8859-15?Q?YBUMjIdgIhATetXZL5n7+V/mfaEvo0clQ3v2UGaDPyRQKaPprHlZgHkt1?=
 =?iso-8859-15?Q?cFakTUFwMeXQW76vaou6XNjbYP66p7bocj3OyfQFjq6/U6IZ7Q8Px9rw/?=
 =?iso-8859-15?Q?rA3SU9VtmWqz590Si1gv4ZBpGieApigBA76JMP/g4UKeqSDzbqwTmLKz0?=
 =?iso-8859-15?Q?8MZdvNON19uNskwX/eigahAFbOWbsoTaocOiZR8dUxCwaZDrw1NxjZgQP?=
 =?iso-8859-15?Q?59PJNffcpjTbCOXHiB0Sh13VPK6JcHUsrhqOd3irovAhP7kIQXxLKKrl1?=
 =?iso-8859-15?Q?AdWFk9rFx5rRyw38UX9l/Az+LMf0bt/iA+oh0cgky7asV09dN4at9x0Op?=
 =?iso-8859-15?Q?0qrDt+VwV+9eADi+wfCUXfwM8GxNOO7CcMVRII4qSk7kMktkYc2b3ay+V?=
 =?iso-8859-15?Q?BTJVbkkoRRi4IsTbe2lr9+E3cUWw9yyvKwQPsA/5G8FNIaUIMHIQ8E7xi?=
 =?iso-8859-15?Q?UYqJjyLsA/tMRUD2tplja2/4NC5/vSPLg/XFeXqvW/FUzwDvux/kk1w1u?=
 =?iso-8859-15?Q?BptIA8ji/ymgLkdBnHRIsEhadw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <E4CF1E77F5BE2349A19EA6EBEF7EC033@eurprd04.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aefa239-693f-4a27-35fb-08dbea9fa0a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2023 14:39:11.8534
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aSAPMVD6l266nHyjNQyppj2HJA1mRzsEgq2Wa5KrIT+FZQdPpxS9oJWtdYK5wFdpmcCc4GET1jBqD7ZS+ZtbNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8700

On Mon, 2023-11-13 at 11:52 +0000, Martin Wilck wrote:
>=20
> PS: Here's a related remark about 17a3585 ("pvscan: use alternate
> device names from DEVLINKS to check filter"). I can see why this was
> necessary, but I don't understand why this is found to be necessary
> _now_; the same issue should have always existed if "pvscan" is
> running
> during a "change" event for any given device. The solution of 17a3585
> "worked" for us, but it looks only semi-ok to me. Other udev rules
> may
> modify the DEVLINKS list after pvscan had been running. A correct
> solution must make sure that pvscan runs after all udev rules. IOW,
> pvscan should be triggered in a udev RUN=3D statement rather then
> IMPORT=3D. This would probably require a new systemd service, because
> it's not just "pvscan" alone. But the result would be more robust
> then
> what we currently have.

I have seen no responses to this remark ... is it just nonsense?

Martin

