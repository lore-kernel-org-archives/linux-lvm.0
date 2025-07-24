Received: from FR4P281CU032.outbound.protection.outlook.com (mail-germanywestcentralazon11012016.outbound.protection.outlook.com [40.107.149.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD902DCF49
	for <linux-lvm@lists.linux.dev>; Thu, 24 Jul 2025 14:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.149.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753366236; cv=fail; b=cirOU5fnkY6Lp9Bxdb4POc+UtNAis/Lw1gOoi+uV0/ifEg+oOKXlkssgki1J683OG1vQfCy0isNdbDbs8ueSX+COATjE86AM8QDsUHn/EINC9EE6Tj7J/F1+yTCfTUbFt54oBEact5Obf2B6R9O/QkJE+l0LIIpumihlBGWdPhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753366236; c=relaxed/simple;
	bh=uIdGIBuA4xLlCgqwD+DFIRdyyfxvnZKRf1nzzi4ccPo=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NqFjAeRINoao4ZzwlyUPFEkSlTUaORdmtGBXxXlhUh2I1j7fzZXEzJyEq8AiRBp/eAv6TmAHED1Khffh8Mva+qPYtnm8ItndP2wmqvsXt1s4XGCb54MoAKZYd/ikONwfF+/4YKyizqHkoP809TkRw6FwjgjSBRslnAX/lKWPdP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=eon.se; spf=pass smtp.mailfrom=eon.se; dkim=pass (1024-bit key) header.d=eon.se header.i=@eon.se header.b=DW9es0wR; arc=fail smtp.client-ip=40.107.149.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=eon.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eon.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=eon.se header.i=@eon.se header.b="DW9es0wR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=exGLl/3XH2kQDyjO2kEiE6y0/r07Z3Cw/YMaCWNbWLIvvyDLYZZn1ALFJRr4EZpwJ1L0r3i8XxUC8VbwfGQF6U33YHT0eiyFk3fwYj7Rw94UNHbQMSpYV9N7YOPurpkeVyTNHug79OW1YvBaOEU7rbE503iqYQDV7jO2THKYieIzuavUvr/G8CTQFgS49Y1WYNCISYW3caCRDbxI1YUULQvNTAa6DXtNCeF9E189v87QR+Pj4zvfA9FfSW/0Fk/FLKWCtu9NruuB9EKifyTx3RJT8kowuQUFHmG6UmewRNct/tv77b9cxBtQoa1nHKIqb69+SX9s5KuV056KfcFP8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uIdGIBuA4xLlCgqwD+DFIRdyyfxvnZKRf1nzzi4ccPo=;
 b=XJ7LQTvxxHqWzBRUGbH8jao78m0XbH4wURCiCM/lnO/TDSf8uPLRglhisDIsDyeIjjxXL73uiB4SbMsXBbp6YT7v/DTAFQ1pYRINrPGv7Bz72nyUq/7d1EhjIcGka10S6Brfm1Wl0qKtI2boxpiH43htLoSBkdD9ulDQjooAeEWssN0Z6/27fwW8jVD+ZJEU7nzWQCztiWIadh/fMkZfhgsCYdiq4A1rSnbL+rr+MlKXAdmDJtPvEa+5ZBtJECmct33Nrqrvzm4UnE1rlxManTLN4P4Paob9o5Df+dy6qbrnxcfPI88Y0Q51yaH+nz4J7Rw/fv3jK88JZQX/mJjwRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eon.se; dmarc=pass action=none header.from=eon.se; dkim=pass
 header.d=eon.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eon.se; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uIdGIBuA4xLlCgqwD+DFIRdyyfxvnZKRf1nzzi4ccPo=;
 b=DW9es0wRQ+gUj38zIJTT5celtQvpoN+7LCFawZ4uyRCRq+mpo42V7lK/Ak+c2W/VEZd/A4JRlOt7tekSMylXAofrrFL/H32ICyLJOqFgHW5VB2if67pUAhk/MLQBGOTTRa3kv1PiM+HOoWDC7VxE/4sVITC8iTpFd3klslXgZ+g=
Received: from FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:be::11)
 by FR3PPF8503AEF3B.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d18:2::160) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Thu, 24 Jul
 2025 14:10:30 +0000
