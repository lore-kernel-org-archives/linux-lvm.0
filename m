Return-Path: <SRS0=fOC6=OC=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C02CC433F5
	for <linux-lvm@archiver.kernel.org>; Sun, 12 Sep 2021 16:52:46 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8EA460EE7
	for <linux-lvm@archiver.kernel.org>; Sun, 12 Sep 2021 16:52:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C8EA460EE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-bFPZ929JMtmjUP0qbpuADg-1; Sun, 12 Sep 2021 12:52:42 -0400
X-MC-Unique: bFPZ929JMtmjUP0qbpuADg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64233800FF3;
	Sun, 12 Sep 2021 16:52:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 179B760C04;
	Sun, 12 Sep 2021 16:52:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 173FD4E58E;
	Sun, 12 Sep 2021 16:52:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18CGq9CA026535 for <linux-lvm@listman.util.phx.redhat.com>;
	Sun, 12 Sep 2021 12:52:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5BDC32166BCC; Sun, 12 Sep 2021 16:52:09 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 54F632166BB1
	for <linux-lvm@redhat.com>; Sun, 12 Sep 2021 16:52:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F22E8007B1
	for <linux-lvm@redhat.com>; Sun, 12 Sep 2021 16:52:06 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.111.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-346-GYoRY3VCOlmTEc-qbp7ZUw-1;
	Sun, 12 Sep 2021 12:52:04 -0400
X-MC-Unique: GYoRY3VCOlmTEc-qbp7ZUw-1
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
	(mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-20-TYbW2d9KP6mMnWY6YpXtDg-1; Sun, 12 Sep 2021 18:52:01 +0200
X-MC-Unique: TYbW2d9KP6mMnWY6YpXtDg-1
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
	DB7PR04MB4267.eurprd04.prod.outlook.com (2603:10a6:5:27::29) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.4500.18; Sun, 12 Sep 2021 16:51:59 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::41ea:157:e802:5d8d]) by DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::41ea:157:e802:5d8d%6]) with mapi id 15.20.4500.018;
	Sun, 12 Sep 2021 16:51:54 +0000
To: Martin Wilck <martin.wilck@suse.com>,
	"teigland@redhat.com" <teigland@redhat.com>,
	"linux-lvm@redhat.com" <linux-lvm@redhat.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<d1d35f7dba3d0e887e7eac06a06ff2414a84c924.camel@suse.com>
	<20210607214835.GB8181@redhat.com>
	<20210608122901.o7nw3v56kt756acu@alatyr-rpi.brq.redhat.com>
	<f6b8c5b6c01ecef842eb711748a765f81b7f04e7.camel@suse.com>
	<20210909194417.GC19437@redhat.com>
	<d8c83a7f4368a9eb466fe78c98b5181ab9e80644.camel@suse.com>
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <bc871dd4-bd38-32b1-0f2c-9ed83b4d0e1d@suse.com>
Date: Mon, 13 Sep 2021 00:51:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.13.0
In-Reply-To: <d8c83a7f4368a9eb466fe78c98b5181ab9e80644.camel@suse.com>
X-ClientProxiedBy: HK0PR01CA0051.apcprd01.prod.exchangelabs.com
	(2603:1096:203:a6::15) To DB7PR04MB4666.eurprd04.prod.outlook.com
	(2603:10a6:5:2b::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from c73.home (123.123.130.24) by
	HK0PR01CA0051.apcprd01.prod.exchangelabs.com
	(2603:1096:203:a6::15) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384)
	id 15.20.4500.14 via Frontend Transport;
	Sun, 12 Sep 2021 16:51:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f74f67b-ed71-4722-79d1-08d9760d9fdc
