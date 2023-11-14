Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2073.outbound.protection.outlook.com [40.107.22.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9383F2C1AA
	for <linux-lvm@lists.linux.dev>; Tue, 14 Nov 2023 17:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dSIbF1Z6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GOoja7vhRHWedhIr1QGgdUXCs895EQSwefpIeLxVkrA5XLXsHtXopmfMltmMUEGR8IGqMUgjhrniX42WnoVgSSW6eU5v92EsxgvS+eU+8q/GVLLnRbqstlSjPB40D0Mx1h6GFVcQCAsC8JVeY+LptirWk4souv8FgzQpqa1hm/HcYpCfkCwAIk4DDC8TnRbxM+Vuh2CR2Zf01EXyBXKHlo9pQZTMjaMU/5UE1cDWLWyrTSH1kyTJIh2UHd/d7MeAhT7SaKfapMdazMFQQ9NvuQCBt98H1QTrO7o49erNMJByRa2jqSk4n4Tj7bonrUILNZJCjBmVatCKA/j0gjcHvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9EaUWLyAba5B+3fjqqgTb7RBeRBPjASBTHhBeN0g61I=;
 b=oHeonRFrGMXOZTKrifHmZiMMsrfczZDTZ3YfySUbFKPwCGN19SODrHtZyz5UVoBSNGzJQn+TNAV4reZlrx3A+ioMQX5ddtVdRDIn8BiYdGSovJIT3Y/yVPUSjJU0Y50bcoeGL3tWjhIm7iFW+FjOxPVpP2pMbk5D+5xlR73Aen623nn8pATMdVg/V19qO/6pGzOpgg7jfVtiR18hN5pTLTe0guRooePpA5ALCOj7R0xhIakLAmRH2jMIdP6TGzw9OPYeYD8u+4shiwd0G4ugh3jsUI4GEcHnNWR06tcDQPJj+L85LWXPNlY1ykp6fod7WI4uYdTkBEsshEIKe3niFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9EaUWLyAba5B+3fjqqgTb7RBeRBPjASBTHhBeN0g61I=;
 b=dSIbF1Z6aYyA0JJoEB6SUPacgSUXBkcUmPwA17DzOYiA5/X/LFMt7Tv8fVtiV5gxqLqAMSP5BWKyjtfRX2cPPdQ0i9IJRwMkFpq7vHTfvE48tlilc8ys8BDUUDxjFNLVZSa3EEYohQ8AZn+i0SsLRF3XiKJZ7eWJEzABj0RHe+vHMSZS2B/+JhdbTTx4w5114xdkeAFj+QCMDU1dHmULsOHYZEF2V1zXCrmHB4uDbAhN7UDRCoxvJJbVN4reTB7WW8m3QW7h2oWBGLIzAUKhVr6uQOXNJX9XTBONahaNLK1rcoecW/cdk3l39hQIwd9BxvUTlItLem0up9kZh4RDqA==
Received: from AM0PR04MB6324.eurprd04.prod.outlook.com (2603:10a6:208:13f::12)
 by PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Tue, 14 Nov
 2023 17:58:52 +0000
Received: from AM0PR04MB6324.eurprd04.prod.outlook.com
 ([fe80::5c82:3111:897d:74ab]) by AM0PR04MB6324.eurprd04.prod.outlook.com
 ([fe80::5c82:3111:897d:74ab%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 17:58:52 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: "teigland@redhat.com" <teigland@redhat.com>
CC: Heming Zhao <heming.zhao@suse.com>, "zkabelac@redhat.com"
	<zkabelac@redhat.com>, Glass Su <glass.su@suse.com>, "bmarzins@redhat.com"
	<bmarzins@redhat.com>, "hare@suse.de" <hare@suse.de>, "prajnoha@redhat.com"
	<prajnoha@redhat.com>, "linux-lvm@lists.linux.dev"
	<linux-lvm@lists.linux.dev>
Subject: Re: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
Thread-Topic: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
Thread-Index: AQHaFJ3iDFYd3KQH70a+UW68GS9Zyg==
Date: Tue, 14 Nov 2023 17:58:52 +0000
Message-ID: <84c0588a5b6a8142459a482c25f82bc6d15b19c3.camel@suse.com>
References: <74b83545-abe7-432c-ae19-814b289a6ff0@suse.com>
	 <6c7699678ceebca58c56aaa769c2a7b9a6092883.camel@suse.com>
	 <23d98f61-f9e1-494a-be3c-df9531f4f70b@redhat.com>
	 <ZVJtCxq7XeCg_G-g@redhat.com>
	 <0bad121644deb8bf67329f111f0ba34ea261e988.camel@suse.com>
	 <ZVOnoCjNmOYToBpt@redhat.com>
	 <38458148cb14bf398aa3c6912842ddda79b81115.camel@suse.com>
In-Reply-To: <38458148cb14bf398aa3c6912842ddda79b81115.camel@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.50.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB6324:EE_|PAXPR04MB8459:EE_
x-ms-office365-filtering-correlation-id: 171c49e7-3905-4cb3-42cb-08dbe53b5cbf
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 NEX76fSnHOTdzhlqAM1oHHxbeCUXC240wJAG8ZMRTfdAzoouJ3rNCXhFWG9pm8jKG6hBJipiD28iqrV0T5qjTVPL0+WQLqFAOkhGNJTnnRID+VCVivpAL/fTuumFh5RVR48Eg9Vn1nFEAJ9/4ijQoaYZSeeU5uukRY8ltNPp/voVD5WAXMAvqYbkE46EAL7bkYjOZ3a9K4VPIyA7xkz6bxr4ORLNgJYKEehwtve07GiAE4vtptAQh2Zrm3ua1+Z9WiI8YSjEg6lWWI2oXiPAwXirShm9vk5YfMyMF8dOLE5G5GWcPFhJXlShHP115xAJrz3WrRQCcaBIS5dKTk+zAihCgI1X7YT5OdKWsKfRLg1y7SmiNVN311T18dhXv+d/ft0kE1cjs30xdUOUwKvKp73NQexg/GDz3Ltl5KEe6iE+Hpg1fZi3bWBtyjdzEow9tM4lTc15jkGNOzlKZDrIWt70rw4EI5FLqhedSdqzGS7ucDj0Exv1NSycsMRRfOm8O8tPu1LHcuxk2w5EW2Qot41+/cFuOW15h8IQ6NASlgi4o6XSHewssyczD6h4ipjPLDX7VyslaSYaDMjrrowLiFx7j2UlCO4dzMrOmSNCuoQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6324.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(346002)(376002)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(26005)(71200400001)(2906002)(2616005)(6506007)(6512007)(83380400001)(44832011)(8936002)(4326008)(4744005)(41300700001)(8676002)(5660300002)(4001150100001)(6486002)(966005)(316002)(478600001)(76116006)(6916009)(66446008)(66476007)(64756008)(66556008)(66946007)(54906003)(86362001)(36756003)(38100700002)(122000001)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-15?Q?XP7ZHjG3QHG7cSbdOYplxrFKiKNg49tHAZtbP9mXihp2nB/mi1sw2V/tY?=
 =?iso-8859-15?Q?+uKQD9+2RbS0cwG8dCea0fLeZclrIl/N/MpOaBb/LiEYCrqWEOOrydkLR?=
 =?iso-8859-15?Q?BTvU7H6OsYhBiXjvCMaqj97VXrWQDAwiXEaWT1o8TA78d+8g/yNlxBI95?=
 =?iso-8859-15?Q?IbDZTN3vMaLljsq8DvDLs2+LKsWFy1UhhOyyjHWZP6Jwhit7lYS61a7s4?=
 =?iso-8859-15?Q?+cEKdDQ7/46gjsy7E5Mwupv0JYFCoXTaOOKCCRXOabZB88WxhGchp4gID?=
 =?iso-8859-15?Q?XwmoweQM9Far4FJQMhETp8nMgDfsknCNJXIlIjQyXailUB0jRT7i5WIat?=
 =?iso-8859-15?Q?gECjGEpvI1EkT3xtN0PhGHSDm5wu5UaL9UYlh06t/CDyM4oXzo+EG3f71?=
 =?iso-8859-15?Q?zGaIbQ9+QxRm55S7GYDsnYPpqaKrQyG8o5RcBi9dmIpKDICPLZLUzzJpr?=
 =?iso-8859-15?Q?s/WBX1Hdiezvx8ErT8sVhnuuIzRv0bMtYta/pLE6N23Q4GaE+hLgVjbcV?=
 =?iso-8859-15?Q?xEkt0lQIiOGZJTUw2j9/2jGLDcMXg7EdsG60D3bBg2LGx3NsPyF67Oq3q?=
 =?iso-8859-15?Q?TKC/PJJkcnPQiqxIYu9MpWyQonOdxKLIxz/Sn0fSWPdO41HxoKbcr7ps7?=
 =?iso-8859-15?Q?Lva6iqv5vvjzWgbG+8U/EzpVYm4FZ7FEgfdIhfBDSZ9whbKPF1mWcPwyU?=
 =?iso-8859-15?Q?zGgCUtCLHAmTSZeizzULif2k9BAIF2fKEZwyE25nL5qjYQQ5SaKADUfUM?=
 =?iso-8859-15?Q?fYkEUwipJhTIlgI6s3Qj4y+mctr8im5R5YMnd2lPziZqvRt+6hnDkSpNS?=
 =?iso-8859-15?Q?hjMldtfQjEj8ipVvfg7IJesbPROw4yvghGk8WI9OVwHIv9q1J9xHunxue?=
 =?iso-8859-15?Q?lUM+0aa/VkzhjNbO3Z5LMkpbXNPlA/G6S9GxG9f1bVxaH3ZGQoRWYtZWe?=
 =?iso-8859-15?Q?yp2opLv3UdEnqs7CEFGZpT9Hh1DEI/OCK1IrMscaLOcHwwf7I5SrL2n4j?=
 =?iso-8859-15?Q?ScfTsUaw4ZrLZmvuu87TqPoEbGenE9IuI31PXhHgqrJu+W074Xa5SAc5v?=
 =?iso-8859-15?Q?65nP4HJE50kGR/rQhaTxfip/loOlM+2SScy0YpG164Ew8zZiT0PO/1sKx?=
 =?iso-8859-15?Q?YzWXxVZusJ+S6kY2thUKJABhyBZqVU4hT/UP55sqfNzZrX6v4LSbNlgJC?=
 =?iso-8859-15?Q?GmAP4OvCMWL/o+ENl7RyFG1Xgy9fIEME/nUHcWx+2J+q/b/jLkNEh0AsM?=
 =?iso-8859-15?Q?JjVkbAnPAjoSky5NyI7Ip4QansfjmZDRaGM2TyOpqU4gnrUQc+NCBn2tj?=
 =?iso-8859-15?Q?0YpDlpVC0yONNZV0S7cYLWnY2zCDT0Z0u+j+XF0fcj1nIrAwgYYSyBPek?=
 =?iso-8859-15?Q?J5pfz8imNuRmdvO2q2rIKHQVEPesnuLjACeR0prjuwtJOMtFZavYI7LT3?=
 =?iso-8859-15?Q?LpLiUJMCpaejckOS8z/bD7G4Hl0Q6NWMmeKfSVm7SjHT7IlKB+ja+SLyf?=
 =?iso-8859-15?Q?ImeFmOeMj9YhlxqcmtNawfvtAwC+QkwtJjzdsCD9Axrs2+pDXYwrXVgQG?=
 =?iso-8859-15?Q?7a/MgqmMgD98ZMhOx3KudSaW22Tl8gy88e1doa40d3O4yXC30zta0qpen?=
 =?iso-8859-15?Q?d8NwAR/Cvh3VC1WmrhInwCOicJDv8nTFKkV6CRG5cXNC3DsLyqeuSoZ+r?=
 =?iso-8859-15?Q?utAbWpGtKgkQm9o9biF6OMTSyQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <08E9638B68E5434F9DF1F338496A8795@eurprd04.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 171c49e7-3905-4cb3-42cb-08dbe53b5cbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2023 17:58:52.4950
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q0u1VGMP8yCDQB3OmpGnvSJhHBnwSQInXQtWB7ls6glHw7Zix9cujSvAUbmX4s6qSkRAduR9BW55T8qnG3fG9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8459

On Tue, 2023-11-14 at 18:48 +0100, Martin Wilck wrote:
> On Tue, 2023-11-14 at 11:00 -0600, David Teigland wrote:
> > On Tue, Nov 14, 2023 at 10:44:02AM +0000, Martin Wilck wrote:
> > > I haven't looked into "system.devices" so far. Is there a high-
> > > level
> > > description of this feature available somewhere? A link would be
> > > appreciated. On (open)SUSE, afaik, system.device is not used
> > > (Heming,
> > > correct me if I am wrong).
> >=20
> > https://man7.org/linux/man-pages/man8/lvmdevices.8.html
> >=20
> > If that's too low-level let me know and I'll look at writing
> > something
> > more conceptual and introductory.
>=20
> It looks allright.

    "mpath_uuid is used for dm multipath devices, reported by sysfs."

So users are supposed to use "mpath_uuid" if they want to use multipath
devices as PVs? What if the user simply uses "sys_wwid" or "sys_serial"
for a multipath device? Will LVM perform any kind of multipath
detection, and if yes, how?

Martin

