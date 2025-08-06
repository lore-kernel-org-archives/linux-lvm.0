Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11022081.outbound.protection.outlook.com [40.93.195.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD3917736
	for <linux-lvm@lists.linux.dev>; Wed,  6 Aug 2025 21:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754516998; cv=fail; b=L8+xaPDIHIKwOUxhVe88Pn9OWh8ppdIFFfDFslsvcp+eE2pG1hIIlW40u21fnjLSTuHCVGf4uGpNzgFUP31YluBJQRVqdVTDwHoMeqp0GEURdZHRow6n+7h7TEWjNEM0GQFFQDNURZzwN4QYuUWoJEGE6HTXbFzRDhEPg1nxNwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754516998; c=relaxed/simple;
	bh=Ko3SfW353FsTNytTCW+Yd2m+845H6TJpYe4YnkM/g8Y=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GRQqg6xj2xYXUn+ySIbk6LviMCZr50bVBKWnCy2lECbA/E33QzcVPQPIH53m4Sr7i91FmNk61GpNpAdNmMDOY8w4AVeb/045Rnx/gZtU2XT/Q9XybdWkQxxCJk9k1r3n4eqnQLqo0YWvPNs9eaxsD4sC17gecxyHTcsqmJ5miNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com; spf=pass smtp.mailfrom=microsoft.com; dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b=Y3MRm2XT; arc=fail smtp.client-ip=40.93.195.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b="Y3MRm2XT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v582HnhQoNXEIX3SCCJglXlY4b5nK7HNuQ2Km7kU/Jdk9EAtGV3O3F5G340gqXLnlAEC6c15L2k6J7HXuzH5HrbdrBx81YBGBH6VEa3jcXwk+ZfPPPBnZNBUakPL6zZ+in5pPaLl41eiZKmKmO7llxRSI9ebELQUGNbvZ6mzX+JlcJDQm71Ayawlc8F1nFIdYDuKc4UlAW0hsi1izk+bCslGGAurX0y1kvOzC1tmWWZQE+Gz53jD2VsvUFF/c/1nl3p9BFF7yNrfrIMnvBO0BChN3hrgl3X+YT/Is22wsVWxmQPJ0dguRpexOxCjbKFMWb3FzpNSCB4jVUmIDPSsWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ko3SfW353FsTNytTCW+Yd2m+845H6TJpYe4YnkM/g8Y=;
 b=Aj/7iqYHBfffEjWtw63KkkXTt3pNnN5oszfzoacgIR/dcat+M0HQc3x/dBQcVYDh8tGusuJGwX3kaepfCCq0KQeVLee5Dq5ZMHF+0UZTIXfbNiYeG0FBtfAR2VZOmfaDKLWswWWHHkSMwDUtdD1rvtjW5STLnX+csRvomHwQ0DZre3ZU9rAlfYI3Fs5BkJf292kdp0BuhgeOouBjR7+x9lwnyuqHD+3ccG+5piZpMclGhITUfQYKHAiegU7DLmx662yBqgtk7ZgPhkyKBO6nmonIW7fPWNE7qCYcqXZeQyWUoFDi+83l9sG4Q+ZtJiKpBLUGwHQ+SCruangCPDJg1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ko3SfW353FsTNytTCW+Yd2m+845H6TJpYe4YnkM/g8Y=;
 b=Y3MRm2XTYcZ3hyaIrG3VP8mT2QfVvkGVmNriitl1k6Iop/6VF3tSUqtgm5GM2lESQ3oWCw6IvUt6l6HIJsZ1A60sBwvrN/edJI+8kLUpIiIcoorCPG+5cVWpuZgI5G/pPlLXlZJvdFP9gs3reyi8eE6DpQ7pxE0UPzvYUzLKvWo=
Received: from LV3PR21MB4252.namprd21.prod.outlook.com (2603:10b6:408:277::16)
 by LV9PR21MB5167.namprd21.prod.outlook.com (2603:10b6:408:2ec::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.8; Wed, 6 Aug
 2025 21:49:53 +0000
Received: from LV3PR21MB4252.namprd21.prod.outlook.com
 ([fe80::95b4:c3a1:279:6ff]) by LV3PR21MB4252.namprd21.prod.outlook.com
 ([fe80::95b4:c3a1:279:6ff%3]) with mapi id 15.20.9009.011; Wed, 6 Aug 2025
 21:49:53 +0000
From: Joshua Long <joshualong@microsoft.com>
To: "linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
Subject: Question on Computing VG Capacity
Thread-Topic: Question on Computing VG Capacity
Thread-Index: AdwHFfDPqKIjEKqUTba23qKwFu9gHwABEZmQ
Date: Wed, 6 Aug 2025 21:49:53 +0000
Message-ID:
 <LV3PR21MB4252594D194D3081D1E50411C12DA@LV3PR21MB4252.namprd21.prod.outlook.com>
References:
 <LV3PR21MB4252B491DCFB134F050577BEC12DA@LV3PR21MB4252.namprd21.prod.outlook.com>
In-Reply-To:
 <LV3PR21MB4252B491DCFB134F050577BEC12DA@LV3PR21MB4252.namprd21.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=7783cc73-cae9-4554-a405-a540f9417656;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2025-08-06T20:15:16Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR21MB4252:EE_|LV9PR21MB5167:EE_
x-ms-office365-filtering-correlation-id: 543078a4-d88b-463c-670f-08ddd5332d13
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|10070799003|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?tDK1xx904eAruSXLr51mw9nmOt0EkRy3otC7a5gGIUp2byhmTtmb+m4fR1?=
 =?iso-8859-1?Q?7+8H+mf4LfSB9q5/D7fbxZj1DjenEeBFr6bBPXZk60tJMzjx3mefMSbv5v?=
 =?iso-8859-1?Q?zjBqH2xqb7ULH7ZFAEqxliUP6ej7xzHPcDjYIcMt78DZ60b9mnDCG0Y3Z8?=
 =?iso-8859-1?Q?JrQ/cXyOap6nzVCvtWzeLL6Vn/CsQ9fjYxKvt7PSkwI053WdLN8jkFh8dg?=
 =?iso-8859-1?Q?ge1qCHg+qn70mOZGszmFSDVQodAfQPCNgZT4ZXPbReT32IDslE2Kdoz93N?=
 =?iso-8859-1?Q?vCTNSnhN/eKtgMl5/4LHlwP+Sbdx2fm8OydR2CkZ4fX2Om7Pn6jbF5yQ5M?=
 =?iso-8859-1?Q?5dFS7QN3zr/IfxziNn3nPOx8xkOObrheNe9peuwl+m0XWM1bArOu4Iza1h?=
 =?iso-8859-1?Q?KfirZ7fdSDKvISP3GJdUvPPdOIonh+LgbJYXZD+cclSo7L+8zI/B9XT5iP?=
 =?iso-8859-1?Q?sQqsMi6Hl3dnLeR5PVfaxhpjTlK5GG24lOLQNHyohP4lBUIFXFcjrNU8Cg?=
 =?iso-8859-1?Q?Kv7dEq3t3dGcWvTuk53rhakdfUUR3xs21RInfK4SQ3Xs/nPYeIdEZfVidR?=
 =?iso-8859-1?Q?ziwNwe9f+ONvnaDK+nT/CdfLoLFnUHuIVj1rvjO+d/R6902j1bK24oWhX1?=
 =?iso-8859-1?Q?lhKjeUDspcGTuWJ/KzNuyTKZsL+QyZ33Eb8LxMORSz4mJ/M4kv/Xj6Hezd?=
 =?iso-8859-1?Q?r2mx0KQTDY/6wzOa18YaYPedMflt6EQeHuo8Tue2vZlXJL4dk+0uVTH+4x?=
 =?iso-8859-1?Q?UNhVvdusOSPAs7E/Am3Bkn2N4TtLriLnuMAtUCY5ZidYX8RD9ieOx5m5Pb?=
 =?iso-8859-1?Q?Aqhv0oqtQFQL3dbjbVzo4+EkYBYPe4La+bNHEACvOMHw2nElPT89/mr3Gz?=
 =?iso-8859-1?Q?T6FGqE3m3P7/P0t9OvD8u3BMaBcZY5i2cl3afsMXcbDTtm92C8zNCg5/f+?=
 =?iso-8859-1?Q?8jgMEIRCSo5QAeYFMD+/Ua2iIdbPqY2scz/Lski/s76REH7QpUNh0j/OUX?=
 =?iso-8859-1?Q?fAga7dv0gCXsQ0cT1RlW31kYpP9omtPOZGUo978dPp/w50slTP/3wYH1jG?=
 =?iso-8859-1?Q?/ds8BY9oaGw+gGcvtYRr7N9bYgJUK5FnI4qEDentisYuenEEPRjTlP0wzs?=
 =?iso-8859-1?Q?AFVO971IsbypuMs9WhowrI27NFHCNvGaB9GO5bQB5rWo3CobBekXnwPX4y?=
 =?iso-8859-1?Q?BJNo6pbyNU9mamv51YZgLpdEvUu/GyUC4DZ0shy9aHkvUxVxUAIezm4UoO?=
 =?iso-8859-1?Q?Lz5ZgM9Uf9JRQkJAyUnE49mwhSgkMPepg00k5/xdYbSs55Li/lvaZo/cfJ?=
 =?iso-8859-1?Q?exZcNePcmD4T0V7UXOGKmeUrVPYN1ZQy8pC38+e3qUVmVzfdH/rGNabZ9j?=
 =?iso-8859-1?Q?gcDC9vt+OakSsoQPlGfH6oIwiH5HwsF084Y6ZQJilvZBEaYCz3PUBxW7i+?=
 =?iso-8859-1?Q?RkWMDtICCPJq/sl3JhYYtG6YmpkYd42fV8rHLzn9wExwdcN3t+Z5n0QCIG?=
 =?iso-8859-1?Q?ZLqPUE7wm/n8EM5knsXTXSMZOLO9Z+W82K8N2Qsvutfg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR21MB4252.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?SIcp8pXbQpT7bf+RbqgnKxpISLotqWcccaBQbbms4E7s1yhBbuoccCtvwN?=
 =?iso-8859-1?Q?Ry8KmvxTLSCUHvNIANadj4q91U4FlVvpjQ7GZf5hAtc570HYQvoIYjUGtx?=
 =?iso-8859-1?Q?UCRrusPw0hbGO/WcWthcVxOdXClTyDOzaTlef9e1FmrfM/fCEEC0C7bxvL?=
 =?iso-8859-1?Q?pvkzsRRtYvoGYAA5ufopvEPbaNlcVFI2/jmgojEY9jfbD9LD1MQNFIi0UL?=
 =?iso-8859-1?Q?D5bEgwY96k3YTUC4mT5X2awaidYXWumU9/gaMqzwIY6iIvlSAOAMy2mBCk?=
 =?iso-8859-1?Q?swYGSMWSiODqKBdigIziJXWqd4NnhvM4zhZ7zYxTanjE9eERv8tIfJQfPc?=
 =?iso-8859-1?Q?bbMfr8iShxkkZ1ieILUFX6nEVMvso7kLPR2ESIn1BVKkC9inELAQuq/j9I?=
 =?iso-8859-1?Q?di9tfnlM5QD9bdruKEJAO/BV6MdJp0SEEuyW0Tduzc6woJ36dYHI3YuSve?=
 =?iso-8859-1?Q?wglcHHljCmIOTz7Yj5COIE5s4XY6vRDnaqfydr/cUIrF3d/XgGZpDB2o1e?=
 =?iso-8859-1?Q?bQkl+HJDnUj+0otd7nUeABf/Bl7N3PgnG1K+KSxWxH/YU9bALRzNGASOpa?=
 =?iso-8859-1?Q?LXVx3jS3OZyDxdYThxlMzuGJi3myf4KFYCUikRHT3xXefj0gf4objAg6ME?=
 =?iso-8859-1?Q?aBBc3y08eXqn17umJLS9t45SaC9WMiISGDNbC3K2fTGVxzCkKmzEK7UqjE?=
 =?iso-8859-1?Q?jfBU09zBbkLpBvXfrRowiBzRIfSwB0PDAWKZL5IKYs19DD98AtCRB6Z/PC?=
 =?iso-8859-1?Q?mGTNIdc6mW3cN8J3zHoUTf0uBFk/mLWflO0Pha3e5ToJJmYmEohtH8rX36?=
 =?iso-8859-1?Q?T/YGv6KIhBuA7TRkGVxiUWueYqZkJkgQMq6FYpPYuq/iaz5xZeUkqM8zLd?=
 =?iso-8859-1?Q?VPv6VNL22061bnnF8BFTwaLc1fWrTzSJBwpWPRc+V5DsiHFJwJefL821A/?=
 =?iso-8859-1?Q?4iEXOnqYCIEtoRkDOc3JAkoUgBoWkwCBrvvXiZiyNfThP5B23YQUiDL/tj?=
 =?iso-8859-1?Q?nptNnTDI+FJxi2sE0PD4y2+fUjomzcy/7+4n3wSuit1tpOCsU2QPeIpcOQ?=
 =?iso-8859-1?Q?taRAdkil1WpNoVkTp5BsWJ/xk0YhGaz5QS/op2/w60vcdhYFVwS0/LqG2p?=
 =?iso-8859-1?Q?rSMDioZ0LF9ysTCikNZW6AWueBR53xfMVUYyq3m5JgZ6f8trP7b6pQLeyJ?=
 =?iso-8859-1?Q?K8vkesxWZmHZcmymTUAjUGIDmfortLGcvJSTSkaFUsB4OHlOfRDcDeDWO9?=
 =?iso-8859-1?Q?KcXBRrgXH+8SnK03gE6dIh7pWi3hHXn218gvUiqgCUeACtfJvr+1Hporhi?=
 =?iso-8859-1?Q?rE0PmsjinvBZIWe53he38iEtny0Yg03xCFUj+lYtOKTZHWpfMFzUSPeUvN?=
 =?iso-8859-1?Q?odA8cX2UjrQr0/21UaJhsdKcfqwRzmelEQHfAyjORVTkxlSZHyvZgn1teQ?=
 =?iso-8859-1?Q?UozvIZyowbu9eHBQFRX78360U6CkAXW/7rUscl1Vj7O9mlE5PUmDu3rh6d?=
 =?iso-8859-1?Q?QV+zzrONx4PH5vmLx7cq9mppWOvkcU9pnEsaiZGVp7oDwnJO74b7ftRaxF?=
 =?iso-8859-1?Q?APbn8z+yB5XRkMg89zIidyDAQ03skQ6/KYhICCFuyVAQ5brap4XK9hYIWf?=
 =?iso-8859-1?Q?pM5P1lsVuoNdZ9gG0eLkfai34V7ycaRM09?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR21MB4252.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 543078a4-d88b-463c-670f-08ddd5332d13
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2025 21:49:53.2522
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /puV7mB5PSzlSITiEyQrriAmDTkl1nUQ8oIWNnbCE22eDwOlTG+eK03gkIarB9WJ8xrl1yNvRrt1GnF3PL0zkU4fAe3Wg1EKNw/RTki8Frs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR21MB5167

Hi everyone,

I wanted to reach out with a question regarding how to compute the exact us=
able capacity of a volume group, based on the disks that will be used,=A0wi=
thout actually creating the VG or physical volumes.

Specifically, I am looking for a method or tool that can help me determine =
the capacity accurately beforehand.=20

For example, I have a VG with a single PV with a PE size of 4194304 B.=20

We have one disk with 1920383410176 B, which equals 457855.084 PE.=20

The capacity of the VG with this PV after creation is 1920378863616 B, equa=
ling 457854 PE.

Is it always true that the total PEs in the VG will be the disk capacity di=
vided by PE size, minus one? Or are there other factors or metadata overhea=
ds I should consider? Any guidance or suggestions would be greatly apprecia=
ted.

Thank you for your time and assistance!

Best regards,
Joshua Long

