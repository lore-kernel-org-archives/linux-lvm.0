Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2053.outbound.protection.outlook.com [40.107.249.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C787E
	for <linux-lvm@lists.linux.dev>; Wed, 15 Nov 2023 05:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="hpaFMKtC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LOjVCSOvhJJy1DY3o0wfI/MXz03vCOSjIbDBed7sNZBJSSEHXRo14F3R9a10ax2Sk+zYX7dBRf/3o9ioIE7J4EUY7W11J2EYXb2yr0cC/bPZnixPnpw1+GFAhMdHViri1WXQMDmTDl/uhyGHr85fynPQ+dSnZIyYmJHPpm5XiN52d1UEf3erA37Wc/geiWNl4736kAyPqiLQDmzz40mW5qapnBplE7Gvg3WeJmmfemJ/qjvcWVQMYoBGsZqQOuN9BGlmmAaxmhc7wiJN87M6JB4uaSkc8HDiZtygR+33P9Qjhvgy0W0BHarGLJNFMob7CUH2XKnI31nFPTFcm/JO8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQ1HqoMA9nNF19frMR6Oecgk7Hl9aTXPXOSkYy7BpKE=;
 b=ORL5oeivyQ/meOmffwIIyjL0TwcP0qanM5HK8jL+dARXrDmF2YZSGt0xOW+aHAYV8BamJCsB0nmui2Fm6QvZLrOHxGa5jCTPiVGct9nCIwEBlENq+8ZwFikygSUqqA9/iCQDroYZJykoJCsmV6R+QSx5LOdJfzN3xe8L5bLZkIBc7VC/P93iUV2bVOPCgA8wteZ07EBSrZTTdaD6dcZXWnLocgP67Pw1WvIH/z6/vsgTSCBQe7zqH+3cDb2SlvOtHOjssatHqCj7k8u3CsEanWy/1LutHYdJohOQ97nTms3utaX/ZnhdZmiycNuI76r81XcsZoiUdfnb7IG6IkRiqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQ1HqoMA9nNF19frMR6Oecgk7Hl9aTXPXOSkYy7BpKE=;
 b=hpaFMKtCBOgOTDNRTB91w2vR5OVhPTGkwhW6s15tsTiwwS6GOoEQqdBEo1WkOWs7rwgYp4tPYkSnApFIlYHeftqgpYFNZwZ84p6pYVHFmMfMXCUMbZ3CJnHJoU2DYas1H/36yTnXYH1BGqC4wHN4tnuUARSsBpUfVuOt0RUCffaAFkQJe5DKQMr7V30fq/XtManaxnTiCW1UP0+Q1UTc0D+WHwMbutkC3YTSyhHfKofIKiDcgevNmbBAzmuPpDltfvnFcFhz9VtjAPe/67F4qtVo30wC2ixqJ0SwQylfz5AcrFk3d5HWlkvO95/y2TLfToLg+uzx6ORsACTSXKqT0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from PAXPR04MB9594.eurprd04.prod.outlook.com (2603:10a6:102:23c::17)
 by GV1PR04MB9149.eurprd04.prod.outlook.com (2603:10a6:150:24::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Wed, 15 Nov
 2023 05:15:23 +0000
Received: from PAXPR04MB9594.eurprd04.prod.outlook.com
 ([fe80::4dc1:6d84:5501:b9ba]) by PAXPR04MB9594.eurprd04.prod.outlook.com
 ([fe80::4dc1:6d84:5501:b9ba%4]) with mapi id 15.20.7002.015; Wed, 15 Nov 2023
 05:15:23 +0000
Message-ID: <f4a4eccc-7093-4804-aabe-7d8dbcc993e0@suse.com>
Date: Wed, 15 Nov 2023 13:15:14 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
To: David Teigland <teigland@redhat.com>, Martin Wilck <martin.wilck@suse.com>
Cc: "zkabelac@redhat.com" <zkabelac@redhat.com>, Glass Su
 <glass.su@suse.com>, "bmarzins@redhat.com" <bmarzins@redhat.com>,
 "hare@suse.de" <hare@suse.de>, "prajnoha@redhat.com" <prajnoha@redhat.com>,
 "linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
References: <74b83545-abe7-432c-ae19-814b289a6ff0@suse.com>
 <6c7699678ceebca58c56aaa769c2a7b9a6092883.camel@suse.com>
 <23d98f61-f9e1-494a-be3c-df9531f4f70b@redhat.com>
 <ZVJtCxq7XeCg_G-g@redhat.com>
 <0bad121644deb8bf67329f111f0ba34ea261e988.camel@suse.com>
 <ZVOnoCjNmOYToBpt@redhat.com>
 <38458148cb14bf398aa3c6912842ddda79b81115.camel@suse.com>
 <ZVPd0NyOgJjRTzvi@redhat.com>
Content-Language: en-US
From: Heming Zhao <heming.zhao@suse.com>
In-Reply-To: <ZVPd0NyOgJjRTzvi@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0052.apcprd02.prod.outlook.com
 (2603:1096:4:54::16) To PAXPR04MB9594.eurprd04.prod.outlook.com
 (2603:10a6:102:23c::17)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9594:EE_|GV1PR04MB9149:EE_
X-MS-Office365-Filtering-Correlation-Id: 3933abae-135c-4048-deb6-08dbe599debb
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dDIawmQJsiAH1VVSus4zYBmsCeZk+VeTPVxjMSLm6jKsIGbHeulDXkq6PEK+ZSMnZUuTK78m/uAXP/CCvnMBv6b0XKO20Q3O/vEQRVkeEWSGBcMZ7w8X++FcdNL7QSQkKTVk60G6JJd4Rw625uqWkclAlbMjXtPtqegfymguDhJvVCNZfj/BOhJz+RjlZ6SJ4UJuQG0r5tstETbCsoRPn3sCg4fuvPBE6c0mAM1arHtth6DVgfb5c8O9mdaM2cw8A5w/hQ0d0nIYpBx/sN248IN6O0xagJ9SREkpnesFUqinhKY/yJR5G88Hs3eKtUF8PX4VDMNyIVP+qis6PYbFC9oypXKXqB70NwWG/7TMteMLZ10rPR3e9AFFTY8fNoWdztEMyQ86xObYDH9b/IbztCSb0V6ShxiO6X5RciMwFy9Sa4XQXgGpPoDAsbxA+9o7OAC8dvBf6+v6GeoDTOapqBlG2U6s7wxtIPxVoY/2Pisqy1M0S6y2Gp3WmB/0ZPQ7ZWphSLUSWaDS/iiKMluJFuNMCwti2EBuNMewKkayAQHF9DPBoU4kqB5iOBO3l10Ymam3OK4hQObsuqRSQLD+GD32IQUax2PMg+YZAfEr3IxpYKIPZD7V8xOPuPCnJV4953fE2euwEbOROoGn1mvj1g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9594.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(39860400002)(346002)(136003)(376002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(6512007)(2616005)(478600001)(6486002)(31696002)(44832011)(36756003)(4326008)(8936002)(8676002)(86362001)(41300700001)(2906002)(4744005)(5660300002)(66946007)(66476007)(66556008)(54906003)(316002)(6636002)(110136005)(26005)(53546011)(6666004)(6506007)(31686004)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K29WenE2UjZCMEdMc1hyMHR3b0RmMHJIZDdoNGxIZnl2Nko0alFqUWo1QzJ2?=
 =?utf-8?B?Y1k2WGN6cWZFcTgrSE1FU0ZTeGhEWE1leDFFdDUzL1JxZTNtWjV0Y3FYUkpY?=
 =?utf-8?B?aDQrWnNZQThBNFBDYzlCZXNlRnN6SUNuTk9vSUNsakZMQnFQaUprWDlBamZN?=
 =?utf-8?B?dmVETkFCV1M5MU9MZXhNSDFKYzRTdmlmbENRTFZ6dWZZR1d1TVJHZkNwUEVX?=
 =?utf-8?B?LzdnQXVoVysvZFRlTEk3OFlweUJyNjN0VzZQUkFNblg5TTlDMThKemNnZDRn?=
 =?utf-8?B?SVZBYzNkUTRkTFdyNVlMTXdYcFBLTXRjUVVnUi9ES1Nzdmd2T2F3SEwwOS9K?=
 =?utf-8?B?OVB2WEpMZXZ6WXZNeEVyWm9Pb1c5QXl5UGx5MFRzL0kxeFB6eHA1ZkcvN09J?=
 =?utf-8?B?K20xK21BcGxkWVhHOGVnNjRtRWFvTG5hTHlSaEh5Q1lQYW9TU0pyaHRPMStC?=
 =?utf-8?B?aGpMNktmZUpUaEdxRnRpejdQK092aHZoeVFjMzhGVHNjMjBhZVZicnJKeVI5?=
 =?utf-8?B?SEJTZloyZTVsZVlNTnZ4cklBaVArY0VMUytQSmVIZUFOSVBwRG81cW1iQUhs?=
 =?utf-8?B?ZGZ6bDI3SDdvWlpUTHFWS25WWmRUdVBlS1hnRzB2ZFlCYUhVZ1RhbW0yS3JJ?=
 =?utf-8?B?L2xobVllR0ZUUnc0cERic0k5SHVEbnpERS9zMDhnNHQ3YlpheDVSSU9uUWoz?=
 =?utf-8?B?WnR0K3RmN09UMVdRYkJJTzFGZnpJRkFYSjFLYmZZUWtFSGlBZ3UreVNFS05o?=
 =?utf-8?B?ekhKa0JPeGhYeHYvVjRyMWNQQTlGWXlncHAxTFN1OCtNVVVKM0NhTjZ1Y0JE?=
 =?utf-8?B?UWJwcVgwUGxHbnh2WjJIOWQ4a1FneWk3WTRuT2dTaFdJRlBxbVRqUVRRN3kx?=
 =?utf-8?B?WVZHVExkQTNoWUxERFFGQWRNK2tjbGl5K2I0d1hKeDFKRC80aVMyalhSTjAv?=
 =?utf-8?B?L3lvbkRTK2JPdDhUWU1zc0twUUFQQXk0RjZISUpuaGU5d2YyZ3ArOS82UVMw?=
 =?utf-8?B?QWNsMUwvSnZmZzBSS3A1NGNjVW5vNTV4c1JuSDZwYnN4RGZKc0o0dXVqTlRi?=
 =?utf-8?B?WFZWdjlaS0QwRGZ2YmNlMVBiaERNNnBzSytYdFltcDB3YUFPNm5oYnhaTUFm?=
 =?utf-8?B?L1o0d0RRQ3pMYUZFc1pQenhQL1FiWnVGVnprVTJjRldSWEVuQ3JMTFlHRjgx?=
 =?utf-8?B?cXgxbFhwRjRubVhQbGNQSzJNdnhnbHFFazgvaEt1b1lubElONkNtdHVFNHRR?=
 =?utf-8?B?M0ZWK1h3eHpXQnJrOUpZZ2dITE4xUTJ3M215YVlsM0hJMTFGeW4zcTNTejFR?=
 =?utf-8?B?QmJLWGVCNmxYQVRzVVprdlNHaklseGFYNExXQnU1amFFakYrRmlQK2ZkWjV2?=
 =?utf-8?B?QWJrWW4yU0phVDM1QWFvNTRSMUNoOHFiSmR0MjcydHlCY1l4am90cGRVNHJB?=
 =?utf-8?B?ZkdtZXhMYlE4TmxWRXZ1NE5vMlBDUjEyOEZFbCtGVkNOU0I3VWgzUzIweFJn?=
 =?utf-8?B?Y25RdEYrWXdKai9iQTBHR1lGUjUwZmxqV0xKbUNzZjNiTno2dXoyYThpbEVE?=
 =?utf-8?B?eEdueXNzcHBuLzVGbWh0QnNwcitvbEZhNW1iSmU4N25BbnhscnhsVXA4VnY3?=
 =?utf-8?B?NU9KcEp0aG12U2w1OEkzenFTbDU5ZzBYWnNLdzJzcDFONG9tVDlON3NLbUxY?=
 =?utf-8?B?WWFNbk5DT0FUczZuT21hVVZoamtSY3NCNnl6M1BDK0liTUhTVUZzNDZXRENV?=
 =?utf-8?B?ZHRKaFV1Z0Zhb0t0aFlySzUwdjRxUUsrbmpOQTIzVGZDOVZ4ZjVhYnZaM3Bq?=
 =?utf-8?B?VFZKYWVIZ2NBc2lTaURpUkRNMWwvMGpjb2hhZi9IN3NybWFpU2hUK1E2REtx?=
 =?utf-8?B?bHdEV0VteHhOdUUvczl5T29CMzFnM2c0em95a3lFZ05tVjRNYU9Vc1RwQ2dv?=
 =?utf-8?B?SlJYd1hWSmVac2VxM1U5VFM3SDZBeVhaeGJKY1RXZWpyMEFLRVd1VFA1cGV5?=
 =?utf-8?B?c0UrNEY5NUZrb0EyMnY1bjE4cEZKb0JSWU9DUEljSnp6dGVVNTBsYVNKdENu?=
 =?utf-8?B?M2FzZkVtOEVDM1pUdXQ5cGZHbE1Sa2FQbHVWaVRHaGIrMGM1ZmJZODcrWlAr?=
 =?utf-8?Q?Wn2erHTGNIX6liGy4q803K0o8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3933abae-135c-4048-deb6-08dbe599debb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9594.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 05:15:23.5385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zGcN3qexbsDBbqwSWKn4wTZ9OCqM1yAlidwMPxsqH7K5CLo8y64FJ4ObCPv2KoF++1VKitV381XEf7NwUEe7sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9149

On 11/15/23 04:51, David Teigland wrote:
> 
>>> Yes, it just causes lvm to skip the use of /etc/multipath/wwids for
>>> checking if a device is a multipath component.
>>
>> Thanks. I'm still not happy about it, but if we find no other solution,
>> I guess it will be ok.
> 
> Could you try multipath_wwids_file="" and see if that's sufficient before
> we add a new setting that's nearly the same?
> 

I did some test.
1. multipath_wwids_file="" failed boot if without commit 17a3585cbb55d9a15
    So empty value is not enough, or some code logic changed which makes lvm2
    denying multipath dev.
2. using system.devices, machine could boot successfully.

Thanks,
Heming