Received: from FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM
 ([fe80::210b:d15e:d20d:7fd6]) by FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM
 ([fe80::210b:d15e:d20d:7fd6%7]) with mapi id 15.20.8964.021; Thu, 24 Jul 2025
 14:10:30 +0000
From: "Henry, Andrew" <andrew.henry@eon.se>
To: Erwin van Londen <erwin@erwinvanlonden.net>, Zdenek Kabelac
	<zdenek.kabelac@gmail.com>, "linux-lvm@lists.linux.dev"
	<linux-lvm@lists.linux.dev>
Subject: RE: striped LV and expected performance
Thread-Topic: striped LV and expected performance
Thread-Index:
 Adv3ryOkPkyC1+SGS2a//kGki21OpAABDQ9gAAlHfwAAAKRzYAAD2EiAAAFmTFAAB8FbgAB4CquAAJ5EHdAADqK+AAAAQa0g
Date: Thu, 24 Jul 2025 14:10:29 +0000
Message-ID:
 <FR6P281MB367272794788E0000A0AD50DEB5EA@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
References:
 <FR6P281MB3672085D192D8BF5CB45CFE4EB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
 <FR6P281MB36727398D141AD2A1A1E76DAEB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
 <67b28bf7-b862-4878-8434-aaf0d157f2ca@gmail.com>
 <FR6P281MB3672F7D1B62E229AFCD31D0DEB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
 <9f6afc0d-ce58-472a-942b-15527f693d28@gmail.com>
 <FR6P281MB367296DD8DAECAB5633C9BDDEB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
 <630443e7-b5c6-449a-8f6d-402a71967710@gmail.com>
 <46e3e8c3-429f-4ffc-a710-5d8d585fbd1a@erwinvanlonden.net>
 <FR6P281MB3672CD74F16FBA40D66B8100EB5EA@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
 <5a03bead-580c-4c23-9154-e7b72a62a92b@erwinvanlonden.net>
In-Reply-To: <5a03bead-580c-4c23-9154-e7b72a62a92b@erwinvanlonden.net>
Accept-Language: en-GB, sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_ActionId=820bcff6-3297-4151-a91b-827edb3ea6a5;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_ContentBits=0;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_Enabled=true;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_Method=Standard;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_Name=Internal
 -
 Unencrypted;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_SetDate=2025-07-24T14:04:10Z;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_SiteId=b914a242-e718-443b-a47c-6b4c649d8c0a;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eon.se;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FR6P281MB3672:EE_|FR3PPF8503AEF3B:EE_
