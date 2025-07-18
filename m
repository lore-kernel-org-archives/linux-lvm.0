Received: from BEUP281CU002.outbound.protection.outlook.com (mail-germanynorthazon11010014.outbound.protection.outlook.com [52.101.169.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A845C21859A
	for <linux-lvm@lists.linux.dev>; Fri, 18 Jul 2025 07:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.169.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752822830; cv=fail; b=B3VjsdPK5s1/ila962FY33y92Vi0rNFp/aSX0Us6IQ12jZB4X43xbA0uTaryos+/xdoMJ2csjNLKuYKlFO68qj1GM0I+f6zP2YahE4ZZJld3WhCWkBFcGB9yxbt2EBpoSf84GOQ8E5s/0PpTS1tiZxri0iiglEu0yYycqfMhA/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752822830; c=relaxed/simple;
	bh=NTi6UuvpA4q6qp7rBblXCsigKy1nnkfUxAX2+1I6P/o=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Pa42VJIyEgUrGUCaKOoos1kVlhS2ei/wcvLiTX6HIKphumxxbGKqzz5CB90bGFR2lD++XcgMY9c9OOO64M3om0V+DUQuWGTLfgsafntg2BU2xxVhVt66lV8IWAaRthbtYcTVmanXQj9nYqqF0+ij+E24RAEZ/F2ypxNs2lB45P8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=eon.se; spf=pass smtp.mailfrom=eon.se; dkim=pass (1024-bit key) header.d=eon.se header.i=@eon.se header.b=DwtdISrU; arc=fail smtp.client-ip=52.101.169.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=eon.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eon.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=eon.se header.i=@eon.se header.b="DwtdISrU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X8YYC87LT3f0JpzqaJwodP3uoX3nOZ0zR+90Og7clveQ+jMa2GgzmOl+5ThWeQ4izvq4Qb1IHMy9vdYz23oRCLbEwr3Q+fvigE+4ZsKHSRW/LyM+BFnMX9IMFDPucMqtu/tarzuHYM1wjUOp0F1BsWOj+8zH3UBRrcokBu80dkoj1ebqlgRb129ifTDiZAyEQKeV4pWKKnTKclxK/67mf1Ri+oPZtLudyWPU48Bf91uJe1kc7neyM10038dhYLUPuA18VLcEVaYprVrnvxZyf4dwQYQCTMhOgqs3Ocam+nyzngkEcHuEieLcAEGh6LfsCEBz8J9MbqHuDXhCPjpqrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTi6UuvpA4q6qp7rBblXCsigKy1nnkfUxAX2+1I6P/o=;
 b=LaECOrFMSJ4L+JzF5GAEHWyFTpH9olvWguB6tZvkLwA9wbbyHHN+l85pwvux1lGznkjPCE4WkJJCCXD5L4EVIMFxxAw837Cxwi7uTig6+WHN7ArxGBsZF9E5rEx5DHSCv7ONY8ILbwVgBFuBFlbGcoIUBnDKcMFFMqbmw/gozjNC4RCzvFSOCNWaVzZ6T9k30R9DK9By+WQo1WG7YSLit70mMExVTARKFo7W542PkIHz5RmJZySRpTn3Lo9JxjyYkvYcxsAxIeddKJj9viD3ZIYYNIVePiYPDlHvNAhaZQcdw4roA0YH5oIiJJLeCwtH8hA1BLXEsNC6pOjzjjzdOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eon.se; dmarc=pass action=none header.from=eon.se; dkim=pass
 header.d=eon.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eon.se; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NTi6UuvpA4q6qp7rBblXCsigKy1nnkfUxAX2+1I6P/o=;
 b=DwtdISrUCEAnOVvAqUYb8t+NOhxyu4dwrV8QeZC3IxWTD9q3OMRnCi27vFtuIVnAmb/zYahwpyGZox/IZkXR8UQybHFaQ6ilVVX8P6CmlToJx+P4ZtQNhs9QDViET/8jLbbgOzcLH7Fwmc65DFBwgAw+1cAsXrRcRp3SmdPnhTA=
Received: from FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:be::11)
 by FR6P281MB5058.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:176::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Fri, 18 Jul
 2025 07:13:42 +0000
Received: from FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM
 ([fe80::210b:d15e:d20d:7fd6]) by FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM
 ([fe80::210b:d15e:d20d:7fd6%7]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 07:13:42 +0000
From: "Henry, Andrew" <andrew.henry@eon.se>
To: "linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
Subject: RE: striped LV and expected performance
Thread-Topic: striped LV and expected performance
Thread-Index: Adv3ryOkPkyC1+SGS2a//kGki21OpAABDQ9g
Date: Fri, 18 Jul 2025 07:13:42 +0000
Message-ID:
 <FR6P281MB36727398D141AD2A1A1E76DAEB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
References:
 <FR6P281MB3672085D192D8BF5CB45CFE4EB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
In-Reply-To:
 <FR6P281MB3672085D192D8BF5CB45CFE4EB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
Accept-Language: en-GB, sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_ActionId=c836874a-c051-4ede-b6ba-0ad239ca4e0a;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_ContentBits=0;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_Enabled=true;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_Method=Standard;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_Name=Internal
 -
 Unencrypted;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_SetDate=2025-07-18T06:42:11Z;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_SiteId=b914a242-e718-443b-a47c-6b4c649d8c0a;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eon.se;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FR6P281MB3672:EE_|FR6P281MB5058:EE_
x-ms-office365-filtering-correlation-id: 87805d46-3737-40f9-3f0f-08ddc5caa062
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|19092799006|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?K2FZWGRzTkJ1c2hTOWl3YlFiUERBU2U2K2RVVDc3WmZLbXVlOXlKbEw4TjVB?=
 =?utf-8?B?by9hdSs3dEV4akdWYTFhTVJzNy9PV3FUSmIvSDlieVdGeFJYaWNYOURNelQw?=
 =?utf-8?B?MC9XQ0gzUEFSdjZsZEFwM0RYMXFCMzNrUDdIUy9WUUZKWERObEpsVUVNVHZ1?=
 =?utf-8?B?M2xFVE8vQnUwdVl6SGNaSDhrZVU3d2tOZ0Q0RitLTjByaXJSUE1IWHhaWlF3?=
 =?utf-8?B?WFRFbEJySUlKeEJEWUdNd3VMRzV6N0Q0NUVKRXhnNEdWNFdKbG5WSXVYd05Z?=
 =?utf-8?B?OG1BVTJvanhicTVSenAxQTJDNGRlRDBxYW9NY3g2bSt1VHhyeHh0Q0ZyenZr?=
 =?utf-8?B?WkRQdkg2UUZmRkhvM0JUdlFhWEFDYVdYYmVWOTE3Q2FSYkpDWHN1UXFqb05r?=
 =?utf-8?B?YjFzT0h2MnA3bnIwYWRBWC9sUlhiQWQ2Y0pvb2trTDdGdTlITDJaMDkzVkht?=
 =?utf-8?B?aUhEbGlsNXBnRkE4d2NjbmFYajNUUy9VVGt4TmlCcXJ5UmFMdUdWb1BoZEQy?=
 =?utf-8?B?eXpZWkZXdWtjMlpQNDBRdXlnazgxUlk2SVlXdFJtWmJYUXZuR3hyNE5ISGZh?=
 =?utf-8?B?ekFBUXZDMkdxUk9FazltUGo1V1VXRVoxVjVQVmFQcVBPTEZPVVRFM2U0MkhN?=
 =?utf-8?B?RDZ3S28wd0lXZGY2K0FxYjlWckNyODFIRGF0NnVQODE4SEdmYXZCcFU0S2x2?=
 =?utf-8?B?czNzMnFHcnlYSkt1ZlZmY2VITnU1MFBOS1lDTXBYeFlWdm9PalhTelFzSXhZ?=
 =?utf-8?B?YjdPYnBvLy9iWHpYMFltSjFVU3JYbnFSdXhpdzJqZUh2YjlRVkhScW0yV3dp?=
 =?utf-8?B?RWIwbHRZVWgrejFrMlBsd3I1Skg0RGlnc3h2YVBTekhXOUh0RmJtd2lUd0Jq?=
 =?utf-8?B?bDFRTDJIbTh3OG1QcmR4UEtYUkppMlBOakVFamhORUhmRUdnTXpRZDUxL044?=
 =?utf-8?B?enE5dGRvMHVyN0VmeUIyVVQ1VGY0ZUljb05VbUJVK1dQcnNRV3plVmk5alI1?=
 =?utf-8?B?aXNkUG1EaFVSamhPUERuMXNSQzlBbkF1eno1Q0FaWGdDNkJCNWUrb3JFUk41?=
 =?utf-8?B?dHZBNXJMRGVrTFRMMGlZR240RkNmVnI4OXRLbGVFRy9KRDkvQU8vdXpzbWZ5?=
 =?utf-8?B?M2x6WWFaekwrRncrWnlXb291Mkd2ZDltRVV4Q3E1S3M2c3BxRVJub1ZpSVNG?=
 =?utf-8?B?bGI1TklDaVZLdVREbENyMGNGWUZETTJwVG1wQ0UvWEhhOUUxSEo2NWNRcXZD?=
 =?utf-8?B?dDZYejlvZzc4WXA5YVdYdkFUMlE5NjZyeCtSYkdoNitnbjhaTHl5cUhydjBq?=
 =?utf-8?B?VjIzSGNpN0VjWkZPWnV4bUNEWURyYmFObVNsa3dkcnNrWW41RVpXTDU4R3RY?=
 =?utf-8?B?c3B0WlNHZEZ1NUc1TGZEc21GLzNCS1pVQkFoUG12bXJjNTJvd04vY0RNNzVy?=
 =?utf-8?B?aUlLOS9NUU1YSlBSS1diYVBSempJR29tcVl2OEdJbDl6bXJBK0JveW1Ncjg2?=
 =?utf-8?B?dWtwRmh3bWZJSy92YXhhYjR6SDgwRGF6TlZxNytvclB0T3gzamRwNW5mc0ZC?=
 =?utf-8?B?K1BDbDNYM21wUGljWlhvK2hDOGc3UU9wOFpPalFaY2dadWs0UThyNnFKdk1Z?=
 =?utf-8?B?S1liVU1jSTFidThTeFFUM0JKSklicmFwV0hQVUlUSjA5UVlmRDdvQ0t1dEFR?=
 =?utf-8?B?STNTYlBmMWJYVzU5SG4wWldtWHZWOWZ4Um9oeE8wS1lldVVUNml3RHA1Mkgv?=
 =?utf-8?B?VVhIQkN6VTVpN3ZlSzVTczZ6ZVRoY1RpYkJTVlRsOHovOXFYVE1qUGVmN0d1?=
 =?utf-8?B?bU5BdVdOZVBuSGpQSC9pOVg5ZFUrNE5RbXF3WDJXSXNiWEtzaENLNHNsNk5p?=
 =?utf-8?B?STc0S3VaQ0ppaXVMV2NwNC9sWG9UMFlDRXVoZ254dnBtZmZjTmJodjRqNTB2?=
 =?utf-8?B?YW1RdFJhaTBNaXdsbFQrbWhJSlhDVUVWV2VxRkJhZFg0dnhtbkpTcUdGRzdJ?=
 =?utf-8?B?aTZnZ3pNY3RBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(19092799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SDJ4QUFlUW5FbnFJRXFBR1kyNitEV2lKVWEzUEpJRXYrZm05UjVFcWdkZ1VF?=
 =?utf-8?B?SVcrWjlnMStmUDZpRnNxc0JPdGoxR2tabUJYNDM4VHJLSEFFMThUcVR2aytC?=
 =?utf-8?B?V0M1VGtQU3RhbTJZZ2ZuSzVNejVkWkxwTHN3Tjh2ZUtzakZhdUI4TzVoczE0?=
 =?utf-8?B?YlNOUWZPbnZUNTE3VnNaVER3WEJraUZwdm14RHZ2KzE5OUltQVpxbG1FbUVz?=
 =?utf-8?B?UElDb0lQRXZUTnliR2Nud1BzT1RqQXJTUHdKNnVTNUM5aWxyUUFLY09qa1Yz?=
 =?utf-8?B?ZFYxek9YUmFlMHV2K0U4Y1M5RU1zeWVqSnAxVGJYYURkaWtCZmNDRkpXM2pL?=
 =?utf-8?B?enNyaXIveGtzamw0a0VhbXQ0QUx6UXluZ0h4UU53VkE5czIrOUY3QTBVc3lS?=
 =?utf-8?B?TnhQUjdqUVFmTmQ1Y1hIZHdLRnJlLzgyUUN2UTM5VmpWOWx1ZFUzWTZBeDRp?=
 =?utf-8?B?SUdSNCtzd3UrQVFQSkhEQnMvV0dEbWdPZFpnZkozek9DaTcvWTMvb2tocW5r?=
 =?utf-8?B?bWRPLzhoM3h0TjQ4ZlpnbEQzc2tvWVFDSFNVSjJuVHJQNzA3aWhRakI1cks4?=
 =?utf-8?B?YVJxNm9YcEhka3BHbThRNzYySWtPM0xuWmtsdllzNHkzdlVCNG11UThZU09t?=
 =?utf-8?B?UjcxTVVBNVdDM0wwR1JteXBHRXRCdzEzNVlIbWFzdW1NOURSaUE0SkZRd1lq?=
 =?utf-8?B?M2s0VG8zbThtWThzcVI0aEtHM3d0RzdZL3RXSDZ4aStsTU1Femw1eUtLdXcy?=
 =?utf-8?B?YjRFMzhYOGIrdlU0VGJrRVF0N1IzZUpxSVhuRHhFZnNlRUlWY1gwY0kvVkN0?=
 =?utf-8?B?bnhTWTBITWd5SkJmOUoxTlFVNVgzaUNFRG9zVlNhSk1nb0VVMnppZmlCU0dq?=
 =?utf-8?B?SDVNTC9MWlVIOWN1a3FMNVdEQU1xYjdGM3hFWjQ2ajNLTDZHQlJnUnQxSnVK?=
 =?utf-8?B?YmdXSzl0OXc2Ti9tdnhRa244U1YxVHgvVHcwTHlDclpkeWwxdTQ0cEoyWUFr?=
 =?utf-8?B?QVV3dytVM1pwbUwzWHlwNWtkUHVqbFZDTkVUalEzV3JuaTJKMVQzK2c5dnhl?=
 =?utf-8?B?cTNoWDdxNmhKalpPNUplejhjZENuc000dEF1ajFXWDZxMmFWSHJkK1U1Mnhy?=
 =?utf-8?B?WTRSekRQdHlFSjNDN3cvcUw5NnpYZUEvZFp6V3Bza0N4SzIyZlhsa203eVJl?=
 =?utf-8?B?WjlZaFZpS3RLbFBJNWs2TzdUTldOZVdPTzFDRW50M0NtLzhjaVM2UlFLV1li?=
 =?utf-8?B?eHI0SXdoNW9Ya0wrc2c2SndTZWpwZGJvdU5jbVVheCtJcEdLM0ZTNUlXZFVE?=
 =?utf-8?B?ZC9TeWJ3aFNadVJxWHV5OFZ2TkZpcUF4cUdoTnNYbEMvdnlVQkpMQ1hBS0Ux?=
 =?utf-8?B?Vk9ITGVWSlhocEN5ZlEyUkIxcFpZRkFQUDgvbWVTOGgwWlJXTVBhUXNOcktj?=
 =?utf-8?B?b3pBVzN2K2pXUGNHV2RuSHJEdm96dlBPamh3UXdZVTBWMnppdGM2VUp1bVZt?=
 =?utf-8?B?SEx0NXd2V2Ixa2FZMEl4N1Ztd3E2OTFyaFNNc0o4YjhDUjkvUUcvTDZQbEVr?=
 =?utf-8?B?L3lpVzQ5REpKUkxuOHNzZEVST2x0RVFVYUgxSXdiZm1MSEpENE1kTnVESmtY?=
 =?utf-8?B?YlpjSmJqMnNJK3FhVHZDQ3NKNzg1SVNrQjUrR3FzNGNwb1VYUDBzK013RTht?=
 =?utf-8?B?ZU5tMmg5WDBNU3JmZFI1THVMQW52VmdKYTczMml4ODI0NTErK3BycUw1dU5Q?=
 =?utf-8?B?ZWRkUmFXV3R4OGY2YzVjcUhtNWEzMXBUQ29ySmo2SlY5VkQ5b204eGlTTjZV?=
 =?utf-8?B?K0xZS0ZLOVI1eVJ0N2pmcmRzMVJub3RuVTVtdy9BR1Rmd1RyTnYwREx4MTlI?=
 =?utf-8?B?Uk9IdXhjZnZCMnBjZENlWkRQWTdPaTJyVXNGTjNGN3lTZmdQZFdESFFIYUlI?=
 =?utf-8?B?NjY0VlV2ZXpybWdTbE42MndlQ2w1OFZPU2dobXhOZ21OQlBSWkprQ2krREww?=
 =?utf-8?B?eEFva0dpaEJSbitEa3RmMHNkWU81c3dpSDNKaGdvcUZuQ2FRdWpGYmgxNXhX?=
 =?utf-8?B?b2JIVXVDWEo0T3pla29abnI1bmp1M0R1TGtLUTI2dzEralprQ1lIbFVlQXF2?=
 =?utf-8?Q?0uqE=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 87805d46-3737-40f9-3f0f-08ddc5caa062
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2025 07:13:42.0812
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b914a242-e718-443b-a47c-6b4c649d8c0a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OG+sScC4nsXA+GfdZk46TboH9uH1waB6dEcL8Zk8EzdT0X3G2R7lF4wpinTTngai
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR6P281MB5058

SeKAmW0gdHJ5aW5nIHRvIGltcHJvdmUgdGhlIHBlcmZvcm1hbmNlIG9mIGEgdmlydHVhbCBtYWNo
aW5lIGd1ZXN0IHJ1bm5pbmcgUkhFTCA5LjYuwqAgSeKAmXZlIGFzc2lnbmVkIDMgc2VwYXJhdGUg
U0FTIGNvbnRyb2xsZXJzIHRvIHRoZSBWTSwgYW5kIDMgdm1kayBkaXNrcyBlYWNoIGNvbm5lY3Rl
ZCB0byB0aGVpciBvd24gY29udHJvbGxlciwgc28gdGhlcmUgaXMgbm8ga2VybmVsIGJvdHRsZW5l
Y2sgaW4gdGhlIFZNIG9uIHRoZSBjb250cm9sbGVyIHNpZGUgd2hlbiB3cml0aW5nIHRocm91Z2gg
dG8gZWFjaCB2bWRrIHVuZGVyIGhpZ2ggbG9hZC4NCg0KSW4gdGhlIGd1ZXN0LCBJ4oCZbSBjcmVh
dGluZyBhbiBMViBhcyBmb2xsb3dzOg0KDQpsdmNyZWF0ZSAtbiBzd2FwIC1pIDMgLUkgNjRrIC0t
dHlwZT1zdHJpcGVkIC1MIDE2RyB2ZzAwDQpta2ZzIC10IHhmcyAtYiBzaXplPTRLIC1kIHN1PTY0
ayxzdz0zIC1mIC9kZXYvdmcwMC9zd2FwDQoNCkFmdGVyIG1vdW50aW5nLCBJIHRlc3Qgd3JpdGUg
c3BlZWRzIHVzaW5nOg0KDQp0aW1lIGRkIGlmPS9kZXYvemVybyBvZj0vbW50L3Rlc3RmaWxlMSBi
cz04MTkyIGNvdW50PTY1NTM2IG9mbGFnPWRpcmVjdA0KDQo1MzY4NzA5MTIgYnl0ZXMgKDUzNyBN
QiwgNTEyIE1pQikgY29waWVkLCA0MS4yMDQzIHMsIDEzLjAgTUIvcw0KNTM2ODcwOTEyIGJ5dGVz
ICg1MzcgTUIsIDUxMiBNaUIpIGNvcGllZCwgMjcuMzk4NiBzLCAxOS42IE1CL3MNCjUzNjg3MDkx
MiBieXRlcyAoNTM3IE1CLCA1MTIgTWlCKSBjb3BpZWQsIDIyLjgzNTkgcywgMjMuNSBNQi9zDQoN
CnRpbWUgZGQgaWY9L2Rldi96ZXJvIG9mPS9tbnQvdGVzdGZpbGUgYnM9NjRrIGNvdW50PTE2Mzg0
MCBvZmxhZz1kaXJlY3QNCg0KMTA3Mzc0MTgyNCBieXRlcyAoMS4xIEdCLCAxLjAgR2lCKSBjb3Bp
ZWQsIDEwLjc1MDYgcywgOTkuOSBNQi9zwqAgIyMgb25seSBkaWQgb25lIHRlc3QgaGVyZQ0KDQp0
aW1lIGRkIGlmPS9kZXYvemVybyBvZj0vbW50L3Rlc3RmaWxlIGJzPTFNIGNvdW50PTEwMjQwIG9m
bGFnPWRpcmVjdA0KDQoxMDczNzQxODI0MCBieXRlcyAoMTEgR0IsIDEwIEdpQikgY29waWVkLCAx
OS4xNTggcywgNTYwIE1CL3MNCjEwNzM3NDE4MjQwIGJ5dGVzICgxMSBHQiwgMTAgR2lCKSBjb3Bp
ZWQsIDIzLjAzODQgcywgNDY2IE1CL3MNCjEwNzM3NDE4MjQwIGJ5dGVzICgxMSBHQiwgMTAgR2lC
KSBjb3BpZWQsIDE4LjM3ODggcywgNTg0IE1CL3MNCg0KSSBtb25pdG9yIHNwZWVkcyB0byB0aGUg
aW5kaXZpZHVhbCBkaXNjcyBhbmQgdGhlIExWIGl0c2VsZiB1c2luZzoNCg0KaW9zdGF0IC14ZG10
IDINCg0KDQpNeSBxdWVzdGlvbihzKToNCg0KV2hlbiBJIGNyZWF0ZSB0aGUgTFYgdXNpbmcganVz
dCBvbmUgZGlzayAobGluZWFyIGx2bSksIEkgYW0gc2VlaW5nIHRoZSBzYW1lIHdyaXRlIHNwZWVk
IHJlc3VsdHMgYXMgYWJvdmUuwqAgSW4gaW9zdGF0LCBJIGNhbiBzZWUgdGhhdCBlZy4gV2l0aCAx
TUIgYmxvY2sgc2l6ZSBpbiBkZCwgaXTigJlzIH41MDBNQi9zIHRvIHRoZSBkbS0xIGRldmljZSBh
bmQgYWxzbyB+NTAwTUIvcyB0byB0aGUgcGh5c2ljYWwgZGlzayB4dmRhLsKgIFdoZW4gSSBjcmVh
dGUgdGhlIExWIGFzIHN0cmlwZWQsIEnigJltIGdldHRpbmcgdGhlIHNhbWUgdGhyb3VnaHB1dCBv
biB0aGUgZG0tMSBkZXZpY2UgKH41MDBNQi9zKSwgYnV0IGl0IGlzIHNwbGl0dGluZyB0aGF0IHRo
cm91Z2hwdXQgZXZlbmx5IGFjcm9zcyBhbGwgdGhyZWUgUFbigJlzLCBzbyBhYm91dCB+MTcwTUIv
cyB0byBlYWNoIHh2ZCBkaXNrLCB0b3RhbGxpbmcgfjUwME1CL3MgYXQgdGhlIExWIHNpZGUuwqAg
VGhpcyB3YXMgbm90IG15IGV4cGVjdGF0aW9uLsKgIEkgZXhwZWN0ZWQgfjUwME1CL3MgdG8gZWFj
aCBkZXZpY2Ugd2l0aCBzdHJpcGVkIExWLCB0b3RhbGxpbmcgfjE1MDBNQi9zIG9uIHRoZSBkbS1h
IGRldmljZS7CoCBXaGF0IGFtIEkgbWlzc2luZz8NCg0KU2Vjb25kIHF1ZXN0aW9uIGlzOg0KDQpJ
4oCZbSB0ZXN0aW5nIGRhdGFiYXNlIHRocm91Z2hwdXQuwqAgSSBoYXZlIHRoZSBmb2xsb3dpbmcg
c2V0dXA6DQoNCkRCwqAg4oaSIDhLQiBibG9jayBzaXplDQpYRlPCoCDihpIgNEtCIGJsb2NrIHNp
emUgbGltaXRlZCBieSBwYWdlc2l6ZSBpbiBMaW51eCBLZXJuZWwgb24geDg2IGFyY2hpdGVjdHVy
ZS4NCkxWTcKgIOKGksKgIDY0S0IgYmxvY2sgc2l6ZSwgYW5kIGhhdmUgYWxzbyB0ZXN0ZWQgd2l0
aCA0S0IsIDhLQiwgMjU2S0IsIDUxMktCLCAxTUIsIDRNQg0KWHZkW2FiY13CoCDihpLCoCA0S0Ig
YmxvY2sgc2l6ZSBvbiB0aGVzZSBkaXNrcyBwcm92aWRlZCBieSB0aGUgdmlydHVhbCBob3N0DQoN
ClRoZSBvbmx5IHBhcnQgb2YgdGhhdCBlcXVhdGlvbiBJIGNhbiBtb2RpZnkgaXMgdGhlIHN0cmlw
ZSBzaXplIG9uIHRoZSBMVk0uwqAgSXJyZXNwZWN0aXZlIG9mIHdoaWNoIHN0cmlwZSBzaXplIEkg
Y2hvb3NlLCBJ4oCZbSBnZXR0aW5nIHNpbWlsYXIgcmVzdWx0cyB3aXRoIGRkIChhbmQgZmlvIGZv
ciB0aGF0IG1hdHRlcikgd2hlbiB0ZXN0aW5nIGRpZmZlcmVudCBibG9jayBzaXplcyB3aXRoIG15
IHdyaXRlIHRlc3RzLsKgIEluIG90aGVyIHdvcmRzLCBpdCBkb2VzbuKAmXQgc2VlbSB0byBtYWtl
IGFueSBkaWZmZXJlbmNlIHdoYXRzb2V2ZXIgd2hpY2ggc3RyaXBlIHNpemUgSSBjaG9vc2UgaW4g
dGhlIExWTS7CoCBJcyB0aGlzIGEgbGltaXRhdGlvbiBjYXVzZSBieSBteSB2aXJ0dWFsaXNhdGlv
biBsYXllcj/CoCBXb3VsZCBJIGhhdmUgc2VlbiBkaWZmZXJlbnQgKGJldHRlcikgcmVzdWx0cyBp
ZiBJ4oCZZCB1c2VkIDMgcGh5c2ljYWwgZGlza3MgY29ubmVjdGVkIHRvIGEgcGh5c2ljYWwgaG9z
dD8NCg0KSSBzdXBwb3NlIGl04oCZcyBub3JtYWwgdG8gZ2V0IGxvdyBzcGVlZHMgd2l0aCBzbWFs
bCBibG9jayBzaXplcyBhbmQgaGlnaGVyIHNwZWVkcyB3aXRoIGxhcmdlciBibG9jayBzaXplcywg
YnV0IEnigJltIHN0aWxsIGNvbmNlcm5lZCB0aGF0IDhLQiBibG9jayBzaXplcyBhcmUgd3JpdGlu
ZyB0byBhIGZhc3QgZGlzayBzeXN0ZW0gYXQgb25seSAxMy0yME1CL3MuwqAgSXMgdGhpcyBjb21t
b24/DQoNCi9BSA0K
