Received: from FR5P281CU006.outbound.protection.outlook.com (mail-germanywestcentralazon11012003.outbound.protection.outlook.com [40.107.149.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA4017A319
	for <linux-lvm@lists.linux.dev>; Fri, 25 Jul 2025 14:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.149.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753455084; cv=fail; b=JYh5U+m3oOmjsqbLzZIRxV34lNfrar/e50uataIJ2t3ZXj/Wkt1htOg9NNVEcl2TI7lUJesjRFOqar3L/ONQZQXY3gVYCZHPL1iUExQswwrF2IYpM+H6ZwICZA1lsKJBx25GrAGRqI0FHuZu09JMPHvVJ8HD8wnoK1h127/mWq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753455084; c=relaxed/simple;
	bh=l1VflNXf/ObwWPYE42Ycna3qYK6Kis5b6UVTAdTKe/I=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=B1emBuMQKq7a7Khqcj9WQN6VKL5A/QYVDQ/mUnv5umRVs7Ia40dM/OyUqmpP2eNjTVNpzfPrzM6DqlDEHYtfLDGWwVPVDE8RMfOskvA6r4SkndA7M//gJuQmPZ544iCIyZZ2A4D7SP6n/MSz5p08kCotTDxqbI/LjObsgAbgTsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=eon.se; spf=pass smtp.mailfrom=eon.se; dkim=pass (1024-bit key) header.d=eon.se header.i=@eon.se header.b=PuTZQPG+; arc=fail smtp.client-ip=40.107.149.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=eon.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eon.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=eon.se header.i=@eon.se header.b="PuTZQPG+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x53SrHYdz4t4RqIwVuBGgThDKKxfOFNvATPktMqPULfo+DDD2VxMkH3NFHFwvI9qia883bgNaF4aZ7I8jtYcqxT4iDLXY+Z27Jjx2JLL3XG5uiHM5dGHjO27/gRx7msTRV930XY0wwx6ixnTUIxTvsprM6Y40kG8wBoBu+8fgImeLg4Pna8YkJSQdxNk5vksLhhdQjX8BPFN8Rd+eXJzOqayoppUwIY8nxyPHfxJ3IR0LKrkFNy841+lS9QRh3pcyb14qQB5NJAUHrMjru2p72Kkt0N0Y7feU3zLlYu83AalKNzs13ZBJqDr+thqOnU1RmJ+BnZtUKVT2P+cCNHm5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l1VflNXf/ObwWPYE42Ycna3qYK6Kis5b6UVTAdTKe/I=;
 b=qAwysTroJhKn/bbVpu8Na3Vl3vz2mOcSv4Re6/7XOOLR+wsMaTb+3dNtXktNyq4St5skt9rULtk43aXuUDO2eHzAIfKnNm7KZjetzVITXBuBKv+OVrFJIzhcGpVvDKzkznZKFs4num1fe/qD/P19nJCJvEWIPoYt9RltDQujiGv++t/UAqwfJUYokGL5p+/zeZ3rMNQKlg+AdChEcgp97eR423tO0uJ59xm97ZG91/sZAxU4aL4BkNXj3RwpN22zeNfpcEn61aDkCX/10Ug/IjLrcOlkUl3k27xLdT+Zog/VpMOxnMfd6SjAbofDekl84GBx0fLsEYE7SnljjO8jgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eon.se; dmarc=pass action=none header.from=eon.se; dkim=pass
 header.d=eon.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eon.se; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l1VflNXf/ObwWPYE42Ycna3qYK6Kis5b6UVTAdTKe/I=;
 b=PuTZQPG+FUtoMD+RD+uEM+kyPcvITP/hHp2EcCDP4XTfoDfVGsgFhQNsOFeVdeieX1jX8yhUqBRdeG/H8aULbxStEZrMXglnHyRK2iDEVdJfsqBp+7FqPU8uwsL9jYafR3O6s3jRfLknVeHaNnDWa1uBeCUV/tiAFssQVxby8ME=
Received: from FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:be::11)
 by FR0P281MB2667.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:56::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.23; Fri, 25 Jul
 2025 14:51:18 +0000
Received: from FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM
 ([fe80::210b:d15e:d20d:7fd6]) by FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM
 ([fe80::210b:d15e:d20d:7fd6%7]) with mapi id 15.20.8964.023; Fri, 25 Jul 2025
 14:51:18 +0000
From: "Henry, Andrew" <andrew.henry@eon.se>
To: Erwin van Londen <erwin@erwinvanlonden.net>, Zdenek Kabelac
	<zdenek.kabelac@gmail.com>, "linux-lvm@lists.linux.dev"
	<linux-lvm@lists.linux.dev>
Subject: RE: striped LV and expected performance
Thread-Topic: striped LV and expected performance
Thread-Index:
 Adv3ryOkPkyC1+SGS2a//kGki21OpAABDQ9gAAlHfwAAAKRzYAAD2EiAAAFmTFAAB8FbgAB4CquAAJ5EHdAADqK+AAAAQa0gAAEEXAAAMrHiQA==
Date: Fri, 25 Jul 2025 14:51:18 +0000
Message-ID:
 <FR6P281MB3672DF5523313F265D242D2FEB59A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
References:
 <FR6P281MB3672085D192D8BF5CB45CFE4EB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
 <FR6P281MB3672F7D1B62E229AFCD31D0DEB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
 <9f6afc0d-ce58-472a-942b-15527f693d28@gmail.com>
 <FR6P281MB367296DD8DAECAB5633C9BDDEB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
 <630443e7-b5c6-449a-8f6d-402a71967710@gmail.com>
 <46e3e8c3-429f-4ffc-a710-5d8d585fbd1a@erwinvanlonden.net>
 <FR6P281MB3672CD74F16FBA40D66B8100EB5EA@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
 <5a03bead-580c-4c23-9154-e7b72a62a92b@erwinvanlonden.net>
 <FR6P281MB367272794788E0000A0AD50DEB5EA@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
 <3e8ce1b8-8a10-40e0-b0ed-468873f3c6e0@erwinvanlonden.net>
In-Reply-To: <3e8ce1b8-8a10-40e0-b0ed-468873f3c6e0@erwinvanlonden.net>
Accept-Language: en-GB, sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_ActionId=fef623df-2735-4bac-924f-7b3be2845aff;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_ContentBits=0;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_Enabled=true;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_Method=Standard;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_Name=Internal
 -
 Unencrypted;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_SetDate=2025-07-25T14:44:51Z;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_SiteId=b914a242-e718-443b-a47c-6b4c649d8c0a;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eon.se;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FR6P281MB3672:EE_|FR0P281MB2667:EE_
x-ms-office365-filtering-correlation-id: bd6516fc-b6a7-4d84-e6d2-08ddcb8ab6ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|19092799006|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eDhrcEtjNW02R0xvakdVc2pqMmN5aFI0WG04bUxUQTBjRzVTZlJSNzl6ZE5m?=
 =?utf-8?B?MDFZRzdQZldOUUNJbnV3dmtXWVBkYXpTL3dNb1VWdzI1NjZFemErRDQrUklY?=
 =?utf-8?B?ekhGczgwR2V0eFVjbW5sRldIbmlFbnAyaGt2amliU0Z4NWN6NGFKSEV5dS84?=
 =?utf-8?B?Q0RVd2NoTGY5TUtwQXNYbmVuTE8xaTFpY3JCWWV4am0zelM2VHp5YWFxSlRW?=
 =?utf-8?B?QWhuMUZQU2lCLzJMWEhZcGxCN0ZlbmMrcjZEU1Y2c0ErTlhLQzk4dlZnSFNH?=
 =?utf-8?B?amFrUXZEeG5kNk5mMlRNazFoeWVORnQ4aXB2MGlMTWdzNm5BbTNoKzZzMVEv?=
 =?utf-8?B?VzlZTm5NYmhzMGVMVldTb3hRd0J3L2FFUElpcThiVThwNzZzZlhBd3Z6bVJJ?=
 =?utf-8?B?S005Y1g4c2ZNR3BhNFhjcEI3K25SVDlGZkFhTFpWV2lnaVpuSXlaQ2lZbTBL?=
 =?utf-8?B?Q0x3TnQ1SmdjZlF2WjdkaC9xcVhSWGJXQzBVeEc5NXFPNFZpeFkxMzNXKzc3?=
 =?utf-8?B?ODdjdmlBZk1GeUI2TDdqZWFLNjNKTCtZQ1lRcGtRcGkvN0tpeWV3RnBSUncz?=
 =?utf-8?B?VHB3WjlQYmhjdENRMTVxaTRiVnc5Sjk5eVVCWFFMQXBsRUg4NnZYZzBsOCtH?=
 =?utf-8?B?QlVFS0RseVhlcGFjTVJDQTJDYWs3R0xvdUJORGJZQ2dnOCtyZFZnUjVZUStT?=
 =?utf-8?B?QTIzR0V2UkxuRVZ2TjhoQnJTdjNYYXNZMGo4UEc5NG83cm92c2FLditvcUd4?=
 =?utf-8?B?V1RCc3p1Mk0rUlNZd05Ka2xsUTBIZjk4OUdPMHNJTkR0cC9TRlFoTVFBZnMv?=
 =?utf-8?B?cjZKK0l1ZmJVRTZkOWFma2ZlUnN3SGdzREtZMmFkOG5wa294MnpSWWRpaEhG?=
 =?utf-8?B?ZFFnYVo5RWZFb3IxOHQ2aGFpSDVmRU5KYTFSVEF2ZkNlQkx3K0dtalQrRG1m?=
 =?utf-8?B?WmFLQ0RpWElvbWp1UERNWGhkUHRzTDNtTTU0NGNIeW1mMG9VeldwK3E5L2Y3?=
 =?utf-8?B?c0RaNWNqM0xKZXdZNDJQcFdhV1NEY2l5RWRIL3AzQjliUFV2VXRJNURNajVJ?=
 =?utf-8?B?amJ5VGV0ckoyUUd5RURwMVhVWm1PaDY4alJPWXNuM0xWVm43NjdUZzRsWTFZ?=
 =?utf-8?B?YTNSdk5mLzhLR1VCbXZweDhWQjV4dUZWT1l4WGtsRVFhd2hsb1lEZGxZcFpU?=
 =?utf-8?B?dm1yWk4xa1o5N0Q0WmZwaUNYejY1QkVRWklWOEdsR0svclJrVk1Sbmg5dnda?=
 =?utf-8?B?U1ZnSXJIcXVkMHhTc2NsNWQ4bGlkZFB0OW5BVmhJZk8yWXRtcUU5cUVOVUM1?=
 =?utf-8?B?S3VXTlJZeG94TnNFcUJoRWViUXUwa253OWxkdXNCWXdxdmp6RUF6cy9vQzh0?=
 =?utf-8?B?SFdqUFg1b05PRVBITWE5a29sQ3IweFh6T0dXeHVVQmR6T1dhME0yN3U5cEFm?=
 =?utf-8?B?V0h3bkdjNm81TTlpckJrZm9JbHFQaHN1WmI4L1FVMkd3VlJKdi9oOHh4dFdm?=
 =?utf-8?B?bTd3bGxKdS9qZWxZM1VwV3ZTQWFlZ0V6NkFaQXFWZXp0N0JuMGZEOWEzSXNx?=
 =?utf-8?B?eHFGWmhoeEdqamJXT3B5WTVtaFRiREJlNmhHS3NZSElnYlYrNTl4Z1pxeDZO?=
 =?utf-8?B?U1gxZkdVRGhxK2V0UDhwa3ZCQ29rM2QrVGR4eGNhSk1rRndURVdTU05rQnFq?=
 =?utf-8?B?K0hSWHpuQ2daU2hzcFVnYmFyejgrNU5WRmNKWjZRdURrb1FDQnhXMnlYenR1?=
 =?utf-8?B?RERxWHVTa0JqRlAvaTNYT0FJaGRMWC9JS2xSUWdMYVR1ZjlvSmxzaFZtQTJS?=
 =?utf-8?B?OUZUYng1STNiZzdjRExGdDQ1R3lxUkZGSFBYTFJKU2NBNXZrcExpcnRQN1NG?=
 =?utf-8?B?L3YxcVl6MzRmdWNhdVBnTWZ0aFVGOW5FVWZmR3prdlB3NVlCVHV0RDBBSThV?=
 =?utf-8?B?dDJzQUZkcDB6MjRobmtBejFxOFFENDE3RWFJajVGcmUxN0xHbld1UVVlcFNZ?=
 =?utf-8?B?ZEh4MGlLMENnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(19092799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MFJ6Y2JsaGFvWFY0ZWdHUDlnTW5vMGk4YlJQc25RSk84aG9McDl4TitJNDRL?=
 =?utf-8?B?MXVuVUdnMHdIR0pmR2hZVXJ5RUx0QW5DMGdFTnNSL1VjY3pmbzNrV2ZtT2lP?=
 =?utf-8?B?TC9COGpNYkhEL2NRNGJ4bGdPM2FYTjkrcG1sOE9KWFo0aEJIWlAxTEZueDky?=
 =?utf-8?B?WHRDNFNDU3M4SGx3K2thMWFvVHA4TGVYRE5Ta1dZOXhTcTIzaFlTdjVrdGFV?=
 =?utf-8?B?K2JBM3hEeU4zZkdFZ1VNK3ZzTlRNajcrR3lhZE5ZNHcwZ2VIcFVnZWlBZWJC?=
 =?utf-8?B?ZXQyY0c4VVFZZTc5Nm5KL1ZXcWxjSjJPQ2hOaGUwSTlTc3FXTThKMk1PRU95?=
 =?utf-8?B?SkZmbE94YWJ2eksyd3c5WVpZUmJhZFlCakJVTjdMam1wSTN5Y2JUNVhSSGxy?=
 =?utf-8?B?V2ttWXhCOHhhUVhuWHZlYWJtbzNzQ2paZXBXSlh4L2lrM0F5cENvcG0xQXpK?=
 =?utf-8?B?WlhsQlRJUkg1Zkp0Y1Vsd0RqUXJ3dThVTnJBSFRSSU91anc3YWZMaFJXM1p4?=
 =?utf-8?B?YTZMMlkvc25XSWRMbkZtOElDRzY2d1hTZDBBVmFEbDc4eW5BenFtYnFmYURI?=
 =?utf-8?B?WVgzcTZKV3BSL2puaHFxZnRnWVhlZ3BVMzFkUlVXRlI5eVdwclVVam5kaXZm?=
 =?utf-8?B?Vk5JaHNORlJIOGN5U1NldDZyRTFReWpERjZ2UUo2UmtZMElTUFpiVStIaTJR?=
 =?utf-8?B?QXN3ZVQ1Q3lDWktCNUZvSUFXdGRDV2pxVWRJRE9ZeEdRMUY0SlVsa3I1ZlpD?=
 =?utf-8?B?T3g3ZEVwRW9VSW5qTW04aFJBT3NZWEh0dlhqc2JDNGRCNTNLOW4xZnh6Wkww?=
 =?utf-8?B?NW1OeXFvZzcxRkFYQmViSDRlVG1OYkw5REpxdTR0TzduWmpUbkVNTFVtUzNH?=
 =?utf-8?B?cy9vMHYrQTAzbVEzL1JBTjFIQ0haNlVVMW9jaGhtd1h0SGRXY3Bucm0yaXd3?=
 =?utf-8?B?QlYzUG1DSlR0VEhQZmw1QllqaG8zbG9ERjk1dVloa0xqQkRqTzd5V1pFWXJ4?=
 =?utf-8?B?UXZvZDcvTjB0OGRIQVNKeVNxbVRKeXFRMWx1Mk5tMXlXZkZJZ3NxRkQ4N3JU?=
 =?utf-8?B?ajZiemI5VnltUmpGVzJpRVc1V3EzVHhiM3RQZEpaYy9kcGtVYjE4OXN1VEZx?=
 =?utf-8?B?T2p0M0pOMW05RHZGY242NUFWOFJMK1JhWFFUREh5dFE0MXovdWN6UEtoQXZi?=
 =?utf-8?B?aTJDcWQ2bGQwd09tdlFDUTlqc3dQZ2gxZ2xMSUpBSWtleld1Z0ZjemxsMmlt?=
 =?utf-8?B?MVQ5V1lJSmI0bjRMWmx2Q083TisrZ1FuSTQvcGF4N2d2SGw0WVVkUHRTWG9F?=
 =?utf-8?B?VWMrMDcrVzBqNXlvaGI4Ym4rU1B1TVNmTDYzYUVIT2hrczhzTnJWNTlXS0Jn?=
 =?utf-8?B?N3o3M0xFV1FpQ3c1MFROZG83NXlaN1Q3cDhlV0c2V1h0cWpVclBxRXFWdTFv?=
 =?utf-8?B?Z0dKK3dpVzJyUm05ZjdaNUhsVDVTN29KT3dVZWJHd2RNaXQxNTAzTUVIWE5w?=
 =?utf-8?B?QTNhVnNwNE5nVldIRGgzeFQ2eFN5dHNjbHlDY2U3ZEJOZk04ZzJEM0dxeDU5?=
 =?utf-8?B?dFFsOE9WVEpyMnBrQ2lvQmwvcGlDZ0YxNEFHNk1pU2thRUxEb09RMXpSOS82?=
 =?utf-8?B?VjR3eTB6VXFZWjVNcUgreENqRXJudkhnaThXVE42YnZnMDhGNVg1ZjU5REZT?=
 =?utf-8?B?T3RPZHhkcHNsRU16SHBZNUM3dHJRbnlNNm1ReWxwMjdIdmxSQWU1V3FoS0dC?=
 =?utf-8?B?dXRwOGxDWnhDWXgzUmhtS01EM2VPM0dVL0pISFRWUWJCSEdaRnlUOHhhb000?=
 =?utf-8?B?aGIvby9Fa0ZNZWRBYTlJakxkUUI1MGhZWnVqZHc2TmRjbnZYaHV0ZUZVdUpU?=
 =?utf-8?B?clpXd29zMWV2V3BRNFY2ZDBSMTJBd2dyNmtHUFVaUEhOU0x2eGs1VUVtR0oy?=
 =?utf-8?B?M2h6UkhqWmNHbnNjUjNlTTBNcGtwUmpWbEhHYnY1N2hFc2FIUUNLQXl4M1Ew?=
 =?utf-8?B?dHVWcWJJYkt2bEdzQVZHODFQalh3aDFONnZ2VVBjYmw4eFl6YWtjeXEvRkc3?=
 =?utf-8?B?SmF4bFBxd0FVK01QKy9BUDY0MEFQQ1RFbnM4VzFYZ0NyOGk1RVk4WjlzZ1F6?=
 =?utf-8?Q?TEEA=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bd6516fc-b6a7-4d84-e6d2-08ddcb8ab6ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2025 14:51:18.6683
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b914a242-e718-443b-a47c-6b4c649d8c0a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LkpVgH6aJjKXJ70dl2uiaDu4Auz7DS31ooxLccjzwM1AHuDxhCdTlkNgS13R1c3L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR0P281MB2667

PiBZZXMsIG1lIHRvbywgSSd2ZSBhbHNvIGJlZW4gaW4gdGhlIElUIGluZHVzdHJ5IHNpbmNlIDE5
OTIsIGFuZCB1bmRlcnN0YW5kIHByb2R1Y3Qgc3BlYyBzaGVldCB0aGVvcmV0aWNhbCBtYXhpbXVt
cy4NCjotKSBPbGQtdGltZXJzIHRoZW4uLi4gSGVoZWhlaGUuLi4uLg0KDQpZZXMsIGl0IGZlZWxz
IGxpa2UgaXQgZG9lc24ndCBpdCE/ICBJIG5ldmVyIHRob3VnaHQgSSdkIGJlIGFuIG9sZC10aW1l
ciB0aG91Z2gg8J+Yig0KDQo+ICIiZGQiIHdpbGwgYWx3YXlzIGdpdmUgeW91IGEgc2VxdWVudGlh
bCByZWFkIG9yIHdyaXRlIHdvcmtsb2FkIHdoaWNoIHdpbGwgYWx3YXlzIHRyaWdnZXIgb3B0aW1p
c2F0aW9uIGZ1bmN0aW9ucyBpbiB0aGUgdmFyaW91cyBjb250cm9sbGVycyBhbmQgSEREL1NTRCBm
aXJtd2FyZS4gVGhlIG9ubHkgdGhpbmcgaXQgd2lsbCBzaG93IHlvdSBpcyB0aGF0IHlvdXIgbnVt
YmVycyB3aWxsIHNvbWV3aGF0IGFsaWduIHRvIHRoZSBudW1iZXJzIGluIHRoZSBkYXRhc2hlZXQu
Ig0KPg0KPiBXaGljaCBpcyB3aGF0IEknbSBpbml0aWFsbHkgdHJ5aW5nIHRvIHZhbGlkYXRlLCBi
dXQgbm90IHNlZWluZy4NCkkgdGhvdWdodCB5b3VyIGZpcnN0IHBvc3Qgc3RhcnRlZCBvZmYgcnVu
bmluZyBvbiBhIGh5cGVydmlzb3IuIEluIHRoYXQgY2FzZSBhbGwgYmV0cyBhcmUgb2ZmIGFuZCB5
b3UncmUgc3ViamVjdCB0byB3aGF0IHRoZSBob3N0IE9TIHdpbGwgYWxsb3cgeW91IHRvIGRvLiBU
aGF0IHB1dHMgYSB3aG9sZSBvdGhlciBwaWUgaW4gdGhlIG1peC4NCg0KU29ycnkgZGlkbid0IG1l
YW4gdG8gY29uZnVzZSBhbnlvbmUsIGl0IF9pc18gYSBoeXBlcnZpc29yLCBJJ20gaW4gYSB2bSBn
dWVzdCAoYm90aCBXaW4gYW5kIExpbnV4KSBhbmQgdGhlIG51bWJlcnMgYXJlIHJ1YmJpc2guICBC
dXQgSSdtIGNvbXBhcmluZyB0byBhbm90aGVyIHN5c3RlbSB0aGF0IGlzIHJlYWwgaGFyZHdhcmUg
d2l0aCB0aGUgZXhhY3Qgc2FtZSB0ZXN0LiAgWWVzLCBpdCdzIGFsbCBkaWZmZXJlbnQgd2l0aCBo
b3cgdGhlIGh5cGVydmlzb3Igb2JmdXNjYXRlcyBhbGwgdGhlIHVuZGVybHlpbmcgaGFyZHdhcmUs
IEkgZ2V0IHRoYXQuICBNeSBleHBlY3RhdGlvbiBpcyB0aGF0IG15IGJpZyBmYW5jeSBTQU4gZnJv
bSBhIHZtIGd1ZXN0IGlzIGdvaW5nIHRvIHBlcmZvcm0gYmV0dGVyIHRoYW4gbXkgaG9tZSBQQy4g
IE15IGxvZ2ljIHNheXMgdGhhdCBpZiBpdCBpc24ndCwgdGhlbiBzb21ldGhpbmcgbXVzdCBiZSB3
cm9uZyBzb21ld2hlcmUuDQoNCi9BSA0K
