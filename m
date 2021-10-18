Return-Path: <SRS0=tbfx=PG=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81171C433EF
	for <linux-lvm@archiver.kernel.org>; Mon, 18 Oct 2021 19:10:10 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16BF661074
	for <linux-lvm@archiver.kernel.org>; Mon, 18 Oct 2021 19:10:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 16BF661074
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-cJF2-ey4NuiglSsWG21n0A-1; Mon, 18 Oct 2021 15:10:05 -0400
X-MC-Unique: cJF2-ey4NuiglSsWG21n0A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D526A1006AAB;
	Mon, 18 Oct 2021 19:09:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E6B79323;
	Mon, 18 Oct 2021 19:09:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AB0204E58E;
	Mon, 18 Oct 2021 19:09:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19IGusSu008374 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 18 Oct 2021 12:56:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 43A2011701D2; Mon, 18 Oct 2021 16:56:54 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3AB2C11701D0
	for <linux-lvm@redhat.com>; Mon, 18 Oct 2021 16:56:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 280D3811E76
	for <linux-lvm@redhat.com>; Mon, 18 Oct 2021 16:56:51 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.111.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-34-9c7aCu5XOn-EZB6Ypa3BPw-1;
	Mon, 18 Oct 2021 12:56:49 -0400
X-MC-Unique: 9c7aCu5XOn-EZB6Ypa3BPw-1
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur03lp2054.outbound.protection.outlook.com [104.47.10.54])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-24-hHyjRfoBOzWYkLD_XJmg-Q-2; Mon, 18 Oct 2021 18:56:47 +0200
X-MC-Unique: hHyjRfoBOzWYkLD_XJmg-Q-2
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
	DB8PR04MB5817.eurprd04.prod.outlook.com (2603:10a6:10:a3::24) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.4608.16; Mon, 18 Oct 2021 16:56:45 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::483f:e29e:cef3:fc5d]) by
	DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::483f:e29e:cef3:fc5d%7]) with mapi id 15.20.4608.018;
	Mon, 18 Oct 2021 16:56:45 +0000
Message-ID: <d0262d2d-1dbe-954c-80cf-10ed56fb58b6@suse.com>
Date: Tue, 19 Oct 2021 00:56:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.1.1
To: David Teigland <teigland@redhat.com>, Martin Wilck <martin.wilck@suse.com>
References: <d1d35f7dba3d0e887e7eac06a06ff2414a84c924.camel@suse.com>
	<20210607214835.GB8181@redhat.com>
	<20210608122901.o7nw3v56kt756acu@alatyr-rpi.brq.redhat.com>
	<f6b8c5b6c01ecef842eb711748a765f81b7f04e7.camel@suse.com>
	<20210909194417.GC19437@redhat.com>
	<20210927100032.xczilyd5263b4ohk@alatyr-rpi.brq.redhat.com>
	<20210927153822.GA4779@redhat.com>
	<20210929213952.ws2qpmedaajs5wlx@alatyr-rpi.brq.redhat.com>
	<20210930155542.GB32174@redhat.com>
	<418b2bd497a3a4cd76840b3cceb1955ba7e9ba01.camel@suse.com>
	<20211018150418.GA3917@redhat.com>
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
In-Reply-To: <20211018150418.GA3917@redhat.com>
X-ClientProxiedBy: HK0PR03CA0106.apcprd03.prod.outlook.com
	(2603:1096:203:b0::22) To DB7PR04MB4666.eurprd04.prod.outlook.com
	(2603:10a6:5:2b::14)
MIME-Version: 1.0
Received: from [192.168.2.101] (123.123.129.154) by
	HK0PR03CA0106.apcprd03.prod.outlook.com (2603:1096:203:b0::22)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18
	via Frontend Transport; Mon, 18 Oct 2021 16:56:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d16b533a-b326-44b7-e31e-08d992584456
