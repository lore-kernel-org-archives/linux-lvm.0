Received: from BEUP281CU002.outbound.protection.outlook.com (mail-germanynorthazon11010070.outbound.protection.outlook.com [52.101.169.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B3829CB40
	for <linux-lvm@lists.linux.dev>; Fri, 18 Jul 2025 12:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.169.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752841471; cv=fail; b=bmitGlA7GxNHUd4IBD8LnPcjc9YWsO68mkMcvlwtC9hgsAHNNN0phkeryCDlm7XyklKdix9eqSMoDliNqHArD34Ng+gBmrUD+pCVfMkHFmDodrPFARdVsK78fNmh5bs8aO1wmjCxu8O6ANGdPxgFMROoQdYtc59qPDENeoeQ1PA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752841471; c=relaxed/simple;
	bh=3Bo5g70LrYYTOZhyf0SQ0dhZcHWLUXBH+I4U7kQ1eFI=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HsaP6aE7NPO3O4aALfd/TGqu2hqvrojnWkrz4dXG6nxSm57Bc1HnF9Dplfe0tn/KejRX2XxziI8PwCpuvjNTf4y0sdQ7+qVTng9rhkzJaiQ/gy9BIkLa5SzNfmcMCfSYuNHkjXQVJ1Y3MJ2Er87Fd2X/B76Ky4jna1GqW4J0pvs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=eon.se; spf=pass smtp.mailfrom=eon.se; dkim=pass (1024-bit key) header.d=eon.se header.i=@eon.se header.b=Mznjr/bJ; arc=fail smtp.client-ip=52.101.169.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=eon.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eon.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=eon.se header.i=@eon.se header.b="Mznjr/bJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K6GaSCmBIsx/P8RjEi+ulm/DD7AMuRNocl9JDMRU2QkHAxsuGj56MbnVDjyqBYJ+pJDOQUA/J54MkUUWEzVRgi/H4PocMOvNsvCEnhS8s58xDHfMnrSduCrnx/R/HpV6HN6hPNStC4/olcLkkYzgUFVyC6mNNaPrZkOGJwHWKSBsao7QbOSnyJoVCuoB2jVy7Km0xg5ksiTZI+7wMlCyOdgpWPO4SFmgIrTrwpLSV1JMBJ56/wQ219SPsw7ernz28RhvRpkWbvYfqY3MznK1Na8KMCIca8vPAb4O34/TtULS26qYhqzxCkFANdtQWnRcPuxn/rpgwDJJaSfmUVavEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Bo5g70LrYYTOZhyf0SQ0dhZcHWLUXBH+I4U7kQ1eFI=;
 b=RPkyiiOey+B94c0fwu4iJYFiepE9yamfZc2oF9P+l+WYNtMFEFuikMVwWLvRI3aPs/T7rv7eS/UkUaqBuyX5u6MoNWwl9F6FzDyi3Njwq2iXOuT+fARdY9qh+EKucDZFpe1m4A0D6WgAdBEdbvjBDEefq2XIVtW1UAKbwccnMP6yFB2Ew6R+8xlBABntVdsAz/3Olgr88aZjuLbK+EQdCGzENPGO3U275UobSsdUCiIA7ZauqQh2+loZk4t3dChbz6cN6LpjvCfa29zKqUP/nnG5032zHSzz0REM33uxFxrGXJh+mjl1SvnAlda9/A5iLo/B1nTN0AZwg5i5nAXs5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eon.se; dmarc=pass action=none header.from=eon.se; dkim=pass
 header.d=eon.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eon.se; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Bo5g70LrYYTOZhyf0SQ0dhZcHWLUXBH+I4U7kQ1eFI=;
 b=Mznjr/bJimILX+tnm1ORYRAupzv/lkGJ4TqYJeU0OuJHvlbFSaaZNTB1RdAyQUqcJrqi9vaYaX7B6FNp30FyfQowpq33IkasyVlFYHPYeNE7nEYxvxHVWEqu+EyBMBhu5MTf/qTzj5R5Haq5zeidT2rKIaocI5Gz8/cd1Bbccp0=
Received: from FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:be::11)
 by FRYP281MB2060.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:45::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Fri, 18 Jul
 2025 12:24:27 +0000
Received: from FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM
 ([fe80::210b:d15e:d20d:7fd6]) by FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM
 ([fe80::210b:d15e:d20d:7fd6%7]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 12:24:26 +0000
From: "Henry, Andrew" <andrew.henry@eon.se>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>, "linux-lvm@lists.linux.dev"
	<linux-lvm@lists.linux.dev>
Subject: RE: striped LV and expected performance
Thread-Topic: striped LV and expected performance
Thread-Index: Adv3ryOkPkyC1+SGS2a//kGki21OpAABDQ9gAAlHfwAAAKRzYA==
Date: Fri, 18 Jul 2025 12:24:26 +0000
Message-ID:
 <FR6P281MB3672F7D1B62E229AFCD31D0DEB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
References:
 <FR6P281MB3672085D192D8BF5CB45CFE4EB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
 <FR6P281MB36727398D141AD2A1A1E76DAEB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
 <67b28bf7-b862-4878-8434-aaf0d157f2ca@gmail.com>
In-Reply-To: <67b28bf7-b862-4878-8434-aaf0d157f2ca@gmail.com>
Accept-Language: en-GB, sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_ActionId=cad95829-3759-447a-80ab-11522cc8c2d6;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_ContentBits=0;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_Enabled=true;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_Method=Standard;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_Name=Internal
 -
 Unencrypted;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_SetDate=2025-07-18T11:56:43Z;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_SiteId=b914a242-e718-443b-a47c-6b4c649d8c0a;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eon.se;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FR6P281MB3672:EE_|FRYP281MB2060:EE_
x-ms-office365-filtering-correlation-id: f3fbb905-15ed-4f6f-c4a7-08ddc5f60987
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|19092799006|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NXQxOEFXMlRYNHprbkNaNlJZallBNWhIOVZOM1oxQ1p2SUdBN0hBRWdLL3dh?=
 =?utf-8?B?VkpYQ3ZadUF6bnkzUkJLdmZKVVNPaFBOMnh2ZkpNOXpxSGw2blNTcE0yWW9p?=
 =?utf-8?B?M2hCRkExV2prVlA2bUVXcjhBNnpQSXZsQkFNbDFKR2dEblQrUFAxbDdScWZX?=
 =?utf-8?B?c3FaOHdzdElEK2VQYTZEOEZBMUFNbCttb05vYmFQVmFvMkk1MFRYTm1jNmdi?=
 =?utf-8?B?WnA5UWZldlVuYUFyZ2pwOFdRMUtOMGJ4TjhqL05KVmpReWV6K2hFMDZKNXdn?=
 =?utf-8?B?RW5LRTdrZHo5eHNtTThPUU05U1RlMlFEKy9RVC9kekcwdEMvcWFoN0w2OURQ?=
 =?utf-8?B?aTBURzd3dW8rUDk0UndJRGJ4Q0dtaVUwdlBwMmtMUGxBNFF2MHhsUTkybXpy?=
 =?utf-8?B?Tm1Mb0NzZjREbTRKU0JEUkZCL29WeUQ2UzFWVEEwaGJzd1JMc0cyQUM2SnZL?=
 =?utf-8?B?TmZzYVhvMnpndDhueVEvSms0anQvSGQvdHVhYXZOT1dKWSthLzFFYjlneWZJ?=
 =?utf-8?B?U0NhenVaSVptdjBhM0ZmRTE5a1R2WHRQNHZlWGdweGN0OFV1SjBBQmFVNDh4?=
 =?utf-8?B?V2Q3aTZRZXNDY2Y2dG1IWWVWQWJzK2VLZ1A3S04wWlhKQkhtajFkbjZHWnAx?=
 =?utf-8?B?eWFPSTUwTkVibHVrYWxkdVh5aEllQ1RneVJaWmM3N281S2pSOGlpVEFRMkNB?=
 =?utf-8?B?SnhkelZqRENZalN1NS9QM1JWNkp3bGVPQk1BWDlHTDFGdmNJMHY5TjR3SWh1?=
 =?utf-8?B?cEdqS0NKVm1KNGczWnQ1SXc5K3BibXZqSEREc05DVHpKcjJpZ1pFd3NPRmFE?=
 =?utf-8?B?SllnNFovZFpPajFiYmdBVDk5ZnBEQ3RWUXRMMnVsSkVJQmNpMDhIUjV6Tmp2?=
 =?utf-8?B?WVVqNkZLRWYyUHRLM3BmMVRpSGwzcUx5ZFBVWW1tVndFRVVWUWMySk1Sdk5u?=
 =?utf-8?B?SmJZaG9qLy9XaVpYY0s1dXl5NmhEMFA2cWVucUQwK05jS3NLbUFhM2txQlBR?=
 =?utf-8?B?WldYVmUxcGI3ak43aUs4Yzc2aXZqODh5ZWZqWExOZFVxR0VCRkV6TnJMRzZu?=
 =?utf-8?B?THk3VjAzdEhQSXF5djRzcWtiTkdIbHdXeXQxd0x5R3hCb1M4RzdzakJpakx4?=
 =?utf-8?B?SVNaLzd1RG1tUVd4N3N1RDhvWE8zRDFVM0JRYXdaWDQyYlpnejZyQjV3L2tL?=
 =?utf-8?B?QkdDMnp2bFkyWUtQc0RkWWJmM1hsWUxpRjl3aXB6TGgxczlDR3hDakZDWWE0?=
 =?utf-8?B?Y3JFTXl6MGVlWTJEekRlTmlsM3czR3hEK0FqQ0FGUkpiN2paMmtJSm8wYnMz?=
 =?utf-8?B?ZmU1cTB2SEFmS1RZMElYdjNnQ3Nubis3VDNIVWQ0SVpGbnNNTS9JeGl0cysv?=
 =?utf-8?B?eEZQNDV3c1psTkY3SXlOam5NSTdzdDBId2xZdFY0NDA0QVFINnNCWVIzQ09W?=
 =?utf-8?B?eEFFUUhkWkx1SFFjQXVEa2NSR3BvYnYwcDI5T1BoRFJsUnd3Y2MvSHcrcDBJ?=
 =?utf-8?B?RHNGMWhQbEZUNDd2Z3R5RlBiaVlDQU9rOWUzMlZwMmpnN2RXaHVCSUFEell5?=
 =?utf-8?B?Q25iMnpXMFd6VDJKMWVPc0pSLy9DTkZESEV0WWVyNHpkeTNacHRJUE9wRkR0?=
 =?utf-8?B?Rk9wekZPUTM1cTIwSlYwYVIxUnBjU3RBZHErSDRyK093UWtXQmFQNGozUktG?=
 =?utf-8?B?ZWV4d0w3SnVYbERzMzJzT3ZJdFJEUmw2QUhKWUZFMSs4bHc0L1VYZHE1VmFM?=
 =?utf-8?B?TmRKZzFHM3RzRWY5SVlDSmw1YXVKZUJzVWRFdERqS0s2RDZMZkc3blVPdFpq?=
 =?utf-8?B?UTM4Vzl2cFl3TEFPY1hhZmZybWNydHh0Qm1WSEkrazRTNVYxbDRDeFFUZVRV?=
 =?utf-8?B?RlJlTGw0Q3liYURsV3BBWHdIc2VjQXRKYzJPNzVSVzRjK0RDQlRud1hkczI3?=
 =?utf-8?B?bkhSZk8rNHVibEV5dUZwT2pHSXBRcEFVRVlJRzBvbXJCbUZlVHNnYTducEgy?=
 =?utf-8?B?T2diVkhrUmdBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TXE1c1l2ZW5TV1Jkc2VubmhWQmNrMStmS2hXbHFMWHQrZHNWeVJ3aFQ4bnFt?=
 =?utf-8?B?cFpyTnhaUkdIbWVkVngrNy9MRzJxdGV2YXJYY0kwN29sQVB2aUhDVDlXVDdM?=
 =?utf-8?B?OERDZzdGSUpzdW0xKytndUIwS1lVUWNBd2pVYUVqUGdMQkpGS1NiQ1NsdFJy?=
 =?utf-8?B?L1JKYm9KdnR5a2xwTGE5bEpmaWx4RUhqTEMwbm80YUhRMWpMdnNJK2luaFo4?=
 =?utf-8?B?Qy9oWkRDR1N6c0xOZG9LWDB3NUlUVGNCMmxDSkJjSXNnVXptbjVQb2VSWXNn?=
 =?utf-8?B?R2prSVhtbmdFejE5S1FPL1QwQzAwS212UnVBV1pTNDlEUEtVbEEzSWVzaGY0?=
 =?utf-8?B?dWFnaGlOSkV1Z3p0MEN6cFluUURPQm15STlMV0llbFN3QVZJQ0Rob093cGZv?=
 =?utf-8?B?SkY2Z0NFalV6SlhxOHdkYVluaDJsbisza0U2YW9TMnVJem14NnZHSC8rSXVZ?=
 =?utf-8?B?SUtzNzZpTGRsVmVjaDRhQ3U0MW5CMFNhcjdSQllvSU9CWGMwbFZPQkpNQXJO?=
 =?utf-8?B?YTZCZ055MEt0RnpYMmZ5TWRzZGlzeUxUZFhxQW02ekUyQy9KT3U3NkliL1c5?=
 =?utf-8?B?bUhici9OK0M1d1AxcXVTNGNKTzV4SURLUDJUUnNnVlg4Qm1NZ21PdUJDSGow?=
 =?utf-8?B?ZDFSV1VGbnVWdUI3R0NheEM4bUZYdUY4a1ZWQ1hFOTFqbWhTR0xBMVBTK1Jp?=
 =?utf-8?B?eldPWXA2NFFmbWpOWmZ3amFDR1dCS01aVitKNE1QbzM1YXo1eVBiUWlUclFm?=
 =?utf-8?B?aXp4aC9teVhYamM1aVAvRG9VWUs1aDVDQWRpNVBhWExoSTJXUGdoZTNkTkNN?=
 =?utf-8?B?QzdwbFNwbFJqdzlBbkNPbyt2YmkwT3JDSnJldnNKR1d6K0g4YWF1Y2MwQXph?=
 =?utf-8?B?WEtiZDY5SThkZFI2WVFoR0NSSmgwYXlyc3hCYUxRMkNNYzc4S0NIc3FpMU0w?=
 =?utf-8?B?amVhUzduTFJOM011MkQxVUJaQ21sWVoxTkJicFJzTkcyLzJ5NEw2NWU5ZlZa?=
 =?utf-8?B?TU12NStUNTR5RmRnVFhpT1h0ZDlTUm5sNC9NQ3hCVGhoQmNJNzBvaVkzbW10?=
 =?utf-8?B?enBEMElpSm9TZGFHUFZlU2pYaFdEZS90MXhqY1crTWZOTjFHL1NHKzI3MWxu?=
 =?utf-8?B?Z2tYbS9xd2x1Q1EyUGtvZ21ENElmV0gyOVdzR1hla0ZLdUdIMlMraEF6TjdL?=
 =?utf-8?B?d1BHTEowOTkwT2FFRmo0N1k0RmdnVU4wVTNkazlmdFdCc0czSEJuOGJ3aHVa?=
 =?utf-8?B?SmNIRGEwdlNaajZJWTVtL0s2Sm9BN3k3SFJ5K2tPSm9OUlJXNlN1Ly9acmJ2?=
 =?utf-8?B?aFUvTG1iVUVnd3ZoL1FkNzRnTHZ4WkUvK3lxL3VNNUlyVHhIbTNGbFpKazlL?=
 =?utf-8?B?MmVEcVNYZitUNFNoYzRCM1pLeTFteUxnVTM1eUYyTm1WMnNGRnBBbmRscE5I?=
 =?utf-8?B?VzBUN1Y4OEZETEgvRVJjYnZBM0VoSWV3VHc0bUFGWXpCOWEvSlcvWGJjMHBP?=
 =?utf-8?B?ZythYUUzMy9mTlZIK0Vib1FZM1F0bzVwQm5wRUFZcHNORGRrVFJVaUNjUmhh?=
 =?utf-8?B?N05wVzdOdnRDdEYrUnhaeTdLcUErQmdTdTZKdGd1YStnRk5jVTRxaE0xN2JH?=
 =?utf-8?B?dlVpeGNscllDVUZNNUtBSjN1YTAxdlhkNm5EdCtLR0Nuc05xODloTWhsd2g2?=
 =?utf-8?B?NitUak05aGw1UVR1Q0VKNHZUSGFtNTFmTWpyZDNnclhmZ1lxQTlzQlJnT1h5?=
 =?utf-8?B?WGJWa2dlWHpWSVArMlFPV0NxNktCQjd1bFVPWHlVTG1IL3o4NDUzZXZkUmlB?=
 =?utf-8?B?dDZVYTdsK21haFpWZzZSMU5RdUNBVXZZMHExUjY3cEc1ekN5c1A2a1JYdUF0?=
 =?utf-8?B?SmliNDFzeUtvRmlEU1BDdndtdmE2czRLcmpTR2dyM2tVcSs5eElWWkRMYU9Z?=
 =?utf-8?B?cXZrbTFHdzNGamtSSSs3eTM4cVpNcnBUdXpDSEdSVWp0cDM2OWZpSzNIelQw?=
 =?utf-8?B?VWhmY1oydTdxWXg0ZG1jUWZUeUhlYWtZWHlYbUk4RGZRd20wNm5rNXJnenFI?=
 =?utf-8?B?WHVHWndXNDU5dUNNRnEzNW95dU1sRm54N2VrTnpJVWZjcGVCNHNReWdlNkxk?=
 =?utf-8?Q?G0P8=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f3fbb905-15ed-4f6f-c4a7-08ddc5f60987
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2025 12:24:26.8873
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b914a242-e718-443b-a47c-6b4c649d8c0a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D5paFoXY+NUj7RolN8OLtwH43mdNVJ5KuLEYbnHKo9d2sCMsjU890tq9tCJPg5O0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRYP281MB2060

Pk1heWJlIHlvdSB2aXJ0dWFsIHN5c3RlbSBkb2VzIGhhdmUgaXQgc2VsZiAnYSBzaW5nbGUgd3Jp
dGUgcGlwZScgLSBzbyBhbnkgcGFyYWxsZWxpemF0aW9uIGlzIHN0b3BwZWQgcmlnaHQgdGhlcmUg
LSBzbyBtYXliZSB5b3Ugc2hvdWxkIHN0YXJ0IGZpcnN0IHdpdGggYmFyZSBtZXRhbC4uLi4NCg0K
VGhpcyBpcyB3aGF0IEkgc3VzcGVjdCBpcyBoYXBwZW5pbmcsIGFzIHRoZSBiYWNrLWVuZCBzdG9y
YWdlIGlzIHZlcnkgZmFzdC4gIEknbSBnb2luZyB0byB0ZXN0IG9uIGEgcGh5c2ljYWwgc2VydmVy
IGluc3RlYWQuDQoNCi9BSA0K
