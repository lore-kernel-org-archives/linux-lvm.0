Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2075.outbound.protection.outlook.com [40.107.8.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608002206F
	for <linux-lvm@lists.linux.dev>; Tue, 21 Nov 2023 18:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="1mUVQuDX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gfOnQCgJyxk5fJHG8wWeIE/RCuO1jbGaMNpOFQlqpvj15p6zBN1Y+9ciYmRq1NqkeykpgddDB4NtWm8I0l0NPXbQ5596yS3Hm6swt4kKv+NKaxDjOCzhnLr/V+vsYFFA/v6NHw4QCx2xKlF76AOhRpkpr1cYeEq27D6K5Bql9j2PfTsylSPkbIQt1w6/2+CgqveeLvIBgs3zPRtjF1Wxz0oTq9rZvA1UVFPJM60QRr8wkWP/5uUNIxWmk27fYDEk+fBznbMn0+ZdvLTqJ9tHl0fO1MeZ3HilvzRR3WBnKXvRpo3U18CQnrxcsa8eFQSwm/vZ0R/ujC9RmKeEw1zTZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TWfJErmdFXOhqMxYzQL6YG2E6b1W0bJ1eKeqCm0vJ38=;
 b=D93Dbvh65WjBzjOSENn5+UIID8HnQDOrGrywARtp83zFm0eYukPfyjqgnfqFfET8mqZqBf2e7i08hoZG8Y5k76tF+jxzL4EY1GqEucFgNevjwoFhQE32rCuHFBGwzuW5iXPtI4Ci8B2a7Q+3HpIfwTcfrT35RgNDByNAyq0rb5GQSZVxHRy5L0+U8zgGChfoaLCce9OD/AStb2i6Qy08MBViz1kv22Oh/rds1IowRgZI//XCXmvWPS7Aedg+EMA9wOG4vgNZc5QG9qOMF6rIZwDPLKvm30pdlS7dA9vWlrdDSXA6ztSzAPZmrB6gqaFPuw+wWIfBRxYQPstgd+jtnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TWfJErmdFXOhqMxYzQL6YG2E6b1W0bJ1eKeqCm0vJ38=;
 b=1mUVQuDX1uFGReJco/p97jauk+GlwTqwCe/UUH8KGl44nY7QVR0EU9YDO7e9ze2+McGvQY8Qt8XeOoeCXVqkKcRHswQqp3GpQQvewKY7f6ZmX17G+KnXaKyq9WOE2jyJscURgj9nDb8E+q+7UAjBx2tHQQvrtWbt2pxL8B2U3BlhcA4PvbUeSHRB+Sder10/aUIBHUiRuHl6rstiahAi8vvD0qGv2MQDHPF9P83r+1CLqNrOCR3EqoCVd7VKEyU9PSx4SAytiRV+8aXzQE+p1pchGrKZthI91/lCDNOf5FXn4kmuZfCZOvTwqrld1nOQ7JRCmNcINHs6RQn/9vbZcw==
Received: from AM0PR04MB6324.eurprd04.prod.outlook.com (2603:10a6:208:13f::12)
 by AM9PR04MB8241.eurprd04.prod.outlook.com (2603:10a6:20b:3e4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.17; Tue, 21 Nov
 2023 18:10:12 +0000
Received: from AM0PR04MB6324.eurprd04.prod.outlook.com
 ([fe80::5c82:3111:897d:74ab]) by AM0PR04MB6324.eurprd04.prod.outlook.com
 ([fe80::5c82:3111:897d:74ab%6]) with mapi id 15.20.7025.017; Tue, 21 Nov 2023
 18:10:12 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: "teigland@redhat.com" <teigland@redhat.com>
CC: Heming Zhao <heming.zhao@suse.com>, "zkabelac@redhat.com"
	<zkabelac@redhat.com>, Glass Su <glass.su@suse.com>, "bmarzins@redhat.com"
	<bmarzins@redhat.com>, "hare@suse.de" <hare@suse.de>,
	"linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
Subject: Re: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
Thread-Topic: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
Thread-Index: AQHaFJ3iDFYd3KQH70a+UW68GS9ZyrCFHu6WgAADxYA=
Date: Tue, 21 Nov 2023 18:10:12 +0000
Message-ID: <b5629e054b0fa5f124f93def8d0b878eeb96869a.camel@suse.com>
References: <74b83545-abe7-432c-ae19-814b289a6ff0@suse.com>
	 <6c7699678ceebca58c56aaa769c2a7b9a6092883.camel@suse.com>
	 <5a9061d0f7e287993b127641cc11d7a15d442803.camel@suse.com>
	 <ZVzvUR-_zSTC4sOk@redhat.com>
In-Reply-To: <ZVzvUR-_zSTC4sOk@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.50.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB6324:EE_|AM9PR04MB8241:EE_
x-ms-office365-filtering-correlation-id: 1a7d9772-cae3-4742-c2da-08dbeabd1ad3
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 zSLMZEEzVZ2QMyJwyy10xL6ZSVzEKp30W8ZuwtvK2qlGi11V/cFpat+MnxrXQm30/VoSbBYvR+ogzvrNR9+WR+OHZGArvNycr9JZ8vAnH7lXG05KtHViBb7tzKLuvfAvqIDVARPgKdXESdVmUMtq0ViumW1/jcveJIAW0k0kERx24l2vtfceePlnOkLCA48LUhhtUMI7+gy8XaYHbhPJ+hE337VXw9g6clpJbcPQoyHvY3immQTQzuyhcKjcJqqq2noRWD5xb5f2tYU2CpBTDENfmjy6o88jH3uQw+euJ6grq64kKAUaUPnc7iTmS9CfN31sITceMUMHfxqGTxhrvR/agQiYJCU7EGYOkXloq7e7OOsuoHQMKx1buNAAwV0w1NJmrSVRO8TEZctTTXTV2Qg/T2oGgzUT5nZ9FypoRjDDzsNadu1anqBWMmZD9wfHai7LTjwEDrfQEoP7D3ftuu/yZbUz+t4u9YQHbziJRspLb63z18aJWlqAxLpJRGPtpFbhrj0UTdtFOZzaEmkHVQ07iRQltpr/XjMPLCUJgnxXjyAwdErVyGRpvKYFt8Th2WG5+/vGu4IDP+fkBPCPHBXSrEUmGZhXHxqBHKzJzGg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6324.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(376002)(136003)(366004)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(26005)(41300700001)(36756003)(86362001)(5660300002)(2906002)(44832011)(38070700009)(4001150100001)(83380400001)(6512007)(6486002)(122000001)(478600001)(966005)(71200400001)(6506007)(4326008)(8936002)(66946007)(38100700002)(8676002)(316002)(6916009)(66446008)(66476007)(64756008)(54906003)(66556008)(76116006)(2616005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-15?Q?QneUD6tYWyZ0630FZ2sO66TeSdFF9iPLOLP0wPEPsFzCMKNZG0WE2owJF?=
 =?iso-8859-15?Q?wa62Ue7sVhdNyKaBFFWzoQW1Y/cDRfzLd4JeBF7r7NL1NQTYPXELjsYrN?=
 =?iso-8859-15?Q?Y7lLLQ7Q83kjBeX2/iwFsSu4qzwLVKOcCber7N8SsW4CSTXOltNn0N/eO?=
 =?iso-8859-15?Q?5v2SMv12KWvCClMZ0oVbSZOUgGMogmA0v5B5ADxo+zuAhbLpFQkzvadvw?=
 =?iso-8859-15?Q?VAIhIuP9BcaZzKCyHXWC9+hGHa01DQDGQ5MiXoHl77g6akNIxs+FtWOR3?=
 =?iso-8859-15?Q?e6wx8FQ+XGFOXe1WZ4Z9qsefWK40OqDLr4BvvfLtiw3/7ZTekSc9rg8hG?=
 =?iso-8859-15?Q?N4oVGgehSOfnQwN8xOrwTJT58kyvP4EQGa+dE3MeBY6fgvUdypEAXam9t?=
 =?iso-8859-15?Q?r+2og5AqrE+biLKwXzcvddVkacZja9/p0Rh9nwrpyf3T/JDDVEOX7j73v?=
 =?iso-8859-15?Q?CMr9g5WPJ6czsJH6YuKk09rREZUSCimv0wi75XIKnCdl7Rq2zmoSwkuyN?=
 =?iso-8859-15?Q?yIBqs4mznzKupkYyATFTd4Mf0t8Pyyq5rsHfCIttsDBkSHHshlivyluSj?=
 =?iso-8859-15?Q?xt7dSQrBJuhchUMtk8DWLlskxIo2VLtxlLPNekiFMON5s1fbc1Y1LXG8b?=
 =?iso-8859-15?Q?XbyUPhq05XKs2t9ruybkIMkj2z+zd5ezHrdIFMoD8aDiPni+r/z5ZPr91?=
 =?iso-8859-15?Q?2evmtt2Pho8i3aUbCfxaf756mm5SjwtOMN4TNc7ehvhI4tvPHjnVO9QzP?=
 =?iso-8859-15?Q?oJywrqu1eedoHYa2Dl6VUl53xLFlGB5TJ+PPSKNCtrin5VLU4BtKOsJiN?=
 =?iso-8859-15?Q?3R/qYYZI7pcfdlodtykASg/3sd1wqoUQ4UFzfnu9/jd+DqNTcUhfhFq2c?=
 =?iso-8859-15?Q?ukEnfR0Pma5XPW4AgUTfQ1RoDlFy4ItKVTYsedu/Jm9xPMX0Nz8FwVL/7?=
 =?iso-8859-15?Q?VvLofriDbjZuo7vu8G9RuDoHB09mZAWJ5EOWziM/wZuhEy/3Lx46O+shQ?=
 =?iso-8859-15?Q?oWiJLUNkTaX7D6ioH0O/4iyG0JIuRFtelsay6tC3iMiHV70FxhkIEybDq?=
 =?iso-8859-15?Q?AFKFF/IAX65bvEcLEtbywI9oTTiCLWivXIf7UoDiqsRe7lRZKDS4+G43R?=
 =?iso-8859-15?Q?rujeXvP7lZXG4jsLNsAJ06WrV+JEGBY45G93wCWt3TXiQWTJ3kFNQUENj?=
 =?iso-8859-15?Q?OVbP7mzuDYHGFDGg7KT/uAOMcEh14rYbBefSHCJpYbxeKacqwSM+vtY4Z?=
 =?iso-8859-15?Q?9srGbsWgF++kmpH4RPAwevzgWPVMT+ZLsfF0IpGa36u4kb8EyJrwziZnw?=
 =?iso-8859-15?Q?OEgoFOOAjyALryuGw03KRNxSsWIo6L16B60y3neUZkH2vOoolJ2S/s3po?=
 =?iso-8859-15?Q?nt/jGflSbrXT535FSQajmNvEjR8l7wuW4lzE/i5ReNZwcWMUxY8TYdYwB?=
 =?iso-8859-15?Q?xbPP5RiMfTKSNH90k2S++5V+qKV7zZKRIV9b7xJEVrs+HePT7ZDvvjpIs?=
 =?iso-8859-15?Q?ukPJrgfKEXD6xJdl/4ypot+X80JsT442q9ahL/WyF4VlXJCSiPtYE4juI?=
 =?iso-8859-15?Q?Imp1851goYDxuoe/fQzAlgyXI0XVV9ktfLXL4S94wLPXSmqu7SMZxAl9s?=
 =?iso-8859-15?Q?Vd1oiBTLwIR/ETpJk9airdsz5SIOHxgfrFedO3ND3Qp35E/yQCX6d2uD4?=
 =?iso-8859-15?Q?ukuWdjD4B/RKL5JSDyMyftnG3Q=3D=3D?=
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <E515F82E633A88479D2C374BE1C87DE3@eurprd04.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a7d9772-cae3-4742-c2da-08dbeabd1ad3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2023 18:10:12.2816
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AwJ3YFzEfb8hu72T6vy9BajnPr9xCrSS5LHk+I6gDyqTBx5V23reqyOFGepsoTIBMq3Ga4mxSMr8AQbMIp+2xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8241

On Tue, 2023-11-21 at 11:56 -0600, David Teigland wrote:
> > PS: Here's a related remark about 17a3585 ("pvscan: use alternate
> > device names from DEVLINKS to check filter"). I can see why this
> > was
> > necessary, but I don't understand why this is found to be necessary
> > _now_; the same issue should have always existed if "pvscan" is
> > running
> > during a "change" event for any given device. The solution of
> > 17a3585
> > "worked" for us, but it looks only semi-ok to me. Other udev rules
> > may
> > modify the DEVLINKS list after pvscan had been running. A correct
> > solution must make sure that pvscan runs after all udev rules. IOW,
> > pvscan should be triggered in a udev RUN=3D statement rather then
> > IMPORT=3D. This would probably require a new systemd service, because
> > it's not just "pvscan" alone. But the result would be more robust
> > then what we currently have.
>=20
> To be sure we're talking about the same new udev rule, the context is
> 69-dm-lvm.rules, which does IMPORT from:
>=20
> =A0 pvscan --cache --listvg --checkcomplete --vgonline \
> =A0=A0=A0=A0=A0=A0=A0=A0 --autoactivation event --udevoutput --journal=3D=
output
> /dev/foo
>=20
> That pvscan prints LVM_VG_NAME_COMPLETE=3D'vgname', which is then
> passed to
> the actual activation command, executed through systemd-run:
>=20
> =A0 vgchange -aay --autoactivation event $LVM_VG_NAME_COMPLETE
>=20
> In our environments, this new autoactivation method coincides with
> default
> system.devices.=A0 So, we don't usually see this autoactivation method
> combined with the regex filter, and commit 17a3585 doesn't come into
> play.
> However, when the devices file is disabled and users have regex
> filters
> containing /dev/disk/ symlinks, then commit 17a3585 is necessary.
> (Avoiding this difficulty is another advantage of system.devices.)
>=20
> As for the udev rule specifics, the RUN vs IMPORT discussion occured
> previously here:
> https://listman.redhat.com/archives/linux-lvm/2021-October/026001.html
>=20
> The answer was that RUN doesn't allow pvscan to provide vgname
> (LVM_VG_NAME_COMPLETE) to vgchange.

Thanks for digging this up. You're of course right, passing this
environment variable back into the udev rule is impossible, given that
RUN is executed after the udev rule processing has finished.

But I wonder if this is required. You could create a script that
calls pvscan, and then systemd-run / vgchange with the output of the
pvscan command, and execute this script in RUN. That was roughly my
idea. That way you wouldn't loose any DEVLINKS added after 69-dm-
lvm.rules.

Thanks
Martin