X-MS-TrafficTypeDiagnostic: DB7PR04MB4267:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4267B8F563CFDCFC3DD1DF8997D89@DB7PR04MB4267.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: biOxhjKVlKJkjcyufK/gpvX6FopyS7TwYtHfCdPZUomiOtrWXduv7zY/Q1/MQTCLwPk4ak/R/4q6JdgajlYPVHgJuYI2T+2UYiEIr2YBn6QeFNnOgQFgy3OxuJa8RXCsFHdoHIa2/P9FsbXeVaXia3sqet/J/vZCR9v2hQmPhcua1+0yUZk2vEB4IrxsxFJ1nh2Bd2N75s7XUbae42r+NT2OOP1TWpbZDEBAudAyZXYWUfYB1ceWBldu0Iw4aTj7H35S7EgWijyUeAm3Wq2izF5hS0jfRTEM6kn8cL7ieeEKIPteFECfVkTqJZRPO7jJfEUHx3F3LgSzurnaSQMoWcNbPoLoQZKnT3poBmFJRahCnMLClJq88JYB+eeHGiNjUBZDMTaXq0/d+wH5lud27hLq/+niXuVcqzIJWEdLkpYeqDcYCoM9SOVk0jDffmDRfLGFi3hRRuYDT+k+qyXr1H4TOLtQk4jFq0cMtDx4ZFIxKld/6q2gXMEv4yspBJNw7B/Mk2xTUTONWjh3EnjlcgrnZfoVYgCJ6/kt6+Qly5C5dG+1MTZQg7+tMajO7ozesm3qdNw+2J3WsQa26qXWxDXi5EbNYJSNWZDPND/obtX0PIHyVxMIcmAI4jFN2vIIIIXYAesIcNITx1ynZmBv7XiE2T8tZM+Oscq3iyQBQ8w12GGewk+Tk0YeLY9DCJjwejJio5ZWgUTryvd4PyrHIHjyvLEQfOFTtfsyeGkk8nfkbtzOFl3n+so1fRyr4vCwrEfBFhyBK8m9uhjONHgUMVq/UJsimwf8ow2+XHyzzKA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB7PR04MB4666.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(36756003)(316002)(8936002)(2616005)(26005)(54906003)(956004)(110136005)(83380400001)(5660300002)(4326008)(450100002)(8886007)(31696002)(38100700002)(86362001)(2906002)(508600001)(53546011)(6512007)(31686004)(8676002)(66946007)(6506007)(966005)(66476007)(66556008)(6486002)(6666004)(186003)(9126006)(43740500002);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EcoZp94PYJ1oVaWI2nbtDibDo7RtFMVhpmgRd2/NcSaRVRtOoFm6rxIps+yg?=
	=?us-ascii?Q?QpxHfhFd2O/axZ6j+Rx5ZDYRGISIZZpFP6bH0/SV7UPPr120dGMbq7Bgjofs?=
	=?us-ascii?Q?AgNwHFGJ+UlUWkNrTF2RvTyIcTg2LwL2qkaydKtgSoyGivEjqqz8x30y9KzX?=
	=?us-ascii?Q?3KEOCtNaL7JWtzc1KaCo1MDIEoi4UB5DWQnWhrGUIOkLHvHZH8fhmn0wp3J1?=
	=?us-ascii?Q?X4LI55oWWH4RZd/TI+unUctw3eDDdP+RTDGMcQUC+ngZLEedV8Gybj8TD06/?=
	=?us-ascii?Q?2iZ+Ggproj5EH2kmdzoys5ld5BnI4DjIvJ4U9vN5MsNAjALqbTzWHX5L5+NY?=
	=?us-ascii?Q?a0+vLPY5uz78EURowe3iaF7WaHGkEcExOh/BN0AU3ceg9bSWfK1xoCz+KLSg?=
	=?us-ascii?Q?T0hmOKaS1Np48n25idq0eCewB29Q6ZO0A9x3iHCy9UK2okHfJhD9SU/cDwEe?=
	=?us-ascii?Q?C4r7ikvPUWxGV80ZvPCASz5/yJYgU0B8IYrLfZQqrgDuB88h+Q33vX9OfbYM?=
	=?us-ascii?Q?42SS+XjeQfZyUI8jc7OJYQsnqNfbIGtocglwTVhPckrKCEkE80Dy6FN+9aVT?=
	=?us-ascii?Q?pFueZ+z39XzP6OReb8J6csfTP2Vhu61/ClSVVabiNkvvSl0gCMLdFko07XOZ?=
	=?us-ascii?Q?Ss8Daz7QzOCAjywIaDvvjAMykhlVTYxXE54ObYIsX11xhy2kpNlW6uSJi507?=
	=?us-ascii?Q?CmNb41NqrxUxJfJJcG97gnac5a75uHabzf7jHIHhZ9llFhTQYH1tplyigAhO?=
	=?us-ascii?Q?OjaLEAWwLegx0UNc/NECwqeo/igdxC3KsNMBh9F1o2URMPl8qx/jhef7Yphw?=
	=?us-ascii?Q?rMPYOMaQkQKpTTuURLviLnYbPn/IKx5Rj+H+5fPolCf8VtxfTPp/CwPV2VS/?=
	=?us-ascii?Q?9p1EI0sDUlijqLOnnblOhoBZBzSpUF2HAdIaHFXI5Z4Nt1QNycMcoh4zp4wG?=
	=?us-ascii?Q?SIHVkszc3n/D945n87CL7W8QqdRcJQ6p7xdOkNLGaU2bJ9lGH5Ar/yWF4HPT?=
	=?us-ascii?Q?utdSOCN+ZL8L+mdSTJpGxy8kvRtHXhGo75b49AjYrFTaolk2BlxvRjwmkohX?=
	=?us-ascii?Q?XcmWkvV1ayIAPQ0UTcYmceLhjHMMB0/wdtcmEHGl4uOtdWlwzQ+P/IDurnNs?=
	=?us-ascii?Q?/8wfFfmt9twe49RNGXnP/NRiIMC8S7Crh7SPg1p/jFw2dnnG7p9Wnsw9Tp2d?=
	=?us-ascii?Q?huXMWDxJ/qPV/2FTEMeIcqIO444b0oBUGvhceG9AoM3Mp0xcx9gilwZ1ZEfl?=
	=?us-ascii?Q?Kupr4N+akgDGqfunuyDvEcpwptXO9Mh7HuP2kFqX024AutOiTvYzSmqB6BJJ?=
	=?us-ascii?Q?XoH+Btncmx10NE4RU8PpAJPL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f74f67b-ed71-4722-79d1-08d9760d9fdc
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2021 16:51:53.9603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XDwy7yY+okiuuvKYnNn2wWD6BEVKdXBSD5ORqNRxXQYbmNDJ7Nb2/OQwSwvYU+0LV2d4fKxbMqEXVLHil3B10Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4267
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 18CGq9CA026535
X-loop: linux-lvm@redhat.com
Cc: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"prajnoha@redhat.com" <prajnoha@redhat.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-15"; Format="flowed"