x-ms-office365-filtering-correlation-id: 1223ce4b-edab-43bb-b481-08ddcabbd8bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?L25qRXIxK1czZjJJcW84bjZLNVJYUnZKY2ErSWxDZm1LRnh4VmRwcldTblJH?=
 =?utf-8?B?dWtQb1JSOGdCSFJZMWc2ajE1MWtkNkpvUVVzNGE2aWZDNkdRVWpaa05ma0Va?=
 =?utf-8?B?TWY0Q0xHakxHbjBWNW9YMnZndXlwTVRiT1B5RkpHVFltMGJMRElFQ25JeExk?=
 =?utf-8?B?OEZvZEhDeTIyZ3B5VTdrT0xmV1NxeCs0UUFFMExFTzdVcWxwWjZ5NGVPRmMr?=
 =?utf-8?B?VWVLVkpyaEZuMlhEcjIvYVdZQWlsZ1hDUFpiVFluZzNVd2ZQN0lRaTdISXh0?=
 =?utf-8?B?c2prTDBNakI3MEQ0bzFJNG1xTDZSUCtaa083Q1ovYSszL25UbmI1UENyUTVm?=
 =?utf-8?B?VThKbUozZWpDSTN5ei9acVlOM0kvd2U2ZHhPWVdqVHVObnNFSHRXYkx5aXNo?=
 =?utf-8?B?K25SMW1qSlZQUUFPSHhwdTdhdGZZV3Y4VW54QW02T1AxcGFsS1JGS0ZhZFRX?=
 =?utf-8?B?dXRDRlZkRmc5UU5QRVpodnRCNGhyN3Y0RjJVVkVhVWV4NFVGZ1NrOXlPNU5D?=
 =?utf-8?B?UmM1a0t4UFI1QVNlTWFrMWNQaVo3UGZYaWUyMmF5Mk83ZDlDQmR3Q0dsOVVm?=
 =?utf-8?B?UzZidmF0UU9Xa2dLUEJISWFpMEkzQUVqM0lUUStsT3U1UmRzdmJod05tWFdM?=
 =?utf-8?B?Q3AzcE1NSDk2aHEzUDJQczNoSVVOdVFBV2NLTUtZSFB5YzFrWVhLU1dvTVVB?=
 =?utf-8?B?SldUNUFQMXBxU3NwVUZzTFAvWEprTjJXWmNZMWhzajkzRGNNMXNHQkNwbU1n?=
 =?utf-8?B?SFVjc3hlenEwS0NTRERFTU9qR3V1Wk9UVklRVGdTZ29wY0l3NnhaRm1nVVEr?=
 =?utf-8?B?TzViQkQxQXIxdU5QV3J2SVp5WmxGNGRNYmJZWW9PQmVTWGtmbjFnMkhMV2RH?=
 =?utf-8?B?c1NycnY1Q0ZNenBZZGpab3U3aktwUmhwYlBRY1RrOEJrSVFNWkdYazhmMk0z?=
 =?utf-8?B?dTdpaDlzdUtFWXk3UkV2Q3pFQkdyWU9TZExrM0x3WVlmdFJvSW9FZmJXZnBO?=
 =?utf-8?B?TWpUNllockhXcGcxNmduUHR3dk5LaVF0NnpvWjNCbE9XdCtmWVB3enpXZWtF?=
 =?utf-8?B?ei9LaDlYTUZ1Q09qUUdnT1AvSVkvNHVRTjZuN0ZqUGpjcDZvU09TeThBQlhH?=
 =?utf-8?B?amNabENlSDJuUVFWdXg4RVhXc3N2NnFRL3h5dUl2aDc1dk1vSkNqTWFYZkhT?=
 =?utf-8?B?TUNwaTFGVDZEWVlncEt0ZGhHbXdCcGkrR2xBZ3NkcGhrNEN5V28vZXRoeEVE?=
 =?utf-8?B?TUhRRklrOWxjRVZGNjZjTHFMWUxWa0VUZ3BENXNLeDVQa0Nkc3U1eW4vdy9S?=
 =?utf-8?B?L0ZVdllKVkcvYkM3c2s2V3g4MXZ5WVJjd3dnN0JZWm5henlYaWYwWk1Qb2J0?=
 =?utf-8?B?MitTSGx5QWpXUzE2Q1RTbW81bG1WNWVRNitGdEdYZTFFcVFEMmpsTEYyZlVS?=
 =?utf-8?B?U01CV3oyWlJDTDlSNkFoL1hwUHQraEgwQ0JhZzJiUW94TmZwN21nNUtvQzVW?=
 =?utf-8?B?eEx1cmZwMzhXWFdDMXY1eFpFTHhYVEZ4TXg5RjIxYjlHaGxJVmwxREpNakph?=
 =?utf-8?B?a0gzUUhXSSs4SklFSDZHaDdNVjVONSt3UlFqQ0piQ2xiaXVpaExPMFVNL1ZQ?=
 =?utf-8?B?ZEJiUFVjakVvOWZ2NkNHaDBWM1kxbnQyQlA4dmhRZjZ1ZlFKTWtzQkR2THAw?=
 =?utf-8?B?VmpLTlYrVmh6QTNhYkxXaTlXYmdFT0tEblV1Q0ZDNHAzM09rVm1SWlNCREx6?=
 =?utf-8?B?Kythcno1b2RIN3BpQzlJbUduUXd0clpma2pTbjQzQXdaSGdpdUV5aHlVOTNO?=
 =?utf-8?B?MTIrRkZRZEZGUVFzeFFTTllxZjRBMVg5N216NU1lZnh5N2wyY3dTZHUreWJa?=
 =?utf-8?B?dTdMeENQZEVoLzVPQmdCSUFTRUFaT1FVcXVINEliT1NIOFBhWldLQ2Z4dllC?=
 =?utf-8?B?eGoxYlFkUWMrYzI4NktmRmxiR29oTllxdThLRUFSQVpMNlQzNWkvVnlmbmZr?=
 =?utf-8?B?TzJGRC9ZWW1nPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WkJMUUhabW91YVZMU1BQYUlKdjgvRk12V2VwNXg3dXRvcTFUbEJYNmdiTk1J?=
 =?utf-8?B?YXYwTXBEcXk4bUJpTE9iamhLVXhZQWNvc0RQd2NZVlN2eENRMGNBdVAyWEho?=
 =?utf-8?B?TVMrQnFCMzVHQVUvY3MrM09WclZHUkFwZVh0em16ckFaOEJZY0ZXSWNFL2cy?=
 =?utf-8?B?QkhNdWRMaDRzcEZPdStESjgvVHlQRVUwbEpnQ0RQZWZlN3hGamZLQWNJdDRw?=
 =?utf-8?B?SmxDMDBkU0xrQ3lqR241UUhrSnZGRmRmUDZCdmY3djFaTkRQK0lkeHZUeExq?=
 =?utf-8?B?WXo0TnJqNGR1Z3A1ay9lZWw1UzhsN3M2bm5yTU1rRlBRTTN1eU1vVmduOWhK?=
 =?utf-8?B?MHA1RGY1S3QvTXJyL1A4NnhJbzRkWWs5YWVCZks4U3dMQTlqT0Z2SzJZcjhX?=
 =?utf-8?B?d3FJTWNwUms3KzN1aHZtTmR2ZW9RWllpWUVyclRrRHdRcFNKcnBaV2FkSmIw?=
 =?utf-8?B?VTMxL3g1djlJdDd2R2R1THpQakRyRCs4S2Qrc09aMTJuRzl1cERFYVI1aTNx?=
 =?utf-8?B?emd1MUJGRWlvNjRjOUg0bDJQWFdHd1dscThtUVVTaXVQOTgxdUpEN3FkUDNB?=
 =?utf-8?B?YUlRSmppeW1HY0pneHdoajREOG4zNUM0U0pPRG04TWhOKzdqZktONjlETU5n?=
 =?utf-8?B?TzNhUDRuSDhDOEwvYTBndG1qUkNqMHJERmZMVVZINjk2dUdoS1lNRDlwMFRu?=
 =?utf-8?B?NXFtb1JkcXdkMTlLcm02L0RYais0bStHK2Qxc1B4eEkycHZXU09RQytib3Iy?=
 =?utf-8?B?c3NTeldlaWlna3hlUzhZSDM4SEFBd2RLNmFUWmM0VUJqZ1JwZmhrMDMxYU9O?=
 =?utf-8?B?Y2NkekFSRmtOMFQ3Q3lOUVdZMGhXdFE1d05QanFjMDIrZUJKNml5Y3FERnhQ?=
 =?utf-8?B?K3dyTzlua2RGNXlzUXhuTGpRNmtkTnJTMTBuemE5emZTa3I2MmFEYzhUT0M3?=
 =?utf-8?B?cEoxOHZVd1J3eEFYVGU4TVRoclZrR2xpcDdVSEs3NnVLM3lMbTl6cndBamJz?=
 =?utf-8?B?eVV2cEI5djJvUUFBZU1VZ1NJbGZIV3k4ck1HcnJNQ0RKQUZHc0xZcUI2enp5?=
 =?utf-8?B?cEZxOU9YYW5hL05DNVIrRlVieWRnWHNNWGJVWllaVWkyTWFRWCtUZEw2RU5G?=
 =?utf-8?B?NUY0RVQvM0k4TnhCK1ZvNlVobW5DblIrRFQvZzVua1k1NTdEM3Vac1VKaUdu?=
 =?utf-8?B?YmVrNGRDdk9xZTNnQ1VoZzZyMU5DYU5yeUE5ZGl6ZldDejZBVFdmOVRuVUpN?=
 =?utf-8?B?N1VDandGV2xJSkM2K096YlRXVDM2UHB3ZXJGVG5EOVBCZk11TG1YUFR1MnQy?=
 =?utf-8?B?MjUySTRRZnRRcStLM3hoSStKc1BuK2Q2SkV3UHZ3K3BQOHo5L2dKZG50ZHVl?=
 =?utf-8?B?cG1KUDJTZ2V1SmY5eW0rZFlyRGRVei8xTGhublNCOURyNGNEUzhiK3Flc2Vz?=
 =?utf-8?B?U2owbzJDTE4xZloxbVE3bXFqc25RNkVIamZZcEZqRm5vNTVZYmJzdEpEbnpp?=
 =?utf-8?B?TmJCZGo1UHlvY2l3N3o2UlYvSm0wRDUwNHQwYkFkbDkwd1JaZWtOdTVlOGJ6?=
 =?utf-8?B?c002dmNLU3pwTXg3dU4rd1N2NFl4NXdjbk9CckNObWIwNlJSc2VFMVBsdVh5?=
 =?utf-8?B?ZVA2cVdhM3hRenBxRmM0UndpY3pkVVZIK2lsRXdkUzhLYmd1Nnh5aUpMUVYx?=
 =?utf-8?B?aGFKY0pUODQyOXZQb2QrVndmZHBDNHBoZEZnYzNNM2IzN2VtUVdTSk5wV0w4?=
 =?utf-8?B?cjFySEJFRTZKc1dNRHFKOXl0VzJtRXh1dmxQMk9LOU1JZWpZZDBlcXBpeTlN?=
 =?utf-8?B?OTNESlJvU21jU0trSGJpT0RBWXAxcmE2N0FJdVQyWEM4VVJaaEYrRHJrblpG?=
 =?utf-8?B?eWFxSm5jT21CS1o4ZWJ6bndxc0tjNVY5bFB5SzB2YlU2Z2VSaXJ4NjVIOGJh?=
 =?utf-8?B?cVVNdS84a2JWM3dpaFJMWHEybVFQcnVNT3BrODB0N2VpT0lrbXB4YlpsaDRF?=
 =?utf-8?B?M2VOMEF5bGFYSlE5VTBQTDAvYjVIcWtLNDcyTGNGdWhCREtMWFdaQ3QwK3Vw?=
 =?utf-8?B?RGhlcjZvRjZDL3VoaU1ZYnFEN1dKWTFzYXFYeEM3UmErUkFyaWVGVEFseEVv?=
 =?utf-8?Q?vaMI=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1223ce4b-edab-43bb-b481-08ddcabbd8bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2025 14:10:30.0283
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b914a242-e718-443b-a47c-6b4c649d8c0a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c9XBXilpQiBWWXISA1a2JDv32B2pdU6j2UPo8K7VNPAocG75uDIycy8dqRLa8eWb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR3PPF8503AEF3B

