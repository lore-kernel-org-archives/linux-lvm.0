Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on2040.outbound.protection.outlook.com [40.107.14.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11A379D7
	for <linux-lvm@lists.linux.dev>; Sat, 11 Nov 2023 12:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RT1Ew27R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=msBXrFdx73CR2KAuYkzGTJYKkBjiQu/b93qEkSEBa9akaKdOcV5dhwv4K8u2UjSh1JH9IdjaUWDAt5ti6BAHTzfTjxMxkyUf2LWVYOb2i4gyNXm2yETFw3Yn3RTLIpAbnC8jspMzvNYYW/MoJeej893haQGZPbFWLeKyGOgWnlAho0NeGbIunRR8O03HuwUwKQlHiu6WHBIft4ILskQExfHGcSZkVvat2H05b1GtbzxnalwYgrAtZlEA7JakLNKCF5p8mos8FDf2LcLy4OTfq+8Vl0mqyT/+7zRkCKsfLsPxQ8elFFn85d5RYAHzy1YzN9y1bT1o+0PQhVL25zwBxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iPvHi2QpgFhWa8SlZqEYw57oggCFXKkyP/G22oqRxE0=;
 b=VFUrjKDlnoXHqv3aVUOw9BZubQitOdTMlJQGRUG1P48lhon/2swim7y36tKvDJ9a4CUKOMlDg0Z8mhdYB5nI0D1HuYZJvKoAytSMRLXq+62ia0jz/4Czdg9zaJZ3zTUD+2Tw8T7y3rf1h3rSc39fsqCKN/NUthsCdKMxmSXVJknumBAARb0/y07TVO+za0XTHVnY2WHpiCKtO+kstRKQJYKgrevXuvZxw1mNLEXjGbsSQ4vzqgWYKrrSRz2yJ7KB85O0SvLHD/l1LkIlYdKfNfTl5eMlwUN59ixkUnQ/lmHV226Z1TKT3QUR/wR0aXap4hKC972a/96yQvmRbaUGQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPvHi2QpgFhWa8SlZqEYw57oggCFXKkyP/G22oqRxE0=;
 b=RT1Ew27RneLKp1ifPeU6HrDceU/XDUepl4zBBtntqDvWReoswCix4wkEraGY685Ygccc/lWAinPxapY2LrZkEjmofLy1SYEWpTcv4ejULpeIKq2r/iBpGWW5BGN+1AMExa2ulrhMNNCEUdgRiX3yl8LG+fU0jR+sCgmSm/DrG1ryzYdDmXriEXK8LBOunbfkxmEKtqfQ9F4WZ1c2WrzJ35Xnr4Gmcg1Yc9M5Fidn9ePtU3Di+fBqNd2lhSLg4/xqTLF21OxmHDZhrd1QZfMaXo5mOKpNrTqV9ps0iiuGARv9mtpIx6e9AvWI/bk+QT1RI+gk/DQMCzhEm3BuOzpfmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from PA4PR04MB7997.eurprd04.prod.outlook.com (2603:10a6:102:c9::6)
 by AM8PR04MB7460.eurprd04.prod.outlook.com (2603:10a6:20b:1c5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.13; Sat, 11 Nov
 2023 12:52:09 +0000
Received: from PA4PR04MB7997.eurprd04.prod.outlook.com
 ([fe80::9dc2:eaa8:ac00:d290]) by PA4PR04MB7997.eurprd04.prod.outlook.com
 ([fe80::9dc2:eaa8:ac00:d290%4]) with mapi id 15.20.7002.012; Sat, 11 Nov 2023
 12:52:09 +0000
Message-ID: <74b83545-abe7-432c-ae19-814b289a6ff0@suse.com>
Date: Sat, 11 Nov 2023 20:51:57 +0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: teigland@redhat.com, linux-lvm@lists.linux.dev,
 Martin Wilck <martin.wilck@suse.com>, Zdenek Kabelac <zkabelac@redhat.com>
Cc: Glass Su <glass.su@suse.com>
From: Heming Zhao <heming.zhao@suse.com>
Subject: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SL2P216CA0202.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:19::17) To PA4PR04MB7997.eurprd04.prod.outlook.com
 (2603:10a6:102:c9::6)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7997:EE_|AM8PR04MB7460:EE_
X-MS-Office365-Filtering-Correlation-Id: 72d87792-4254-416c-1af6-08dbe2b503f4
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I10O+JI4V1UQ2Y9FYrnT5vSCqfvHk91lwp/Wf0MOzelOvWoHUN0e+S72W9myau9Fh0PMHqC0rJv/ctNiDM2/tAMEVhYfdAXWgjSFdz7aK9ea5k/g9ZAWngX2KsyxnNB1NE6p6CHY/dmqNU10Vhx2esbk6LjFvb63Qg1wxe3k3KtP6IYIQHDLHtIAzxzbhE+VUs683AQAsFGchR6pnVeuuBlSRaYT2awc+QGYAcqEDXtb4Ju/LpCFlvmPMVEmYLVNzAGir2hGJbiuvcgUZJOSgpVUDqBFbg1gN7158/DmYV6cK9G3XnB7uwR4o69ALxycc/q7mhj+bHMgQ+8WMbhUNmXr1Xg1tVUENLRC4m708H+vLoWPDvWNnZThR3DI/WCgvaF4hLXIOGgKQf9j6/k/Z9uxXwiSM3GBxcjLvfoRx/pBA5kqW2O6O0wPzxkgVJnNdcKUVuGrrFkfjQ2G+o2JA/95UuGu7k7cyDS4pf5G48GfDCBdw+bJlyKa9AKXM8GeFrKP0O0cwKO2gl2JDtt1WCG5e3Fat73CDOxkVwUNvx+3+jBt+iF80+B3PJcoDzgL4TUGVkp8NtVZ7u/NHT9owFMzhtaIzem3iGE7+2xA206l26V+YVHxOiofoSWOuLZmy7yMp9Fr+QiNoeUUIhzzf2v42Z1gJzo3u53OiSKg9voUTPGe+4IcPkr3RELwqw2/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7997.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(136003)(366004)(396003)(230173577357003)(230273577357003)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(6666004)(2906002)(6486002)(38100700002)(31696002)(86362001)(478600001)(316002)(41300700001)(36756003)(110136005)(66946007)(66476007)(66556008)(8676002)(4326008)(8936002)(2616005)(44832011)(5660300002)(107886003)(31686004)(6506007)(6512007)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjRzVDZRQi9URVMxbzN0RjlXenA0M0xGVEN3am8vK254U2JsZ1VaRS9XVnNG?=
 =?utf-8?B?TElZUFFqNkQ5YTJNcVo3YjRDWnZuWXRtYjZuS200NGlEdTNiWE9XeCtLdlRZ?=
 =?utf-8?B?eHZ3Q1EybEhiemZkMmJkNDFYenFrK1NkWjkzdXIybmdnZXljbEJvWDYyRVE4?=
 =?utf-8?B?bGRSTlAzZHd6RXhkZ08walV2YkNJbEh1SXpwU2dNREFVTHZhY2RkMnZCdEMv?=
 =?utf-8?B?MktxeTZrdjFtdnNPam9uUHlXMmVqNUlXaVFiOWxMR1ZMRHNXNzlac2Q0UVVE?=
 =?utf-8?B?Q0wwRDc4Wk5jMCs4Q2JJY3N6bHlWQmJJZWlLcWdHSHJGeXRPVzY0NjM4Nk5z?=
 =?utf-8?B?NSt2K1VVV0cyTVlnWDE1NHVxRENObm92UjFuNmh5S0NnKzhHeG9Vc1czbGI5?=
 =?utf-8?B?TTVvTEhYcDJFWDcwTVd5UVFXZEhza2Uzc0JNZm9RQWZlblZaSWhncWJzTmtE?=
 =?utf-8?B?SDRlTDhEcXhUWm94eVByb0JvemRCUy9CSUU5MWZMT3RTclg1WVV1ekd0SENZ?=
 =?utf-8?B?NlhudTlrQ1d3YUdBTjM0RjhCWnJacXBtRktzWDBhcnMvVWUxWlpzcExsWFph?=
 =?utf-8?B?WGJWaEp4VEtLVUpyb3BacTdVVC9NbzB2OXV1U05KM3REcjF2Zyt3aFFpNmNj?=
 =?utf-8?B?LzZYNk1WemJFVVZZUzFMQk5ueHRrRTlDTjJsRDg5MVpCMFNLcWh3dVRhaC9Z?=
 =?utf-8?B?M1lUS0ovU1h2cyszOFprbFlKK25GeFlZZHEyU2lxa05nNnM0Tm10RVIrczFl?=
 =?utf-8?B?UmNJUUtySTlZcE04WTFiS0QyOUFQYjN0S01GakhMa3VBSU9QN3JZbHpSbmVK?=
 =?utf-8?B?c1B2UWF0QTZRR3gwWTAydTBTS1dTOVZiSTJGbXJ4UlY4dDgrSll5R0ZmcTMx?=
 =?utf-8?B?WUNrcyszUHNPRlUydFZZVXlzM1pvS1RBOXBQZGhoNFMwNGNnODFXQWNGRTlE?=
 =?utf-8?B?V0wyRTQvc093dHFmcDR2MXpFcEkva2JueGFCc0JCSjJJRlp1dS9qeGdnbEpi?=
 =?utf-8?B?Nk9BLzBFUVRwY2wzVFlackIvOVM4RThRdzk1eFhCTzZ3R1YrSmQyS3FKMUlo?=
 =?utf-8?B?aUFiQVlsUjg1dGl6OFZtVUhFMzI0NERHdGNTNC9ZTG11OENIdFpyNUdBdW5u?=
 =?utf-8?B?OE05RUZGTDl1elhKY3p0RmtieVZrb0p5UkRoTjhSRUExaC8va0J3N0pjTnIr?=
 =?utf-8?B?SnJKSUp2aHFtRkxmUElPWXM0aWI0TXEra0syT3FhVG1Mc1Y0VHE4M2xiWE1O?=
 =?utf-8?B?cGd4aE1KMm1hTWRWbzBKMVM1U0FJMDdIVjBVVUZsQ0swMHFsS2l0UmtVUFFU?=
 =?utf-8?B?SGtjZVF0WC9KN1ltU0pXcTJlNUZFSXFnSjhJcjA2SFdDa0hpUDBXTzRQd0VV?=
 =?utf-8?B?T3BUNWVnRWhkYjBUamx4ZUkzcTZyNTlJOGtlSTFjeFUwZ2QvejlLSEJsdXdW?=
 =?utf-8?B?RHJldjQvdnF0bThEUnVtVlVFNGhGY2hMNnQxZTEwVlJiZjRDMXE2N1RaR2Fk?=
 =?utf-8?B?TGQ4RnhqQ2pIOTVKVG1GTWZya0tac2JjMEJ0d3Y4V0lOWlIwVEJSS3hhZjFV?=
 =?utf-8?B?M1BScHdKZFhPaHZValhvMkRBNGE2c0JEUExadG5KbDN5cUxYb2RGQXFDbU0x?=
 =?utf-8?B?MjU3S1B0aWRMcXVjWHd5aWJLOVYxTGxFd05mczROZ2IvdWpucndKZUVVdG90?=
 =?utf-8?B?ZXpUOHdnZmV4aUVXM3FVcW9DSVRKNkhRK2tjR0lBQW1veURVTnVMZTRDZ2h4?=
 =?utf-8?B?ZHJXL1ZTcTkxK1BsUCszcW5mUzVQalJKcXNYMjQ3VWZjSyt2QnVsRDdsOFV4?=
 =?utf-8?B?UDRvU29wamVyRGNpL1pVNm1uYTZoNDhkbGYwRFBGTDZVbnBwN0lPQklWcVNZ?=
 =?utf-8?B?eUluUEpBRGxhaERLMFRKbzlIOFhFT01PMm42VDBYelhra2RDZkFJWi80aGZy?=
 =?utf-8?B?ZjV2RG1teW5vU1JhQm9YaU1uWWFjNFJPc3ZkaU13aS95Yjg5R0NsZ25tck9r?=
 =?utf-8?B?NUZpVkw4dDN4YTdvK1dENlpKY09FeUNXK21adlROYXlqdTFSaHBSZ0MyVms2?=
 =?utf-8?B?U09RbEsxcTR6SFJxcFgrSTVxQjJkVVFVelk3MEcrZmwrbXdQeGdvaFZMUVJ3?=
 =?utf-8?Q?lHIqGZXeXOxjrtrcxS/aW1T1e?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72d87792-4254-416c-1af6-08dbe2b503f4
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7997.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2023 12:52:08.9876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sQsCbw42HMXir+dpGjuKVGsvXA6G2M1pfmzMy8qf9Kk2Nm+1abozXu22UsMZWA35ZFpgLg//9lIUSKrV5Qi9Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7460

Hello List,

I remember we discussed about the mpath filter before. It looks lvm2 developers didn't trust udev and wrote hard-coded scanning actions (see commit 3b0f9cec7e999, and below function dev_is_mpath_component()) to replace mpath+udev. But in SUSE env, we had tested/ran a long time and worked fine with setting up lvm2 under obtain_device_list_from_udev=1 & external_device_info_source = "udev".

 From SUSE env, below function at least should put line 702~705 to the beginning of this function. In the other word, consulting udev first, then back off to hard-coded checks.
I don't know if the "udev+mpio+lvm2" combination in RedHat environments often encounters problems with abnormal startup. From SUSE env, it seems we do revert 3b0f9cec7e999 may got better result.

677 int dev_is_mpath_component(struct cmd_context *cmd, struct device *dev, dev_t *holder_devno)
678 {
679     struct dev_types *dt = cmd->dev_types;
680     int primary_result;
681     dev_t primary_dev;
682
683     /*
684      * multipath only uses SCSI or NVME devices
685      */
686     if (!major_is_scsi_device(dt, MAJOR(dev->dev)) && !dev_is_nvme(dt, dev))
687         return 0;
688
689     /*
690      * primary_result 2: dev is a partition, primary_dev is the whole device
691      * primary_result 1: dev is a whole device
692      */
693     if (!(primary_result = dev_get_primary_dev(dt, dev, &primary_dev)))
694         return_0;
695
696     if (_dev_is_mpath_component_sysfs(cmd, dev, primary_result, primary_dev, holder_devno)  == 1)
697         goto found;
698
699     if (_dev_in_wwid_file(cmd, dev, primary_result, primary_dev))
700         goto found;
701
702     if (external_device_info_source() == DEV_EXT_UDEV) {
703         if (_dev_is_mpath_component_udev(dev) == 1)
704             goto found;
705     }
706
707     /*
708      * TODO: save the result of this function in dev->flags and use those
709      * flags on repeated calls to avoid repeating the work multiple times
710      * for the same device when there are partitions on the device.
711      */
712
713     return 0;
714 found:
715     return 1;
716 }

Thanks,
Heming