On 9/11/21 1:38 AM, Martin Wilck wrote:
> On Thu, 2021-09-09 at 14:44 -0500, David Teigland wrote:
>> On Tue, Jun 08, 2021 at 01:23:33PM +0000, Martin Wilck wrote:
>>> On Di, 2021-06-08 at 14:29 +0200, Peter Rajnoha wrote:
>>>> On Mon 07 Jun 2021 16:48, David Teigland wrote:
>>>>>
>>>>> If there are say 1000 PVs already present on the system, there
>>>>> could be
>>>>> real savings in having one lvm command process all 1000, and
>>>>> then
>>>>> switch
>>>>> over to processing uevents for any further devices afterward.
>>>>> The
>>>>> switch
>>>>> over would be delicate because of the obvious races involved
>>>>> with
>>>>> new devs
>>>>> appearing, but probably feasible.
>>>>
>>>> Maybe to avoid the race, we could possibly write the proposed
>>>> "/run/lvm2/boot-finished" right before we initiate scanning in
>>>> "vgchange
>>>> -aay" that is a part of the lvm2-activation-net.service (the last
>>>> service to do the direct activation).
>>>>
>>>> A few event-based pvscans could fire during the window between
>>>> "scan initiated phase" in lvm2-activation-net.service's
>>>> "ExecStart=3Dvgchange -aay..."
>>>> and the originally proposed "ExecStartPost=3D/bin/touch
>>>> /run/lvm2/boot-
>>>> finished",
>>>> but I think still better than missing important uevents
>>>> completely in
>>>> this window.
>>>
>>> That sounds reasonable. I was thinking along similar lines. Note
>>> that
>>> in the case where we had problems lately, all actual activation
>>> (and
>>> slowness) happened in lvm2-activation-early.service.
>>
>> I've implemented a solution like this and would like any thoughts,
>> improvements, or testing to verify it can help:
>> https://sourceware.org/git/?p=3Dlvm2.git;a=3Dshortlog;h=3Drefs/heads/dev=
-dct-activation-switch-1
>>
>> I've taken some direction from the lvm activation generator, but
>> there are
>> details of that I'm not too familiar with, so I may be missing
>> something
>> (in particular it has three activation points but I'm showing two
>> below.)
>> This new method would probably let us drop the activation-generator,
>> since
>> we could easily configure an equivalent using this new method.
>>
>> Here's how it works:
>>
>> uevents for PVs run pvscan with the new option --eventactivation
>> check.
>> This makes pvscan check if the /run/lvm/event-activation-on file
>> exists.
>> If not, pvscan does nothing.
>>
>> lvm-activate-vgs-main.service
>> . always runs (not generated)
>> . does not wait for other virtual block device systems to start
>> . runs vgchange -aay to activate any VGs already present
>>
>> lvm-activate-vgs-last.service
>> . always runs (not generated)
>> . runs after other systems, like multipathd, have started (we want it
>>  =A0 to find as many VGs to activate as possible)
>> . runs vgchange -aay --eventactivation enable
>> . the --eventactivation enable creates /run/lvm/event-activation-on,
>>  =A0 which enables the traditional pvscan activations from uevents.
>> . this vgchange also creates pv online files for existing PVs.
>>  =A0 (Future pvscans will need the online files to know when VGs are
>>  =A0 completed, i.e. for VGs that are partially complete at the point
>>  =A0 of switching to event based actvivation.)
>>
>> uevents for PVs continue to run pvscan with the new option
>> --eventactivation check, but the check now sees the event-activation-
>> on
>> temp file, so they will do activation as they have before.
>>
>> Notes:
>>
>> - To avoid missing VGs during the transition to event-based, the
>> vgchange
>> in lvm-activate-vgs-last will create event-activation-on before doing
>> anything else.=A0 This means for a period of time both vgchange and
>> pvscan
>> may attempt to activate the same VG.=A0 These commits use the existing
>> mechanism to resolve this (the --vgonline option and
>> /run/lvm/vgs_online).
>>
>> - We could use the new lvm-activate-* services to replace the
>> activation
>> generator when lvm.conf event_activation=3D0.=A0 This would be done by
>> simply
>> not creating the event-activation-on file when event_activation=3D0.
>>
>> - To do the reverse, and use only event based activation without any
>> lvm-activate-vgs services, a new lvm.conf setting could be used, e.g.
>> event_activation_switch=3D0 and disabling lvm-activate-vgs services.
>=20
> This last idea sounds awkward to me. But the rest is very nice.
> Heming, do you agree we should give it a try?
>=20

