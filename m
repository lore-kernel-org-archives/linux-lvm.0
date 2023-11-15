Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2045.outbound.protection.outlook.com [40.107.21.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456989479
	for <linux-lvm@lists.linux.dev>; Wed, 15 Nov 2023 11:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MPajRxXd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h6p7oZgIy4qF7f/sKY+V2rk8in8y/axsL9ZH8P0D1WcKeFShxU78qgOEK6ZKLZwi7vBvMU4U5hp3Y/UA1oucG2G/jUVSBTJPZ3CKqQtsNKQGwZ9ym1rVGVkit7tXdaMrzwhwJDLOg4wtlqwLHMtvrGGMVV2EXVvwBHtCRQI6lbpq4gf8y4Cy0kSVanIBXTTcaYmDS2vKzvagbVNtmDApC8m6nIeKxzVm23u6DRv0nf/BkbxeU4izNxl5rnjTUpIKxaWD8o0sWFfCz/aF1v35pbUiBVnA81NITzR6rD2QrMhll2b9Zjlpuv19dWVkeqNdGl5DqoQO1osd2U8TAlMTIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I4kSgesyXMmzoSFTk8DMWr+5RfMCZ5vKsDLi4or0Kxk=;
 b=AyrrwFCLdh3i787p/musWC6aOV0ELvHEw+RWeuXgeEGH+kiK9gjhnZMz2gITxVHXVQoAyPUa3r5fGESFvI+doLg+YKWJ2K1CLRpp4gSqdbEyoZsy5VOOCdE8gKb7PszA3i7yEMwNINokcyqJSZZQLxr6+CFAEXVPfW7PCX9mhj4Kk+DfkLdRgciyxPlsfVtM6fZJp/KUem5f/jrK9u+5kNclAhgBJaJNqMax4lmaxsyMLYVBUG0SumhGNL6sly3TRq2+fKOxMYk0mTM8nB6kbG94YVvhTb/+HeqIyVRcd+PrGIdAc+nLMRZXh/21IggFtPJUnvYWvqrd7KkMgV3qdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I4kSgesyXMmzoSFTk8DMWr+5RfMCZ5vKsDLi4or0Kxk=;
 b=MPajRxXd3liyNchczs5SUWNoXfLWJLqyEAIcvilgSPIlQhrpGpNQGmJiiGYI89EQnhYr67qEXC5zbcb9cB+WBMXo9yJG/t1A44/t7nOU/GtUFI/HZNznJSpQUP7eVBhNTiV1OtSt1gfDEHpJq0dKzn8H3Hki9KyN7x4PvmY80m053mnJIUDCd+gQNFf5ILnDID9nPkR+M5m5MU/acOzGwL9KxsIZ2NVH94K8twI5aoP3oDfpJMFrlnDfnuz1jALvMyEqGVVlHpGEXqT8d4a1+75oIAWMWo1INrJEBIZa9k4YulRfn4+wk0S8pvCBSuC82ds5zYivxM9Dbw530ZzqjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from PAXPR04MB9594.eurprd04.prod.outlook.com (2603:10a6:102:23c::17)
 by PA4PR04MB9415.eurprd04.prod.outlook.com (2603:10a6:102:2aa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.18; Wed, 15 Nov
 2023 11:37:16 +0000
Received: from PAXPR04MB9594.eurprd04.prod.outlook.com
 ([fe80::4dc1:6d84:5501:b9ba]) by PAXPR04MB9594.eurprd04.prod.outlook.com
 ([fe80::4dc1:6d84:5501:b9ba%4]) with mapi id 15.20.7002.015; Wed, 15 Nov 2023
 11:37:16 +0000
Message-ID: <037a0ba9-76fc-469c-ac96-11981391903b@suse.com>
Date: Wed, 15 Nov 2023 19:36:57 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
Content-Language: en-US
To: Peter Rajnoha <prajnoha@redhat.com>, David Teigland <teigland@redhat.com>
Cc: Martin Wilck <martin.wilck@suse.com>,
 "zkabelac@redhat.com" <zkabelac@redhat.com>,
 "bmarzins@redhat.com" <bmarzins@redhat.com>,
 "linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>,
 Glass Su <glass.su@suse.com>, "hare@suse.de" <hare@suse.de>
References: <74b83545-abe7-432c-ae19-814b289a6ff0@suse.com>
 <6c7699678ceebca58c56aaa769c2a7b9a6092883.camel@suse.com>
 <23d98f61-f9e1-494a-be3c-df9531f4f70b@redhat.com>
 <ZVJtCxq7XeCg_G-g@redhat.com>
 <177c4b2f-3b4b-44e0-9391-3df007cafe36@redhat.com>
 <ZVOgmGx-EIpMF54F@redhat.com>
 <194d20b7-e3b0-43d6-95e1-1a7d56eab506@redhat.com>
From: Heming Zhao <heming.zhao@suse.com>
In-Reply-To: <194d20b7-e3b0-43d6-95e1-1a7d56eab506@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SL2PR03CA0010.apcprd03.prod.outlook.com
 (2603:1096:100:55::22) To PAXPR04MB9594.eurprd04.prod.outlook.com
 (2603:10a6:102:23c::17)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9594:EE_|PA4PR04MB9415:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f8a333f-5208-40c3-7c51-08dbe5cf3795
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XceqVNe/vynva3TntyQwdNqvg+xA5PQgdhFaP3LJeHr70/HWeZPL/NbN8fjfNdG9RsJnRwjyeqyXhVx9t3pNOYZujKmIkabfPEtvhBdi/2Rs6rZTPpsp9nuUIdQr2aEEjLCcE9Ku/8MezvpB8G1EVkTFWFZN3FVAINnOvPZNnG57GpSUhUOfj9YNPyMvpFMwmRXeL1yWkXSrymo09xUrXW+DH9O6Nw1+bV59OEFMNIqkAUkbEZ1tcsrnTrka/fsWPYw5HM7fp8kZq5OxGd24RSIQqB4WT0PPjPMWezYtUpHS9CLdBHgYFcsR7logRTA9n17nvXsDEejEn74lDC5yM8EkOCu8Gg497YtrQul/qRg1P9KDB5dTDA+kYI3jawO5DXE6u+shz68ZgcDvU9MJVN4KEehskoMecDNUazb9ZYlJTYHe3W1fwv7q6BCxlS4RgZg9ztx6FTOSPubUykjvQEFeL5JXOaEVXR0V21ecP2XjH0rayCQ+9kNqMDywm8UxQabZfEse+JAk9Ad2/EAcZKlzHil9sPrapXUmQrQXWsweDZoW2enAP2LgR5Hl4bCkRHsLBeoI+F0TJ75sfwRoTXOJBjVO5oNaxn4XgvV2Szr1V3aWIeYrmFaAG6wYDs+4w0T0wATYZvzQMMOIyEZjEA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9594.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(39860400002)(376002)(136003)(366004)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(83380400001)(36756003)(26005)(6512007)(54906003)(44832011)(4326008)(5660300002)(8936002)(110136005)(8676002)(316002)(66946007)(86362001)(53546011)(31696002)(41300700001)(6506007)(2616005)(478600001)(2906002)(4744005)(6486002)(6666004)(66476007)(66556008)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEk3aVNyTkdnTTk0SjgzK3JQRDF3aHdRVFd4NVpVcU1JQWxkdGd6ZTFEajds?=
 =?utf-8?B?Z2ZEbk80TGdsVjBFaVYzSVdJelUwd0RnUStBMEJ3VVdZYlJhSXBOUWN5Tzg2?=
 =?utf-8?B?cUlPeTZ4Zy92UzgreUdNRlVFRmFIazQvY0M5bmlyZHpHSS96bk1xSGF5cUJs?=
 =?utf-8?B?MklZY2VHNzlkNE9MTUR5MHhhSEN5R1dBMjhzWVNxQW9ERTlPZG5qTXNVL3RJ?=
 =?utf-8?B?Rk5KQkhqVlE1SDZGdWwvcVZHTGgrNEt5NEh0dTY5WjFIbEpHdXRIK0hraUlQ?=
 =?utf-8?B?aTJtTDVxQnpxTGt3c1M1alAxWWxsTjlNMjYyQlpNNG5oRll5UU1xWmJrSGpm?=
 =?utf-8?B?akdoYXJZQ0cxM2s3dE1Ta1BvQVNqbFhNZWx5YWQ2eGlpSVk4NTJLaHNlQmFT?=
 =?utf-8?B?dDNGV0picitVKzE0SlNHenJXZGUyRjc3V1h6dzhpeGlyRzJFSDFQSnVpZDZ3?=
 =?utf-8?B?SW14K3FvNnNrNEMzNTgvSUErVEhhcVBUd2V0V1VUTEg1SXhia3hDTzE3azRh?=
 =?utf-8?B?cWVlSDNoZklKcmdHWUhvd2pNL3J0QjN1VkVNRVgrK3M5RzQ5ejV3QVRvQ0Vq?=
 =?utf-8?B?SXpNZUtRVlNMTkpodlFlWUtNVEpmQ0xoOHBpWmNDaTBJQ0NPK2svcHRnZzlH?=
 =?utf-8?B?N1IxVTJKR0lQY1NiT2tEam9yL1VaNm5WMlY1QmlNWWEvd2JqMjR4VVNHaVQw?=
 =?utf-8?B?YWh4bHJ4dFIzRTd2R00rSTJDWjdVUW4xNHZjSTdlSzN1WTNDVEcwcWJya3pi?=
 =?utf-8?B?eHdpRkFmZDhvUXdXUjlOYlpFdVViR21VRlVYRkkzM2UweGVvWGVza3I5RnZk?=
 =?utf-8?B?MHFWVGpWM2pRWlFVY0FEVjhEUVdMWnNMUjNDQTF2VEx0N3NXc1dNb2Z4OXY5?=
 =?utf-8?B?TGRSUWRiTWpyaHNSemFrVVVJODZEaFBaa29hVThwVUMzdGtNZk5QeHNPUXg0?=
 =?utf-8?B?bmxPMUFFbUhmZmE2YmQ2Y1dGa0dTdkYrVHovOHkvK0FsWGJPVHorRkg4SnAv?=
 =?utf-8?B?eUdXR1JpSVBmMGZaWkJHWXlIYUdUR0dNQUJrckpsVGFjMVp6dFdRem5VODdZ?=
 =?utf-8?B?Wll2K0kwNTVLR2FpTkZmVTIzRndPYnBxY0IveGpreThXWjFVRnUra3JMTzVZ?=
 =?utf-8?B?K2dVaXhHQ2lxY0dlelFJQlp2K3d5YWVOTGU2dnJzVXZDZFNnLzZvakdhemFt?=
 =?utf-8?B?c0xaT1F1dDRuMDhTM2NRaDRGNytWWnNOMW9EQUJTTHQ3N0xaVit2QUN6a3dF?=
 =?utf-8?B?VmpQRTFVL09oK1J1K2t3OGlYZXJNY2FJTFRVZnpyNjgyRS9pek5WdzU2aDFR?=
 =?utf-8?B?UFJub1c3NkNDcVg2ZVFsVHVWaDJPNS9qdW93d1YvRzQ3MXkxZittMVlESkV2?=
 =?utf-8?B?VVdZMFNxYmtweVNwUlNHcTAyTXRUdTZsazJ6TlBJa1NBTndBVXdNYThvTDh2?=
 =?utf-8?B?elpteVF1YXloYTAxL0ljUHRwWlN4T0tjY0lmQXZZNXpURFFDaUtBTGZFLzBW?=
 =?utf-8?B?RENmQXJSN2c3bXBOL0xmZHJ5Q09jWTRxRjNxRTVTbXFEUDhvaVNyaHV1cENF?=
 =?utf-8?B?V0xNUGpuRGMyd2RNdDBRbldnTzlJam1NUWZVYmlBdzRwcUY1T3FSZ0M0Znd5?=
 =?utf-8?B?MEN3NGVxVEdmdkxYL3o3YlpVekg4WU1aZUdSMnR0Wi9Sckd6S3o5RWI3Q3Ro?=
 =?utf-8?B?WXZzbldoenBTWndhR1h1SWo0VktqNEtpdGJTS210bVM1cUhzTmVrazd3YlpS?=
 =?utf-8?B?R3hOMmtlaWVaZ2xBanZONUpDUEVKKzI0OTJKSi9Iejh5bHhpV0l3U2RzVlNi?=
 =?utf-8?B?c0pyeldoblVLUDE1R05LTGtDdU9EZlFjcWtPMTVVaVp5eVNRUkdMdzVjdGtZ?=
 =?utf-8?B?dUhtMk9mSDk5bHpGaVRwcmo5em5XSjZabnUrcDhGNGdIbi9peWI5RG4wN1lG?=
 =?utf-8?B?N2pUZlRieTN4TnRPSFZsZEkzejgraXg3YjZHSm5adXJQNlIxNnZtM3ExQjlu?=
 =?utf-8?B?am5rcVdBUVZ3TnF6L01hS2x1ZHFTaTViZ0xsbkxFd3RuMFdObUtZU082ak0z?=
 =?utf-8?B?WWZ4Z1lHUW94TDRLRUxUN1k5WjI2ZWJnTHdRVnNSTHZ6VWMra1c3a2NrR2VW?=
 =?utf-8?Q?q5/sMLSQgSkzZOva4fSn/Jhkq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f8a333f-5208-40c3-7c51-08dbe5cf3795
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9594.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 11:37:16.0612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ce9K24YW5Voi8UPmsnP9gabn4gKhso7sGeROfzOYTJIdBV3yS713zNKSjLQYqmzCBB/ArHuYyYkadg5cwg+AUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9415

On 11/15/23 16:51, Peter Rajnoha wrote:
> On 11/14/23 17:30, David Teigland wrote:
>> On Tue, Nov 14, 2023 at 08:55:39AM +0100, Peter Rajnoha wrote:
>>> On 11/13/23 19:38, David Teigland wrote:
>>>> - In general, it's old versions of lvm that we're discussing here.
>>>> Current lvm uses system.devices by default, where none of this is
>>>> relevant.  We can just turn off a number of filters when system.devices is
>>>> in use, including filter-mpath and filter-md.  It may still be interesting
>>>> to look at improvements, but the context for that is older stable,
>>>> released versions.

 From the lvm2 code, above description is wrong. By default, system/devices is
disabled status. Because lvm.conf option "use_devicesfile = 0" by default.
under "use_devicesfile = 0", any pvcreate/vgcreate/lvmdevices/vgimportdevices
won't generate/create system/devices file.
If my watching is correct, part discussion of this thread may invalid.

@David could you confirm my writing?

Thanks,
Heming
