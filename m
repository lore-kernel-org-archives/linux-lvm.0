Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2068.outbound.protection.outlook.com [40.107.21.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8562C1A4
	for <linux-lvm@lists.linux.dev>; Tue, 14 Nov 2023 17:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="tD9mz2TR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CtrGut69BVkzvFRtf1byryi0qQ4R8BGfR7Cs8WOdWD90hC0FrcY8KJnkOWGI6tdWrPH+r+apJsi795oeOXwGEh6OfnfFfuJZgnKhcUCIwWVnttmiye6Zq0oOT8q8EhT4ZqvKJRRZ4tY/TKV3Zm5lzwT0vDy40UYixvYVjDi3srks41l3brnoaJ4LDFbkgPuU1qtLri3xw0KER8VRRBsJwZ5FrO9tuf2YarO7robqUMXgISHpn+rf9jq+E1zrHVdU8CLVZICFH1qVJzn1MHyXJnQx+KK1lOG5Xp3uPBphp4NN9NgErjPbSrALqS2IVsuH1t5syd48fUgBUMjyQd5fYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SIgZBD/yqZekdq8bGrJJiacOXeTLUqiPZiAWOm0fdOQ=;
 b=RRMjPSd6xtgYhcCXYdwYeya57KwqTDNLURmFRj6/rsyV/ua4HF9MYyfp3qVmTvdUyTmt8Ifrxt92cLmb5yi5wewu3onZdjcYkWXHOPtePq+VmUme09ZAJMpGtNeBuG48LPDYc5cAR+CQWj/2V3iGGPrRMIudYCaEvY/jNNkQmhOwzyK20dZ7R9TNrAaTqKONgTf3WWR8+UNNsc6QDamAEp6HXZa+v4gdCesrtzOTJ904AN1/wGPJvyBtID2Qb+JmGlu6nKECeakfpkvUcBdDi+KERYhBT2s+bPHLVu4Lghdf/JGapXnQwrL8iVapsOCsothYiiFP6duh2yvgCc1xZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SIgZBD/yqZekdq8bGrJJiacOXeTLUqiPZiAWOm0fdOQ=;
 b=tD9mz2TRI6TX8GKCaUJmrmBHG/7UPmCiaLTS5unsXij41inQT5ppHY7R7Q7XKquVSYpU90E7Zrbfli88tXC7thJoRqTWL2yRCBrbtZVO/XFwIYoZDXV3AOxUH1xCQtD/t3R2xVcPnDxn4lv+/xqax+rr9W/NXVoyz19E0ssk5IOBmCvVjZMiHc4Vrvkd2uxaV+tZnpikxfGOHel1177uEqhNpnH/02TlJf3UROgSnOf4Mymn5haBp88/BWPGezS395zPe77aaLOKmfBCJrBTHgxWx8L6YD4SKUaQjtY6YGcaHiZW1y0povNLV+Uc2W6h93zWKySTmcWstfr+Puv0tg==
Received: from AM0PR04MB6324.eurprd04.prod.outlook.com (2603:10a6:208:13f::12)
 by AM9PR04MB7651.eurprd04.prod.outlook.com (2603:10a6:20b:280::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Tue, 14 Nov
 2023 17:48:46 +0000
Received: from AM0PR04MB6324.eurprd04.prod.outlook.com
 ([fe80::5c82:3111:897d:74ab]) by AM0PR04MB6324.eurprd04.prod.outlook.com
 ([fe80::5c82:3111:897d:74ab%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 17:48:46 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: "teigland@redhat.com" <teigland@redhat.com>
CC: Heming Zhao <heming.zhao@suse.com>, "zkabelac@redhat.com"
	<zkabelac@redhat.com>, Glass Su <glass.su@suse.com>, "bmarzins@redhat.com"
	<bmarzins@redhat.com>, "hare@suse.de" <hare@suse.de>, "prajnoha@redhat.com"
	<prajnoha@redhat.com>, "linux-lvm@lists.linux.dev"
	<linux-lvm@lists.linux.dev>
Subject: Re: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
Thread-Topic: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
Thread-Index: AQHaFJ3iDFYd3KQH70a+UW68GS9ZyrB4SCEPgABPtICAAXcNEIAADYEA
Date: Tue, 14 Nov 2023 17:48:45 +0000
Message-ID: <38458148cb14bf398aa3c6912842ddda79b81115.camel@suse.com>
References: <74b83545-abe7-432c-ae19-814b289a6ff0@suse.com>
	 <6c7699678ceebca58c56aaa769c2a7b9a6092883.camel@suse.com>
	 <23d98f61-f9e1-494a-be3c-df9531f4f70b@redhat.com>
	 <ZVJtCxq7XeCg_G-g@redhat.com>
	 <0bad121644deb8bf67329f111f0ba34ea261e988.camel@suse.com>
	 <ZVOnoCjNmOYToBpt@redhat.com>
In-Reply-To: <ZVOnoCjNmOYToBpt@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.50.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB6324:EE_|AM9PR04MB7651:EE_
x-ms-office365-filtering-correlation-id: 02468719-e14b-4db4-7aa2-08dbe539f343
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 V4RRgg0jVR+vCqlUk1QT5A7n4w4uMGwsCZ9JsToYwWkzRyTk6UimCFm/SZBis4WPkfFUVH5iQ+OXPC+jWUVu8aBQ1aoGaiuIejzoXt/ZgkTzkQowl6YWsRCTJzu3MyPnS9pEJfdFU44FE67OQd7SSDJC5C1dmmTrpVbBZTceUKruEhqjwwvIuNGDCrG8ex/dMo8oilF4coIt6h9IY49avUZTrsLYt7ySTuKbLuacksdMf6ySht52BlOoJq+kyCchsb5/LNJ/wXaodbo2sMNWWc2B5T7jOl+lzYGAnnWTuONfxexpoKD/Vk6ua3qHCg6BLZXhjft8kvviogf/3Bju7woJothnNY15g03IT3OkXelnDqHVNhp53+GEr/7wvdtWgpMUqsR3X6eODIEKM0HS0kVnlYyJyKDJMDon0Zy+1USs179cJZ2Jk9ry4/P/luEdsVJmRU0wpcWAw/5DMFKn5fy7nI1R0c6uYJ03kwtLmkg7vJWvTaQT+A1Cyi7BmCv+MAjZ43aIRstnzGRAH1eTfzNr10t5GauoSU6emWog5uvFXupfkV94xYdfZ4hwjGrcgqfLE4vi3hyD5W7AzFpE+vZKhhK2kDZSowFqm6TYYJ3nZ0YFAGbAijX3ShYfnFOS0x09oDpmVjISZ8ofak6cSA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6324.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(396003)(366004)(136003)(39860400002)(230922051799003)(230173577357003)(230273577357003)(1800799009)(64100799003)(451199024)(186009)(2906002)(966005)(71200400001)(66446008)(76116006)(4326008)(6916009)(8676002)(54906003)(64756008)(66946007)(66556008)(8936002)(316002)(478600001)(6486002)(66476007)(36756003)(41300700001)(86362001)(5660300002)(44832011)(4001150100001)(38100700002)(122000001)(2616005)(6506007)(26005)(83380400001)(6512007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-15?Q?17+3BIejqz0OcywMe9RmplyjKFm1fTyYA1IjrW+boypjPe56igcqLxYKW?=
 =?iso-8859-15?Q?bc/neQzgYNn+P9EiYqmaz6+ZXCLNrv/p7T4kmVLW2SDyZwLIof3yR1dIX?=
 =?iso-8859-15?Q?AWW6UMGEUhXSdYRgMt83rm4liVpumau7CIiakGgKqcS8+h4ymZb+KIIGG?=
 =?iso-8859-15?Q?N7CUW28J+VaxKq1iOiTE71Z1DKeNA7lXIhAheb1G3gAqEg+Weu09NDIPv?=
 =?iso-8859-15?Q?XPpIOrMhc9SV+ZiPrxSJcVj2Oi0OrsZZV0evcCOOFfV8lHWDbIICPLMc3?=
 =?iso-8859-15?Q?B571rQRCOkq6JSYmQ2vg0KNVStcrkCKkrfbVBPXYbTlkIRys91dF0xvQO?=
 =?iso-8859-15?Q?+h7T65o+oOCnzHcFH0V54gJFXZ958hYruA+mV4Eq6NcqV3OdnSNqifw1V?=
 =?iso-8859-15?Q?jd7ohWltibVbLSEbHY/z9m3I/IsrErtIvkKWrak4S4KpyiemMIDY1/6kN?=
 =?iso-8859-15?Q?P/NK+lkur2KdnMzh+ovtZC8GkqXUvOtYZqMCWmDerFI2KgDMaZsKrcxKj?=
 =?iso-8859-15?Q?mkjLLM6mAen+niXPG8AYu2iIamg+pNncsjDGAyj+yrAH25Y0G8QgV1RuB?=
 =?iso-8859-15?Q?ojsOos4mFa893ttr6ymB/aSTANIQ9LN826iB4cjJVtSjUk4dKRvNu8t4F?=
 =?iso-8859-15?Q?+46DS1QqM8e8Q2uuZxuolNPNKTIUVAI+ceOP/jqOiG1mxIM61IjEJoJf2?=
 =?iso-8859-15?Q?oWZsRFHTqT0d8sLoeq2koJd5bY24A+m/+sRKiRQYhlvvXtpv+IFpCnvLJ?=
 =?iso-8859-15?Q?Ez/wI1mlJUA5450oHev9pu97rjUPTHer7V4HwiqjBFm6gp+YE/9jut6rR?=
 =?iso-8859-15?Q?xT07RG22dyBP1VkCctbg+FC2YJqqGhk9ApkDw7PgOwG2zqpr7cw3oGJaJ?=
 =?iso-8859-15?Q?ciflvjgY6LjTLqjFPa9bvFWdCQjq2RXww6RoSNBdDULH0aaUA5Wh420TK?=
 =?iso-8859-15?Q?ZEtLbwAbk9QDar6327o78YEHmHyESAenxNcXqiGm1tvsNl1bRo/Iz8AlI?=
 =?iso-8859-15?Q?13qtS4Etk2QoUvlp465H5kF0wdJhS965IwG4btjSvf3ulMB+6w5w+ZXUW?=
 =?iso-8859-15?Q?/1PaU24Y5fexj9WNxg0zopWdyh5rf/7BqLufgsOZQMajdZtu18Ao5sg3c?=
 =?iso-8859-15?Q?pSdJS3WSP6R18nqcKuAd1luMBFxnLI9Ne0L9AEoK5mbTEfeMpDFKqeBtS?=
 =?iso-8859-15?Q?Ilpzu38dNIIwKIjguI4VZA7CpWwRPq1Uwa91RxWjNwcEwoZfQPVebEpyi?=
 =?iso-8859-15?Q?DNZfEq2XJvQ+P16F2eyGftLxSVdWWZGeYk/P9DSSo7gsxthWZL343RZtV?=
 =?iso-8859-15?Q?CDO/WlbYQFRTl6JS9Sa0P+gjwMxtMVJG1IScl9zpNt6uAmLy0kZFtQiNh?=
 =?iso-8859-15?Q?tKxCo6lMCgMVncT4n7rxhRjWYgZ/Tq0vYqCSo/wscRO6Tx6AQLb0hAXYe?=
 =?iso-8859-15?Q?ekxvj/8/sTm7kJuoxXOEiKlQfFfC3kxGay91SbpO8/ScYPRPTvkwtOWm3?=
 =?iso-8859-15?Q?JxqCaJqBtKD6Z8IBicNIYRmGKNYtY4Wb6SmGpQr49Kcnomh7Y7x0s6Hjl?=
 =?iso-8859-15?Q?IIgLJCnamh569/5n72Wn57tHGLpeTomcZolSIs9NSk/BKtlkf5UYMkRM5?=
 =?iso-8859-15?Q?GnWMkh/x98hNTeqUuR5Bp5IEms/PaPlAalS6q4k+zdTLOBuPWPwZSoFXT?=
 =?iso-8859-15?Q?gPJTlsHazqy/kX1pkxji7gVzlg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <7A0E5C949DE3254192E0593BBBD77C28@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6324.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02468719-e14b-4db4-7aa2-08dbe539f343
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2023 17:48:45.9788
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZCyBEBWbRZiJHLBlQd5U1vWnk/2gRb0ROyb3XAvxkAdFkBgXZw+hsf10+hxX6FOcKG+v/xszdkFhgdnMR/+23g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7651

On Tue, 2023-11-14 at 11:00 -0600, David Teigland wrote:
> On Tue, Nov 14, 2023 at 10:44:02AM +0000, Martin Wilck wrote:
> > I haven't looked into "system.devices" so far. Is there a high-
> > level
> > description of this feature available somewhere? A link would be
> > appreciated. On (open)SUSE, afaik, system.device is not used
> > (Heming,
> > correct me if I am wrong).
>=20
> https://man7.org/linux/man-pages/man8/lvmdevices.8.html
>=20
> If that's too low-level let me know and I'll look at writing
> something
> more conceptual and introductory.

It looks allright.

       "If the system devices file does not yet exist, the pvcreate or
       vgcreate commands will create it if they see no existing VGs on
       the system."

That basically means that every new installation (where PVs and VGs
will usually have to be created first) will use system.devices, and
thus disable use of filtering and traditional-style multipath component
detection. Right?
And if a user wanted to use the traditional way of determining devices,
she would need to delete the system.devices file?

> > > - To make filter-mpath use udev info, and prevent lvm from using
> > > wwids, you can set external_device_info_source=3Dudev and
> > > multipath_wwids_file=3D"".
> >=20
> > Good to know, but that's kind of counter-intuitive. I'd prefer
> > if external_device_info_source=3Dudev did what the name says, and a
> > new
> > mode ("external_device_info_source=3Dhybrid", say) was introduced for
> > the
> > current behavior.
>=20
> I'd also thought about adding a new option for
> external_device_info_source
> that would mean "udev info only", rather than "both native and udev
> info."
>=20
> The complication is that external_device_info_source applies to a few
> different kinds of device info, not just multipath, and I doubt we
> can
> apply only udev info to all those cases.

AFAICS the other use case is MD RAID, no? I think that LVM could rely
on udev for that as well.=20

> =A0 This means adding another config
> option... not much different from just using multipath_wwids_file=3D"".

For multipath, external_device_info_source=3Dudev used to mean "udev
only" until recently, unless I'm mistaken. The semantics of this
settings has changed. I don't know what the situation was for MD or
possible other subsystems. I'm fine with calling the algorithm "udev"
if the respective semantics are still the same that used to be called
"udev" in the past.

> > Can a distribution set multipath_wwids_file=3D"" by default without
> > undesired side effects?
>=20
> Yes, it just causes lvm to skip the use of /etc/multipath/wwids for
> checking if a device is a multipath component.

Thanks. I'm still not happy about it, but if we find no other solution,
I guess it will be ok.

Regards,
Martin

