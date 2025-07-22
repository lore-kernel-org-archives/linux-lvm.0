Received: from FR4P281CU032.outbound.protection.outlook.com (mail-germanywestcentralazon11012064.outbound.protection.outlook.com [40.107.149.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2721940A2
	for <linux-lvm@lists.linux.dev>; Tue, 22 Jul 2025 11:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.149.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753183485; cv=fail; b=n2vJhpPjfFDo7i20WgDH3JEdpbsWH4ZDCXq4QwGMiylOwdA92olhGC/hqkLSIKrlV4CcGSylRLslQp0dtHaEqFY0TDjWpzuKpTHfULOwEIM1peS0Lnfnt5zb+I22KXfEStdJpthlOANhyrCPrZgUtEVSJIn2pXGC+Qyv+3WK5YI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753183485; c=relaxed/simple;
	bh=IhKH4WiWCHsg+eIeqOHuSJL2IBgjomE/kSBSoGCYhHc=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hgAa/NLdkegGO1eN01Wp66x3PaVwULojjNtI5/dJJTPo4daicdyZBfL4P1ya8/UxBrQOod/MEYKqzsg5VdyLHF9wV4DIbGxnXioKfhLungolNAD3vjFEnW4tZdpqWOuI4aSU9rSbnxX9EJDil5k/p2YoGVJUlO3d8eB2LbCJqtU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=eon.se; spf=pass smtp.mailfrom=eon.se; dkim=pass (1024-bit key) header.d=eon.se header.i=@eon.se header.b=YbUkcTc1; arc=fail smtp.client-ip=40.107.149.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=eon.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eon.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=eon.se header.i=@eon.se header.b="YbUkcTc1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H887Vih5Yr+C6Fl1QwD/rwFX1Tk7+OSwMQFqTu8ojm3sbvWEwXW28H2OZe9587IW86gZefMp35ipuNrsa2gf56v7vfLgQSx7XOpFwPm73RdNgWI/BC8GRCoMeP2tGAE4eZJCsH4gyCI+bq3zCKreyjzCZmUDuHc0c149qFsng04/I3b8SYEEmcFNfcfFbxgHptSwe/Me0W5EwHRZ5Mb3bI1GYLJQ3wzSwVvuKVNOAKDScMow/Q22DlaohpQvBws+ZmqR3J5brRezBf/1LzNW7Fop8YEkbDThZf7xnhB98vbZo7MSyqwqycPItmjFh465qcBi5jOsYMWqgSmipRxO0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IhKH4WiWCHsg+eIeqOHuSJL2IBgjomE/kSBSoGCYhHc=;
 b=tpn7n7ebXuJXlkBf7giYnhdl6WcBal/+Udt6qowyK3MQfl+Z26MXADwjUsGDUnPodqCnkxM7sQV7QTpH/NPghWBf/Eyw54xKa+pokSQhkJplZYwoJ/MJ0whLtwVG/PDaAT891xZ2zJ4M5ak0aN1fOhfrY61GrAxsO8dGJ19NAj5MYWD9CWtGyG/ykodPt+WL74d0C0yBp2jXpg7NY5ZGXvOaxAwKtlHzLRMBdmuppv9D1Sd6DD6O7pA3yl0YQeC1+uLDRv6Q+SAS4G3UOt/LS5yGn0c2tG8Q+ATBhv3aWj0VMXC09m7kgjn0aCki1j5E3rLLjIsKUmHpA+saCfg9oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eon.se; dmarc=pass action=none header.from=eon.se; dkim=pass
 header.d=eon.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eon.se; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IhKH4WiWCHsg+eIeqOHuSJL2IBgjomE/kSBSoGCYhHc=;
 b=YbUkcTc1esuhLi2mtecyNDM0x4DxpFincs91ER3qsiBBIJE7Uwc72ppRUGDaen3v6xtRursR3CipO1BdHmTr9JlhKHe7dFAP+8xoNpExBUe5eeEpPPm67RILU2mwXokAObQpvAfo+YMYzQxkHfgcP3JqbxXMx5Cf71lzPqHkV1E=
Received: from FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:be::11)
 by BEZP281MB2007.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:57::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 11:24:33 +0000
Received: from FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM
 ([fe80::210b:d15e:d20d:7fd6]) by FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM
 ([fe80::210b:d15e:d20d:7fd6%7]) with mapi id 15.20.8943.029; Tue, 22 Jul 2025
 11:24:33 +0000
From: "Henry, Andrew" <andrew.henry@eon.se>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>, matthew patton
	<pattonme@yahoo.com>, "linux-lvm@lists.linux.dev"
	<linux-lvm@lists.linux.dev>, Erwin van Londen <erwin@erwinvanlonden.net>
Subject: RE: striped LV and expected performance
Thread-Topic: striped LV and expected performance
Thread-Index:
 Adv3ryOkPkyC1+SGS2a//kGki21OpAABDQ9gAAlHfwAAAKRzYAAD2EiAAAFmTFAAB8FbgAB4CquAABvM8QAAAGEoAAAmZEnQ
Date: Tue, 22 Jul 2025 11:24:33 +0000
Message-ID:
 <FR6P281MB36729FA59F26E8BEE18F2D91EB5CA@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
References:
 <FR6P281MB3672085D192D8BF5CB45CFE4EB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
 <FR6P281MB36727398D141AD2A1A1E76DAEB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
 <67b28bf7-b862-4878-8434-aaf0d157f2ca@gmail.com>
 <FR6P281MB3672F7D1B62E229AFCD31D0DEB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
 <9f6afc0d-ce58-472a-942b-15527f693d28@gmail.com>
 <FR6P281MB367296DD8DAECAB5633C9BDDEB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
 <630443e7-b5c6-449a-8f6d-402a71967710@gmail.com>
 <46e3e8c3-429f-4ffc-a710-5d8d585fbd1a@erwinvanlonden.net>
 <2047613453.835684.1753116128145@mail.yahoo.com>
 <d935e1ae-9e0c-4b9c-ac3c-9a8e080ae16e@gmail.com>
In-Reply-To: <d935e1ae-9e0c-4b9c-ac3c-9a8e080ae16e@gmail.com>
Accept-Language: en-GB, sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_ActionId=fa2776a5-da44-4247-b209-296158713dee;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_ContentBits=0;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_Enabled=true;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_Method=Standard;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_Name=Internal
 -
 Unencrypted;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_SetDate=2025-07-22T11:12:16Z;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_SiteId=b914a242-e718-443b-a47c-6b4c649d8c0a;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eon.se;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FR6P281MB3672:EE_|BEZP281MB2007:EE_
x-ms-office365-filtering-correlation-id: 5382a573-f798-4bb7-ef0c-08ddc9125564
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eGEyRm85UkY2YlVRajdXMXNNVnJZZStGbWxvcnZleWY1dXhRcnNkeEl2ZGo3?=
 =?utf-8?B?d2pEUVo2YXpWS1NDR3JqS1NPaEtBVDEwaHFiWnRRREJ2bWpFdzdEK0R0SGFq?=
 =?utf-8?B?ZUEvVEI3QzNpN2w3d084VzhFalF0KzdhMFJwU285cjZIN2FySU4zRUR1WHMr?=
 =?utf-8?B?U2p0Z3Iydk42eEU0ODhXWVRFS1dsMTNISVR2ZkpTYjRKM3VSR3QxZVpWa3BY?=
 =?utf-8?B?NFdZVnd0S1JhczVjcjJKNnNCM2I0WENQRExZeHRESWErSFZqYzl4ZnRLdmRB?=
 =?utf-8?B?UDYrRGdyOWxBNjFkbHJVbzZBR1BQdGxTWEtUQ0VycmhjeGtValIxMVN0NEpW?=
 =?utf-8?B?TVVJNDZUNU53d1NDWGNvR1luTnlobmtKZmFVZ2pSV3phK1VsNUxJanZzSVkz?=
 =?utf-8?B?dC9HVWZRRGZtSUNLMzhpQXg4bzVIcVFBMnJxMzJXWDUwUU9nc09OWmYxYjRN?=
 =?utf-8?B?RVlrbkV3UTJSaEN0dm0yN2dsYnA3SmRsY2pmZ0MrM1VmbnR3eHlvdHYveEho?=
 =?utf-8?B?RDhneXdkeFk2M0Y0ZDJrZ0w3cDdERlpyU0dXdWh2NE82d2pwUmoxbTBJdGFX?=
 =?utf-8?B?T2xMcmg5Ky83SS8ySU9Sb2xBdDJhWFhCTjVUUXFwTU9kVkdYcnM5S3pWMFhJ?=
 =?utf-8?B?d2hUcXlXVXBUUFl4ZW1tclRoUnZUOGJIeFZ1UERhaXNZdktNRnZVc3RpZUNW?=
 =?utf-8?B?ZGpSaWgwK1MrZ1JpK1Fidkpqc3puR2ZBc2VYaTdBSDlNNjhscFJ6ZG1mNXJS?=
 =?utf-8?B?Rm5FVklMNXhLaW1oRVpVKzF5Wk45UGZQVms4bXZTSDBLUmUxcFhjOGNKVXJ5?=
 =?utf-8?B?K2RTZG1zbUMwNno1bjVsZUhWeFIwdkxDWXdaVFkzb1pla2FEVHlFSVhsR0l5?=
 =?utf-8?B?MDBhTUFjdThsc3pWSEtJWkwwQXM5QUlFNlhKamdIUzRsZTFuN1pzYW8zQzAw?=
 =?utf-8?B?aHNYUFR1cFZCeElZNGtRQml0OURaWk1YY1VzMDIzRXZoUE9PZWdxQVlFb01z?=
 =?utf-8?B?Mzd5MHNxejRDY1dWaHRZeklYRzIzV1NTLzV6K1ByVnVkM2lTRk5iRGNGcHEw?=
 =?utf-8?B?bGdBbW96SENZU3BzVTJMK0VTSlc2ZzJBWWNvWlhKdXBGeHBiWU14KzExNXIz?=
 =?utf-8?B?b0EyYnpERmtrSXJVT2VWVVJyRGN2R090UUNXSEUyclIzNXlYd0tTM08ybWdo?=
 =?utf-8?B?RFJtek5zSWRXckp5KzZTZ2x5UGNSSnRXcktpT3I5QkNIalQyWlk4SWIwZSsr?=
 =?utf-8?B?SDlnR0pzQVFCL0hmbTAyTDVnNXpWbzBmbzB1RjRXa1JzK1ZmcWJGRXZZWm5N?=
 =?utf-8?B?cXJicHRxNEs0czBhZ2JSZ05HemhwanpkakVJUmhJcjBLMjZYREtBRDZJR3RO?=
 =?utf-8?B?SGFRNTdZYUNhb2w4ZUFMbnM1ZEtmZGtOOXFBZHdRUHV2RCtOd0xUd0RhSEVX?=
 =?utf-8?B?RXFSSTE5SW1oUFJFQkRBTTVWUkVvVzU4eCtPdjJXNnpVS1dNZHY4UnhwVC84?=
 =?utf-8?B?V084MU1rZGE3YXp1OFRaallBT0tpRjdUOXU4Z3NzWFZkK2pTRmNBdXpUaCtz?=
 =?utf-8?B?OHZ6ampxMjhScGR4QXlDL2FuMTBsL3JldThZUFRwam5EbDVpUGtvK2NiZXgr?=
 =?utf-8?B?azRDVjRzNE1WdlpnZnNiaml6Z05YRk9YQVlyc3Z0RjdCaVVuVkE3T1hrUm9h?=
 =?utf-8?B?a0IwRVIrS1F3TmV1UlNxaVVCaG13S1BpL1FhdWw0Q01PaWl3bEM2aTk2RjIy?=
 =?utf-8?B?bU05d2NTRk5nRFZLOG9HTFg2Y1FMcTFXODdqU1kwUklTYVI2OUM2NE0yZ0c1?=
 =?utf-8?B?dk8ydFFnYTdvTTArSWNocmdqbXVZeXRLNUsycDIxaEdRYy80T3Fmb3F0Njd5?=
 =?utf-8?B?Q3BWZkFrR0I2c0t2c3FZOCtQeTduek9KWWx1VTVRbW9sSXJJR0gvcTVEWGVY?=
 =?utf-8?B?c0JaUHFzenFDVG1MMHp5dmNPZG44eEpreVh1V09PUmp0cTJFTFNoT1puMkti?=
 =?utf-8?B?T0JBUG1jY3h3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VTcwQ0dERmZtZmFoUklieERqYURlMjgrRytJdVpuQkxKTmNGK21DdUVtL0Vj?=
 =?utf-8?B?dmpBSTg5MUJycVhZbU1qOUdiNEJoWVV5SkFWa1Bsd0ZubkxYckt4cGZkK0Uy?=
 =?utf-8?B?VVhaZ1MzZmJIM1gzRXF0bGpNdTVVekZQSCtsU2Jzb2pZOXIvLytqNlpnMFpn?=
 =?utf-8?B?eFBTZjFnQ2MzdWJsOEgwKytrZkFXbmF5S2RldkF2R0ZHYWoxTGN5UTk5Z2Nj?=
 =?utf-8?B?VmtXbDhPY1U2V2VYNmx0OFNWZDkwTWZFNkRSbXNKWFF4V0dUN3l2cy9yNW4y?=
 =?utf-8?B?SVEzaFRpVFdvNThUSWNUZ1lTVXlUSTZNQXptc0t5VEdZM0dyQzBVdE1ZZjAr?=
 =?utf-8?B?MFM1U0J6QmV0K0IyU0tXSTBGdjlya0lTZWNmb21MRG1Pa252bU5SLytLMllt?=
 =?utf-8?B?Ynp2Vjd6Z0RWRm84SWdTb2pIeWkxbHJMUGpPRldPQlQwYmZCTGtjMkJ4QnJs?=
 =?utf-8?B?NWxaUG1qeUMxbFhzMHdRTkNFUzVrY2V1ZFpyTW1EQnVncHFCVUxjRmZ2MnVG?=
 =?utf-8?B?UVNKRC85STlDTWlpeXlkeXQzQXIyZlNscFV5RnZhaGVRaWszeWxZNzVxZkUw?=
 =?utf-8?B?WWJFTjVqZHhUS25kK3Vuck4yV0dIUlA1M0gwbEVSMS9rWjhrTGtyK1VJY3ps?=
 =?utf-8?B?M29SUFA2ZHVvRm1FeGJ0Q05IUG43bm51V0lrUWVJZ1BJKzRNTWJUUkQwZ2ZH?=
 =?utf-8?B?VER3QncrTXRqUlZkcG9vNlNLcGlLZm9sTm9VYkdkQzBrd0FidzYxTURRcTFV?=
 =?utf-8?B?alQ2c2N6YkFWWWFIOTlxQ1Bpd3c5NkU5Z0JKbVVZUnE1clZ5UjIxZlArV21T?=
 =?utf-8?B?N1k2eXJPTm9HUzY0M0Z3b1ZyVFlsTTJWSDY0akc3SjU5dCtkVzhEYlJudVFq?=
 =?utf-8?B?SlJ1em4wOVlKU296QzF0cm1lWmhOKzhLT1BubkhHTmdJNXM2YmNDRFZPOS9Q?=
 =?utf-8?B?QVE2c2pxS1dEcG5aeVhISDR6N21GanNoWlBDUy9uRm1BcHVOMjZCTTB0Vzd6?=
 =?utf-8?B?Q053NVBnN1BJeUk3Y25hVjI2aFJXb1oyazJvc1ltVURiKzZNaU5Sc1ZSWkxW?=
 =?utf-8?B?Nnl1Nm1oY3N2N3lxRG5saDJyaEtJUGZJN2VRM2dybGhxbnloalZBb2duL1Jn?=
 =?utf-8?B?Tk1saTgyVUphUzJwWnUxcHhSaTJPR3NRT1d0NFNQYnRzNFBNc0diSjlSazFW?=
 =?utf-8?B?NVNRNEo1eFBKVE5acnp6emU3YkdRMDBIK01CVVlQRlZRR1g2NEIzZkprenZx?=
 =?utf-8?B?UktUZW1XYldISG83WkhmRXVyd1A2d2xxVlUyOTgxTE1Wd3I1N3o5cHVQWHdU?=
 =?utf-8?B?M1c2MlY5L2hpSjdxQkZxWWNCTGpqK3JkcUxzZW11dEZoZ2FiZ3JudXA0bEov?=
 =?utf-8?B?TmdXYnlXT0tBQnhaS2JKR1hNTUFCR3Mwd3BjNmdHYjFGQitrSjRZbVJoMWVz?=
 =?utf-8?B?N1ZlY0xmSmpGNTZsY25qK2ZtZ2FhOFhDcktMeDA4cjdHS0ZRUk1PRXRrOGdl?=
 =?utf-8?B?L2R4UWlURHNCalN6eE5sV1JEcm1JdGpoT2dBSytDT3hUSU1TblpNQWxSYXdI?=
 =?utf-8?B?T1d4SGtmL2V5bFZ5M01KRVFOcFFVWk4yR0hsOUoyTnlZaUlpTHVYYlZoSnRq?=
 =?utf-8?B?U1NIbjdxMVRCdlBjdnlnT0hucXI5YmdrR05PZHFMdEJyV3VZLzJ6dW1wL3JX?=
 =?utf-8?B?TjZOd2RqT1djT25YVnZYQzV3UUowSW50eXJTSzdvb1ZNVDVsdHV6OFpRcXVM?=
 =?utf-8?B?OGwzR0Z6VjVuMTIzMncrL3pBZHZyQk5jSDc5OUlGeUk5WU8yRFRrTmkwNGZs?=
 =?utf-8?B?NmxWWVNtZzF4TzNOdmlxT3h2MVdWc051QTJXd2tGV2dWMkVSU052QjNnN0tH?=
 =?utf-8?B?UjJHbG9qazFDOHErcklTRjFVcUQveXNIUEJHRTg3VnJIY1dqYmttSFVLeGZS?=
 =?utf-8?B?QWJQWUM0Yk56QTRXMjZHRkNadngyUlA4S0hnZkUxdVRPeTNhaTd5STVsdWVI?=
 =?utf-8?B?VjZTUVlPUllNbWdxQmpSODllOHVLc1JBRDhDcFBFbms4dUFQditJdWF1dHNP?=
 =?utf-8?B?SWE1Nk5od3ltT0Y5N2ZmUERSMUQrTGtHWkp0S0EweURFMzM3SWZleXpUUVNH?=
 =?utf-8?Q?je1s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: eon.se
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5382a573-f798-4bb7-ef0c-08ddc9125564
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2025 11:24:33.5162
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b914a242-e718-443b-a47c-6b4c649d8c0a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ov35CM9wJ3Sx7cTXYmfrxzUU1+xV+r1pPVRnDAUDRjGShTdhKJoO6essTqNMZMMF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEZP281MB2007

wrRUaGFua3MgZm9yIGFsbCB0aGUgdGlwcyBhbmQgaW5mby4gIEkgdGhpbmsgSSd2ZSBjb21lIHRv
IHRoZSBjb25jbHVzaW9uIHRoYXQgdGhlIHJlYXNvbiBJJ20gbm90IHNlZWluZyBhbnkgc3BlZWQg
aW5jcmVhc2UgZnJvbSBzdHJpcGluZyBhY3Jvc3MgdGhlIHZpcnR1YWwgZGlza3MgaXMgYmVjYXVz
ZSB0aGVyZSdzIG9ubHkgb25lIGNvbW11bmljYXRpb24gInBhdGgiIGZyb20gdGhlIGd1ZXN0IE9T
IHRvIHRoZSB2aXJ0dWFsIGhvc3QvU0FOLiAgSSd2ZSB0cmllZCBhbGwgY29tYmluYXRpb25zIG9m
IExWTSBzdHJpcGluZyBvbiBhIGhvbWUgc2VydmVyIGFuZCB0aGUgc3RyaXBpbmcgYmVoYXZlcyBl
eGFjdGx5IGFzIEkgZXhwZWN0IGl0IHRvLCBldmVuIGFjY29yZGluZyB0byB0aGUgaGFyZCBkcml2
ZSBtYW51ZmFjdHVyZXIncyBzcGVjLiBzaGVldCBmb3IgcmVhZC93cml0ZSBzcGVlZHMgdGhhdCBJ
J20gZ2V0dGluZyBvbiB0aG9zZSBwaHlzaWNhbCBkaXNrcyB3aGVuIEkgc3RyaXBlIHRoZW0sIHBs
ZWFzZSBJIHNlZSBsaW5lYXIgc3BlZWQgaW5jcmVhc2VzIGZvciBldmVyeSBkaXNrIEkgYWRkIHRv
IHRoZSBzdHJpcGVkIExWTS4NCg0KUmVnYXJkaW5nIHRoZSB2ZXJ5IGxvdyB3cml0ZSBzcGVlZHMg
d2l0aCBkZCBpbiBhIFZNIHRob3VnaC4uLiBPbiBteSBob21lIHNlcnZlciwgd2l0aCA0ayBibG9j
ayBzaXplcyBpbiB0aGUgZW50aXJlIHN0YWNrLCBJIGdldCBhYm91dCA3ME1CL3Mgb24gbXkgbWVj
aGFuaWNhbCBkaXNrcy4gIEluIHRoZSB2aXJ0dWFsIGVudmlyb25tZW50IHdpdGggc29saWQgc3Rh
dGUsIEknbSBnZXR0aW5nIDEwTUIvcy4gIFRoaXMgaXMgaXJyZXNwZWN0aXZlIG9mIHdoZXRoZXIg
SSBwYXJ0aXRpb24gdGhvc2UgdmlydHVhbCBkcml2ZXMgb3IgbGVhdmUgdGhlbSBhcyByYXcsIHdo
ZXRoZXIgSSB1c2UgMyBzdHJpcGVkIGRldmljZXMgb3IganVzdCBvbmUgZGV2aWNlIGluIG15IFZH
Li4uIGl0IGRvZXNuJ3QgbWF0dGVyLiAgQnkgdGhlIHdheSwgdGhlIHJlYXNvbiBJJ20gb25seSBn
ZXR0aW5nIDEwIE1CL3MgaXMgZHVlIHRvIG15IG9mbGFnPWRpcmVjdC4gIElmIEkgc2tpcCB0aGF0
IHRoZW4gdGhlIHNwZWVkcyBhcmUgbXVjaCBoaWdoZXIgZHVlIHRvIGNhY2hpbmcsIGJ1dCBJIHdh
bnRlZCB0byB0ZXN0IHdpdGhvdXQgY2FjaGluZy4NCg0KU28sIEkndmUgcnVsZWQgb3V0IHRoZSBM
aW51eCBndWVzdCBPUy9kaXNrIGNvbmZpZ3VyYXRpb24gYXMgdGhlIHByb2JsZW0uICBJdCBtdXN0
IGJlIHNvbWV0aGluZyBvbiB0aGUgVk0gaG9zdCBzaWRlIHRoYXQgaXMgY2F1c2luZyB0aGUgaXNz
dWUsIG9yIHNvbWV0aGluZyB0byBkbyB3aXRoICJleHBlY3RhdGlvbnMgb2Ygd3JpdGUgcGF0dGVy
bnMgaW4gYSBWTSI/ICBGb3IgaW5zdGFuY2UsIGlmIEkgY3JlYXRlIHRoZSBzdHJpcGUgYXMgNGsg
YmxvY2sgc2l6ZXMgaW4gbHZtLCBidXQgd3JpdGUgYSB0ZXN0IGZpbGUgd2l0aCBkZCB1c2luZyBh
IGJsb2NrIHNpemUgb2YgNE1CLCB0aGVuIHN1ZGRlbmx5IEknbSBnZXR0aW5nIDcwME1CL3Mgd3Jp
dGUgc3BlZWRzIHRvIGRpc2suICBJIGdldCBpdCwgdGhlIGhpZ2hlciB0aGUgd3JpdGUgc2l6ZSB0
aGUgYmV0dGVyIHRoZSBzcGVlZCwgYnV0IFdoZW4gSSBjb21wYXJlIGxpa2UgZm9yIGxpa2Ugd2l0
aCBwaHlzaWNhbCBtZWNoYW5pY2FsIGRpc2tzIGFuZCBJJ20gZ2V0dGluZyBoaWdoZXIgc3BlZWRz
IHdpdGggdGhlIG9sZCBtZWNoYW5pY2FsIGRpc2tzIHRoYW4gaW4gdGhlIFZNLCBpdCBqdXN0IGZl
ZWxzIHdyb25nLiAgQnV0IG1heWJlIEknbSAiY29tcGFyaW5nIGl0IHdyb25nIj8NCg0KL0FIDQo=
