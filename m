Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88499C43219
	for <linux-lvm@archiver.kernel.org>; Thu, 24 Mar 2022 15:35:16 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-481-IwbJV9oZMpu7UybeFKgF4A-1; Thu, 24 Mar 2022 11:35:12 -0400
X-MC-Unique: IwbJV9oZMpu7UybeFKgF4A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 20F7D9058C2;
	Thu, 24 Mar 2022 15:35:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 169481454539;
	Thu, 24 Mar 2022 15:34:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E018F194034F;
	Thu, 24 Mar 2022 15:34:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 439501949762
 for <linux-lvm@listman.corp.redhat.com>; Wed, 23 Mar 2022 07:33:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2F7F6565DB2; Wed, 23 Mar 2022 07:33:17 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AB0F4C36D8
 for <linux-lvm@redhat.com>; Wed, 23 Mar 2022 07:33:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0DC6C3804080
 for <linux-lvm@redhat.com>; Wed, 23 Mar 2022 07:33:17 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-vGZtY8DaPvOStjcaWMe79g-1; Wed, 23 Mar 2022 03:33:15 -0400
X-MC-Unique: vGZtY8DaPvOStjcaWMe79g-1
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-8-LckMgnXFN026p4OfU4J_sw-2; Wed, 23 Mar 2022 08:33:12 +0100
X-MC-Unique: LckMgnXFN026p4OfU4J_sw-2
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
 AS8PR04MB8769.eurprd04.prod.outlook.com (2603:10a6:20b:340::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Wed, 23 Mar
 2022 07:33:07 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
 ([fe80::34b0:c774:609d:2764]) by DB7PR04MB4666.eurprd04.prod.outlook.com
 ([fe80::34b0:c774:609d:2764%7]) with mapi id 15.20.5102.016; Wed, 23 Mar 2022
 07:33:07 +0000
Message-ID: <a4df63ee-1381-de03-7490-bb1d51fa1e0e@suse.com>
Date: Wed, 23 Mar 2022 15:33:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
To: David Teigland <teigland@redhat.com>
References: <38c190ac39c244d9442670589b7bfeb4f800383e.camel@suse.com>
 <97c2e9f9-0959-c5ed-230a-9d4089577410@suse.com>
 <20220321164431.GA23151@redhat.com>
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
In-Reply-To: <20220321164431.GA23151@redhat.com>
X-ClientProxiedBy: HK2PR02CA0161.apcprd02.prod.outlook.com
 (2603:1096:201:1f::21) To DB7PR04MB4666.eurprd04.prod.outlook.com
 (2603:10a6:5:2b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b13eb290-f6cd-4f18-cf2f-08da0c9f5fa7
X-MS-TrafficTypeDiagnostic: AS8PR04MB8769:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS: <AS8PR04MB8769159439156CBBDDB5122D97189@AS8PR04MB8769.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: yjmFgDnz3cIoNs/6vw8b3xRqwFfLaJPJtVZnsObqNeuBGkMLTAC7HZMC0+wv6GcKecAnKEdjbFbLXZAFEnCBrVDP6EfBuS5bvkZELaoptT8TXQftQzKgN42mKXZCb21oSN0rvlvJf3Sp7jwto3J1aTrKPzFpAb4ibMtCFEub9vn/Rrifq3lAn3FuOdd0v8En8QgzemDToihDMY+YBhl8mhdyHp34X/QJlEUnpfo+nFFr5L/HObxtPi91Q7uknT6R8DXU3wjbknzjMV6JvX1aWnuenVTiUm9bNORCv52KYx5XE/C3FDANLPGqXLe0o9uJ9LsbEFnVcG7DDbETT3XdcPr8ljjsV7F1CMqpPnxVz4xbl5kUB7BU7U8e2JccelNGFP+i8COjoWudLpdzk33VMLTv0+41tMeAGEfm2e6Nslw3Vt4q/zKv4SRYvfNsPcln8Rjx3ECtvVRKvcz2xQ5Xfb8hsA8Mon2WgzEXHMx3CgqQRH9+A6jIppTaehyxjDChnWHZefGTp7vjIqOk6o6c8z3xWSjHXfgOMLev3J6jVIlOjIVCBBNE0Q6ZpOYD/4ItMIuOw7I57bcx6QM0eGHS94XUiivuN7SP3pKmJchpApDgzuzYtmUl3pa4shvqTsJTjH16UiA6Gu2PVqxHiT+cAjnzrvgx1djgx2g7vaN4aO5hQLckQRLa0discIRk75itoMEr8nRRG8LfKwo46j6icM8sPvSHZyvu1Oe2g7XHp30=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR04MB4666.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31686004)(186003)(3480700007)(26005)(2906002)(316002)(83380400001)(36756003)(6916009)(508600001)(6666004)(54906003)(5660300002)(6486002)(6512007)(2616005)(8936002)(86362001)(38100700002)(31696002)(66476007)(66946007)(66556008)(450100002)(6506007)(8676002)(4326008)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHhXOXhWakRLcXVqUlo2OVZOdERBSGdBTlBiM0ErTzY3UVluU3pDM0FhTVJx?=
 =?utf-8?B?cWhMcmJGcTRERFBQazVBRzlFZlNPWGRPaStpUlJVLzRjWXRkYzh0M1Y2aWhU?=
 =?utf-8?B?TUdGTjY0VTVNNlF4eXhmN0lSMG9iQ09ncFFvM3M3dzRIdm9EUUhyZVhkaytG?=
 =?utf-8?B?MURKbzlCaHN3MzVxOTM2SDZxeWJ6dzhRKzIvZzl1Rms1ZWkxa1Q1NUd5OUNK?=
 =?utf-8?B?VTFmTjZKalFCVUlBUW1yUDdXajhxdTNWb1B2S09yNThNdFp6Yjc3M2dnS1M2?=
 =?utf-8?B?V2tmOVlSNUd5ZlhGMXhZK1Jla0FVRE5VTWIwTTlBbjJuVmxaRExnR2JMcUlN?=
 =?utf-8?B?WEloR0hEVENMcXdkYjJNL25Dck1YQ2VsVEd5Y2pNc3dJdmZNM1VwSCtjVnZv?=
 =?utf-8?B?MXBFSm44S0paT0QyTXRrMXRwSFBYU2dTNVVocGcxTDhPVGRVRzg5SXVCdmox?=
 =?utf-8?B?RmdmL1M5TEI0MXVCd0RMR25Fd3JMVUFnaXdYdnAyeHQ5b25OSWVMSXo5Vmx2?=
 =?utf-8?B?c0dPT0NJeWxydzN0Si85NjI0MHl0eUFwMm0zZUFNTWhVQVNZb3YzZTk0Rlli?=
 =?utf-8?B?cGNLYVl5Mmd2d1FsTmROU3ZDYWlLSm1qL1dxZG5FNm1vUmMyWlZCTGQxZkdy?=
 =?utf-8?B?UlZ3OWgwNjBwOUpZNUFWclJyU2NGQ29nWk9kcC83Ty95RjBYeDRYemFIQm9D?=
 =?utf-8?B?SkpJNmFwNFVzaWF6ZGc0amc5L2phQ0xwRkIwMzloNUhNdEZPa3YxY0ZRZlow?=
 =?utf-8?B?aU9ETDU4NlVWY3p0RTljVSs3SytiT3crdFU4Z3NVb1QvWUpnc0plKzFmWkxD?=
 =?utf-8?B?eHgxQ01YbkIxNyttck55WkE2TXdBU0JqcXlQTmZNZUYyL2NMV3ljbzNBRFRN?=
 =?utf-8?B?TGRJSEVqZ2ZJdXY3ZlZ4ak5OQk1sMEpJcEdrR0pTaDRRMXMxaFhBZk5NTGdr?=
 =?utf-8?B?S2VueWhOeGVnUlVpcmJiK3pmUWdvYmgyd0lwOWUrQVZmTDlUMFFiU09yK01V?=
 =?utf-8?B?MDQzR1Z6VGJWVFU0TSs2UjVKdG9OYnVqblA3WkU5YlNzRERYRm9SRVFvanln?=
 =?utf-8?B?MzFLT3l0cVQzenlleDVWNGdRZ1VSbnVjdFdIczJkKzdBTkFnSVMzdEh3NXhZ?=
 =?utf-8?B?ZU9OL3BWMmJHSEQ2QVVzRUgrWVBqbnRwSkJzVW40dG9KakFDTWFsbElEdWxw?=
 =?utf-8?B?eUltanFKMWxiMlRlcnB1MHdNeE55MnpoRkU4RkpBV0J4aVg2ZkxoNzVuVzBF?=
 =?utf-8?B?eFR3M1NEQzFjbXlmc1AyRFc0UU4rRVVoMWR6QjdkUnlMREtaZTlpZnFhZ1Ra?=
 =?utf-8?B?MmxPejU5Qm5NdDdKYW1nOHdYYnl5QzhYd0FHbHliZ0Q4QnE2aFM2ZkRiY3Fu?=
 =?utf-8?B?aVE5ZjM1TENZSkxxZkR1dytKSS8wQTJ4SDFSVjRFUG53TXF0OUhVL1dtM0JE?=
 =?utf-8?B?MTZIeWtQUDZtZks0UlRTSjZwMlFpM0QzeUhDZXF3eFFsR1gzYjNyWFVZVitD?=
 =?utf-8?B?Qm9GeHJvMnFNeVZ2MWZ6TlYwaWhiS1pnblpUdGVvSHNFZ2pWREtKV2hHR21Z?=
 =?utf-8?B?bEhZZE15OUJuamZ6Uk1aSHZGcmx2RGtHMDVheDRJU09CcWRRUW5YRFA2dFJJ?=
 =?utf-8?B?eTdpVTBYRlJyTjA1UmNFdUd1d1hYaVpKN1hwZXE3MUlXRjhxVzFNeTZIdU40?=
 =?utf-8?B?ZXRFamVEd1Nmd1JmOVh2NGpmSWNUaCtBd2FrV3g2dkFiZGZITWJ3SktYblZk?=
 =?utf-8?B?c01jR3VwU1M4cGpwMUZiU2NPbkcvZCs4ODA1eFVQdFpLTkNoQWtSV3ZNdlc4?=
 =?utf-8?B?RFlXNDViYU1JWVRsSUlXRWUrV2hhSGNMeXpQQlRFQkdXOGNmWnlOd0tjRzly?=
 =?utf-8?B?WGN5Z0k2Y1hXcXR6bFF0Ui9nM3BZOVJ2SnZjTFN4dHlYSWRDMnMwSkl1WThH?=
 =?utf-8?Q?KUGfiY+fUZb+NqTX2TPUBB/RHgoK8gDF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b13eb290-f6cd-4f18-cf2f-08da0c9f5fa7
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 07:33:07.3481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BL5RMWbK7s6L7mT0rHT/WsApmGOgmenKyYBxMIFO5y7p926ond0aZK98YL8pa8z2R/30/G9uAOpvon2yQMQYkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8769
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Mailman-Approved-At: Thu, 24 Mar 2022 15:34:56 +0000
Subject: Re: [linux-lvm] LVM autoactivation and udev
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
 <mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-lvm/>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
 <mailto:linux-lvm-request@redhat.com?subject=subscribe>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Peter Rajnoha <prajnoha@redhat.com>, Martin Wilck <mwilck@suse.com>,
 LVM general discussion and development <linux-lvm@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On 3/22/22 00:44, David Teigland wrote:
> On Mon, Mar 21, 2022 at 04:57:09PM +0800, heming.zhao@suse.com wrote:
>> ```
>> Mar 10 10:27:54 Mobile-PC systemd[1]: Stopped target Local File Systems.
>> Mar 10 10:27:55 Mobile-PC systemd[1]: Reached target Local File Systems.
>> Mar 10 10:27:55 Mobile-PC lvm[658]:   Udev database has incomplete information about device /dev/nvme0n1.
>> Mar 10 10:27:55 Mobile-PC lvm[658]:   /dev/nvme0n1: Failed to get external handle [udev].
>> Mar 10 10:27:55 Mobile-PC lvm[658]:   Udev database has incomplete information about device /dev/sda.
>> Mar 10 10:27:55 Mobile-PC lvm[658]:   /dev/sda: Failed to get external handle [udev].
>> ```
> 
> Since vgchange --monitor runs during startup, it should also override any
> udev settings to disable them, like pvscan does:
> 
>    init_obtain_device_list_from_udev(0);
>    init_external_device_info_source(DEV_EXT_NONE);
> 
> (Those are the default settings we use, so we don't see this.)
> 

you mind me, I forgot SUSE chose to use udev by default.
So this is a SUSE special issue.

> 
>> In my understand, lvm2-monitor.service does the "clean up" job, which will complete the
>> monitor job for thin/mirror/others LVs, which was created during initrd phase. (because
>> lvm_scan doesn't have ability to start monitoring.)
>> on current lvm2-monitor.service, the dependency asks this service start as early as possible:
>> ```
>> After=dm-event.socket dm-event.service
>> ```
>> It makes monitor service start too early, and triggers libudev not ready issue.
>>
>>
>> To fix above issue, we find a workaround:
>> ```
>> - After=dm-event.socket dm-event.service
>> + After=dm-event.socket dm-event.service sysinit.target
>> ```
> 
> Yes, I think starting it later would be better.  I don't know enough about
> these systemd targets to comment on how well that change would work.  I've
> not given much attention to lvm2-monitor, but I've also wished it would
> start later> 
>> And maybe there is another workaround (not verify):
>> ```
>> -ExecStart=@SBINDIR@/lvm vgchange --monitor y
>>
>> +ExecStart=@SBINDIR@/lvm vgchange --config 'devices { external_device_info_source="none" \
>> obtain_device_list_from_udev=0}' --monitor y
>> ```
> 
> Let's patch vgchange monitor as mentioned above.
> 
> Dave
> 

I inclined to use the "--config" option to avoid booting warning.
(or write additional codes for vgchange "monitor_ARG")

I have two reasons:

1>
Martin & I also found it is a difficult to find the best time to start lvm2-monitor.service
So modification "After=" dependency will still failed with some cases.

2>
the lvm2-monitor.service helps to finish monitoring job for lvm_scan. So it's not necessary
to ask this service to handle the VG/LV which starting after switch rootfs. (These VG/LV
should be monitored by "pvscan --cache".)

So starting lvm2-monitor.service as early as possible is accepted.

Thanks,

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