WWVzLCBtZSB0b28sIEkndmUgYWxzbyBiZWVuIGluIHRoZSBJVCBpbmR1c3RyeSBzaW5jZSAxOTky
LCBhbmQgdW5kZXJzdGFuZCBwcm9kdWN0IHNwZWMgc2hlZXQgdGhlb3JldGljYWwgbWF4aW11bXMu
DQoNCiIiZGQiIHdpbGwgYWx3YXlzIGdpdmUgeW91IGEgc2VxdWVudGlhbCByZWFkIG9yIHdyaXRl
IHdvcmtsb2FkIHdoaWNoIHdpbGwgYWx3YXlzIHRyaWdnZXIgb3B0aW1pc2F0aW9uIGZ1bmN0aW9u
cyBpbiB0aGUgdmFyaW91cyBjb250cm9sbGVycyBhbmQgSEREL1NTRCBmaXJtd2FyZS4gVGhlIG9u
bHkgdGhpbmcgaXQgd2lsbCBzaG93IHlvdSBpcyB0aGF0IHlvdXIgbnVtYmVycyB3aWxsIHNvbWV3
aGF0IGFsaWduIHRvIHRoZSBudW1iZXJzIGluIHRoZSBkYXRhc2hlZXQuIg0KDQpXaGljaCBpcyB3
aGF0IEknbSBpbml0aWFsbHkgdHJ5aW5nIHRvIHZhbGlkYXRlLCBidXQgbm90IHNlZWluZy4NCg0K
IiBGdXJ0aGVybW9yZSwgcmVhZGluZyBmcm9tIC9kZXYvemVybyB0byBwdXNoIGEgd29ya2xvYWQg
d2lsbCBmb3Igc3VyZSBza2V3IG51bWJlcnMuIFRoZSBjb250cm9sbGVycyBhcmUgdmVyeSBzbWFy
dCBhbmQgaGF2ZSBiZWVuIGZvciBhIGxvbmcgdGltZS4gSWYgdGhleSAic2VlIiBhIGNlcnRhaW4g
ZGF0YSBjaGFyYWN0ZXJpc3RpYyB0aGV5IGNhbiBjaGFuZ2UgdGhlIHdyaXRlIGJlaGF2aW91ciB0
byB0aGUgcGh5c2ljYWwgcGxhdHRlciBvciB0aGUgTkFORCBjZWxscy4iDQoNCkkgaGFkIGNvbnNp
ZGVyZWQgdGhpcywgYW5kIGlmIHRoaXMgd2FzIHRoZSBjYXNlLCB3b3VsZG4ndCBpdCBnaXZlICpi
ZXR0ZXIqIHBlcmZvcm1hbmNlPyAgSWYgYSBEZUR1cCBpZGVudGlmaWVzIGEgcGF0dGVybiBmb3Ig
aW5zdGFuY2UsIHdvdWxkbid0IEkgZ2V0ICpiZXR0ZXIqIHZhbHVlcyBpbiBteSB0ZXN0cyB0aGFu
IHdoYXQgdGhlIGhhcmR3YXJlIHdhcyBjYXBhYmxlIG9mPyAgSW4gd2hpY2ggY2lyY3Vtc3RhbmNl
IHdvdWxkIEkgc2VlIHdvcnNlIG51bWJlcnMgd2hlbiBjb250cm9sbGVyIGxvZ2ljIGtpY2tlZCBp
bj8NCg0KL0FIDQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEVyd2luIHZh
biBMb25kZW4gPGVyd2luQGVyd2ludmFubG9uZGVuLm5ldD4gDQpTZW50OiAyNCBKdWx5IDIwMjUg
MTU6NTcNClRvOiBIZW5yeSwgQW5kcmV3IDxhbmRyZXcuaGVucnlAZW9uLnNlPjsgWmRlbmVrIEth
YmVsYWMgPHpkZW5lay5rYWJlbGFjQGdtYWlsLmNvbT47IGxpbnV4LWx2bUBsaXN0cy5saW51eC5k
ZXYNClN1YmplY3Q6IFJlOiBzdHJpcGVkIExWIGFuZCBleHBlY3RlZCBwZXJmb3JtYW5jZQ0KDQoN
CkhhdmluZyB3b3JrZWQgaW4gdGhlIHN0b3JhZ2UgaW5kdXN0cnkgc2luY2UgYXJvdW5kIDE5OTUg
d2l0aCBERUMsIENvbXBhcSwgSGV3bGV0dCBQYWNrYXJkIGFuZCBIaXRhY2hpIERhdGEgU3lzdGVt
cyAoVmFudGFyYSkgSSd2ZSBzZWVuIGEgZmFpciBhbW91bnQgb2Ygc3BlYyBzaGVldHMuIEJlIGF3
YXJlLCB3aGF0IHlvdSBzZWUgb24gdGhlc2Ugc2hlZXRzIGFyZSBpbmRlZWQgb3B0aW11bSB2YWx1
ZXMgbWVhc3VyZWQgYWdhaW5zdCBvcHRpbXVtIGNoYXJhY3RlcmlzdGljcyBmb3IgdGhhdCBwaWVj
ZSBvZiBoYXJkd2FyZS4gVGhlc2Ugc2hlZXRzIGFyZSBvbmx5IHBhcnRpYWxseSB3cml0dGVuIGJ5
IGVuZ2luZWVycyBidXQgd2lsbCBoYXZlIGEgbWFya2V0aW5nIHNhdWNlIGFkZGVkIHJlc3VsdGlu
ZyBpbiBzb21lIHBvdGVudGlhbGx5IHNrZXdlZCBpbmZvcm1hdGlvbi4gRW5naW5lZXJpbmcgaW5m
b3JtYXRpb24gd2lsbCBtb3N0IG9mdGVuIG91dGxpbmUgdGhlIGNvbmRpdGlvbnMgb2YgdGhlc2Ug
bnVtYmVycyB3aGVyZWFzIG1hcmtldGluZyBwZW9wbGUgd2lsbCBtb3N0IHJlbW92ZSB0aGVtIGFz
IGl0IHNpbXBseSBsb29rcyBiZXR0ZXIuDQoNCiDCoCJkZCIgd2lsbCBhbHdheXMgZ2l2ZSB5b3Ug
YSBzZXF1ZW50aWFsIHJlYWQgb3Igd3JpdGUgd29ya2xvYWQgd2hpY2ggd2lsbCBhbHdheXMgdHJp
Z2dlciBvcHRpbWlzYXRpb24gZnVuY3Rpb25zIGluIHRoZSB2YXJpb3VzIGNvbnRyb2xsZXJzIGFu
ZCBIREQvU1NEIGZpcm13YXJlLiBUaGUgb25seSB0aGluZyBpdCB3aWxsIHNob3cgeW91IGlzIHRo
YXQgeW91ciBudW1iZXJzIHdpbGwgc29tZXdoYXQgYWxpZ24gdG8gdGhlIG51bWJlcnMgaW4gdGhl
IGRhdGFzaGVldC4gVmFyaW91cyBPUyBzZXR0aW5ncyBvbiB0aGUgc2NoZWR1bGVyLCBkbSBhbmQg
ZmlsZXN5c3RlbSBjYW4gaGF2ZSBhIHNpZ25pZmljYW50IGluZmx1ZW5jZSBvbiB0aGVzZSBudW1i
ZXJzLiBJJ20gcHJldHR5IHN1cmUgdGhhdCB0aGUgaW5mb3JtYXRpb24gZGF0YXNoZWV0cyBpcyBh
Ym91dCB0aGUgbWF4aW11bSB5b3UgY2FuIHN1Y2sgb3V0IGEgcGllY2Ugb2YgaGFyZHdhcmUuIA0K
RXZlcnl0aGluZyB5b3UgZG8gb24geW91ciBzaWRlIGluIHRoZSB2YXJpb3VzIE9TIGxheWVycyB3
aWxsIG9ubHkgbmVnYXRpdmVseSBpbXBhY3QgdGhlIHJhdyBwZXJmb3JtYW5jZSBudW1iZXJzLCBs
ZXQgYWxvbmUgaGF2aW5nIGEgcmVwcmVzZW50YXRpdmUgYXBwbGljYXRpb24gd29ya2xvYWQgcHVz
aGVkIG9udG8gaXQuDQoNCiJmaW8iIGdpdmVzIHlvdSBhIGJpdCBtb3JlIG9wdGlvbnMgYW5kIHBh
cmFtZXRlcnMgaG93ZXZlciB0aGlzIHdpbGwgYWxzbyBkZXBlbmQgc2lnbmlmaWNhbnRseSBvbiBo
b3cgdGhlIGtlcm5lbCBhbmQgaXQncyBJTyBsYXllcnMgc3VjaCBhcyB0aGUgZGV2aWNlIG1hcHBl
ciBhbmQgZmlsZXN5c3RlbXMgaW50ZXJhY3Qgd2l0aCB0aGUgaGFyZHdhcmUuIFVzaW5nIHpvbmVz
IGZvciBleGFtcGxlIHdvdWxkIHJlcXVpcmUgaW5zaWdodCBpbnRvIHRoZSB3YXkgdGhlIGhhcmR3
YXJlIGlzIGJ1aWxkLCBlc3BlY2lhbGx5IG9uIEhERCdzLiBJZiB5b3UgZG9uJ3QgaGF2ZSB0aGF0
IHlvdSBtYXkgYXMgd2VsbCBwdXQgYSB3ZXQgZmluZ2VyIGluIHRoZSBhaXIgYW5kIGdvIGZvciBh
IHRyaWFsIGFuZCBlcnJvciBydW4uDQoNCkZ1cnRoZXJtb3JlLCByZWFkaW5nIGZyb20gL2Rldi96
ZXJvIHRvIHB1c2ggYSB3b3JrbG9hZCB3aWxsIGZvciBzdXJlIHNrZXcgbnVtYmVycy4gVGhlIGNv
bnRyb2xsZXJzIGFyZSB2ZXJ5IHNtYXJ0IGFuZCBoYXZlIGJlZW4gZm9yIGEgbG9uZyB0aW1lLiBJ
ZiB0aGV5ICJzZWUiIGEgY2VydGFpbiBkYXRhIGNoYXJhY3RlcmlzdGljIHRoZXkgY2FuIGNoYW5n
ZSB0aGUgd3JpdGUgYmVoYXZpb3VyIHRvIHRoZSBwaHlzaWNhbCBwbGF0dGVyIG9yIHRoZSBOQU5E
IGNlbGxzLg0KDQpFdmVyeXRoaW5nIHlvdSBkbyB0aGF0IGRvZXMgbm90IHJlZmxlY3QgYSByZWFs
IGxpZmUgd29ya2xvYWQgaXMgYSAianVzdCBmb3Igc2hpdHMgYW5kIGdpZ2dsZXMiIGV4ZXJjaXNl
IGJ1dCB3aWxsIG5vdCBnaXZlIGFueSByZWFsIG1lYW5pbmdmdWwgb3V0Y29tZS4gQmVsaWV2ZSBt
ZSwgSSd2ZSBiZWVuIHRocm91Z2ggdGhpcyBkaXNjdXNzaW9uIG1vcmUgdGhhbiBvbmNlLg0KDQo+
DQo+DQo+DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEVyd2luIHZhbiBM
b25kZW4gPGVyd2luQGVyd2ludmFubG9uZGVuLm5ldD4NCj4gU2VudDogMjEgSnVseSAyMDI1IDA1
OjI2DQo+IFRvOiBaZGVuZWsgS2FiZWxhYyA8emRlbmVrLmthYmVsYWNAZ21haWwuY29tPjsgSGVu
cnksIEFuZHJldyA8YW5kcmV3LmhlbnJ5QGVvbi5zZT47IGxpbnV4LWx2bUBsaXN0cy5saW51eC5k
ZXYNCj4gU3ViamVjdDogUmU6IHN0cmlwZWQgTFYgYW5kIGV4cGVjdGVkIHBlcmZvcm1hbmNlDQo+
DQo+DQo+IDMuIFVucmVhbCBjYWNoZSBvcHRpbWlzYXRpb25zLiBVc2luZyBkZCBpcyBieSBmYXIg
dGhlIHdvcnN0IG9wdGlvbiB0byB1c2UgZm9yIHBlcmZvcm1hbmNlIHRlc3RzIGFzIGl0IHdpbGwg
bmV2ZXIgKE9rLCBhbG1vc3QgbmV2ZXIpIGFsaWduIHdpdGggcmVhbCB3b3JrbG9hZHMuIElmIHlv
dSB1c2UgZGQgZm9yIHBlcmZvcm1hbmNlIHRlc3QgeW91IHdpbGwgZmluZCB0aGF0IHRoaXMgd2ls
bCBiYWNrZmlyZSBpbiBtb3N0IGNhc2VzIHdoZW4gYSBub3JtYWwgd29ya2xvYWQgaXMgYXBwbGll
ZC4gVGhlIG1haW4gcmVhc29uIGlzIHRoYXQgZGQgd2lsbCBhbHdheXMgaGF2ZSBhIHNlcXVlbnRp
YWwgd29ya2xvYWQgdW5sZXNzIHlvdSBzdGFydCBhIGxhcmdlIGFtb3VudCBvZiBkZCBpbnN0YW5j
ZXMgdG8gdGhlIHNhbWUgZGlzayBhdCBvbmNlIHdpdGggZGlmZmVyZW50IG9mZnNldHMuIEV2ZW4g
dGhlbiB5b3Ugd2lsbCBzZWUgYW4gb2JzY3VyZSBudW1iZXIgY29taW5nIGJhY2suDQo+DQoNCg0K
