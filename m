Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AEEAC433EF
	for <linux-lvm@archiver.kernel.org>; Thu, 24 Mar 2022 15:35:21 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371-d7Hfaf0BOYOgmHnb8RwFMA-1; Thu, 24 Mar 2022 11:35:13 -0400
X-MC-Unique: d7Hfaf0BOYOgmHnb8RwFMA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3DE4310665AB;
	Thu, 24 Mar 2022 15:35:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 203AD1454558;
	Thu, 24 Mar 2022 15:35:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BB144194034F;
	Thu, 24 Mar 2022 15:35:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DD62319452D2
 for <linux-lvm@listman.corp.redhat.com>; Mon, 21 Mar 2022 08:57:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BAF332026D11; Mon, 21 Mar 2022 08:57:27 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B5ADB2026D07
 for <linux-lvm@redhat.com>; Mon, 21 Mar 2022 08:57:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1957D899EC2
 for <linux-lvm@redhat.com>; Mon, 21 Mar 2022 08:57:24 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-111-oyVbKgt-MfKnGV9l3t7ePQ-1; Mon, 21 Mar 2022 04:57:22 -0400
X-MC-Unique: oyVbKgt-MfKnGV9l3t7ePQ-1
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-8-EavcG_45MROX0ysfgESJOg-1; Mon, 21 Mar 2022 09:57:20 +0100
X-MC-Unique: EavcG_45MROX0ysfgESJOg-1
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
 VI1PR04MB6781.eurprd04.prod.outlook.com (2603:10a6:803:13d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.22; Mon, 21 Mar
 2022 08:57:18 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
 ([fe80::34b0:c774:609d:2764]) by DB7PR04MB4666.eurprd04.prod.outlook.com
 ([fe80::34b0:c774:609d:2764%7]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 08:57:18 +0000
Message-ID: <97c2e9f9-0959-c5ed-230a-9d4089577410@suse.com>
Date: Mon, 21 Mar 2022 16:57:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
To: Martin Wilck <mwilck@suse.com>, David Teigland <teigland@redhat.com>,
 Peter Rajnoha <prajnoha@redhat.com>
References: <38c190ac39c244d9442670589b7bfeb4f800383e.camel@suse.com>
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
In-Reply-To: <38c190ac39c244d9442670589b7bfeb4f800383e.camel@suse.com>
X-ClientProxiedBy: HK2PR02CA0165.apcprd02.prod.outlook.com
 (2603:1096:201:1f::25) To DB7PR04MB4666.eurprd04.prod.outlook.com
 (2603:10a6:5:2b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f31246f0-31db-449c-acea-08da0b18cd87
X-MS-TrafficTypeDiagnostic: VI1PR04MB6781:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS: <VI1PR04MB67811F7D5A2659FCC97EE5A197169@VI1PR04MB6781.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: JXR8FGuw/KiDhZkhV0i0WRe5rdmkhU/KF0k7P9hstep7vW+MMAcx0XQ+woqGZAMEcm0heDWrN6+ZzM28FjC2EZZZFRPpqWLmygF65Dlf521iO+e4dQmFxxegv47wso/+W3JjIbtaYfBUCV8mOOLo0Ld83RZpgLjwye0peJmBJfRmMmZjgyyNaEkcVwklLy3Aw6ubKuG+5uC5YMkqrioVU7bKeOUsSiwlUOsDa209zT1q4Fi2bv5uQyvZhpPJWy5SDYO5ZbAglFiNQq2pjq+/gVlQ/XXE8ycLHedruBj5YaYBlUrXn4X3sOOSeAQAjgUV8nGmrvSqWfeP0jhWcOauu83aaTWWA1fBJly3PS3fIuPvwujNDZEo4iri+k9vgX0kHkjwAMe7gVZJvoAi3/CzqiTjNoSnnShLnhgzFI3TsqbbybuMZp1o0klgJcU5utNx0NZNQqHNZBseHWb+nHsZRkq145AsNIUEhGgiL2xB7XWJHFsKklsj26wluJ2HDwofUMySetML+g9T3eR0r5mTDaSTK3+V/QdbYsnoZpQHbEJV5HP0G14ZrPUcUwArWzGOFOJi3lNAAPs/LjIE18F2zwDNXm96v7Qt469Uhg1ItfGS3Ji9RsCkPX+kT0EBDGW3t1E74ZB3AO7n0a1odOauuyeXqg7oOKC0GvLl5qM00DkA1OS8mXnn2es7H9QCqUMlGBgrL69TZ+Cq4wESqZ2n8bTNNjshXNM7idgiWSm2zdg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR04MB4666.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31686004)(508600001)(8936002)(5660300002)(110136005)(316002)(36756003)(38100700002)(31696002)(6666004)(450100002)(53546011)(86362001)(6506007)(4326008)(6486002)(66476007)(66556008)(8676002)(66946007)(2616005)(2906002)(26005)(186003)(6512007)(3480700007)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T01vaE96dWFOeDNVYVdsU3J1TTNWZ0xueU4vd3ZkSmRMS2F0dENRSm5nVWE1?=
 =?utf-8?B?YmJGdXR2YTh4L09MUUkyOE84YzNrZlNDLzJSbTIwVi9IK2hOT2pKR3UzdEFG?=
 =?utf-8?B?NXdmRmxDc0NLWGZBYVRGTm1FbVhIa2tXUWxjdHMvcGhqUWJpSVNkUUdvdzdJ?=
 =?utf-8?B?enQrUXYxbVlpUkpGQUhiampEVmtoVUlCRE9JU3Z5QVkyeFpOMjB0YWU2andD?=
 =?utf-8?B?dWR0RG9sWHhVbzhMNWYwL3hxUkhWRythWHhqRVorNXBiQndZNXJRczB1bjNr?=
 =?utf-8?B?eXVGVVpLY0hiaHMrOUUvNzNObzhsWnBLS2ZYUWZKa1hwOXltZ1VyaWJiMFRX?=
 =?utf-8?B?QktUYnhOdXdGcUhFQlJ5MnRQdjF5RFZ3UEE4dTMyOUhYaEFxMnRuWmdaWlQr?=
 =?utf-8?B?bzNxd084c2JzKy84SG0vNmVtZE9Yb0JkcGNkV05rVVdsWkxvbXpXZlBWdk1v?=
 =?utf-8?B?SWRIVzhiNStDTTM1em5kNm5POUhQZzRSbVhUbWNVQnFrMmJMTVpxNHpob3Z1?=
 =?utf-8?B?ZjJXT2dmMjFCYjVCV2Ezdm5xcmtFQmJEVC93NFVuMU5NL1RyalhqRVo1bFh1?=
 =?utf-8?B?bVBDK3BUNURoL0cxeVFVMFR5T1BKczdaZWcxdVJKUFBJS0M0Qnc2dGtjNVRG?=
 =?utf-8?B?bjI0d24rSWVYb3cycExkc3FmYzJmMGtxK2tzTmZ0ckFHM1EveTBoNWVqamox?=
 =?utf-8?B?N3F1L2l6VUdjR3ZzOGZHUHVJay96aEdhelpXN1p4VVBERFQ2dHo3aTlFT00w?=
 =?utf-8?B?Njlyd21HNGhNUzBPWFRvZDBkSjgweTdYZVZYelpYUC9Kc0RFTUcvN3MvdXhp?=
 =?utf-8?B?TUVJZnczZ0pZU3kwdTdLMGpLWUcwS09LVGZ4SGtMTXhsaTEyTGJMVEFLWStZ?=
 =?utf-8?B?c3RONmR6VnJkTVUxUnozME4vaDJYOUdtVzVqcklZYjRpWFNWdi9qQnp5dFhE?=
 =?utf-8?B?bUpPMmt2R2s3ek9CSEpjM0Jtd05teUZwSCtnSXg4TnZVbFRwL09KRmlFY3Ft?=
 =?utf-8?B?OG9BRU10L2tqcGZGS0NnVUJHTk45OXRQYWhkMERwUm80aCtTWmdVOE1LZWYy?=
 =?utf-8?B?SHFpQ1BiZjgvTHhiWFVQdFNiVFV0ME1pM05WVHFsUENpRXBqOVJFTDc2Q3NJ?=
 =?utf-8?B?YnNOTzhteEpDZ0hCaFQraW5NU3pVdDRDMlBHQ0E5VnM2NFdQd2p0Y1ZPNWx0?=
 =?utf-8?B?THRkWGlhYVcyMlBVbDZuc0YxTDZEYUpIYy9OT2lnWU94UXFlNUhrZjk1TEx5?=
 =?utf-8?B?NStRSVBpVWNHL3ZJQVlTRUVJZDBCcVQ1WjZTdDBGQ00rcWRGTjFIRWlFdXpw?=
 =?utf-8?B?U0V1NTJ6NE93dStOQmVlamJTcnRTb1B3YUhma2tjQ0FuV29zNTJxdTBJSURz?=
 =?utf-8?B?cnVOVU1EQk9jVEZ3TEJSUHZGN2Y5UmJiRno5d2xSWVNWRFQydlIySUZwRlpu?=
 =?utf-8?B?Nmt1OXN2RVh5OCt2eksxSFpLUTFuUnVsOVpUZC8wOGZybXZBTXZTeVlxQjR4?=
 =?utf-8?B?dGpNb1JWRWJpNk5MY1BRZDZ1R3RrUzVUNzZTT085R1NZc1hFWXRoT0xEMEV0?=
 =?utf-8?B?S1lmQklreGFWK0xXeWYwZWtSWjBvVmFGMGxpWXVlZDhxM0JiekhOL0hFYjhN?=
 =?utf-8?B?aEJWdW94ZWxBaStGWkNkT2EzeE5oSVg5cVdqSEp3WGxyS2NkNmNHYjd4aFM4?=
 =?utf-8?B?TGF1U1VIdUhvV2xLbGVjeWdPSkE4QzBqT2IzYkZXMk5JM1gyUzk5TkV5OG5q?=
 =?utf-8?B?U0JtRmJqdjQwR2IzVVlDTHE4WjhJamtTNmJ3cDdORGVSQ2NPL2tRUkgzVDBL?=
 =?utf-8?B?VFBvNUN3bm5pcWxUVjB6MnYxZmhNdVhrSzF5V2hNVWdObEcwbUNDVGVxdGg2?=
 =?utf-8?B?MThJSWlVTWhGcWNkNVdvcE5keElmNHFHQ2NGQVFROWRuelYxZ1dzN1VnalFm?=
 =?utf-8?Q?ej6vSe3250Y3dfyMkOsD7+f/IE27MyV5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f31246f0-31db-449c-acea-08da0b18cd87
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 08:57:18.4969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TcQdYXU6xM8GiOEqlvShbOM9avhmwktCrUIC5YFs+T+sSr/FZmkXiJGFkSCzZXY/DuI7gg2vN2/peitZRZGDnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6781
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
Cc: LVM general discussion and development <linux-lvm@redhat.com>
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

On 3/9/22 23:29, Martin Wilck wrote:
> Hi David, hi Peter,
> 
> we have recently updated LVM2 on openSUSE Factory, and are using the
> autoactivation feature now. We also use
> 'external_device_info_source="udev"' by default, because according to
> our experience it is the only way to make LVM device detection work
> reliably with multipath devices.
> 
> With these settings, we see lots of "Udev database has incomplete
> information about device ..." messages:
> 
>> [   12.377563] apollon systemd-udevd[810]: sda5: Processing device (SEQNUM=2787, ACTION=add)
>> [   12.412723] apollon systemd-udevd[810]: sda5: /usr/lib/udev/rules.d/69-dm-lvm.rules:82 Importing properties from results of '/usr/sbin/lvm pvscan --cache --listvg --checkcomplete --vgonline --autoactivation event --udevoutput --journal=output /dev/sda5'
>> [   12.412767] apollon systemd-udevd[810]: sda5: Starting '/usr/sbin/lvm pvscan --cache --listvg --checkcomplete --vgonline --autoactivation event --udevoutput --journal=output /dev/sda5'
>> [   12.413041] apollon systemd-udevd[810]: Successfully forked off '(spawn)' as PID 882.
>> [   12.419458] apollon lvm[882]: Udev database has incomplete information about device /dev/sda5.
> 
> This is no surprise, because 69-dm-lvm.rules contains
> 
> IMPORT{program}="/usr/sbin/lvm pvscan --cache --listvg --checkcomplete --vgonline --autoactivation event --udevoutput --journal=output $env{DEVNAME}"
> ENV{LVM_VG_NAME_COMPLETE}=="?*", RUN+="/usr/bin/systemd-run --no-block --property DefaultDependencies=no --unit lvm-activate-$env{LVM_VG_NAME_COMPLETE} (LVM_EXEC)/lvm vgchange -aay --autoactivation event $env{LVM_VG_NAME_COMPLETE}"
> 
> These rules are executed by udev while it is processing an "add" event
> for a PV. At that time, the udev data base doesn't contain an entry for
> this PV yet, because the entry is added only after the uevent is fully
> processed.
> 
> Shouldn't "pvscan" be run in a RUN+= statement instead? Obviously if we
> do this, the lvm-activate-$VG unit must be started in some other way
> (e.g. by calling systemd-run directly from pvscan).
> 
> In the cases we have observed so far, the VGs were assembled correctly
> despite these warnings. We aren't certain if this was by luck only. In
> any case, the messages irritate users.
> 
> Or are we getting this completely wrong, and the new autoactivation
> feature should not be used with external_device_info_source="udev" at
> all? If that's the case, how is multipath component detection supposed
> to work?
> 
> Regards,
> Martin
> 

I make a branch for this topic.
Original topic focused on pvscan & udev in booting phase.
We (Martin & I) watched another issue, lvm2-monitor.service reported similar libudev error.
(the lvm2 version is latest 2.03.15+). the monitor issue was still related with libudev
not ready. log:

```
Mar 10 10:27:54 Mobile-PC systemd[1]: Stopped target Local File Systems.
Mar 10 10:27:55 Mobile-PC systemd[1]: Reached target Local File Systems.
Mar 10 10:27:55 Mobile-PC lvm[658]:   Udev database has incomplete information about device /dev/nvme0n1.
Mar 10 10:27:55 Mobile-PC lvm[658]:   /dev/nvme0n1: Failed to get external handle [udev].
Mar 10 10:27:55 Mobile-PC lvm[658]:   Udev database has incomplete information about device /dev/sda.
Mar 10 10:27:55 Mobile-PC lvm[658]:   /dev/sda: Failed to get external handle [udev].
```

In my understand, lvm2-monitor.service does the "clean up" job, which will complete the
monitor job for thin/mirror/others LVs, which was created during initrd phase. (because
lvm_scan doesn't have ability to start monitoring.)
on current lvm2-monitor.service, the dependency asks this service start as early as possible:
```
After=dm-event.socket dm-event.service
```
It makes monitor service start too early, and triggers libudev not ready issue.


To fix above issue, we find a workaround:
```
- After=dm-event.socket dm-event.service
+ After=dm-event.socket dm-event.service sysinit.target
```

And maybe there is another workaround (not verify):
```
-ExecStart=@SBINDIR@/lvm vgchange --monitor y

+ExecStart=@SBINDIR@/lvm vgchange --config 'devices { external_device_info_source="none" \
obtain_device_list_from_udev=0}' --monitor y
```

@David,
What's your opinion about the lvm2-monitor.service udev problem?
Could you mind to give some explain why lvm2-monitor.service is started so early?

Thanks,

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

