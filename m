Received: from FR6P281CU001.outbound.protection.outlook.com (mail-germanywestcentralazon11010040.outbound.protection.outlook.com [52.101.171.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC5E18E20
	for <linux-lvm@lists.linux.dev>; Fri, 18 Jul 2025 14:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.171.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752849976; cv=fail; b=H+OkUMJjP8GCutSfW9W56ROnQpHRcMgkJ3zoNwiWQGcuthElYJt1DD1mBYmfL70FLENlS9mgY3a+DGSN/R7NKdgJeTrcwUMVqKwhiDqljadierhDco/y/8OA4d/RhK8RKVDkGHaz76a3E5jbTVnvit5xuPwjTsacyfU1B1SXXr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752849976; c=relaxed/simple;
	bh=AkW7HF0qajzeNLlNbeycdRicLVVvbhNm/ydsjkQV8yo=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lYvbkNitqv/jed4QrDExpu6KMkrv5ooDZkCHg3HbgcIGBVtrCk7JP0GQes8KKKlkIYbHBO+MZ/yffStYp5jyBCNxBVRaZ78G9BYTOAnXGRZMu9PZqkKXJsTYDR7AjJK9rwLGTz64iyyl4XEyReBsRCE21Vq7lcGxtPOiP8bfVqw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=eon.se; spf=pass smtp.mailfrom=eon.se; dkim=pass (1024-bit key) header.d=eon.se header.i=@eon.se header.b=P6UpSfEA; arc=fail smtp.client-ip=52.101.171.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=eon.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eon.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=eon.se header.i=@eon.se header.b="P6UpSfEA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u/i5bZAzgd8r7w6eOFSJLcWW84ZYrYGh6xO+V/wTR8+kv+03D2Gk4gW8GFTi3Gne70oKqzVkTlh8xEDq5wIzrh40o6e9IO9Yna3sn2rh7P0wa64TBebm7SPCVkhis18RT0MDuhEqbij5+p6aG/PWnAAi60CPZaiS+LaVqKtBgTmYMvZ2wqQrq/xq2ksLCEMojAxL5bjA2hR+SBgyJAPgIPC4dkFCz+PFUEsGx6CDIw6mc4lByTocPd1Jvkvg+knJiU/+wHkNelIutVV1kEcn54xULNFI0fDA0AFEL7qPZoegSg7ACn/2MxmEFseLxTbjQyYprqF/ViiAXev5Z1cjgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JHqUkwpf/t8g5Rh2zNDqiRdwqUkReutD3oQabXN9KmU=;
 b=vIeGyjiX77me1LBKUIS5HjGAQR6DHI+Tlr1jbEEEYCwbPBxa5TWQMF+ToDtVoR0BV3XfAIJQcU4niqQs/Z9HuhOpfNfEynUvCTxSvtX8OteRu0IjM96SLOOybRWLKaB6243Cu4nPm1l6lC0Zs+9eBdBk0ZDNV+mkTDjqGdyrMFejunaDl8dFqwsRo1LbXiIQnCTCPq4L5cQ5zsupfw0Yc1B3GXhrBJ9pF7H0bMHgySOjhZTQ3RuZqBS25svbDCJFLR+AyNpNnYSSVcZMqnbXpm7zeDat7IBBqNbuFj7WXtzRE0rsnm4sXg48pHhCmBsfdTiVo+0BjkaVotk57+l6KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eon.se; dmarc=pass action=none header.from=eon.se; dkim=pass
 header.d=eon.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eon.se; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JHqUkwpf/t8g5Rh2zNDqiRdwqUkReutD3oQabXN9KmU=;
 b=P6UpSfEA3M3okVq9KTxOfZk69gN/shn/zg9A7hAtE7dDLmizLsj7/QOJZezbkq4oCRHfgV1gqCYzmgIyb7u3DKGLpvOyhjFOkrMtgoTp/NejEeRv4DOcf7a2cpfvVEgM2D1u3tNMyohzKMw2k59IUGG/+w1oxHPfcQK2wyJgPD4=
Received: from FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:be::11)
 by BEZP281MB3207.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:24::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Fri, 18 Jul
 2025 14:46:11 +0000
Received: from FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM
 ([fe80::210b:d15e:d20d:7fd6]) by FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM
 ([fe80::210b:d15e:d20d:7fd6%7]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 14:46:11 +0000
From: "Henry, Andrew" <andrew.henry@eon.se>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>, "linux-lvm@lists.linux.dev"
	<linux-lvm@lists.linux.dev>
Subject: RE: striped LV and expected performance
Thread-Topic: striped LV and expected performance
Thread-Index: Adv3ryOkPkyC1+SGS2a//kGki21OpAABDQ9gAAlHfwAAAKRzYAAD2EiAAAFmTFA=
Date: Fri, 18 Jul 2025 14:46:11 +0000
Message-ID:
 <FR6P281MB367296DD8DAECAB5633C9BDDEB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
References:
 <FR6P281MB3672085D192D8BF5CB45CFE4EB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
 <FR6P281MB36727398D141AD2A1A1E76DAEB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
 <67b28bf7-b862-4878-8434-aaf0d157f2ca@gmail.com>
 <FR6P281MB3672F7D1B62E229AFCD31D0DEB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
 <9f6afc0d-ce58-472a-942b-15527f693d28@gmail.com>
In-Reply-To: <9f6afc0d-ce58-472a-942b-15527f693d28@gmail.com>
Accept-Language: en-GB, sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_ActionId=1d76da13-6ed4-49a7-adf3-0a74fa991ec8;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_ContentBits=0;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_Enabled=true;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_Method=Standard;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_Name=Internal
 -
 Unencrypted;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_SetDate=2025-07-18T14:26:53Z;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_SiteId=b914a242-e718-443b-a47c-6b4c649d8c0a;MSIP_Label_42f063bf-ce3a-473c-8609-3866002c85b0_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eon.se;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FR6P281MB3672:EE_|BEZP281MB3207:EE_
x-ms-office365-filtering-correlation-id: aca6b8a3-76f0-4334-4653-08ddc609d674
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?hfri80N9PrPjgWCnaoCOZlU4cxYqfvgqJ7fZwoX9QzcUFiTU8XE2aEdkdfm/?=
 =?us-ascii?Q?niAs9rodIGkZiQRV68D3AQTtHdrucF2X4UPZmfa8Vb+kL8r+Hp8laOH3zobP?=
 =?us-ascii?Q?jpFDtcbzo8tUVGjs1HqZ4U2Ut5WHSkRwcDb7xGwx/XYD4EFzogTZGwdFh+Rs?=
 =?us-ascii?Q?r0FaK0u6+pLLV1HxJmMVbP/CIQuFS+l/zvGtJvMW8MhpmgENtHXCd8TuQotO?=
 =?us-ascii?Q?d+PcH6SctUgWv6zm+VfLcSsQ+6wFHFXClRxFrC4p49tlynwUOKaayrHO3b74?=
 =?us-ascii?Q?BTCRLn8zPtghMOL6WFdex7iPg5RxBNvuQRRjyOg+NNNC7Wd5ZpLaHHnrBMAX?=
 =?us-ascii?Q?afsheVaVdAOtk4cs5dOvPhccyr0KBm8a5xDBdW4r8nheDZrXw6hBOHMhS5q0?=
 =?us-ascii?Q?BlFCg5Dm05O+L3I8Ph+b208HW6+mjUdePS6WTHa4ni/dSGaUVUvlOtL2o/Qy?=
 =?us-ascii?Q?L/CCXriD31ml/atahhOOUDBlng14kENpNlTiH2MyEJfzn7VPcJsEqTGmsecS?=
 =?us-ascii?Q?/1UgUx5lDxuQIfgigjvMfuvIVhpJxTH1gbZ+gujPREH4VYhzLG8NHfRAH6lW?=
 =?us-ascii?Q?PAw862FvUstcu7zgYt7LnoDHkw+l+CmMv10izk3kRhog9Q2e13DJ2BxBi2r8?=
 =?us-ascii?Q?+pqbcsgZzPVU9PksD3omPdYsBvpsxtj3la2hLVWLz2DQsti6rtggQ5rOFrA7?=
 =?us-ascii?Q?Zl0/pnlW21EwAXiWTaaoNl+23DQMfZIN/9bgwAXMFYLbGEHAWoBG/F4XUqA8?=
 =?us-ascii?Q?07M2IrBftlanJwshXZsYXLb1Gpav0RA7ACZRm+TPjB02+IlW023WCCQGTv4w?=
 =?us-ascii?Q?od/bJTGMIpMDlShHBuEtsE2rv7XweoDuQMEesJrEdSLqLVm6gvOyQ1tf1T2c?=
 =?us-ascii?Q?9ozw3qJ5BI3YTlmqBGzz6n0i/imxFr+2BHvYq7jiCcWNH1eFqX7I2Ks/Mpb3?=
 =?us-ascii?Q?kW8awZBZ/OLhjRAmaLlBtnAp6Xf5l7uyL9Xez6zIMUmJgEnEZQNRAv3tg3Uc?=
 =?us-ascii?Q?JtCugdEroD35QYD7Ne++GXZIBxbHCPRD9Ps2lznOTqlsAkQJA4unbaZG1Uoc?=
 =?us-ascii?Q?OUkUZa6zALg+3+8owXkRq/awIhYnQSRQtqIzB+GSrcgvZ7wvPejAY5KRepp+?=
 =?us-ascii?Q?IhMhykw9wHS6h/VFlJNZRaKW111MczcC9/Ty6O1cVuD9I331M4dhEadI5ENx?=
 =?us-ascii?Q?gW22I0qFay+klrJZGcAfdlwSc4aF0AGzJu5DQdjdB6SEM3evQ9avrnLTkQcS?=
 =?us-ascii?Q?ToIyjRl595SUfqBY2YXGCm0ywlyrPDFFh+nr1cXPvrlIQvMfp72GDLPBaooq?=
 =?us-ascii?Q?C8d7vGvtKEJoZHvkLai31cliLlwW/wPxoPLZ+s2pDio5iddZKJJb7nRJDIZ8?=
 =?us-ascii?Q?cooPaDrbaqFsvuhAuAMgg8agQ9HgT/m7OblqY4MB1tQqyd0MlIjJsDPcCDsw?=
 =?us-ascii?Q?3Uy/+76iSl4jQpm3M9GooTkhqF2ZFETPb/6r3blAwhutUhrrQGGJRQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?p6+74/CmZ3E9273E+SmURDpAJU4YpMCOYlEizNliDAUTh/gsUryZkSlYib0k?=
 =?us-ascii?Q?xJChJa+2z7hvpAXUxx8V1WZq4uL+d3q5bk2MeeboAG8iRDP14OQq/Vgx+ls+?=
 =?us-ascii?Q?KUNo2fai1dcnpZw2jR4HmoqADGA4hbHzX8pfSITnN47sM2iVB4y3aWhpsxcM?=
 =?us-ascii?Q?lhGylCQf7lUGzMZvWLR5jee9D3aIbfFlKgYrXgTiEu65OUj97yrVYbqaU+V8?=
 =?us-ascii?Q?aJSBMtBJPIqrjxgu+tnDEQZs3w2/UDo+Ohb4rm9XQaIq+VHWBPFZNm2Z6ImY?=
 =?us-ascii?Q?rePKr8UuN0lTutvl96OZ8Q/qPxyJcBwi6Ep5hYxoaNjl6Wxg2PVhS4nRytdi?=
 =?us-ascii?Q?bTdhw0P7cD7WsPyEKH9WP3qXKMzahksuN2Olgrbxzuym+idhxTGyZwkLBBxr?=
 =?us-ascii?Q?wwOCiB7m7nUwo6yeXK8Iyex64WN5hfCghROYmTiU+cljVv0x4AgH4H1qeIEF?=
 =?us-ascii?Q?0vPH7ZMWWVAgn1fiSLtC1jfxK59sSAEggL1nIfG1POMOjvIen8mKbmNp1Dck?=
 =?us-ascii?Q?j4zCBf3IPW4QsMOL/Ps+iW3EBc4Jb91C/aK6gwTQLSO9GJjOHnvwadS6gVsJ?=
 =?us-ascii?Q?79ha41crYmc89PDgaYBendqgFP9nwAiEjbFZo45LYX2PcL9/O8z8KaXKoCXZ?=
 =?us-ascii?Q?nTRHCWtsDWu9hDSgdHwq+nG8uD4ypD0jffHzCf3FTG/OcxtYfkRVZyInivBi?=
 =?us-ascii?Q?RmoFD1RLef9pes9NH2sAyrzGIL/00DnQxA6AEsiPrbCy9LBWBg7nKQTY/zpY?=
 =?us-ascii?Q?/0xD6MP0pdXUTFAiw0ZG7Ul6yIsP7cfgCmRkeHc3+Xk+a9Kz1Kpa3703Byon?=
 =?us-ascii?Q?nHtnrAABL6TNgKTCo5sLxsUyGerdcTvxaVsTIupPizeoD82EBDN8RNhsypMB?=
 =?us-ascii?Q?6AMUH0luFlb0kG/48V4Lwz6gdCvLFFYHL9fOA5SkaQTEqncLvDraRlaPNeSM?=
 =?us-ascii?Q?zj5dA8HMgrMxNrwI5YblAhyRZxIzVXJPtxNe741a58HyJt57fNBbK2LWUyiB?=
 =?us-ascii?Q?dukjm72CLs9f7BropsMzvXz2ri+61WWEEjfzcsjg8PYpXNO+WmhCTHxKs6BZ?=
 =?us-ascii?Q?PEgHs9kyiiYOo0+kfsUMcWYXsVErtMbHkIVPCBlMEuT+bxVwkImu8v5OrKLR?=
 =?us-ascii?Q?q5E+a/nJMlqDb78K2wBjV80Wviz1skdme8pKHy0FUo727COQXoKEtnA4hmDF?=
 =?us-ascii?Q?SQr+DVsEM5OXdjKOQW7GlUa4+UeRo1zY2RurFHnJLW5RVzrl0dzOZSWS/0Xn?=
 =?us-ascii?Q?f1WEF8TPVWnxzxAibFXpORfUWibw6g1QcgzWVghEXXK2AIbGAxQCXiBtGykf?=
 =?us-ascii?Q?GFzZQJFyIne1EO6oUsLDmvmn3iRtOz+gUHxudvL8TiSth+dhdB/39zVN7Kj0?=
 =?us-ascii?Q?raTdrWx8QMyni4rFrjqL5JSsi4Sv/RLErxZsHJKhiZSx9WfGJi5K1/LFQYYS?=
 =?us-ascii?Q?5psVxjTXLXKdCDkiPpYAnqZLPuyPs50CT7SiHljdwr0Js8GkKzObPIs7A0OF?=
 =?us-ascii?Q?KpC/hKFXd2WLZbCAeyOBJyr0BR1lzW17gXKg/6QguNquQG1P5z64oiwUd0LY?=
 =?us-ascii?Q?EUiYbyI73Tm68XNuBVI=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: aca6b8a3-76f0-4334-4653-08ddc609d674
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2025 14:46:11.0793
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b914a242-e718-443b-a47c-6b4c649d8c0a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O6SjZ2rE9aYzVkyEPSvSQL5dr+YcRWl4LLfZRJq2yqq8GzexYEL/T07ibx1+zWpz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEZP281MB3207

Dne 18. 07. 25 v 14:24 Henry, Andrew napsal(a):
>> Maybe you virtual system does have it self 'a single write pipe' - so an=
y parallelization is stopped right there - so maybe you should start first =
with bare metal....
>
> This is what I suspect is happening, as the back-end storage is very fast=
.  I'm going to test on a physical server instead.
>
> /AH

It's crucially important to be sure - you have independent drives & control=
ler paths to them.

It's really pointless trying to setup a 'stripe' on top of 3 drives that ar=
e at the end served by a singly physical storage behind the scene - this li=
kely can explain rather horrible numbers you get when you are trying to use=
 stripe
-  in such case simply join devices 1-by-1....

Zdenek

I re-tested this on a consumer PC.

SATA6 controller, 2 * 1TB Seagate 4ke drives with product spec of ~210MB/s =
read speed and ~160MB/s write speed.

Created the lv as follows:

Pvcreate --dataalignmentoffset 7 /dev/sda /dev/sdb
Vgcreate vg00 /dev/sda /dev/sdb
lvcreate -n swap -l +100%FREE vg00  # for linear lvm
lvcreate -n swap -i 2 -I 4k --type=3Dstriped -l +100%FREE vg00  # for strip=
ed lvm
mkfs -t xfs -b size=3D4K -d su=3D4k,sw=3D2 -f /dev/vg00/swap
mount /dev/vg00/swap /mnt

Tried with 4k,64k and 1MB block sizes
time dd if=3D/dev/zero of=3D/mnt/testfile bs=3D1M count=3D10240 oflag=3Ddir=
ect

This gives me exactly results I expect:

Using linear LVM, it's writing to one physical device at 187MB/s
Using striped LVM with 4K blocks, it's writing to the striped LVM at 306MB/=
s, which is not quite double single drive speed but near enough for me to u=
nderstand that "it's working".
Using striped LVM with 64K blocks, it's writing to the striped LVM at 311MB=
/s
Using striped LVM with 1M blocks, it's writing to the striped LVM at 312MB/=
s

Plus all these results are sort of inline with the physical characteristics=
 of the drives max R/W speeds.

When I perform same procedure on a VM using the paravirtualised driver for =
the 3 controllers, I'm not getting speeds in-line with what I expect from s=
olid state storage.  Obviously, striped LVM in a VM with storage pool conne=
cted to the VM host just does not work the way it would with separate physi=
cal devices.

/AH
