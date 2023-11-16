Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2045.outbound.protection.outlook.com [40.107.7.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C11F29431
	for <linux-lvm@lists.linux.dev>; Thu, 16 Nov 2023 15:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="mY6iLPOu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aHknlpMrdBicKMw7Skv4HcrqN/P/pTxf4tZcWBHD6hEvqlPSnlPHKQNrfyBenaaIQH7wpu1nsE5d7rpFh+FFJYpDcy23K/CeTPBp2PX5J+xaYV1zUjUDN9lDom0AR73e1iGLlzSZ/N53AeeDEidmSUefksVpyCCuRx7MpKUClXT5nGJVOCsYx05TqKtve4SVjZTw31SNpe4BuVhaFuzZupqFYIDZRDK7MFLBbhBkvk4NSdUoKnZvL3EClzTVpK8gBhq7NDnpmtuLglkC5YZTHRBKMWUb7apXitUZSsXeeWLb7WtFyeh+nLmvMCK/Xpmp2uD9znsy7eZ1ixxP6XcRnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KgE2X4yX+m/nOKwMZKzXzXewGvvTve6weFMykFazFf0=;
 b=K0pyRJE9Xb+ubztOQ5xCvjNwm4/qhmROBcZs4IcsF02I37lXQj+YDZpaIrIc7zLoDkktvKOICWla01TmhCQCnp6Rh1tyN2WSB6zJ/ZLBvvb+ZH5QuZmDXcUc6IUt9caDYn2LLTeYCLpuQarPVYIrWr2RIqeHevs752BZpgNMN4/S/NxOJLU65yTjfvQ2GJWY0toLBMTSMwNOAwRozHZb3H6losv4z87yD4qayCCl586ip32ELfB9EOyIbhWAl1cC4ylFON1YbJA5EZKGHON1DBPdPmdNFkwrk6yJuz6Q71EMeddBx0sGe3dr05XXa5mfa13mRTLHD5JBEAJ0EyH5hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KgE2X4yX+m/nOKwMZKzXzXewGvvTve6weFMykFazFf0=;
 b=mY6iLPOu8i/VIlOmB9uu4vUO/V29w6es7Ap8c50Zl40pbFILQOSjN563u0OXxmUVdwxPBMiAAf1wo5gMpPnIrtVTn3GDDpo/xAa2+XphpFjpKy5ObCwBtZ7PzzNMufiEJE/B5kfRSveyAQ/BWRErU4jXkyu2NLrHF4xmPR6fTRApirniHRQXk7jllaJVurk/EHsO2bfJ4DKWB6dyb87ETXpmFc1j2K8Da6/uW2TgD+zGI/1me6MZ6+Csp9AtRy4czHzg5Aj38hioSTZf2rHksRROBc3dfsJ50eQenGZYhF4fpweRVXE48hyxuZGnxdGrw2gb1bdZ3XKI+/ioloRAzw==
Received: from AM0PR04MB6324.eurprd04.prod.outlook.com (2603:10a6:208:13f::12)
 by DB9PR04MB8236.eurprd04.prod.outlook.com (2603:10a6:10:245::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.19; Thu, 16 Nov
 2023 15:40:51 +0000
Received: from AM0PR04MB6324.eurprd04.prod.outlook.com
 ([fe80::5c82:3111:897d:74ab]) by AM0PR04MB6324.eurprd04.prod.outlook.com
 ([fe80::5c82:3111:897d:74ab%6]) with mapi id 15.20.7025.007; Thu, 16 Nov 2023
 15:40:51 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: "zkabelac@redhat.com" <zkabelac@redhat.com>, "teigland@redhat.com"
	<teigland@redhat.com>
CC: Heming Zhao <heming.zhao@suse.com>, "bmarzins@redhat.com"
	<bmarzins@redhat.com>, Glass Su <glass.su@suse.com>, "hare@suse.de"
	<hare@suse.de>, "prajnoha@redhat.com" <prajnoha@redhat.com>,
	"linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
Subject: Re: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
Thread-Topic: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
Thread-Index:
 AQHaFJ3iDFYd3KQH70a+UW68GS9ZyrB4SCEPgABPtICAAN7ZgIAAj8kAgAESGoCAAC5HgIAAfyMAgAE0zICAABoigIAACGcA
Date: Thu, 16 Nov 2023 15:40:51 +0000
Message-ID: <4da245517088a3bb7d8f850c0903d2d100e14b14.camel@suse.com>
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
	 <ZVYw9eNTj7Ir6V31@redhat.com>
In-Reply-To: <ZVYw9eNTj7Ir6V31@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.50.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB6324:EE_|DB9PR04MB8236:EE_
x-ms-office365-filtering-correlation-id: e2a4b762-c3cc-4914-cd1d-08dbe6ba69b9
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Dygr7Nyc51Yhq8VcX7dcZIJVLfbYd0ErV5H7yS+vJhXLexREazSr6+VqBAOa+URZ9AIWgPmHD2NGKSUKdv1QBwr6g9Fb12g1vHgg6syavyebeyPlzuft/UXGaFSqXNDg7+/2NuCcFKi3Y498ZswPIPDk+NTY+Ulq/gQSRef13Fgr3VAV56FT8gSoYnIgm0xMm9w9oy4tn7fsyCnpMXB2478RuJOHXHPq2IpwTXytp6BZoMoBGwLxyMH87jTn5ew3EMLzrI4UE5K0AB6M94faz5EfaQ8FSEk6FR1H8jo+q7ay4reLE+iXYvUzngyUfHjQDCyscjGK5U0qgELJXPn0Mv5YN9PgVF1eyzlhMVPlPayOKQZAlf5/ndOCB+IiIFwNwAMJsKXtU/myTvcqwb4DXWGzI/91nDEGIYKGHfItQLMovxln5y7CTszemSwh+YXFdu6AzngMVjFAkbxyFgZ/PkmnhVw/IasvaMIuoSyV6LpmZV+SoV7Hee5ElMBY6ntIt9ZNO6TmXSnahmAajsjCtesjCQyrhVvRCsCSYpEU+j2mwpXx+OSjZ0MiHdgiPKePQ0Nwb+652QQR6Thj9In2T4uvGrcHkylRRIoEpd80pEiy+gu+LLKa5ZjmHqai/7cy
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6324.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(376002)(346002)(136003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(6486002)(478600001)(2906002)(76116006)(6512007)(6506007)(2616005)(4001150100001)(86362001)(5660300002)(71200400001)(66446008)(44832011)(54906003)(64756008)(66556008)(66946007)(66476007)(66899024)(316002)(8676002)(8936002)(4326008)(110136005)(38070700009)(41300700001)(38100700002)(36756003)(122000001)(26005)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-15?Q?zn54xkuI5XzjH/qLHMzLjVwAmOkLeyX9l6269rVly4aZJ/ECl+uEpSZqr?=
 =?iso-8859-15?Q?FAHDMYIQ8XMK0pQEht48TUEwzLipsJ+McRTF/rt55uoKiVkfbrFb6G9y2?=
 =?iso-8859-15?Q?VC10RUs5Mf+2BHN3dq5nl7tF9gsTWHyPYucDuFhOEyEQ00k8Yi+UfO79g?=
 =?iso-8859-15?Q?tFQ6fs2eL3SamCTXIvlJDty9mstBhIaE0olhtKKsTmN/ZVSMx+ycDzLH6?=
 =?iso-8859-15?Q?BBKNSI7FDTmki8J6N8f9GJfM4TXPHfE4Awgp0WQhPbFQ1vb6UXFPqct2f?=
 =?iso-8859-15?Q?SHrw8flEBRAXYVVAm73VKARlCwGP+GP3X3O9161mCbsw5bPlcCas78iv0?=
 =?iso-8859-15?Q?z9Kp5Q5Mx4nBhZtwl6UM4XIugs3+qRnH4A/QsuDGeeCpigtjOm9fELjTP?=
 =?iso-8859-15?Q?NLRmsaQBvRTPDAnzL1VdJ9vpVwg2VcmR1fcpVUPhCXLiE3rnpYdKnfWeh?=
 =?iso-8859-15?Q?+fZiylk3AkdhxZpxIJV6e/mxzJc7kHD0YqjXrmeWT3P/R/05OJORysbpr?=
 =?iso-8859-15?Q?/LPlFLqxBZtMm1/cph4tsHmkM3vsJftlMYs1sgbBwphp0aGcWQh5VMfZZ?=
 =?iso-8859-15?Q?3vL15UnmN2SZ0D3klhlPVKPUj7v7IeuvkJ1RApXN8hGsXOog8gSIuHE7R?=
 =?iso-8859-15?Q?xoH+CmnBG8sRLjQzajfnFgFUh1pcNy9RTHSao/CNNPVyAIhJN9OZ4U/5h?=
 =?iso-8859-15?Q?W74HTOa2S35/8UfrS/btK+IVT6aWEG1cBYRQ4Slw0QnUVAEGMxiTDZzn+?=
 =?iso-8859-15?Q?keYVZANQhGVsAv/HIFo1YZdwb7jcU94T/YILGSFtt1d+NK0kcrzh2EzMe?=
 =?iso-8859-15?Q?CbydFsQ6v/EBkQ7UILvJbPeHzUirgBcpLKmGdQ7+dFhSa7J9n2+o2mqw9?=
 =?iso-8859-15?Q?HOd3zb7STHiAtAj7Lo+o0vKMfIS+UepPxqrYhH6Ih2/G0vxM1rt3nCqcx?=
 =?iso-8859-15?Q?2s/5T6lM+zE6ZHQHd2NPZwlMaXfActnr878EOGHDkrvTxwCm1ku42f6CK?=
 =?iso-8859-15?Q?Zoawga0ziaEg+yekV/4HdcWztp9WESYGwm5KiPBdVJJVfYspcRMPHDW99?=
 =?iso-8859-15?Q?bscBlcVW8C35QYNji5PrAr5Mibm1jGPFB68ZkV8ACjsgrYtbuWJuu8WJd?=
 =?iso-8859-15?Q?veG+HUhkoyhf5/vgBaP20IvLIFKqWATcLJm8bjKyHSt1cJpoKBbGLhhHl?=
 =?iso-8859-15?Q?12/Lxf/J+1i32uP4zx29+IVhTbHzIzV+Zq7m9GmN7+7f5vG2Tvw+AreCz?=
 =?iso-8859-15?Q?OsvCdgvEtDyIEZCATtwcGxAlnV72B1zdV0zzajXakG/rwGhd4Llp/Bl9B?=
 =?iso-8859-15?Q?bqb1uUwBrCUkH6bRyzIPYQXqXdXl3Uuj54kwgq2lTDClVs9ii+uAjji5M?=
 =?iso-8859-15?Q?EIjKWtHPcHGF3OnjzPTPL26x+P/muNE1Qi3lkS/mZzSSaYvdCO40wQ6lf?=
 =?iso-8859-15?Q?wrTDmUSYR/2o+MT/yPipLXZRYbGGDCezbzePt6JsvQx0E1hoJ3rWbeaFX?=
 =?iso-8859-15?Q?nQMWKkTjqNZpREDokboJRlOqEkNUEI3J50kILLnZyjTbw9E4cpeP7PLBw?=
 =?iso-8859-15?Q?Fn6JAoixV+rTDZ136fJDf+Z0QX/eKjKABeiZ6MV1XGMaEAuYlrLJlUqLG?=
 =?iso-8859-15?Q?gkiyfOJAmVfipc9Y17M1iGtpeJUrdqLeEh+9Tv68udV7hiMCByuREC53c?=
 =?iso-8859-15?Q?Ap90VhvzpWmq/HJHmf/kDrgoXg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <4C372A2532C1024C8FF8C63AEFE1F6F1@eurprd04.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e2a4b762-c3cc-4914-cd1d-08dbe6ba69b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 15:40:51.4888
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vSCfY8qT3+yUVFpokJs+dtE31GfdojNth6hJkHZFcPSA8oWIQC+X24IUNZGYghhFE7uJJF1iMdKZpRnXpZHz6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8236

On Thu, 2023-11-16 at 09:10 -0600, David Teigland wrote:
> On Thu, Nov 16, 2023 at 02:37:13PM +0100, Zdenek Kabelac wrote:
> > > and restore define DEFAULT_USE_DEVICES_FILE 1.
> >=20
> > There is no problem with configuring DEFAULT_USE_DEVICES_FILE with
> > 'configure --with-default-use-devices-file=3D 0/1' and thus no need
> > to change
> > anything here.
> >=20
> > Current upstream has set this default value as 0=A0 (in configure.ac)
>=20
> I didn't realize you'd changed the default, please set it back to 1.
> (Even better put back DEFAULT_USE_DEVICES_FILE; configured settings
> are a pain to deal with, and the complexity causes real problems.)

The problem I see with using system.devices by default is that it
requires installer support, as discussed previously. pvcreate will
create the file if it doesn't find existing VGs or PVs, which means
that the way LVM behaves depends on the system's history:

- If it was updated from an earlier LVM version, VGs are likely to
exist, and system.devices will not be created.
- If VGs were created by the installer without copying system.devices
into the installed system, system.device won't be created, either.
- If the users installs without LVM and uses pvcreate later on, LVM
will create system.devices, and switch to system.devices mode
- Not sure what happens if the system is running in "legacy" filtering
/ multipath component detection mode and something goes wrong during
boot, causing the PVs and VGs not to show up. If pvcreate is run in a
situation like that, would it also create system.devices and switch
modes?

Distributions can of of course flip the default, but unless I'm
mistaken RHEL9 (and possibly Fedora) are the only distros that fully
support system.devices mode just yet. Thus I vote for leaving it off by
default just now.

Regards
Martin

