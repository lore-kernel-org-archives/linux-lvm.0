Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2117.outbound.protection.outlook.com [40.107.236.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273D578F5E
	for <linux-lvm@lists.linux.dev>; Mon, 28 Apr 2025 05:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745816879; cv=fail; b=X3CyOHN0BDrJgCsrScxnWhbt3q9LamRGSosVql2+Eme3SppSticNuAMwI6QlbytTbeh6hBkDojJLE1Mzv556Jqs0XyP5t4aJZqTiEYsTeObE1WXJwX1xt409RWFMwLv3ELDOzj2YN9HEXi55Zm36MFRpDHDhkhm0A93oJSnr3oI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745816879; c=relaxed/simple;
	bh=2L1vfXfixomqPevW+IfeU+45WAsP+TablRi/+TfhHM0=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=A29/ZYUpySQ/gZ0EHz+deObmeuqt73/DUFOqYUFOtgIZ4J7ntK9QvrWun6dt9qghIYojVdHVNM2g0kdFf3eCWmibJYp3HdK8hC0A9cRdp6KwP19y/vvxARKBIoMThZ7kdQMJg1l4o2yZvs41CBl0od/4PuqN27EPeNQlG+tHMXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=insanegeeks.com; spf=pass smtp.mailfrom=insanegeeks.com; dkim=pass (1024-bit key) header.d=insanegeek.onmicrosoft.com header.i=@insanegeek.onmicrosoft.com header.b=leXjsyu3; arc=fail smtp.client-ip=40.107.236.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=insanegeeks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=insanegeeks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=insanegeek.onmicrosoft.com header.i=@insanegeek.onmicrosoft.com header.b="leXjsyu3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LbwK0vHcsF7AvTHbYKRHh9S+Z79L3IjvWjBhDkiXpSa7BpE357D4NXjeBbY+PXj5QUvYHXG6TkWZlUF90RmsdJS+S6aR5zXr7SQg1rTcJxP9dRL78JKhK3dz3u2WdewqwqQU7HyOBaWLU50xFIpuJI0EKbi8OBjecdmJAgG7BGDMEU4NL9dW9sFKPQfleiuY9kZg+SUZdNd29VrEqiihxxRyQvnJClGn83YgZOsZVeAmF5xQp3YrsC8b18gcYOtmV8BEcsQy48yuVye3PEkCiJTgtKjCMdaf45pVkn+z/78U/bWlnYT9A5O7WWDaCQCDRPPm8OArS2rc7UyfBz0Fkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jyp8QWWRM1M59aOktYlKf4vnk4ohLs5ShmqiOJ3XBIo=;
 b=DmatYmeXcHNLp+t0oFOBjuGTryJseKa0j41uWW9yTcTBvfE/VD6P6ndFYd06wWJo5ZILDe2SolQUeMmNm+/n0NwvMW58CQNtNOsmJO4EXE6JGjDLOJn7P5xtHeerWeDjcLIIjBU1uqXIJ1/uWYw6afML3bDxiB8K+0lo4PQLOGGIi5D/UFcEqEDkMdfxncGZb2AZopsFsACAL2eT4FGrexs2OsFZWEkx7jvWELh7uAOiwUcDyDI8hgj1rOgDBICdJ7PuOYafy3ACmVnSKZzoZKds3nRxIxTviLFRs72VrJoLGr4Y+TEkHIpBaNSmHb06ci8jeF7o9gbXxYRrDnam1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=insanegeeks.com; dmarc=pass action=none
 header.from=insanegeeks.com; dkim=pass header.d=insanegeeks.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=insanegeek.onmicrosoft.com; s=selector2-insanegeek-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jyp8QWWRM1M59aOktYlKf4vnk4ohLs5ShmqiOJ3XBIo=;
 b=leXjsyu34bI8NHvglOKZ+ZKMRCncieEkig7yaK3H55mYTNxKxNJwIJbx8iCEUOsPV2dL5/q76uRmLaFL5xD4VCnEKWhAyPYprXlq9sFHGnvKw0/aWAoyHBlviphxfot09xP9SHSgZcQdMimpmWPjpURXe+Kkp6f8B+w+L7kALm0=
Received: from MN2PR15MB3310.namprd15.prod.outlook.com (2603:10b6:208:a4::28)
 by SN7PR15MB5731.namprd15.prod.outlook.com (2603:10b6:806:34f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Mon, 28 Apr
 2025 05:07:52 +0000
Received: from MN2PR15MB3310.namprd15.prod.outlook.com
 ([fe80::7bde:10cd:5807:7975]) by MN2PR15MB3310.namprd15.prod.outlook.com
 ([fe80::7bde:10cd:5807:7975%4]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 05:07:51 +0000
From: mylist <mylist@insanegeeks.com>
To: "linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
Subject: lvconvert 8x to 16x stripes performance impact
Thread-Topic: lvconvert 8x to 16x stripes performance impact
Thread-Index: AQHbt/t+j9xRDBSQWUaVbjgCMW+f+g==
Date: Mon, 28 Apr 2025 05:07:51 +0000
Message-ID:
 <MN2PR15MB3310F23F86DEF2C5F76D76E8C2812@MN2PR15MB3310.namprd15.prod.outlook.com>
References:
 <MN2PR15MB3310949BCC9556A62C49CFA2C2812@MN2PR15MB3310.namprd15.prod.outlook.com>
In-Reply-To:
 <MN2PR15MB3310949BCC9556A62C49CFA2C2812@MN2PR15MB3310.namprd15.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=insanegeeks.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR15MB3310:EE_|SN7PR15MB5731:EE_
x-ms-office365-filtering-correlation-id: c79aa8cc-ee46-4533-afcd-08dd8612a091
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|10070799003|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?YxQM0JxIV/ydoeJ8w6TSHUfXFscUBGWLxiMICHJJ9Vx4aKFDTNn9Yoo4vP?=
 =?iso-8859-1?Q?69bmUlhYC+7WDeq5ldIE72C14wb0FhKMHzSVThNlHptuNX9s7TS7mHIs2c?=
 =?iso-8859-1?Q?rhZK6hQdFTlO77qlf8rkMsO0QOeZd0bcwQych0I2CVu4Se2yX1t08RJ+WJ?=
 =?iso-8859-1?Q?zrK6rrGN55MafS+LiDRh2X8SEBR73uDnG2QtDbcl2DI88u8/BaS/zVh8qJ?=
 =?iso-8859-1?Q?EpAFemXHWY2zrTkC2A7mvCzBKY+cE8PhmxxA3oTlmDG79u3GQds840UZEf?=
 =?iso-8859-1?Q?acX0rzzRz9KjPLgpjtxsipucQo25Eerf3MJmGBPMyk/SFS+XYCVknYNz37?=
 =?iso-8859-1?Q?5YoqXe1vruL/WHH816nDyOKiJb0jzMcWCy0bukLbCcNpN9JoA17gxMTO6P?=
 =?iso-8859-1?Q?M8UsFo9V8sml/C0xKrR1rIZQleSthMoQcxQQYzQ/CbyWIucTyGcCDRTN8E?=
 =?iso-8859-1?Q?cgBqAOZ3CxzlY6e5GgGJ0SaSOLaVKmNj4OFTim/Q156R2Ir9jnToIkT0HB?=
 =?iso-8859-1?Q?5feKNyjISEe1eTaWVkTQc1DP/LGwufMJYmKzftf/vTuUzsYnU+Pr++0/mV?=
 =?iso-8859-1?Q?4FJZ1El+qk1YzIBJZ0FJlKWdqHgibQ9se7D+cHG/JSNJcNZ1bnAuIeOQYW?=
 =?iso-8859-1?Q?drad+ELvMrnP0Igv9bFN4YbH77H/dKaO5z1wkMatiqo1X0H2al1NrqaG5N?=
 =?iso-8859-1?Q?4u2K8R6tExLYV6ijkTwqivbCOKP24YESBLsAi2NhwR2kjMFAUilFxoqV8k?=
 =?iso-8859-1?Q?cgVAODyAvO3O8pzIdOKitMJr/gc83SmuiA0d4/PdL51itGGFO2Kni871LF?=
 =?iso-8859-1?Q?p6j4pwMu/ICCASMMTLPi6nDu0mxjXzAOESg/KipS9ktWtknteBHpOGedb6?=
 =?iso-8859-1?Q?kKu7CiDQVn3buux2+1bHmLp8T0MaOGiLgtqnv/xRyez7bEqUBS3t/a2W2D?=
 =?iso-8859-1?Q?f4OiAa7RrBKbsgkZMlMaXN0Y2aKVEPoORzo99RxTkFUZP+kBU5rTAQRFQ3?=
 =?iso-8859-1?Q?AdzmnxuzJw9etrW8RP1sdlAepWDmUwMlDDHDQNQ44BENeY0WtfANlzZAhk?=
 =?iso-8859-1?Q?mWRMg9q405Kf3oUixkb7FLynCqN0F6/IDBob4yW0C5pYm3CBwlBCixoxF6?=
 =?iso-8859-1?Q?yepdA3zZbYVIotDwl8Xe2KZIijXyP8J0fhKtWuRLZx+/6ok6DlNQ+KHSdG?=
 =?iso-8859-1?Q?6AV5QI4GO9LGSFZ1X4fF9aZCfhUXJjlcVOcGB8sBmT0TqBohJIa6QnkOGo?=
 =?iso-8859-1?Q?yc0ohvpBJfu1cYjPMiHYE2iarweq3UJXOpN2LKqOqN1XiPb8wdo47g/Pi9?=
 =?iso-8859-1?Q?+H85o+ID9HvllXQVIKsnelTwKB3W69EtIsVu1r493Hp7xMc2Zh81AkSOcP?=
 =?iso-8859-1?Q?MPES+AwywyfKvTHbIUKCWIW4kjAyp89XSxciJ2Tcu+8+xpslcUcjiIQq6/?=
 =?iso-8859-1?Q?1sRwS2v5CWT40W6AeyccHsU14ya0ibR9umi3jF7oUHgFSt+BS/qvNaTkcF?=
 =?iso-8859-1?Q?5wCQJGDlcASyye/8yQxP1M9xowq5n/GP0ctbX9lm+puw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR15MB3310.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?dLNP+PGcghYn9mG7dUNWSY/novnWvB2EQMcYuwkPdld1EFwp2L5F63HPQL?=
 =?iso-8859-1?Q?nU0wOedar5oyABV37aqhpqKGiWqnSpwWoWCGNU0DK7NGB+zA3My5yjoBD/?=
 =?iso-8859-1?Q?nJACzolI/WJULPPKn51iXDp8kel/6jPT+jENS6bO+mAA24jQwfqkohc/sV?=
 =?iso-8859-1?Q?mJhewLa/wUw9b4qUN/TylrFW7QBKpjnON5gwBFp0w2MYDzlJxZPlJTft4+?=
 =?iso-8859-1?Q?41v8a34HqOc2WC3CcOuPVEk/fBlE+EbyFW30wHPT0Z6Kz/8sZuiN4m6ng+?=
 =?iso-8859-1?Q?F6L4EZYo8kx5StttQRDehenjPbDidGS/DUGgJ6fy5vLo1UqwUtOBY9Ou2T?=
 =?iso-8859-1?Q?kPNAXoo/Tpi/NDi1gtVZKYA1Og6ujErnf5ai4IobHv4MxXEuw7Nxrahk+g?=
 =?iso-8859-1?Q?vWq6yzg6sDnxk8ffZh60OgzHSGCp0A6PYX6dMz6uO7Vzh3q8P4LCsvBc7T?=
 =?iso-8859-1?Q?MRbyVrf80CQ8F6kar1j2N4Q9hM5o3Q/FsSbGRJFpG7iOqZJMarwSSctA0t?=
 =?iso-8859-1?Q?1WnAKR4tl3cs7Qygc78hcgt4RPm/SnpA+eSLfP6G3k7KBNynCtO5gwKXrc?=
 =?iso-8859-1?Q?IZqk38ivql67VRLfK+94JRGIMWTgkKzVW5M2Yz61hP2N6BYQxI7lSF5RFb?=
 =?iso-8859-1?Q?O0h+Zu2Z4cWowLBOpYRkVIB0aqdQ/tB76Cza2N0ofAMjyfkWqgMbdIITok?=
 =?iso-8859-1?Q?qYNPsi7XBBRyuWcmPmRCJ9RXlhcUmmYxVm3JcC4TVDTuaGw4xSVyhydVTL?=
 =?iso-8859-1?Q?Z+VmA+HFAv5RqbPRvlARrFWn+waWeU+mKUqZbItHMuw7c0LsWOvbMr7crc?=
 =?iso-8859-1?Q?n0LgBj8rIDesssX4Za8OgjOaAuyhUeGV8c2w0w53oe2GAr9t4uUs0wvrcW?=
 =?iso-8859-1?Q?3PZLW74rlMFOW9AjHN3p273H6eGQ6DyknjjmtWPTgaQZZUtYwD2KQsyYNr?=
 =?iso-8859-1?Q?Nl62JfjWsBdOkNw5dwGF0z2O6Gsto+47x+Ifitsas9upccjjZ04RUS8+EH?=
 =?iso-8859-1?Q?cII/JD6sztRGAA+bY9O5xAtISETSFQnEbabMnXtBBh4Fc1aIpsDG2eQIJ8?=
 =?iso-8859-1?Q?RfYMYqdAfk2/3E0exn9smLdhgu6uG9AuWxqBQf8jRgwm+qH/xGIHoPO2C3?=
 =?iso-8859-1?Q?LmmzPa1lCYFB8dX436ymg9evHAtjSVK7yP43RxhY7+w0SGigSNomRb9mV6?=
 =?iso-8859-1?Q?U1XUxpnQbsdusd15Mx/0ocEVPJXx6JZEIiXtzm3RWsyZMm+KEkUYlCTXv4?=
 =?iso-8859-1?Q?/uot8pPYd3zDv6GXAMUgN/mcEceWlIi+9ycfNk0qtYlMFphdeagtQOU0+g?=
 =?iso-8859-1?Q?UUP/9et2c6zu2xzs5KvZOA8sOkoJqr7Oe4QexX0FCmPuUDfPvwy7OfDMP5?=
 =?iso-8859-1?Q?4caia66XgL75yBgRedHYKovCUU9YdATwHVWpBbyygrgc5/SsEL5Ej0gqqD?=
 =?iso-8859-1?Q?nNBHumf3fZ55ExNSE5ja887fILfxd6voCtQL6J3ZpHPIQzLScYzJ+C3wtl?=
 =?iso-8859-1?Q?2XbVQ432ybqpveJhiaL6UhnzL42fhbQAXeDJZ0z3KYeFIDgpKvZsDS3E6I?=
 =?iso-8859-1?Q?Xv1HkE0VDSFSObfIDV0h68vICt7LZ4Kx3HiHi5yU///faEzJ21gkFDBzDA?=
 =?iso-8859-1?Q?s9Swg9Urp/+eRlgMNFmi9UyF8kXjkD0UdHjHk3axLFEALN0SwxosbD5RNv?=
 =?iso-8859-1?Q?yLCu8HPGkRo39eP+zC2+nrmzBeCfAprOo0id3lfJ?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: insanegeeks.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR15MB3310.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c79aa8cc-ee46-4533-afcd-08dd8612a091
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2025 05:07:51.7312
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7b519238-797d-450b-9f4f-d0141c4aaa0f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0ZO/SqcWsu39tvq40EYYUc4Sq0Deek7jUtmZzmueTr3irWM7/isrm+Xwo/1K+jl3VU9bxLHLFbBUTqXjpVf/HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR15MB5731

I've been given a task to convert a single 300TB lvm with an XFS filesystem=
 from an 8x way stripe under vmfs disks to a 16x way stripe using luns dire=
ctly off=A0an all flash array.=A0=A0=0A=
=0A=
My first inclination was to create a new filesystem and rsync, or xfs_dump =
but the downtime is problematic.=A0 I'm trying to modify the DR filesystem =
which write out batches of writes every 240 seconds and trying to modify th=
ings before we flip over to it later this year where it will be doing reads=
 & writes.=A0 Normally on the DR side it takes ~40 seconds to apply a batch=
 of replicated writes as fast as it can.=0A=
=0A=
Looking at other options to move it online, I've been able to do "lvconvert=
 --type mirror <lvm> --stripes 16 --stripesize 4M --mirrorlog core" in a te=
st enviornment successfully and then remount specifying the different strip=
e width but have a couple of questions:=0A=
=0A=
1) It looks like it should restripe the existing data mirroring at the full=
 LV but not sure if it is more like lvmraid where it adds stripes and doesn=
't really restripe existing.  Is this really doing what I'm wanting?=0A=
=0A=
2) As I'd expect this is fairly performance impacting but are there any opt=
ions to reduce the impact?=A0 =A0I've tried increasing the queue depth, and=
 setting no merges, etc with little luck.   I also tried using lvmraid conv=
erting to raid5, reshape adding stripes, converting back to raid0=A0but did=
n't seem to be that much better.=0A=
     a) Initial sync increases the batch apply time from 40 seconds to 220 =
seconds=0A=
     b) After it's fully sync'd it still takes 190 seconds to apply a batch=
 until I split it where it drops back down to under 40 seconds.=A0 So I'm g=
uessing the sync isn't the most impacting but the reshape from 8x to 16x is=
 since after 100% in sync the impact is still so high=0A=
