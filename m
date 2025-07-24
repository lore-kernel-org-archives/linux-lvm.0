Received: from BEUP281CU002.outbound.protection.outlook.com (mail-germanynorthazon11010009.outbound.protection.outlook.com [52.101.169.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D535B28F4
	for <linux-lvm@lists.linux.dev>; Thu, 24 Jul 2025 07:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.169.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753340989; cv=fail; b=Wps1lWngT9PlmIh0EUb8/V1M4dA5IiQ95qa7OZJ3TVcSSP5xe52vpwBKangz5AzXb45fXXVSQjYpkR5MPzzAYCpir9rQUa0wbmCCHuZwWcgtkTreTDlY/LwjU610dUlX+s/Zslj9VN5yT7fVcE5YUbCl3i16Tv7e/BbtYEpPtm8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753340989; c=relaxed/simple;
	bh=Y2aB7r5wpQKSZoUWJGrfIZmaFZOlsiGASs0iekdfnCY=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dKcSNN1W2B4LrpidlHzXy/kvQ8B5KBdD55bAEeZnsvtLHfw7AnksvjmrqEyeEScVK6V2Lu6BjPgmxIeOBvAGKC9Z9wY3rrn2YHE4Qsb6hTRzRjfbGyGjYNQjxTgavKA3aYJ5alAeTjHL1WWext5JR+oKdgsgGRR/JAWAHKBOYQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=eon.se; spf=pass smtp.mailfrom=eon.se; dkim=pass (1024-bit key) header.d=eon.se header.i=@eon.se header.b=mpa+Qc5f; arc=fail smtp.client-ip=52.101.169.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=eon.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eon.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=eon.se header.i=@eon.se header.b="mpa+Qc5f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gYXKMw6+Fu8M992fiV58X4044xIwsrveQCeoDiii1HNX5iq02D9R59c2uoi5SEPBiyvqO9/tLyHlPXDjXGjWPZBdPcnOc9H522ruxZGb2+kL6HBUVLC3WRgJVyqJtyIBPuitavUbJT44wBjpwbKbv7H/r/2o59TVG5kMma9VSb/8yiQBBWCBGt1sg9nQ6I7ioZF8uPTkTdu7XUujyfpMK7tfL4BkNgMZqxbxfjOi8uUfxXQRlJKsnXpxYzvQVV/sUob6jC0tUcZ12NgILHKVmtDOoVtLMHYNClNVK1ETBypGSVdvJ1oIA9m5U9IGRWUi+IxNBWGo0MQr3zB9MOr1Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y1HzEJz9ah+x5BXBqWRegnh9lp2MAR18gnKnDKyqszk=;
 b=e17jLuu2QMPGA/so08z0lB1lKc+DbsqswiyFkxu/BQS8b3fSUJTIt99fOYTDUOsS3cADqqKfe6w59bXJhILGfCzT3unLFbmtKs7vO/R1REKZRDt3SBkbNjSFH4gisshQefFxM+1KLNdvQBKVWDFPRE7oUx3Vckmy8Afry2D2XCOnE6xcGLEqzkJiMcI4EODqkseW4g1puUpJBwQ390UH/Acwe9DfGxo4VNlQz+VcrrrTlsFYXSelwMyClf0zxdK8XAHQw+3uhhkxqq8ivz4QD4nghvKP18bvvBd0bOZXz02tVEBriujz078Pj6g7b+g8nwPd4Wh54NJKh/VJlcNVjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eon.se; dmarc=pass action=none header.from=eon.se; dkim=pass
 header.d=eon.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eon.se; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y1HzEJz9ah+x5BXBqWRegnh9lp2MAR18gnKnDKyqszk=;
 b=mpa+Qc5fRlqdP7us8ch2QwfAH3DhNbz7veP7fJKxiHoWKN7F7kF7niK2PfitSybU8FbcF7U67WKX9rSkqWmy7qpuOGn9Ipy9AQIRovJeiepqsjQC8loOnM4uePTwky/XJwufgos6AmSC0s7+WjCyVpT9gWJswpyCnYyZGiL8bcI=
Received: from FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:be::11)
 by FR4P281MB4404.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:122::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Thu, 24 Jul
 2025 07:09:42 +0000
Received: from FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM
 ([fe80::210b:d15e:d20d:7fd6]) by FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM
 ([fe80::210b:d15e:d20d:7fd6%7]) with mapi id 15.20.8964.021; Thu, 24 Jul 2025
 07:09:42 +0000
From: "Henry, Andrew" <andrew.henry@eon.se>
To: Erwin van Londen <erwin@erwinvanlonden.net>, Zdenek Kabelac
	<zdenek.kabelac@gmail.com>, "linux-lvm@lists.linux.dev"
	<linux-lvm@lists.linux.dev>
Subject: RE: striped LV and expected performance
Thread-Topic: striped LV and expected performance
Thread-Index:
 Adv3ryOkPkyC1+SGS2a//kGki21OpAABDQ9gAAlHfwAAAKRzYAAD2EiAAAFmTFAAB8FbgAB4CquAAJ5EHdA=
Date: Thu, 24 Jul 2025 07:09:42 +0000
Message-ID:
 <FR6P281MB3672CD74F16FBA40D66B8100EB5EA@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
References:
 <FR6P281MB3672085D192D8BF5CB45CFE4EB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
 <FR6P281MB36727398D141AD2A1A1E76DAEB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
 <67b28bf7-b862-4878-8434-aaf0d157f2ca@gmail.com>
 <FR6P281MB3672F7D1B62E229AFCD31D0DEB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
 <9f6afc0d-ce58-472a-942b-15527f693d28@gmail.com>
 <FR6P281MB367296DD8DAECAB5633C9BDDEB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
 <630443e7-b5c6-449a-8f6d-402a71967710@gmail.com>
 <46e3e8c3-429f-4ffc-a710-5d8d585fbd1a@erwinvanlonden.net>
In-Reply-To: <46e3e8c3-429f-4ffc-a710-5d8d585fbd1a@erwinvanlonden.net>
Accept-Language: en-GB, sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_ActionId=b559da85-4236-442a-881b-a8251a61c03c;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_ContentBits=0;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_Enabled=true;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_Method=Standard;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_Name=Internal
 -
 Unencrypted;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_SetDate=2025-07-24T06:57:46Z;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_SiteId=b914a242-e718-443b-a47c-6b4c649d8c0a;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eon.se;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FR6P281MB3672:EE_|FR4P281MB4404:EE_
x-ms-office365-filtering-correlation-id: 424f6dbb-74da-4992-3ed5-08ddca810fe4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?a9WLBhr7arl8WhdoorTyX+tu9msDvSlkCJHM7mWtvWQxz8CMrANfeE46AVzz?=
 =?us-ascii?Q?8UnGgKmgz3/ZDGUrTBhCyZJHNCY6+FzpdJPJxIl6lOYec5SS8eqBgksDIkLm?=
 =?us-ascii?Q?Rj7kIJq3e5/RKCjTzhXZy6N1b103klBjdLomyDrO864jblD7EZ2CVrFxCs/C?=
 =?us-ascii?Q?F5VYWkIsjp8zOn2/qGhZPB4bBsLUhWw6S4vmLPD06KXnYyyI7tByZMVbcZX3?=
 =?us-ascii?Q?+gdXSrDKZX+TYsK0A0TKSdfJuDkvndRa56HT0Ysk1AJWpcJ8+j7WkVXaZ3M/?=
 =?us-ascii?Q?0jf5nCP354smn49cVysoQXMig0kv/8iRa/RCwwK7jrGv1AURhJ2y5H6yPj5+?=
 =?us-ascii?Q?lBNYYJtCbtxl5SHm6ZFMSyP6hzLQeZ0LzBReevv0FB73zYWtAnq53Bd4XaRf?=
 =?us-ascii?Q?/q9mIbBafjJcodpONS8DqqocWuyMe5qtAkCKX51g1LSB7ilT5Ub/H1+504fX?=
 =?us-ascii?Q?FZDBVYtOtrsaNS/xUxgT5Ec6m4iVSwlP0AdoF74+c2Nkeq5Q3kl9khXC/EhP?=
 =?us-ascii?Q?vk48Zk6YQLQ8YsbSgyw911wyM5+b5esKWdwLRElqLya9/IAxKXDau6H0ouqW?=
 =?us-ascii?Q?m0pmQklLBk3JeReq2iC7mICTa/305yY2EpI4BfF0S6FHqNAaLHb436UxzHtO?=
 =?us-ascii?Q?9SkIck4CemGxnYwM+CrCkVr1h3qKyj8J6ruI346ax5zsu+p8NfMNZ2jQdlv1?=
 =?us-ascii?Q?aSnsuiIQ2tZBz4SPDMiEmY75M6StKl03ZIuNHlermfHAvm9TKQHSBmFe8bue?=
 =?us-ascii?Q?qzjnNd8naHeOd2JF2/j2wsBGhqLFl0GYtpVFJIgN/1K0JoAuOYPX1K6VtADw?=
 =?us-ascii?Q?dWzzk09WgS/f2W17fXkIXuwUNftc+m2/M0sOsxw4JxGHQgGeoISd3UMf4BIx?=
 =?us-ascii?Q?BwQ3hvLU5B6ha6gfREbPWOWmN1hcChA/TFIJcVc77EA4+zHtYoMs8D0P7Q9e?=
 =?us-ascii?Q?1GsaIboy5v4E2+Aur//rgLfocjlOONmVzZ/EIZOscPP/GfzVQpaJCuaIyxoR?=
 =?us-ascii?Q?kSaR2LoKcH8nc3Kn4vRL9a8fRZcv3lsVALE8z+Ll6acKRDG5ppMrAE3l49Ok?=
 =?us-ascii?Q?SSlka7NV1oOQ/4xzJPct1tvhNMuAJA83HmUlBn8cmlwJPRqRsAG0h1uB1i0h?=
 =?us-ascii?Q?Hv12qh5EkH5G+abETsbD+HiFBKeCn/vFabng37870H2FMIwMfsKL7fOfw+sP?=
 =?us-ascii?Q?uxsb1xUz4UoE/yJI12qRYn3SDwGYC8Rstm3tCMyVjHfilSZj3Uv4XjTx2Rjg?=
 =?us-ascii?Q?m1P23YopVQA2YAKQ9eZLhHJvIoReR7YRD62XfI+IlORb2kaiRjSbN44aKBtc?=
 =?us-ascii?Q?oGE9Bj1GGkrJUgGKnQ2ZXo5HMy+HP5QJEw9pspgeRXRhpK7trbsjdcUOjUIB?=
 =?us-ascii?Q?W1/2IcJX7ZPLXqwl2B6tVMHpg4h7nsTE3eSgs6XjZLiUYAssDycGXclBi4gt?=
 =?us-ascii?Q?xZQOVY9rEWminpljBzLzXYoswCQGjoxN0uKrZCCMSFnFgTAOo05f0w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?7N7blOpBk5Tk2waWdfIElopa1ho8W7RLJWcXauGtieFRu73QTqyfWC6CSRae?=
 =?us-ascii?Q?caq22Zd8n+jzyqXLqo9sO2b8OX+6aLKba8Evc6JdlboJ/d+Vu5eLytioEUaW?=
 =?us-ascii?Q?Z9fAu+4jX6rMoWVCT6r5u9D1/UfYksRHAD6b9ePTwSYlIuDEf+FlMH/N7slz?=
 =?us-ascii?Q?Qb7AmOqM/LpZfCZ/pHZq37Tzx7L5v6TyzolA9WW1INur/qRwl6sVBHU37vGQ?=
 =?us-ascii?Q?CqeHEP6tPRASHTKts4VjtFLBJMC37TUqL8Ylh35t6F+LfgRxptVJTqdzNpo0?=
 =?us-ascii?Q?F7THztZeTC3AV2bs5pmYcoI9KerbDfFiqyDDaDNVQ+RD568BXTM+WYAymQs1?=
 =?us-ascii?Q?ICHTLL1CTHshq6vZLh4Ct2JmKc3Tw5shzGKJdmeUDBrjyYz1SQfJAWsXF/ys?=
 =?us-ascii?Q?aS5oNn6NuLR+B0AAiIesvj56st47CzLNTZUPVvn6paOx+X+GAagIkdJJ9kOD?=
 =?us-ascii?Q?7ZrGL9CRLEodWF+FW5qdBtM0XVt4xIk8lMbOO1OiCvlJur7cfrP8w+MnLhTT?=
 =?us-ascii?Q?IuvFJHECr24j4dWQ/yLJ/du2t76bofaHE3KK2b7TC6o/+dThYt/QZo2SezV+?=
 =?us-ascii?Q?LjeuJGP8VqtnsVt1s6M83HrIqZ1Pl8N0okMQI1UPw28PhSmEwNuZP3H+0UCL?=
 =?us-ascii?Q?I9kz3IFs/NpcX/RLePKsDsua6fr7aikdR6ys6RLgJmHY9r9v2fbmFG77Cf7v?=
 =?us-ascii?Q?B223cNuzJIe5pkBT8WJ++PXPnUQ1nWB4RtfEy5qoY5tDfSgSfWtQMK6/wmJ+?=
 =?us-ascii?Q?PVWFkKzfFn80U19doGm6zop8LGoyHn0q0LuiIPw2qtGA0VHhGH3j27lyDhpk?=
 =?us-ascii?Q?CM/yvL9bB1G5nivc2omfJRQRRJWwqQrRSMNeBNH7jjmyHOBwP60YOuOyImuX?=
 =?us-ascii?Q?DkNzvrcwQCBa2DyHHwUxm/28EB76nPrUerPbNanoBFYvr7WDZPgFccN1jSxs?=
 =?us-ascii?Q?YUMuGWnvPzH+hDRxNUy1w7PnYnTuUm2mSk5At1+lurAgL56vWuvQ+zXNhQF0?=
 =?us-ascii?Q?DUl5QL/PYg1TUrNdHjdAbFCHErr1bAtORBjphSVYgc3jk3RRyO5/oN+gfezW?=
 =?us-ascii?Q?R/uZL+BaihJ7K3f0H2G519pGd/nV64rrv1JmCYWBf+4GUZd8GBv9blFEAIzC?=
 =?us-ascii?Q?eQFa5zER2eYkvtuZS2V0MHCEEkYB5OmNbjc1UP8JyMzXMzgQzn0TE3BOoWkY?=
 =?us-ascii?Q?6cvTs3V8SHX0g0QYFzc5Hr2jGW7w15Px+JNxp1hO/LQaK+usxKvxFB1SqIjL?=
 =?us-ascii?Q?YlL2HetdbkRNXpnIJtSfAgO6Nx93uISiFnvKMv5+s+XECIE5ngRftZ8xLpuW?=
 =?us-ascii?Q?8WQl6ncCvjqACW3mlgWR4GmL0UjRyQ75ctunLFLeOSjAZQaIah3Q5yDL9hnb?=
 =?us-ascii?Q?C9iMlu2z6psteJntfMFtWkZUHqZGLDzDDkIoaPBT16iJWsDt6EquoQ67KTfs?=
 =?us-ascii?Q?/WoNVmD0i5zZNxXeJ0wJtCdQ0hqSxTy7Td/Ljzl0sRBrLzpuRoc/oHxzWm82?=
 =?us-ascii?Q?vkFNLgKdiqRRsNh5WZ0hdZ8xRuIVG+jKp1ShVLkYrH1dRujqRf89fy32tuyM?=
 =?us-ascii?Q?onj8uiEjdWJiT5Q2xeE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: eon.se
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 424f6dbb-74da-4992-3ed5-08ddca810fe4
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2025 07:09:42.2057
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b914a242-e718-443b-a47c-6b4c649d8c0a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3SZ3NlE7Rrk6/kjYExnd8PPp5AuXkpKI/GAzlTEG2sZPURVyrzB186eFX2/6X4fj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR4P281MB4404

I've been thinking about the point below, about using dd as a performance t=
est.  Although I do wholeheartedly agree that real-life workload tests must=
 to be conducted (ideally where a production workload is recorded, and then=
 played back in a test environment), I still think that dd and fio provide =
valuable insights into disk performance.

On real physical hardware, where I know all of the variables, the product s=
pec sheets, and the theoretical performance ceiling of all the components, =
I actually see results that are close to the physical capabilities of the h=
ardware involved when I use dd or fio.  To be clear, fio is showing the sam=
e results as dd when using direct writes, which indicates that dd isn't tha=
t bad of a quick test and is a viable replacement for fio to be able to get=
 a quick idea of where performance lies.

In these cases, testing a system with dd or fio, what I'm after is a valida=
tion of the physical capabilities of the hardware, as a starting point in p=
erformance tuning.  If these results aren't in line with expectations, then=
 it's pointless tuning any other layer until this is resolved.

Unless someone can provide evidence that dd or fio do not and simply can no=
t show true hardware speeds when testing in a virtualized environment, then=
 I can only continue to use these tools in benchmarking.

Because when it comes down to it, we buy hardware for their performance cha=
racteristics, and want to verify that we are seeing that same performance i=
n our environment after purchase.

/AH



-----Original Message-----
From: Erwin van Londen <erwin@erwinvanlonden.net>=20
Sent: 21 July 2025 05:26
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>; Henry, Andrew <andrew.henry@=
eon.se>; linux-lvm@lists.linux.dev
Subject: Re: striped LV and expected performance


3. Unreal cache optimisations. Using dd is by far the worst option to use f=
or performance tests as it will never (Ok, almost never) align with real wo=
rkloads. If you use dd for performance test you will find that this will ba=
ckfire in most cases when a normal workload is applied. The main reason is =
that dd will always have a sequential workload unless you start a large amo=
unt of dd instances to the same disk at once with different offsets. Even t=
hen you will see an obscure number coming back.