X-MS-TrafficTypeDiagnostic: DB8PR04MB5817:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB5817C10B808E70F5DCCBE6FE97BC9@DB8PR04MB5817.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: URFZrEEhgdV1NfG4DCZFtozWcx1crSOr44q0N4uJ2zvX8kUD5h+PsT72wRsCzgyYT4cKMfLRNzQpSkM7fckWrE791uGx8hHYpgDlBVRlQMIqfCFLKTm/AYR7yhkOAH90pzpUQ6HjwWjn/PjOUVuE/On0Mc57n8Cy5OI6sW04RUcEGVIwKrfKmudEh6W3w+IrWX60dRQf6tQyqEQLbBEbqqEnHhqE/Df1rudNM8JXqoAQkMSPnOfOdS0JsjTO+6vyckZNWeAnCyL0xi1Pk7qrPbXj20gsakqyZW3WeNQNAowsuPM8oGSPmn5nCePVaM1qj3WC1emVnAhJhZ3X3C3tjl0ZKFHF+t4VZ8tzw5Wt1CnZC3j95ZkwPT9Y6dOcAmxW1/9RasKJDek5FB5o4En4vSwYCA7RXp9sokgrvNbvNtlGbiB952TVVrxhJAMpYr73Y3X8+YJ1Q0MmhYyxh3IQx9v9HRkhckzJI0+k1mk+LEPT3VSzjR2V/pxEQYN2siV9WupYiTXGiOfmROoxaB12qLr93gkp9U67et15nRKK5G8zDkqmUBYcQOE4XR/77G1k2D7ClSa9D9KCSxVeJxAitEPETGaAWTSr5zEt7WBdrm6cl3dtV4TMylEEgpnO6BKSgqRJ3PumR8fJMSH5lvQgFqVbUqw4CD8APuZV2fIDRAPr2zLGspHIXGX9c3EZmNAJ1ehQtr1kyg6Bp9jxr//ikBdT123sMeVNU5bP9cwbLHzVmaQaTjbVA/bVUt0zRTlkbPdQp3Qg28Ui8RVu//ejTbwzqvfUhaeh+2wZbtwR72WH9/lFZVLxO809HwsCKjcfo1z/2h7yI2a+S+/hlLoPg5x3ApOYprYfmu+HxWHuYpergx14bEHQZoaDdDVbraqt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB7PR04MB4666.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(956004)(2616005)(6486002)(508600001)(966005)(8936002)(66476007)(26005)(5660300002)(53546011)(450100002)(186003)(6636002)(31686004)(36756003)(6666004)(4326008)(38100700002)(31696002)(83380400001)(316002)(2906002)(8676002)(66556008)(66946007)(54906003)(86362001)(110136005)(16576012)(9126006)(43740500002)(45980500001);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHUwby93eHhrU2gzZWFTak9VZXRkd2lKWFhzQVpHdTJ6cXZxL3J1TWpsajBa?=
	=?utf-8?B?dXRqZFkzVzdQQTZSR1luZDY5Q2VHUmpCa0Z1WFhGU1orZDVFYXRpdno0bm9S?=
	=?utf-8?B?bUxtRnUyOXNxbnJTK1lLUU1tQnJRTWxMKzJmZ2RVcDIrUGZudE0yMExGL0JH?=
	=?utf-8?B?YmNoZWdZb2lUV0luSDFVZ0E5RGNjRnlqbk5zTEhxYy9aVXNkQmV1NytySUhm?=
	=?utf-8?B?TnFXcHIzYU4vb2U1VDNsMnBuaXJQMk5iOVh4a21jK0FxbHQ3Zm9CZGlHRTRt?=
	=?utf-8?B?NVpwZHVQYTUzNWNlUHQ4Zjh6dlQ0TTlsc2Z4c2U3ZmMzNndMVE9tckJycVJ6?=
	=?utf-8?B?VElMME9sd01kVnZ5QkloMVZGYWVMRnRHMEtvTzYrZVFUYk9JZTVjOFZKQ0Zh?=
	=?utf-8?B?QmZ5MmFqb3lWQUNHMGpMRmh1MEZ0RmxxYitUYnUzcjI4ZjVXUGRhWmVNRnR4?=
	=?utf-8?B?VVRYRWM2VXUvMCt3K1J4ZzdtWnk1eFpMa1RMMENlVVdYdklpV28zbmFxenc2?=
	=?utf-8?B?c0VnY0F4bVZ0cnRZWmc1c2xvQWlnNEUxcUtUNEdMTk5weGZ6TG1TUm0xa0pY?=
	=?utf-8?B?Wkh5MzBYVWJHb2tqVHJUSFBaa1Q4YXlwK3NTdG41QXZWck1XQUpFYmhQWE03?=
	=?utf-8?B?NndralZjUmlTa3FtRkF1NWpobGRIVzFzVmVqSTdrdVA0MGZZd24veUFnaUhC?=
	=?utf-8?B?bHBmeG1BR1lxWWdvdGFCQ3pyTkVSV05zMXg2RENIK0xBRXE5MEZXcjVJbS9o?=
	=?utf-8?B?ZjdpRXkvTzUwMWo2MmV1UHBKUDNzSGJoREtEL3lDSEozeEZTTTR6eW95VGNy?=
	=?utf-8?B?bWt1VFdrcXVVdENDNUFTS0xKR2FIVFVxVWdBT1ZtQjVJdExEYjRKOHd0dW5j?=
	=?utf-8?B?R1owQlBqMEZabUdiNi9NOVU2UHBTQ3dzdkVnTklrQW83bVp5aDdmNExmSm13?=
	=?utf-8?B?Rld4M2hoakJUS2tXcjdGYzNUbW9FQUdoSUdvTjJJQ045bnVoRkJVcDYwcG1i?=
	=?utf-8?B?alBYZ0lUOTZtaDlzSXgxRmdJZ3BvMUtPZi9wNCtSbkEwQUREclNFb09DMGQ4?=
	=?utf-8?B?dStxN3RqejNyZCtPSlFmaW9CeVYyT04ycjlNWjU2b2Qyc0psVWQ0R2dqczlF?=
	=?utf-8?B?SG1MZUNaeW81WGkycVhHbDJwOXYvdVVNMHZWZFV6TGxpempueVlVd3R1UEwy?=
	=?utf-8?B?OVpxWG1ZZmFIYmd6UzRCaEFtaWRlTUNUR0tIb0ZqOCtCMVN3YnRyNGtVTlhl?=
	=?utf-8?B?VWd1d2F5Z1YxdWQ1M0R2SFpnV09zZXV3Rmt3TFhja0VaUUZyYTRDVmttYjVm?=
	=?utf-8?B?TmwvK2o0T3FRWXAyaS9PaCsxdnVpelYrcE9IZkwzYWExL09BZktrd1IwTmhz?=
	=?utf-8?B?RWFsT3FwTkkrWk1wekpRdFVleC9hMDRUYWlscFoxbE5KZkZ3OE5IQm5VaDRT?=
	=?utf-8?B?UmlQSDF4QjM3bUlNQTlvZEY3MmhYN3FKR1lZNDNTeHpRaFN4dWVlVmRNZFZQ?=
	=?utf-8?B?Rk51MDRaNUpVSFVQbmZjNGJkQTMvaXFoSVlzZHljdm5tUXVJTGN1MXp5Uytw?=
	=?utf-8?B?b3plbmNxT2lsdVNzZjhtUTEzU3ZJUzBkVzQvM1gvVWN4cjRCZTE3RFd2bDV6?=
	=?utf-8?B?Mkg2SW5zZmdPU3lrNGg3WEpnRkZ1SHkxdzJZN2toeEFnYkFpVlU5TFVPWklz?=
	=?utf-8?B?SzNhVlJSQXZDUFJWbW8yUUxnYWIxY2RUaVc5am16a3FQSkxVT0UwYjJFWXZn?=
	=?utf-8?Q?itUkMYhoeMOsqK5yC1+jF9DAsRmBYitv6K9PAyT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d16b533a-b326-44b7-e31e-08d992584456
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 16:56:45.2177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ExmzUsSLnvWrn5t8EQhrmVo/N75Go7N31ko3QrVN7hSfDaP2X1CbfNCf2uXoX4Ott7d4ZKXl5drrsUF945kMUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5817
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Mon, 18 Oct 2021 15:09:44 -0400
Cc: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"prajnoha@redhat.com" <prajnoha@redhat.com>,
	"linux-lvm@redhat.com" <linux-lvm@redhat.com>,
	"zkabelac@redhat.com" <zkabelac@redhat.com>
