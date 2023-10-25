Received: from relay19.mail.ox.ac.uk (relay19.mail.ox.ac.uk [129.67.1.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B7F2D61A
	for <linux-lvm@lists.linux.dev>; Wed, 25 Oct 2023 12:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bioch.ox.ac.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bioch.ox.ac.uk
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from ex2016-05.nexus.ox.ac.uk ([163.1.154.145] helo=Ex2016-05.ad.oak.ox.ac.uk)
	by relay19.mail.ox.ac.uk with esmtps (TLS1.2:ECDHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.92)
	(envelope-from <borut.rozman@bioch.ox.ac.uk>)
	id 1qvdQ2-0002Jh-B6
	for linux-lvm@lists.linux.dev; Wed, 25 Oct 2023 13:55:30 +0100
Received: from Ex2016-05.ad.oak.ox.ac.uk (2002:a301:9a91::a301:9a91) by
 Ex2016-05.ad.oak.ox.ac.uk (2002:a301:9a91::a301:9a91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.7; Wed, 25 Oct 2023 13:55:30 +0100
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (104.47.85.40) by
 Ex2016-05.ad.oak.ox.ac.uk (163.1.154.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.7 via Frontend Transport; Wed, 25 Oct 2023 13:55:30 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=inA25huiOJNjKxAlyclXieQv0uonFYx1Kz489xSbdInY9+qeW9qiWSNdyb7ZzgmrPdPPQtUK0QnqKPivjRcBwIwDJAKRIxpbCxet/YQCC1SfMnkwc7nugsAg0S5jhOj0HzUTdnrT511AkM/0cOQp4R+PtuZrb+ql2HJ8pQl6BYl/3nBk6Xm7Odp9eA00YhRZvHs0HDdX4ybVBqa9Ztmhj5ezjwQLnI6HWvw0bFk63nTRd1oLRdNCDg4yijYT0kBDoDWpGRfslmKzGUF0wU9tNLMdk5YIkpOeVOxRYPpxkKEkiwZ9h/UN+sRTfAek8n7QLr2zmJKbaUWO0cI/UdkA9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PrssAYF7mscVCyOHJbusgTX6EHF54u/TBC2PYBUgkk8=;
 b=g2Y5kbTpmzGCwyA1b7PIMf80gaqSDdngCoh/qlE+paFIRNuFxzHTzM6seTO6WjDHbCe7lOaWF4cCdmaEUb3kCF1yqNeOWq/Zj7WAhsM4rY/ZgI9qjI7GYPNWufle+td1DhBP6MR0sFjbUonTMxYAckrxlVgn53jo8zGW3SjBGjDdCE6w7f7wXRTYprSNqhYCHesqcFd3khveoQx9162gvpTNeE2bHW8mh0EozrWW4EfcxXxse70pOVHjs20iw/9hw4IGQ83ZXkrbfczxDO5rR4ekkkTJQAm5rBbpnL4739TJQSrR09U3TIccHaaQfFNb4LuHm6zB944h9ACqJK+ukg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bioch.ox.ac.uk; dmarc=pass action=none
 header.from=bioch.ox.ac.uk; dkim=pass header.d=bioch.ox.ac.uk; arc=none
Received: from CWLP265MB6214.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:184::7)
 by LO2P265MB5885.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:268::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Wed, 25 Oct
 2023 12:55:29 +0000
Received: from CWLP265MB6214.GBRP265.PROD.OUTLOOK.COM
 ([fe80::cf2d:6670:9559:8b9b]) by CWLP265MB6214.GBRP265.PROD.OUTLOOK.COM
 ([fe80::cf2d:6670:9559:8b9b%4]) with mapi id 15.20.6933.019; Wed, 25 Oct 2023
 12:55:26 +0000
From: Borut Rozman <borut.rozman@bioch.ox.ac.uk>
To: "linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
Subject: Problems on enabling snapshots after reboot,.
Thread-Topic: Problems on enabling snapshots after reboot,.
Thread-Index: AQHaB0KGd6+Uc69ZaEGFw/tG9QCxpQ==
Date: Wed, 25 Oct 2023 12:55:26 +0000
Message-ID: <fa6f76d0422d63ce89ec7aea2ecfe3c7184f3696.camel@bioch.ox.ac.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bioch.ox.ac.uk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWLP265MB6214:EE_|LO2P265MB5885:EE_
x-ms-office365-filtering-correlation-id: 6a54ef23-a95b-46c8-78f8-08dbd559a925
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JUHnFx1fUZzaTiC6W73TNTQKJqVrdbGRpCvLbgnkoz7o5hB9baFjRcRu8ToykbsoHqD7LoPZXMQBEoNbE1nIKBWo/56UJkvkSeetMRv8uVuyUWh5sF8ncZXKipTMZ1XlfLJBy5Q/Ocz8g6XxdpPebTHGA6Dv7BNvD//yiMvsGSMXgEM4SZeMihhC75GcB7xuUEBA95p6XVkMfD2Ggdxtim5RX91wthk1dca//O/w1ucRHJaVzYzr3k4p5SpsJjfn2ToAmatGS4QgDWVgAaDpoOt3d35F1cytiRPkz/svw1tlXevrse3U8yb8DBYjjoXNGD1/8dZlKnkbWt9A7cxcp5ck6hi6+o/NwpB0KvH3HUpX4fCYBHLt+eOqkD6JkTeE/ejqLyJQ0ddR4NLtZh3MjtItFpR6lnmctxsAhMjs77agbhFyDddQWnj3HpgzXsAm7ZUgZAfiRr6SKnIkmkvanDkk6hC0Y8C+94cuFAudy575AQcewA79lHnQa0LDTVyCrrC0qKrPWcbX5pWR9PrP9PfocEKHFltOCAMi4gzopnReBFRdcQAn8gvjwE+yB4i0fD/eGZ3zzHASR+X1asf+cOkJvjTASqdUaky8Pjb+2yDIOt0iAcC6Br7MgiPRHvBc
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB6214.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(39860400002)(366004)(136003)(376002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(6512007)(71200400001)(6506007)(38100700002)(122000001)(86362001)(83380400001)(2616005)(26005)(66476007)(41300700001)(44832011)(6916009)(786003)(66446008)(76116006)(64756008)(91956017)(66946007)(66556008)(316002)(5660300002)(478600001)(6486002)(38070700009)(8676002)(8936002)(4744005)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q0I3aXpOSEdiQWtZOXBSYzBoc1F6TFQvNjQzbU1kZHVqM0psdTVCcjFERWNx?=
 =?utf-8?B?MzR6VitZWFhpVDhvOGY5WXhJK3BSb1RQS2owQWF3ODMxOHhiaW90NjIxNE1r?=
 =?utf-8?B?SDMxdFNoRHJudlJLR2dYdFgrY3BYY0ZsZzZranAvcE8zU21wN3JhNjFtQURX?=
 =?utf-8?B?RFNGVk16Nzd5bGowTFdlZisvQjRWODlucC9hdFZXeHZBZVBZQkE2VlMzTmJ0?=
 =?utf-8?B?a29GNXJwNnRmaEJXaG1IRnJBWUpYcWtPSXNOY3NyMU9RdGVBaEhWSUh5c1BR?=
 =?utf-8?B?TGRWZGp3YkVSYzd5ZS9BVzRzRitDbGNXR3BYMkV5Ty9tT3UzRWN4L3lUMkYv?=
 =?utf-8?B?N2w2VVFQeS9yZ1hLUWdvdzRvRmpLbjlTbisrWEZ1U0IwTjNueGNOQkpsLy9W?=
 =?utf-8?B?LzhBMi8vWmlxTWVQd2tUTHVzYU1QVHU4elI1M0NzbjM5NzJaeTVmUVR4MTMx?=
 =?utf-8?B?ZldRL2tVODhkSVA2eStpVEh4cmY0c2ZteFZqTk5NNFpUbXdFV3lqQVhzVVND?=
 =?utf-8?B?NExQOHhjVkpQUDdHNFlSOHlVRHBKV29TdXFIbU05NkxjdGtnQXQ3aTJqRCtv?=
 =?utf-8?B?KzI2RkhUcW9kSnVNSnAySlZ3aDZzcnZuVnUrdjI3VjdZa2Y3c1JwN3ZFOEp4?=
 =?utf-8?B?Q0loTVF1cmM2ZEtVcWNncEVLNVg5M2w4REZTOTFtMjluNTR6RDB0cmFYMXVy?=
 =?utf-8?B?S3ZZR1dLL3J2dWM1U2xma21pZVV1RGU0NmpmY25KS2pXQjU1eDF2Nk9BZjhZ?=
 =?utf-8?B?R2NJd3RwTDRmTlFMdlUyY3M4bE5kSm9GRW43UC9OMGRTMlozTHEvbVJ2OTNy?=
 =?utf-8?B?VllEUmpqZFVqTkJjN3VtOE84T3RPTjJmamVBd3RBTnYxeGRZVm1uWjVNdXo2?=
 =?utf-8?B?ek1BZkpVUjlxbzdjUVR4RGszUUtkd0V4U3JIdWs1dVJ4NzZrUjIyK1ZGMVkw?=
 =?utf-8?B?aWJRVlpHWkpOeUsrVTlIZEgwVHVUUWRTbUQ5UmRXaERKMWREeVd6RTlHZUM2?=
 =?utf-8?B?ZC9CUkJpeHM2cGhmcC9mT3JZUTJOZEZtNm5mdVNLOXJ0c0pReXBiaDJUU0Qz?=
 =?utf-8?B?SUJWaUhGS3J1Z0hXMGdyMjg5eTEzdzNWc0xkTU9pL3IzSjlaTzJoZUtOWERJ?=
 =?utf-8?B?UC9hRVFoVUtaQVR4a3JRVzhRSURNSkM1azNab2VJd2w2Q0svZnhpVDBiK1lX?=
 =?utf-8?B?S3NSbXJVakl0cytnUUg3WnpUd1Nwa2FVVEc3UmlKQnkxcTNwOFVMdDRoaGM1?=
 =?utf-8?B?enZFSXoyc2JvZk1YQ2ErWnk0WFRjMVF1NjJUM0xURHF2SkRpWlJLdW1wS1Ny?=
 =?utf-8?B?OWFkc2tIdDBCaFZhR3JvQ3RwSUd4enBTSm5JWDlOMDY3Qi9OK0M2d0xnTTdK?=
 =?utf-8?B?RUdQYk1lRXN1OEJWNGt6a2hkZjBscW9XcWtZZlBIQVNzR2xmQ3VVQWFPZTMx?=
 =?utf-8?B?V3RNWUtIN3djelpkMjlqMzBmSlRic1d3cTl0cHROdHZoUlZNOUJLWlB5YUZw?=
 =?utf-8?B?ZjlNL1MzZ3c4QVlJQWhNd1F0Nnc1Wmc2RFk2b1lKc3o5NktTdzVEV2hqN0R5?=
 =?utf-8?B?VHFiM0dJaURvUTk5Z0p3MVUxTzhWQlp1M3ZWOUwwcTFTdE9WSWdEa0RCc2dD?=
 =?utf-8?B?UFlFMjlvVU96WWxjSWtOUHBoSWNmaWxqa3IyY1hZbUd0MnAvZEhFZS96R2ll?=
 =?utf-8?B?ZEhVblIrT1ZWNzByK2NNT29hSm9YU0tlNFZVbTNYMGpRcXkrcXduczAvcTk1?=
 =?utf-8?B?Umhyam1FZ3ZPc0Y5Uy9PMzdZUHMwcEQrd2VuN0Z1VHh6bEFrZllZb0NvWUF0?=
 =?utf-8?B?SzdTZFZTNFVhSmhsYnp0MUlsNUZkZEt6WHdmUW9aTDVnMzdoOEc4dFBkUGpU?=
 =?utf-8?B?V2xFNUJBdHM5bDN3a3dEa1Fhd1d1L0JpWmZuNWZUOXRFVTBjQkkyd3o3UFVo?=
 =?utf-8?B?cHZFZ3hHQnRkTDZLbm40TnVsbUtGWjVVTmVUMVJ3WTl2MEpHeTEyRGV1U09W?=
 =?utf-8?B?ZUpad2RkR0VFejlzT0ExNkhEWDFBamVmd3RrYWt1TmRsNzBWK05FVlB1RkN2?=
 =?utf-8?B?ZVZyQXhaVWpEUURHZkdEUjgxUXN6WkVkRXVPeVhCbEF0dDU0MVlDOTN6Tjht?=
 =?utf-8?Q?fcYSUGr9fwcwp05YyC8IeKTQF?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7146926CA4EB1446840F369578052646@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB6214.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a54ef23-a95b-46c8-78f8-08dbd559a925
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2023 12:55:26.9560
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: cc95de1b-97f5-4f93-b4ba-fe68b852cf91
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oc/U/NwAPqM6OWK/pGexAUeIG5HWJsdxOGHX97p1yzjuLlI6hs7vR0xTYui5qOqbZ7/6kHhMT2u1lk6Luq4Skw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5885
X-OriginatorOrg: bioch.ox.ac.uk

SGkgZXZlcnlvbmUsDQoNCkkgaGF2ZSBhIG1hY2hpbmUgd2hlcmUgSSBydW4gc25hcHNob3RzIG9m
IHRoZSBGUyBldmVyeSAxMiBob3VycywgYW5kDQprZWVwIGEgd2VlayBsb3Qgb2YgdGhvc2Ugc25h
cHNob3RzLiBBZnRlciBhIGNyYXNoIG9yIGEgY2xlYW4gcmVzdGFydCwNCmZpbGVzeXN0ZW0gd2l0
aCBzbmFwc2hvdHMgZG9lcyBub3QgZ2V0IGVuYWJsZWQgYW5kIEkgaGF2ZSB0byB3YWl0DQpzZXZl
cmFsIGhvdXJzIGZvciBsdm0gc25hcHNob3RzIHRvIGdldCBiYWNrIG9ubGluZSB3aGljaCBvZiBj
b3Vyc2UgaXMNCnN0cmVzc2Z1bC4gTGFzdCB0aW1lIEkgaGFkIHRvIHdhaXQgZm9yIDggaG91cnMg
Zm9yIGFsbCB0aGUgc25hcHNob3RzIHRvDQpnZXQgZW5hYmxlZCBhbmQgdGhlbiBJIGhhZCB0byBy
ZW1vdmUgYWxsIHRoZSBzbmFwc2hvdHMgc28gbXkgRlMgd291bGQNCmNvbWUgdXAgbm9ybWFsbHku
IEkgd2FzIHdvbmRlcmluZyBpZiB0aGlzIGlzIGEga25vdyBpc3N1ZSBvciBob3cgY2FuIEkNCmF2
b2lkIHRoaXMuDQoNClBTOiBGUyBpcyBhYm91dCAyMDBUQiBpbiBzaXplIGFuZCBzbmFwc2hvdHMg
NVRCIGluIHNpemUgYnV0IHRoZXkgbWlnaHQNCmJlIGV2ZW4gZW1wdHkuDQoNCkJvcnV0DQo=
