Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2082.outbound.protection.outlook.com [40.107.20.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CF21946D
	for <linux-lvm@lists.linux.dev>; Tue, 14 Nov 2023 12:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Ot7gqWGY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DcnL94Ew24EvY2N10R6/vU6KUAi11Hcq5ex/uxPmx4uVbzZK4mGC89JaJRwivXKe81Jf/5OlQhU9gBlV/6Ebhdg17JQRK1aQ9DuSMNKQRURyA2XdsKWd1otYIAAeSK3v7zziK0qgtKV+Hp6H8nUcBCIxy0Fp3O754qwpTAmCfBj8obsJtfue/HM8/AvOMHt+jevEJ5yH5V8PruzYc4m4eaTCC+N9MaTuf3H0Bl0V1ARoSp/JzLYKketKpjrE0UqyNRcUPfTOKINJUVw4DKbne7l9jlqraJhDUSdZfAPBRMruK0GPeBkkkg/UkCNDrwOU/ycapqkK1GybLZ916jBieA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gXyi4B2FaSbgfyZKEl6b/LkQiD84IEAjVHOk/Hoj2Ho=;
 b=ZoKIc3jiTZ4MiTRttc3621dpjynB4PSTMlfTDBNG3pf0uAxsENCbkEuTnp9M2sPdyFRayt7FA3KgJieiYm1BVnMZOjqpsN9z+VyinNFzhMnRfl5RDFsUQNZ0vOcXmA8HVWmyY390JjSiJNuRxdY+gmUjhtMCe5giZ/fV4W0Q7R++IXDGiQ1jjsae5Tvl5TO+KG4GvifbFBRjOQgzpvjHk7YqesAN3TctABAp3TUl38gaQjPq+4xBhcEg6nl7ii+rXLkUAGk6acQRK53VLDtKyztMHeDyHnV8zoumducTB2r2y5M/rgTfT/qbGqVaC2et5gNVo+Bb0x5b0VRwZ4W/Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gXyi4B2FaSbgfyZKEl6b/LkQiD84IEAjVHOk/Hoj2Ho=;
 b=Ot7gqWGYPQNo+CvEwMo6Rggp/YEdzUD6wcBSQxHGCPnaHCl68+Mh+mhm1YmOCYJy12FWpJBvij+v9Ce2gUEd2ELZGNjfLaslI4miL9/l9RnbYKapiNwVJGqjhyj2ZkDIorJCRJ2b2AJ1drjf/oEEUMNZ/8FBBwj8DYj+DAHXfpYKhvCJoFw9ai9xhCHT9aIdJbG0bi4APE48wKT5b/n3OCoiwZAJ5l7OLweu8Om2D0EQeEddCwvW76Hb0yblwp6VXL5KnCmdNO05y1dMjmcj4ChfIYBgGBIgEtBtpvG6wGXSaD5lnHG5nQzztDXzofkvi/TnqU0TFXgfo9BxvyO6eg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from PAXPR04MB9594.eurprd04.prod.outlook.com (2603:10a6:102:23c::17)
 by DUZPR04MB9897.eurprd04.prod.outlook.com (2603:10a6:10:4ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Tue, 14 Nov
 2023 12:18:21 +0000
Received: from PAXPR04MB9594.eurprd04.prod.outlook.com
 ([fe80::4dc1:6d84:5501:b9ba]) by PAXPR04MB9594.eurprd04.prod.outlook.com
 ([fe80::4dc1:6d84:5501:b9ba%4]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 12:18:21 +0000
Message-ID: <479fc9d6-4677-4df1-b1d8-7ce3be2bb5ae@suse.com>
Date: Tue, 14 Nov 2023 20:18:14 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
Content-Language: en-US
To: Martin Wilck <martin.wilck@suse.com>,
 "teigland@redhat.com" <teigland@redhat.com>,
 "prajnoha@redhat.com" <prajnoha@redhat.com>
Cc: "zkabelac@redhat.com" <zkabelac@redhat.com>,
 "bmarzins@redhat.com" <bmarzins@redhat.com>, Glass Su <glass.su@suse.com>,
 "hare@suse.de" <hare@suse.de>,
 "linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
References: <74b83545-abe7-432c-ae19-814b289a6ff0@suse.com>
 <6c7699678ceebca58c56aaa769c2a7b9a6092883.camel@suse.com>
 <23d98f61-f9e1-494a-be3c-df9531f4f70b@redhat.com>
 <ZVJtCxq7XeCg_G-g@redhat.com>
 <0bad121644deb8bf67329f111f0ba34ea261e988.camel@suse.com>
From: Heming Zhao <heming.zhao@suse.com>
In-Reply-To: <0bad121644deb8bf67329f111f0ba34ea261e988.camel@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0101.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::16) To PAXPR04MB9594.eurprd04.prod.outlook.com
 (2603:10a6:102:23c::17)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9594:EE_|DUZPR04MB9897:EE_
X-MS-Office365-Filtering-Correlation-Id: 3202e010-ee53-44f0-5a63-08dbe50bcac9
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6js9AHp3Af0Cb15MQARVIFn54z/gKsxTK15YnQMMNlH6IEVbtr6Df/vFsqval0M17w0dW+LMEqVo+RlSu5qcYxpbFNSZgAk7hON0TqBxeHQagUZ62xxOoBD0eFB70CA9W972gZZSvVpLakvEubwvPktHrzIsCjrSvQJzBf2uulZTu2k76p6OP070ZaqRn3RdvdzJGWIvMADegyWlQ8gywbLaOjd5KU8It5GCKzB+hCwOuOA7oguCwZasFBMlcXjB03Tz898Heu2cbsrJenZL25JfiKQk7sRRFa04RiwoqzkCoi8JxN509yGlazl9sCrdUgFh/HEq34zeZW5OKacKIvJA2C3N5LPIwyd26OenpcOJ+iPsCae2zJxCJgQkp7PtFcbi7TaQF0mPvcQyK47aaxhgpTEl3cQKnXPl4shrbqPsay2P1xvsrLEND7K6Z30xIEMpV6wJCz79GH8cutfd8Hg+jHmb2PaQGpi0YTT0N0vfrPoAnUTyV62T+iVzHjTXr+XNLUxG5o+MVccF4eY4x09zepf9Wk6MBBACygeVtsAHuzo7nw3fW4eD8JrN9u8rNPL0blgVJMdmHGbJZzSRj3czW+2hTLI4OMiKloDn8ls4f3g+tWydw4wIJ0D3JeRWzzTsF3NE+bF5KbVnZKIk7rNbbUJg2vP9mqycSoADd6tgwmD0H5OslLdVpx6tsqJo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9594.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(396003)(136003)(39860400002)(346002)(230173577357003)(230273577357003)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(26005)(6506007)(53546011)(6666004)(2616005)(6512007)(83380400001)(4326008)(44832011)(5660300002)(8936002)(8676002)(2906002)(4001150100001)(41300700001)(6486002)(478600001)(316002)(110136005)(66476007)(66556008)(54906003)(66946007)(31696002)(86362001)(36756003)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWliQmM0by9qZnUvZ3RmMWFGbGFmVlM5S1pqK0p1Tm55MVc5aFlxTUltSG9K?=
 =?utf-8?B?ZFhpdDlhY2RDYlR5TTNHZCs0cURHaUllbU9oSENpSDZLMUxPWjZlMi9qUnhF?=
 =?utf-8?B?VnI1QkpzSHUvV21Hb1loa29qSHlQSS84ZVFlblFyekkyamNkeW41YWJIRkFQ?=
 =?utf-8?B?cFU4K24zOEhiSnJMSGZkVFZsV20wVzkwQXFzVExra2NpTllsTVc5TFQ2ZjJG?=
 =?utf-8?B?ai9wR0dZNnB6MU5mNDY1V2ZJaXRsMkx6L3lPakFTTFRFMkRqS0xYeDRJS1hM?=
 =?utf-8?B?d2xBUW05K2JzMEdVWUdaZWlCZTVQQWVnVC9MZ2ZiT1VoSkoxK3M4b01LNWIr?=
 =?utf-8?B?WEZxajg2aTNHVmNodUFiNUlnbmYvU3hhUUxUdVplb09pY3Iwc2RvQ0MyVisv?=
 =?utf-8?B?dDVmb3NLWFM2dlovRXhiYTVOdDFNOWVzcnZ1eThPVTdtTWcwdGIzR1VPUVd1?=
 =?utf-8?B?WkVVM3NzRzBMQVNaTGo0K2cya2JXSmtoK3BoNkZGRUIyNVJyQVFRVkc4M2JD?=
 =?utf-8?B?Vko1ZWhUdkt4a1M2eStjZjNGdkxGZC9Xc29UN24zdHNlcElwUUVLcjlOSWQ3?=
 =?utf-8?B?MzJ1b0FpTEU0OTJSR25Gb0trSU1aaUhIMjkzR3QvNm42QWVJM0hnR0VNNlVx?=
 =?utf-8?B?V1ZDUnBxUGdrN1hsYkxOYnVKVEtWSE1hdk5kY3JVTFRvQ1NkRmV4MytqeTE3?=
 =?utf-8?B?ZnBCL012NDBTdnpDdWsvTHhBZklVSlVDSko5OWVTbUNwT1gxYURYNGdreXU0?=
 =?utf-8?B?OEdoTEJBU3ZMUVBrM1RQaXNBbWFUMHZoSFRocVo5ME0rWkNHeHQvV1Y4V1lx?=
 =?utf-8?B?K1gzMWRVd3dVcmpGMFU5VFJRWGJpa1hnc3ZhWnNvL2IySGR0U1AxTm9GcDAx?=
 =?utf-8?B?N29qRTN5NktzRE9TeXU4aVBDZmp3WWtuL3JGM3VQc09HcDhxOCtLdFlFeGJP?=
 =?utf-8?B?ODIyUGgxUlRMbWpiZlF6MllYMEN1bDNpNEtMRDhoeXY4a3hWTFRpQ1RxS0xi?=
 =?utf-8?B?ZEkrWkxQdEJOWTZ6OTdUTWFjVnE4Q1YzMEp6NC9YKzlHYXYzWUdsaGNiODF4?=
 =?utf-8?B?MDlRbzFWVUlQd3lZbldGNXg4d2VxWjNMYk5ZZmFTdTk1QmdjODZuVXZDZTJ0?=
 =?utf-8?B?UU9nakhEcVl5WkdWd2RDaHdtTnlQbndwY0lkSGxObWtUeVVybWVHcmtMUzhN?=
 =?utf-8?B?SXppODBBWnduY0lTQ0NPUVJZRHB5cE55LzBaK2cxb2VNQmwrRXRnYlZ5d2Ji?=
 =?utf-8?B?NnJtN1hqemF6TTlFU1Q4NnA3eG9Qckt0RUwyWnBRcEhtbUdsWVBCL01va3Vs?=
 =?utf-8?B?RWNGRGxIWldmRThKRDNXRGNlQmtYeGhHVERCNC9QaVQ1UnZEM01RTTdHMTU2?=
 =?utf-8?B?a043Ti96WXoyQWdGUzlQckpkUnZINkhGMFdpMi8ySUtYR3NESVJjQ0JNeHBW?=
 =?utf-8?B?RzA0QnBTbkkyZDdyMndHdXlkVnJKZlZwdkYxL3V3ekZRQUNNeDI1Z1Vhejd6?=
 =?utf-8?B?U21xT2grYlRiMy9lRTEyVUNyV2lxUVVTVE42dXFycTV6bDRXN2ljNWw0SnA5?=
 =?utf-8?B?Nk9tNzl4bkI5RlBxRzNTbkx6U2xGOGFyNHNOL20zclVxUVkyWEtKc21QeldG?=
 =?utf-8?B?ZEpsQkxXRllDdHZtZGNjTmdXVFlHRUtHQ2xyWGovTW9vT1NQdEp4MVBOZFlQ?=
 =?utf-8?B?Q3lVZU9EUVVQVmZDOEtJNGUxaG4rMWxIRWxXdkVsdW9OdEpnaWE5U05hVU5z?=
 =?utf-8?B?M2pZT3MvNGJORmVqTUlCRTdpRFFEN0wyZDU5ZmtnaU1TODVoK0wrZmVIamYx?=
 =?utf-8?B?U3FnOFF0K2dFZ0F0c0ZOVUJSR1MydDJEVkRjQ3ZWUDFXQnlkVG51bGVtaUJU?=
 =?utf-8?B?YnZKek9zVzdTSVZGOWZ2QzROaUJ5ZWM2VjVDYk5ZUjZZcUh4WTdaR2VpSm0r?=
 =?utf-8?B?M3RaMjBmemxVNHphSDZSd3FrRmhodG9xNEVJWlhrMVRKZlhTT0poODB4ckFS?=
 =?utf-8?B?YlNiQzNpK0psbFdpdURSNlZheUFUR2VaVU5mQ0JjT3BRdGNlZlVMN0c1YUI1?=
 =?utf-8?B?WnY5TVFsVlVHWjRxd2dmTUpTQXErWjRMbGk3eW51RlFWTTdhdnVuR2Vla2xh?=
 =?utf-8?Q?yImyrx0gto6Dg+I9EXhQ/czdy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3202e010-ee53-44f0-5a63-08dbe50bcac9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9594.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 12:18:21.3886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nhlx36LFA0UZHLCvHyXg2fJXj6K8I+qo7Iau1Fn+Jb4csCeLYmGppwLlbASEF5h3D92rZBf8Q40sJbSZuR/Rdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9897

On 11/14/23 18:44, Martin Wilck wrote:
> On Mon, 2023-11-13 at 12:38 -0600, David Teigland wrote:
>> On Mon, Nov 13, 2023 at 02:52:39PM +0100, Peter Rajnoha wrote:
>>> On 11/13/23 12:52, Martin Wilck wrote:
>>>> I can't stress enough that this is *the only mechanism* that
>>>> works
>>>> correctly. udev serves as central hub to retrieve device
>>>> properties
>>>> from, and this is how it ought to be.
>>>
>>> Indeed, that was exactly one of the primary reasons the
>>> 'external_device_info_source="udev"' was added. Reimplementing
>>> other
>>> subsystem's logic is wrong because there's always some intrinsic
>>> logic
>>> there that may be omitted. Sooner or later, such approach will
>>> fail.
>>>
>>> I agree with you here.
>>>
>>> If not sharing information through udev due to various kinds of
>>> hatred
>>> about this part of the system, then alternatively, at least,
>>> calling a
>>> multipath library function from LVM to do the job.
>>
>> Hi, a number of things haven't been mentioned or noticed:
>>
>> - In general, it's old versions of lvm that we're discussing here.
>> Current lvm uses system.devices by default, where none of this is
>> relevant.  We can just turn off a number of filters when
>> system.devices is
>> in use, including filter-mpath and filter-md.  It may still be
>> interesting
>> to look at improvements, but the context for that is older stable,
>> released versions.
> 
> I haven't looked into "system.devices" so far. Is there a high-level
> description of this feature available somewhere? A link would be
> appreciated. On (open)SUSE, afaik, system.device is not used (Heming,
> correct me if I am wrong).

In my view, the system.device was introduced by fixing huge number (>1K)
devices booting timeout issue, which we also discussed 2 or 3 years ago.
Relative to the old methods (event/direct activation), the lvm2 maintainers
hope to use system.device unifying the lvm2 boot code.

In open(SUSE), by default, if the user does not specifically request it,
we do not encourage the user to use system.device. Because we think
system.device is a new feature, it is necessary to wait for a period of time
before recommending it to customers.

> 
>> - In RHEL8 (no system.devices by default, and some older
>> systemd/udev),
>> lvm can't touch udev without causing timeouts booting with many
>> devices.
>> Nothing I tried apart from reading wwids would help.  Boot timeouts
>> were a
>> big support burden, and the motivation for the changes.  (All of this
>> added motivation for system.devices.)
> 
> We used to see such phenomena, too, but haven't seen them any more
> since SLE15-SP4 (~1.5y). Perhaps the most important change at the time
> was to start multipathd early, before udev, during boot rather than
> waiting for "udevadm settle". But there have been lots of updates in
> the various components involved (see list in my last post), so that's
> just a guess.
> 
>> - To make filter-mpath use udev info, and prevent lvm from using
>> wwids,
>> you can set external_device_info_source=udev and
>> multipath_wwids_file="".
>> I think this will be an effective way to avoid any false positive
>> problems from native detection.
> 
> Good to know, but that's kind of counter-intuitive. I'd prefer
> if external_device_info_source=udev did what the name says, and a new
> mode ("external_device_info_source=hybrid", say) was introduced for the
> current behavior.

Yes, hybird is more suitable option value. Obviously, the current mpio filter
behavior is not compatible with the previous one. the udev is not enough
to describe.

Thanks,
Heming
