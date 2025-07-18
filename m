Received: from BEUP281CU002.outbound.protection.outlook.com (mail-germanynorthazon11010007.outbound.protection.outlook.com [52.101.169.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F3B2DAFA4
	for <linux-lvm@lists.linux.dev>; Fri, 18 Jul 2025 11:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.169.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752839686; cv=fail; b=lr314Ku1MgC6YV7+0wNW28BnJY11TNmnfPekdIZRxhuPEEVg1AxsUCVdbaYuwzQlKrAnkZxp82dd/P4WVlovdnf+NNpieUe5GOqdLel3IgMJPKjM6sgnCNSicAIAc9KtgQYN9tHzESPYEwjG3rRMFWzAU+c8ab1RBtmT79k5wlY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752839686; c=relaxed/simple;
	bh=Ccxyrud/ZnWyjG+rQ0f001KO8OKMWMX17zMrBQNbBq8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VkC9T+NT/bKlQnKLvzvMoQocwxglBUqOW2OdHBP6QCDRQ3ZFmiqdQVMyccgvksx27LfiS6pOX8Ikio3bRhFwrrH8ECRUk9r6EBiVI2ngmDzNpVq1MaiziqEQBecXAfMM/yclTErdBgL1DDhiQAcMupKhX/F3rtrKDrVpHyHNSrc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=eon.se; spf=pass smtp.mailfrom=eon.se; dkim=pass (1024-bit key) header.d=eon.se header.i=@eon.se header.b=Yg/ijSIK; arc=fail smtp.client-ip=52.101.169.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=eon.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eon.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=eon.se header.i=@eon.se header.b="Yg/ijSIK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=axaADjuUhuBGqs7EcRT1HlE6L3qCYsa/L6qrRpeB31QkrXaLoaSu7p6mfca6/NOaF0JdgZCF/96XThKwUTzDvb/I2jy+XXdok+K00ejGRc1Yil+htwUZ3X0mA7zIArTeTnwWalSFwF/aN2V669nqdYmMaXZq8XOvK2r89viF3nRyrr4I8VgNWtJJI2dhjQFUJFRfNK5BmXpSQW+1U2YyrNigTe+nuAevNVwu1MimPW+mkTHzV/M+XqAFmGlQ3r2tIVJX36eo+j8x6yJVUXxDoV8GGZQRilv7kOpSuecwqyV7regG12eOqNiGh/Euix3zwmmV4DwjiK9fFftu7/SsGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ccxyrud/ZnWyjG+rQ0f001KO8OKMWMX17zMrBQNbBq8=;
 b=rTN89SVbfg9P3gNfaJ68UXHLDmf4n4UeSRgksfCBRNCtdovDYMI2ipXCMhvU/XB1AGHtn1s1BxjIEj6rrr4cMBgCiWZga3iyXY3xuz1Hs3UzkWjdAFkBtGELeCakxWN3Z2zrdCLxYzHwfuNnfsu2T5g1x0D/KsZ0kYMv1BC/qDL8ver9Tnf7BgQRjD7e3II+AztcxdevIrF2ioXHpKhNhiGPs4R7cRQgcJxsoE5z88o+tFOs2s+FgxDm2NxKCjC3dW9mlB1uEjIOPvV7m1RcF7zQpePTuFAQMREW+IpqignGko9fG2eWpFRhoSw0e2kDSh9eVdEk432TgctKG5ZeRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eon.se; dmarc=pass action=none header.from=eon.se; dkim=pass
 header.d=eon.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eon.se; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ccxyrud/ZnWyjG+rQ0f001KO8OKMWMX17zMrBQNbBq8=;
 b=Yg/ijSIKOADKJNz2tAT1CxWWxaVuWhekCCeMnd+iE2ofCpdZggfWktOj/x1CPHwULtnOMbUjbf7DeRcxqdWRHHx9xYrO7ODqvkjpaqrSlOmbS1U5VuTWhd2Grvl6dhjdGndqosP7DzDYiiqNGjXdhrBgBRHUNESwxrfbYCmYDIA=
Received: from FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:be::11)
 by FR5P281MB5355.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:19a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Fri, 18 Jul
 2025 11:54:41 +0000
Received: from FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM
 ([fe80::210b:d15e:d20d:7fd6]) by FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM
 ([fe80::210b:d15e:d20d:7fd6%7]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 11:54:41 +0000
From: "Henry, Andrew" <andrew.henry@eon.se>
To: Roger Heflin <rogerheflin@gmail.com>
CC: "linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
Subject: RE: striped LV and expected performance
Thread-Topic: striped LV and expected performance
Thread-Index: Adv3ryOkPkyC1+SGS2a//kGki21OpAABDQ9gAAjyQwAAACZXcA==
Date: Fri, 18 Jul 2025 11:54:41 +0000
Message-ID:
 <FR6P281MB36727E6A4A3ADFB5E035218BEB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
References:
 <FR6P281MB3672085D192D8BF5CB45CFE4EB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
 <FR6P281MB36727398D141AD2A1A1E76DAEB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
 <CAAMCDecA=sLY9eEyK2Gs7fGd1Zjd5aVz=8YgQS60CYAb1Z4shQ@mail.gmail.com>
In-Reply-To:
 <CAAMCDecA=sLY9eEyK2Gs7fGd1Zjd5aVz=8YgQS60CYAb1Z4shQ@mail.gmail.com>
Accept-Language: en-GB, sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_ActionId=726fd61a-1194-43fe-890d-3700b211cbe4;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_ContentBits=0;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_Enabled=true;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_Method=Standard;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_Name=Internal
 -
 Unencrypted;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_SetDate=2025-07-18T11:33:05Z;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_SiteId=b914a242-e718-443b-a47c-6b4c649d8c0a;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eon.se;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FR6P281MB3672:EE_|FR5P281MB5355:EE_
x-ms-office365-filtering-correlation-id: 62d2878d-56d5-4d74-8136-08ddc5f1e136
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|366016|376014|1800799024|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NTVKOWIyWjhLRFl3SkhDYWZhSGpBU3U2QnJaY1FsZVVMeDRNN0pVS29nNWNG?=
 =?utf-8?B?NEcrb3BwbXFSck1FTTdsb2Z6ZGNzMWFKTUIvenJOaUlvWFZDSDI3TjlZc0hB?=
 =?utf-8?B?VzA5ZjkwQTdkaGdHc0JvUnVyN1ozdVJrOVJZbG04OUZTcTdNK2xQbVBES0dX?=
 =?utf-8?B?eENYOVBoRlZqTkwySGV4R0pmOEpUcXkyR2pmQjFwYXJQZUs0YTBKd2NaL1VG?=
 =?utf-8?B?RVZTL0NyTDlhZWl1cjRBV3ZkUzAwMzIwV3JST3BaeGIwVnBKRkJIdnF5RFp0?=
 =?utf-8?B?ZUM5RGs0WjlHdXIxUEsrekJRR1ZXcy92RFg2NC80UEs4ZWNlT2tDbmtWckwr?=
 =?utf-8?B?ei9aRTdVY0N0eWhlRjkwOUZHQk9qcHhOTlRNYXFUQkUwdm9jYXI3Und6QkJC?=
 =?utf-8?B?U1RUVnBFR294ZG5COG5IeWNWZEdxVlh6dnUrNUZzQmowWk1WeDBER2tjL09Z?=
 =?utf-8?B?Q3VKUU40eWFwYWtEdkFCOERuSm9UZjVDL2lpbGdQeEJqVFdCMUVZMWIwRTlk?=
 =?utf-8?B?Y0tNTDd3Y2QxaHNDMlE0NFF0cG0xdUNWcldhNnYvYk9FNVJFb1NRNzU4bkp3?=
 =?utf-8?B?R0ZTaStCRitwNzJ6ZkFmWDNtcU5Ea0NGdjRSU1ZmVG5QY3dGUHBpK0R6b0VZ?=
 =?utf-8?B?d1F4dlM0TkhGTnhhZjNVeVZSNTIxeERLcU5PSUxmZ0RVS3BOZGU0eXE1N01Z?=
 =?utf-8?B?YjZQMHVPUVpJemtXaUNFclRQSkJ5d1lHMzE3TW9BMGZOdnZ4THZzSFlVdm1Y?=
 =?utf-8?B?dEtmL0JFYnRzMUdLWkZudy9ZOU04ZVVGekRXVXVyUmkrM1U4NDJIWmM1MEpa?=
 =?utf-8?B?VWdLWHRZTnFQTUE5Rng5NFpVTGsza2VBZ1BSd1NINmw0a0lJRzlwTFhNNm5v?=
 =?utf-8?B?WFovR1hQNHRqWUQxNXdIbGp3UVdRRFdMVlRPSjd6aVl6aG0rdERMTUZmeSsy?=
 =?utf-8?B?UnF2dklVRWhBbzU3NDN0K0ZrZE9nSmR4UksveVhxdFZIUzBabnJ3L3Z4cGUy?=
 =?utf-8?B?a3RaOFZ2WmQ3YzRLWU5rSlZ6ZnlWSTBVakVzb2tzL2EzVHpXUFhZa084QTND?=
 =?utf-8?B?NzVZekI4VmxhVUJQTFRKRXJCb2c0cVpielJZOWVzeVE3VzNZallKT0N6UzB1?=
 =?utf-8?B?UFBLNnNjajdmNCsvUHBvNk8rN1AyOWFTUHU5M09ndENGNlppTEMySG92TmJ4?=
 =?utf-8?B?bUJZY1JKS3NxeWdHNnR4dlRScVVIeFZZRDdHYUNvNVRSQUtsWEJVaCtZNlF0?=
 =?utf-8?B?alMwSTJBbU4rNitReFRRMk5XSTZ1cUc2TUFXZ3NjOUlOL3FORHBVMnl0RjE1?=
 =?utf-8?B?NC9sejNVYmxVQ1J3dHhwd0Npb1B4djVEUnhZcXdDTUtDS0dRa3FjZkpMTFRz?=
 =?utf-8?B?UW53VGhRbE5JazVEQWxSR3pyamZ1MWM0TGljWnRhdHlVc1IxU3k5SlRSOWVD?=
 =?utf-8?B?ODJYRC92RVNlTUNqR24xcTVSaS9hZVgvZnlvUDVhQ1djYUhyUzBzNlZlcURu?=
 =?utf-8?B?R08wcnlGQ1RCUmIzaTRSMk9ScFBla240QVIrQXFFY0RBTU5rNXlkZjdqR2Ux?=
 =?utf-8?B?VEhZRndEYXdGRVUwZ0o2dWZvSW54MXhQNUlnMzBTQ0IyTlNZS1BqSzl3b1dr?=
 =?utf-8?B?Q0NpOFFsV0l2dnEzTXpsTklhY3U3eTNpZE5HeTVlOUJnTGhFTFpLeXA0dnJC?=
 =?utf-8?B?MXZNWlFWZlQ0emh6NHNyOVp5NDdROGVQdTNLcURseXJqeGt3MzJoT28yajVF?=
 =?utf-8?B?ZlU5WkNxRkFxWmZWRWFlY2s3emx2RTZPWlNZb3FIZGw0NG5FTGpQVmw5SVVM?=
 =?utf-8?B?STFROHZ6ZXhRdHJFUWUwL1hsSGorYnVFSE8xcXY3NkZIVEpoOEdaYnpKYitn?=
 =?utf-8?B?SGFMZUgrZ3F6WkNkZ1hHR0RKQWs1bGoxMjJxa2pLeFVJOHlub2RyRmJXdVEz?=
 =?utf-8?B?MnZLM1k3OFQwclR6bzhqdWhQUHNRcWl2OUlZejVvUEFsQno5RG5uTDJ0Q1Vx?=
 =?utf-8?B?U0w5U1dpOHpRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(1800799024)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WkdlRTZONUdXdVRJRk1LbVpEL1dMQmxyaHVtaysvMU5vVjFLTGo2V1JjMGpE?=
 =?utf-8?B?N3g2ZWFkTmE3NGY3VmVVNnI0OXZWSHZMSzB2M2ZBNkUrdERuL0VIYTdpZ0tz?=
 =?utf-8?B?bzMrUnFSZWFtQTdrSnp2aUIyOVIwRTJ2TytpYWYyNytZNWtSSlp5SEU4elhr?=
 =?utf-8?B?UWJDYXYyYWIrVitESjVTKzZIQlVOUmlHUms5cmdUdFgrWGRsVUwxV0dJbkIw?=
 =?utf-8?B?ay96R2d6bk1qRldLR2FMMjBxUkl2MVdacmdic2tDcGlXYmxuUHVuQUZMNmVY?=
 =?utf-8?B?WU1DYkJPd21NVS9iTTJ1Y1ZZRHZLTWxRUk9mZER6Mklhb1FYT21tTkNTZ2lY?=
 =?utf-8?B?TDZhdWUrc29xUGxTMUtjNlZlYnVBTktrSmxrQmg2WXpwRVRHZDl4a2diS2NP?=
 =?utf-8?B?ckN0cVVabnNZMmFNWkY0NkxOb2w0a2JzUkNNTnpob01aeGlqeThPcGpQdVBl?=
 =?utf-8?B?VGxmOGozZ2ordThQOEJsNjl2TzJuWWV0N1hBZFE0UDZRM05oa0RLZWxlNklW?=
 =?utf-8?B?b2I2VVhrZkF1ck5FejlXVi9xMGlST091OTBxVWRIQ1lBSHhnTU9TbVJKeFNa?=
 =?utf-8?B?T1B0eGFvbDZScUpwRnN6YnE3LytjRmRWc1ZsMFEzVEh2cEhkcGxBd1c5TjB6?=
 =?utf-8?B?NkhWUTdYTHljbm1WTXIrR05VeHM2RmZjSDdrOEUrcTVJWVBJMmNVaEFQbFha?=
 =?utf-8?B?ZjVSbWFqMDYwVktGZXRsdi91MDAyQUxDeXE2cGN6OEM4QldCSmJ5WE1HVXhm?=
 =?utf-8?B?enRZS3VBdHEwNEtJZnU1cDJndzBkL0pKUzNOYnhhczNIZ2RIZHl5OXhyeGJr?=
 =?utf-8?B?WWNLWXRjZ1BRNmpHV2VqRUduY1dqc3Z3bGppdSthaFlVRGRtdUVjR1UydWtB?=
 =?utf-8?B?cUY1OTVhZm82alpLeHlXWmRIbitkTGZCTmJjWTBmQmtCMitxNXVLS2o5VFRE?=
 =?utf-8?B?MldIYnZ6OGNnYzJod01YVGZlQ3BsMzF1dzdINlVkUEJhdklYSWNXdjN0TjAx?=
 =?utf-8?B?WmtUdFRrbVRTNUgrTEk4TFo0S0x4Tm9ySkw5NkYzaWNsS2NHN2ZJaHJsT3JF?=
 =?utf-8?B?MnlLVEY4bk5TSlNZNjMycUhsbFFFUlh5N3UxbUZ1M01tWDc2NktCMVhlYWE3?=
 =?utf-8?B?TGQ1dmNELzAyRUZkQ24xeFQ1N0lMQVhxNUZIVnBUbmZRbUNWcGtVRWtyb084?=
 =?utf-8?B?NWhmUkdNRVdSbU1SY2s2T3hPZFdqeWozY0tCNm5Odll2NlA0bmMxVjZEaDdR?=
 =?utf-8?B?V2t1aEVsa0ZDMS9ObU1pMVg2eWFwUGhmbGR1Zld2WkNEUzVTVEdnYVhFWHdS?=
 =?utf-8?B?UVFjY000T0tuSTVHbmRjUXc5K0pvNHlva0N0c2gvdk5PUEt5b0gxMVZWK0xW?=
 =?utf-8?B?M2ovbjFDR1ZjYWxGNUV5a0sxMTg1UU1VYXpPYUhRd0VVT3FFWkpuWUIxckRJ?=
 =?utf-8?B?K3l3RkN5c0tyTmZWR01aVitzaDhoVTNVTHBHOC8wTzF4MGMyc1M3ek1XbzR1?=
 =?utf-8?B?VG1wcUdVb09SVU9PL3dmUncyK2d1QVZrVFlFZFFxNmFBUS9YWmUrVGpWNnIw?=
 =?utf-8?B?ekwyTzJydDJodzlmcXY5Q2srQWpOVDZoSU1HTWhIb0FIdDRibTVEZmhRTUgw?=
 =?utf-8?B?cnpHcEtVL3pWcUN0UmhjRFk5T1FqOTA3N0hTQXU4YUtnRjRVd1c5T1owRWc3?=
 =?utf-8?B?MCtSUDliV0RLdjI5eUZTV2pNdUhWVXE1ZEtHSk9ndHk0WkpRanhlMlJ0dHI3?=
 =?utf-8?B?S05IMEZaL2xzaTVTSU5vTStRMU9XT25nZkVnWjBtV2pkTGluMkZDNDlMdnNG?=
 =?utf-8?B?cFlEelRXdktBTHVMT01ac0phajE0YWU3VkY3MGRCMnJZQWRmWmhEQXRUckJk?=
 =?utf-8?B?VXhOT1VjYWErcTdVVytjbXk3TnJRR2FlQ2gzV0VYbDN2UzU4WkFKU2NnMGNT?=
 =?utf-8?B?OXZLOFo5akxUenBWUHVtRFk1Q1Qrc1U2N04xNzJvMmIvN0VwTW9PVGF6cElu?=
 =?utf-8?B?WGx0TWdzTER6ZDRRRFl4S1hicWwrMG9RR0w1RXIrb3Mrb2Z4M2QrdjJMZEtL?=
 =?utf-8?B?M3hvRlVFWGJ5RCt1OXJOLzVTeVJtQkIxYUhzNjA1VEQ3UU5qeDdrWmlGMVlY?=
 =?utf-8?Q?mWCw=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 62d2878d-56d5-4d74-8136-08ddc5f1e136
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2025 11:54:41.2263
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b914a242-e718-443b-a47c-6b4c649d8c0a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uvH2l9kIDsqu5eMy7UES1qOcArAaLC6vPCLizjsaMRYlX16KXgxY219NKPBSnZNd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR5P281MB5355

PkFyZSBhbGwgMyB2bWRrJ3Mgb24gc2VwYXJhdGUgaW5kZXBlbmRlbnQgZGlza3M/DQpObywgaXQn
cyBmcm9tIGEgbGFyZ2UgcG9vbCBvZiBzdG9yYWdlLiAgVGhleSBhcmUgdmlydHVhbGx5IGNyZWF0
ZWQgb3V0IG9mIHRoYXQgcG9vbCBhcyAxMjhHQiB2aXJ0dWFsIGRpc2tzLg0KDQovQUgNCg0KLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFJvZ2VyIEhlZmxpbiA8cm9nZXJoZWZsaW5A
Z21haWwuY29tPiANClNlbnQ6IDE4IEp1bHkgMjAyNSAxMzoyOQ0KVG86IEhlbnJ5LCBBbmRyZXcg
PGFuZHJldy5oZW5yeUBlb24uc2U+DQpDYzogbGludXgtbHZtQGxpc3RzLmxpbnV4LmRldg0KU3Vi
amVjdDogUmU6IHN0cmlwZWQgTFYgYW5kIGV4cGVjdGVkIHBlcmZvcm1hbmNlDQoNCltZb3UgZG9u
J3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20gcm9nZXJoZWZsaW5AZ21haWwuY29tLiBMZWFybiB3aHkg
dGhpcyBpcyBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50
aWZpY2F0aW9uIF0NCg0KSSBkb24ndCBzZWUgd2hlcmUgeW91IHRhbGsgYWJvdXQgd2hhdCByZWFs
IGhhcmR3YXJlIHRoZXJlIGlzIG91dHNpZGUgb2YgdGhlIFZNLg0KDQpBcmUgYWxsIDMgdm1kaydz
IG9uIHNlcGFyYXRlIGluZGVwZW5kZW50IGRpc2tzPw0KDQpJIGhhdmUgb25seSBzZWVuIGFkZGlu
ZyBleHRyYSBjb250cm9sbGVycyByZWFsbHkgbWF0dGVyIHdoZW4geW91IGhhdmUgYSBsYXJnZSBu
dW1iZXIgb2YgZGlza3MgcGVyIGNvbnRyb2xsZXIuICBJZSA1IGRpc2tzL2NvbnRyb2xsZXIgd29y
a3MNCmJldHRlciB0aGFuIDE1IGRpc2tzIG9uIG9uZSBjb250cm9sbGVyLiAgIEFuZCB0aGlzIHJl
YWxseSBvbmx5IHNlZW1lZA0KdG8gbWF0dGVyIHdpdGggcmVhZCBpbyB3aGVyZSB0aGUgYXBwIGhh
ZCBtYW55IHRocmVhZHMgKGllIG5vdCBkaXJlY3QgaW8pLiAgUGFyYWxsZWwgd3JpdGVzIHdpdGgg
ZGlyZWN0IElPIGJyZWFrcyBkb3duIHRvIHdyaXRlIGFuIGlvIGFuZCB3YWl0IHRvIGVhY2ggZGV2
aWNlLi4uZXNwZWNpYWxseSB3aGVuIHRoZSBibG9jayBzaXplIG9mIHRoZSBkaXJlY3QgSU8gaXMg
c2ltaWxhciAob3Igc21hbGxlcikgdGhhbiB0aGUgc3RyaXBlIHNpemUuDQoNCk9uIEZyaSwgSnVs
IDE4LCAyMDI1IGF0IDI6MTTigK9BTSBIZW5yeSwgQW5kcmV3IDxhbmRyZXcuaGVucnlAZW9uLnNl
PiB3cm90ZToNCj4NCj4gSeKAmW0gdHJ5aW5nIHRvIGltcHJvdmUgdGhlIHBlcmZvcm1hbmNlIG9m
IGEgdmlydHVhbCBtYWNoaW5lIGd1ZXN0IHJ1bm5pbmcgUkhFTCA5LjYuICBJ4oCZdmUgYXNzaWdu
ZWQgMyBzZXBhcmF0ZSBTQVMgY29udHJvbGxlcnMgdG8gdGhlIFZNLCBhbmQgMyB2bWRrIGRpc2tz
IGVhY2ggY29ubmVjdGVkIHRvIHRoZWlyIG93biBjb250cm9sbGVyLCBzbyB0aGVyZSBpcyBubyBr
ZXJuZWwgYm90dGxlbmVjayBpbiB0aGUgVk0gb24gdGhlIGNvbnRyb2xsZXIgc2lkZSB3aGVuIHdy
aXRpbmcgdGhyb3VnaCB0byBlYWNoIHZtZGsgdW5kZXIgaGlnaCBsb2FkLg0KPg0KPiBJbiB0aGUg
Z3Vlc3QsIEnigJltIGNyZWF0aW5nIGFuIExWIGFzIGZvbGxvd3M6DQo+DQo+IGx2Y3JlYXRlIC1u
IHN3YXAgLWkgMyAtSSA2NGsgLS10eXBlPXN0cmlwZWQgLUwgMTZHIHZnMDAgbWtmcyAtdCB4ZnMg
LWIgDQo+IHNpemU9NEsgLWQgc3U9NjRrLHN3PTMgLWYgL2Rldi92ZzAwL3N3YXANCj4NCj4gQWZ0
ZXIgbW91bnRpbmcsIEkgdGVzdCB3cml0ZSBzcGVlZHMgdXNpbmc6DQo+DQo+IHRpbWUgZGQgaWY9
L2Rldi96ZXJvIG9mPS9tbnQvdGVzdGZpbGUxIGJzPTgxOTIgY291bnQ9NjU1MzYgDQo+IG9mbGFn
PWRpcmVjdA0KPg0KPiA1MzY4NzA5MTIgYnl0ZXMgKDUzNyBNQiwgNTEyIE1pQikgY29waWVkLCA0
MS4yMDQzIHMsIDEzLjAgTUIvcw0KPiA1MzY4NzA5MTIgYnl0ZXMgKDUzNyBNQiwgNTEyIE1pQikg
Y29waWVkLCAyNy4zOTg2IHMsIDE5LjYgTUIvcw0KPiA1MzY4NzA5MTIgYnl0ZXMgKDUzNyBNQiwg
NTEyIE1pQikgY29waWVkLCAyMi44MzU5IHMsIDIzLjUgTUIvcw0KPg0KPiB0aW1lIGRkIGlmPS9k
ZXYvemVybyBvZj0vbW50L3Rlc3RmaWxlIGJzPTY0ayBjb3VudD0xNjM4NDAgb2ZsYWc9ZGlyZWN0
DQo+DQo+IDEwNzM3NDE4MjQgYnl0ZXMgKDEuMSBHQiwgMS4wIEdpQikgY29waWVkLCAxMC43NTA2
IHMsIDk5LjkgTUIvcyAgIyMgDQo+IG9ubHkgZGlkIG9uZSB0ZXN0IGhlcmUNCj4NCj4gdGltZSBk
ZCBpZj0vZGV2L3plcm8gb2Y9L21udC90ZXN0ZmlsZSBicz0xTSBjb3VudD0xMDI0MCBvZmxhZz1k
aXJlY3QNCj4NCj4gMTA3Mzc0MTgyNDAgYnl0ZXMgKDExIEdCLCAxMCBHaUIpIGNvcGllZCwgMTku
MTU4IHMsIDU2MCBNQi9zDQo+IDEwNzM3NDE4MjQwIGJ5dGVzICgxMSBHQiwgMTAgR2lCKSBjb3Bp
ZWQsIDIzLjAzODQgcywgNDY2IE1CL3MNCj4gMTA3Mzc0MTgyNDAgYnl0ZXMgKDExIEdCLCAxMCBH
aUIpIGNvcGllZCwgMTguMzc4OCBzLCA1ODQgTUIvcw0KPg0KPiBJIG1vbml0b3Igc3BlZWRzIHRv
IHRoZSBpbmRpdmlkdWFsIGRpc2NzIGFuZCB0aGUgTFYgaXRzZWxmIHVzaW5nOg0KPg0KPiBpb3N0
YXQgLXhkbXQgMg0KPg0KPg0KPiBNeSBxdWVzdGlvbihzKToNCj4NCj4gV2hlbiBJIGNyZWF0ZSB0
aGUgTFYgdXNpbmcganVzdCBvbmUgZGlzayAobGluZWFyIGx2bSksIEkgYW0gc2VlaW5nIHRoZSBz
YW1lIHdyaXRlIHNwZWVkIHJlc3VsdHMgYXMgYWJvdmUuICBJbiBpb3N0YXQsIEkgY2FuIHNlZSB0
aGF0IGVnLiBXaXRoIDFNQiBibG9jayBzaXplIGluIGRkLCBpdOKAmXMgfjUwME1CL3MgdG8gdGhl
IGRtLTEgZGV2aWNlIGFuZCBhbHNvIH41MDBNQi9zIHRvIHRoZSBwaHlzaWNhbCBkaXNrIHh2ZGEu
ICBXaGVuIEkgY3JlYXRlIHRoZSBMViBhcyBzdHJpcGVkLCBJ4oCZbSBnZXR0aW5nIHRoZSBzYW1l
IHRocm91Z2hwdXQgb24gdGhlIGRtLTEgZGV2aWNlICh+NTAwTUIvcyksIGJ1dCBpdCBpcyBzcGxp
dHRpbmcgdGhhdCB0aHJvdWdocHV0IGV2ZW5seSBhY3Jvc3MgYWxsIHRocmVlIFBW4oCZcywgc28g
YWJvdXQgfjE3ME1CL3MgdG8gZWFjaCB4dmQgZGlzaywgdG90YWxsaW5nIH41MDBNQi9zIGF0IHRo
ZSBMViBzaWRlLiAgVGhpcyB3YXMgbm90IG15IGV4cGVjdGF0aW9uLiAgSSBleHBlY3RlZCB+NTAw
TUIvcyB0byBlYWNoIGRldmljZSB3aXRoIHN0cmlwZWQgTFYsIHRvdGFsbGluZyB+MTUwME1CL3Mg
b24gdGhlIGRtLWEgZGV2aWNlLiAgV2hhdCBhbSBJIG1pc3Npbmc/DQo+DQo+IFNlY29uZCBxdWVz
dGlvbiBpczoNCj4NCj4gSeKAmW0gdGVzdGluZyBkYXRhYmFzZSB0aHJvdWdocHV0LiAgSSBoYXZl
IHRoZSBmb2xsb3dpbmcgc2V0dXA6DQo+DQo+IERCICDihpIgOEtCIGJsb2NrIHNpemUNCj4gWEZT
ICDihpIgNEtCIGJsb2NrIHNpemUgbGltaXRlZCBieSBwYWdlc2l6ZSBpbiBMaW51eCBLZXJuZWwg
b24geDg2IGFyY2hpdGVjdHVyZS4NCj4gTFZNICDihpIgIDY0S0IgYmxvY2sgc2l6ZSwgYW5kIGhh
dmUgYWxzbyB0ZXN0ZWQgd2l0aCA0S0IsIDhLQiwgMjU2S0IsIA0KPiA1MTJLQiwgMU1CLCA0TUIg
WHZkW2FiY10gIOKGkiAgNEtCIGJsb2NrIHNpemUgb24gdGhlc2UgZGlza3MgcHJvdmlkZWQgYnkg
DQo+IHRoZSB2aXJ0dWFsIGhvc3QNCj4NCj4gVGhlIG9ubHkgcGFydCBvZiB0aGF0IGVxdWF0aW9u
IEkgY2FuIG1vZGlmeSBpcyB0aGUgc3RyaXBlIHNpemUgb24gdGhlIExWTS4gIElycmVzcGVjdGl2
ZSBvZiB3aGljaCBzdHJpcGUgc2l6ZSBJIGNob29zZSwgSeKAmW0gZ2V0dGluZyBzaW1pbGFyIHJl
c3VsdHMgd2l0aCBkZCAoYW5kIGZpbyBmb3IgdGhhdCBtYXR0ZXIpIHdoZW4gdGVzdGluZyBkaWZm
ZXJlbnQgYmxvY2sgc2l6ZXMgd2l0aCBteSB3cml0ZSB0ZXN0cy4gIEluIG90aGVyIHdvcmRzLCBp
dCBkb2VzbuKAmXQgc2VlbSB0byBtYWtlIGFueSBkaWZmZXJlbmNlIHdoYXRzb2V2ZXIgd2hpY2gg
c3RyaXBlIHNpemUgSSBjaG9vc2UgaW4gdGhlIExWTS4gIElzIHRoaXMgYSBsaW1pdGF0aW9uIGNh
dXNlIGJ5IG15IHZpcnR1YWxpc2F0aW9uIGxheWVyPyAgV291bGQgSSBoYXZlIHNlZW4gZGlmZmVy
ZW50IChiZXR0ZXIpIHJlc3VsdHMgaWYgSeKAmWQgdXNlZCAzIHBoeXNpY2FsIGRpc2tzIGNvbm5l
Y3RlZCB0byBhIHBoeXNpY2FsIGhvc3Q/DQo+DQo+IEkgc3VwcG9zZSBpdOKAmXMgbm9ybWFsIHRv
IGdldCBsb3cgc3BlZWRzIHdpdGggc21hbGwgYmxvY2sgc2l6ZXMgYW5kIGhpZ2hlciBzcGVlZHMg
d2l0aCBsYXJnZXIgYmxvY2sgc2l6ZXMsIGJ1dCBJ4oCZbSBzdGlsbCBjb25jZXJuZWQgdGhhdCA4
S0IgYmxvY2sgc2l6ZXMgYXJlIHdyaXRpbmcgdG8gYSBmYXN0IGRpc2sgc3lzdGVtIGF0IG9ubHkg
MTMtMjBNQi9zLiAgSXMgdGhpcyBjb21tb24/DQo+DQo+IC9BSA0K