Subject: Re: [linux-lvm] Discussion: performance issue on event activation
 mode
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On 10/18/21 23:04, David Teigland wrote:
> On Mon, Oct 18, 2021 at 06:24:49AM +0000, Martin Wilck wrote:
>> I'd like to second Peter here, "RUN" is in general less fragile than
>> "IMPORT{PROGRAM}". You should use IMPORT{PROGRAM}" if and only if
>>
>>   - the invoked program can work with incomplete udev state of a device
>>     (the progrem should not try to access the device via
>>     libudev, it should rather get properties either from sysfs or the
>>     uevent's environment variables)
>>   - you need the result or the output of the program in order to proceed
>>     with rules processing.
> 
> Those are both true in this case.  I can't say I like it either, but udev
> rules force hacky solutions on us.  I began trying to use RUN several
> months ago and I think I gave up trying to find a way to pass values from
> the RUN program back into the udev rule (possibly by writing values to a
> temp file and then doing IMPORT{file}).  The udev rule needs the name of
> the VG to activate, and that name comes from the pvscan.  For an even
> uglier form of this, see the equivalent I wrote for dracut:
> https://github.com/dracutdevs/dracut/pull/1567/files
> 
> The latest version of the hybrid service+event activation is here
> https://sourceware.org/git/?p=lvm2.git;a=shortlog;h=refs/heads/dev-dct-activation-switch-7
> 
> I've made it simple to edit lvm.conf to switch between:
> - activation from fixed services only
> - activation from events only
> - activation from fixes services first, then from events

For the branch code of dev-dct-activation-switch-7, If the comment before
event_activation_enable() is correct. option "event_activation" becomes useless.
I still prefer to use one switcher to control all behaviors.

> 
> There are sure to be tradeoffs, we know that many concurrent activations
> from events are slow, and fixed services which are more serialized could
> be delayed from slow devices.  I'm still undecided on the best default
> setting, i.e. which will work best for most people, and would welcome any
> thoughts or relevant experience.
> 

from my test results, I never meet delay issue under serialized mode (except udev.children_max=1).
I prefer to set services first, then events. This style will triggers performance issue after
entering events mode, but this is under expectation.

Thanks,
Heming

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