the last note is do the compatible things. we can't image & can't test all
the use cases, create a switch is a good idea.
but believe me, except lvm2 developers, no one understand event/direct acti=
vation
story. the new cfg item (event_activation_switch) is related with another i=
tem
(event_activation) will make users confuse.

We should help users to do the best performance job/selection. So we could =
reuse
the item "event_activation", current value is 0 and 1, we can add new value=
 '2'.
i.e.:
0 - disable event_activation (use direct activation)
1 - new behaviour
2 - old/legacy mode/behavior

default value is 1 but the lvm behavior is changed.
if anyone want to use/reset, to assign '2' to this item.

-------
I had verified this new feature in my env. this feature make a great progre=
ss.

new feature with lvm config:
obtain_device_list_from_udev =3D 1
event_activation =3D 1
udev_sync =3D 1

systemd-analyze blame: (top 9 items)
          20.809s lvm2-pvscan@134:544.service
          20.808s lvm2-pvscan@134:656.service
          20.808s lvm2-pvscan@134:528.service
          20.807s lvm2-pvscan@133:640.service
          20.806s lvm2-pvscan@133:672.service
          20.785s lvm2-pvscan@134:672.service
          20.784s lvm2-pvscan@134:624.service
          20.784s lvm2-pvscan@128:1008.service
          20.783s lvm2-pvscan@128:832.service

the same lvm config costed 2min 6.736s (could find this result from my prev=
ious mail).

and the shortest time in previous mail is 17.552s, under cfg:
obtain_device_list_from_udev=3D1, event_activation=3D0, udev_sync=3D1

the result (20.809s) is very close to direct activation, which is also reas=
onable.
(lvm first uses direct mode then switch to event mode)

Thanks,
Heming


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

