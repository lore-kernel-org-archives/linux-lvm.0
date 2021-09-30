Return-Path: <SRS0=XKGo=OU=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8604FC433F5
	for <linux-lvm@archiver.kernel.org>; Thu, 30 Sep 2021 08:08:28 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C234761528
	for <linux-lvm@archiver.kernel.org>; Thu, 30 Sep 2021 08:08:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C234761528
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-no96uSztMpGCT6cEwN5vlw-1; Thu, 30 Sep 2021 04:08:25 -0400
X-MC-Unique: no96uSztMpGCT6cEwN5vlw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 565F31084681;
	Thu, 30 Sep 2021 08:08:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C5A1C604CC;
	Thu, 30 Sep 2021 08:08:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 825CC4EA2A;
	Thu, 30 Sep 2021 08:08:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18U884mv002486 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 30 Sep 2021 04:08:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CD6F22028786; Thu, 30 Sep 2021 08:08:04 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C72792028782
	for <linux-lvm@redhat.com>; Thu, 30 Sep 2021 08:07:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2A76899EE1
	for <linux-lvm@redhat.com>; Thu, 30 Sep 2021 08:07:50 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.111.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-596-WNAeRDd3NZezytM3AhlDbg-1;
	Thu, 30 Sep 2021 04:07:48 -0400
X-MC-Unique: WNAeRDd3NZezytM3AhlDbg-1
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur03lp2050.outbound.protection.outlook.com [104.47.10.50])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-38-p4Upr1lfMFyGK2REh5VLcw-1; Thu, 30 Sep 2021 10:07:46 +0200
X-MC-Unique: p4Upr1lfMFyGK2REh5VLcw-1
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
	DB8PR04MB6908.eurprd04.prod.outlook.com (2603:10a6:10:116::14) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.4566.14; Thu, 30 Sep 2021 08:07:44 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::41ea:157:e802:5d8d]) by DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::41ea:157:e802:5d8d%6]) with mapi id 15.20.4544.023;
	Thu, 30 Sep 2021 08:07:44 +0000
To: Martin Wilck <martin.wilck@suse.com>,
	"bmarzins@redhat.com" <bmarzins@redhat.com>,
	"prajnoha@redhat.com" <prajnoha@redhat.com>
References: <20210607214835.GB8181@redhat.com>
	<20210608122901.o7nw3v56kt756acu@alatyr-rpi.brq.redhat.com>
	<f6b8c5b6c01ecef842eb711748a765f81b7f04e7.camel@suse.com>
	<20210909194417.GC19437@redhat.com>
	<20210927100032.xczilyd5263b4ohk@alatyr-rpi.brq.redhat.com>
	<20210927153822.GA4779@redhat.com>
	<9947152f39a9c5663abdbe3dfee343556e8d53d7.camel@suse.com>
	<20210928144254.GC11549@redhat.com>
	<138b7ddb721b6a58df8f0401b76c7975678f0dda.camel@suse.com>
	<20210928174246.GF3087@octiron.msp.redhat.com>
	<20210929220653.p45cvgzdhlbnp4gy@alatyr-rpi.brq.redhat.com>
	<e8459ca73b148e9ba20cbde0041f6e5f4093699d.camel@suse.com>
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <a3ef9433-ccab-68ea-de00-caebd74e81dc@suse.com>
Date: Thu, 30 Sep 2021 16:07:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.14.0
In-Reply-To: <e8459ca73b148e9ba20cbde0041f6e5f4093699d.camel@suse.com>
X-ClientProxiedBy: HK2PR02CA0136.apcprd02.prod.outlook.com
	(2603:1096:202:16::20) To DB7PR04MB4666.eurprd04.prod.outlook.com
	(2603:10a6:5:2b::14)
MIME-Version: 1.0
Received: from c73.home (123.123.134.218) by
	HK2PR02CA0136.apcprd02.prod.outlook.com (2603:1096:202:16::20)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14
	via Frontend Transport; Thu, 30 Sep 2021 08:07:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f6422af-5b71-4ef2-ec83-08d983e961c2
X-MS-TrafficTypeDiagnostic: DB8PR04MB6908:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB6908EA045059740A2E7D886897AA9@DB8PR04MB6908.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: vcpyA9DfNwWBUZ/24gNXtwQkVJdMx5l53RuvcDtMpiOuNNeCg8nIu+V5P54wVAJQj/KdVWep4BvVIQej3ChAASPNl69bOXxDFqj9pt+6kJpVW9sbpxyjoN51Fz0oedrjmUIASlogVklqmRsBGcVIxzSRZP61cOkx7vuFSASmlHZUI8g5l0xwgP0PdWZRLEHTzheve+ZbrwY6UZwrejYt3FAscyskmFzZBfLjoOQKxjgHPMf7X+NSwz8X5rqQWOXWbqLo2TT9BDTjrTVeYIFbUCZ1c+KWCTplDPbGS5xK9EPB2L1v/uT3ymCcxPSu8irVDiz4lA62Yte1TZQWHwXi26ldruvE1a5Uc5HQuAUTAL3FV2fOO+GVFDNCKpfDPoPI3faav/+IcW/Qy2RsraDDR66X3d+vQXHodNM7wLzkjQB6v2Av3rgL4jNJjnJcgkqHBrUPfslu5987bYCsQtKXV5LnR073fJJDuv7BIZBAPZtFeYfwzDKnEyfRIWc3ieAUuyomF2aP8pnLi3waXbLCXnsfsfOvIOO+j+QERVhduweOuq/8xXVNqICC7nHsc8rLeyyoaCGPuTj/RP30ctZh5Q4woWER7Vu1K7qrOZCT+7CnBihZFFfDcHeLqLBZoqdmTgfX1O8u4TQR+dtvEukA21r4XfzUIVkNtzY0varm731WSpgts3a8nyCk5T4R7pC/ry96T9cMqccM3q9UXB6dzRRdiP+YAV2sc6uBm0jsH9mG+b36LgHTjfhItqflXPgpx277Ulf1dPGZJGSoQzdPKP0lFLgIBDJwHoasFnBR9RZt0adlyaqQg2YbQE5f6hDaCtnKvKcboP7oP1rahA7mGg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB7PR04MB4666.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(2616005)(83380400001)(508600001)(36756003)(8886007)(31696002)(31686004)(966005)(86362001)(186003)(4326008)(6666004)(38100700002)(6486002)(26005)(54906003)(110136005)(450100002)(66946007)(53546011)(6512007)(956004)(316002)(66476007)(2906002)(66556008)(8936002)(5660300002)(6506007)(8676002)(9126006)(43740500002)(45980500001);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RJ/ziQf9IRrrlOIAD6VkWt2NJk5gCmU6+TlJXEanfXT7li77kgNlljjdT00l?=
	=?us-ascii?Q?2Z1J0t/EuJWgWve3O3ekLsAuTqnOdBhqV62EzJ5qZ6JuuWf/YyQ+ZErdOhU0?=
	=?us-ascii?Q?LHg63yqgPVB0mUdQvlc/RzKJ6gPiRqV1BEq3TuBJAxpqpoqFM1y0IT/b85in?=
	=?us-ascii?Q?N3CZuw8LiWPBom9/2EQM+rAPkU6LqohzkuEk7V7Tli4ijhELll+2GkPCOBqS?=
	=?us-ascii?Q?NaBfy2dT2b+Zg1gA/ill/+XmJ7233K/wHgnm+3mD4OHrp4kaRKIQ/V/Q7X0O?=
	=?us-ascii?Q?Dan5Y/HEE7Mz/trgRow9UQMULt6FqpT1m4/ZQqgPOmaolEakkBx5iwictDFD?=
	=?us-ascii?Q?PiPcQxvr3IySvidkGKNMJOOCh4Bn2KbSowQ9k1CeKGMdICKvXlQjvXurpM0L?=
	=?us-ascii?Q?icgN7Cm8pITnmAFM9u1CXwwFbhIKA2JVPUEZAABhx9G/8Gj/b9FpeAQt64DQ?=
	=?us-ascii?Q?Z7K4bjGzsskNXdHH556UMstAwQuzsEkyx1T3jn1RRWNTo+5E3gHYcGYG9pcU?=
	=?us-ascii?Q?Sq+EWMyo4BZcgCTn2eOVtcLf3W7xMO/JxfnGtsOHYfpPaN4N0dltsIIp7uTU?=
	=?us-ascii?Q?hvxG4VHFb64YwGM4xMaHOoKGj8ZJKe8VdHTBSEqKEgjswNJloCKe7j1ubfn2?=
	=?us-ascii?Q?Rd48T+LgLbRykvX8/6VS0eKYha8RY0gSX/PZNXQBew7bZke/ETPSnVZ70rcI?=
	=?us-ascii?Q?m5wbD1mFuiOWuP2UK+XhzdLGbnESeghuZ8P8EkcmYD60kOLJjnsiyNGl8sj9?=
	=?us-ascii?Q?oxOsNEHpMd5A2oQ0ySk7yGkZsrHmCRjzOxPZz65ZMTQI/3WiI05rxRDSI4B+?=
	=?us-ascii?Q?pQAp1/tFvAdsxP37ama1V8eZ8iALdIrDm5g6ZcIgcwbY+9FQGJaPqD5pDyfq?=
	=?us-ascii?Q?7ZRGAVCLni1B92887ZTwyjauRWf9EUXG/M15geTGexlWwfrB9tBmIXbYdK+W?=
	=?us-ascii?Q?FABkhslyMOkd+suTzF6AvK0ezQAd3qbNpyvekT8Vr8lZnpzh9HYbka9zERVT?=
	=?us-ascii?Q?KuhYQYYScSY0hdSlBD6xI2BjP1KTtC0RFTEqeA/4BH2Ec8JqULQpSfJGP+1S?=
	=?us-ascii?Q?eoI3AYjleLN5hZYt9CzXbLcUqfxuknPU/VBxQtf6k+gX104O++wIMjgCujDC?=
	=?us-ascii?Q?JFtuEi9fvh3bht1V+sP1IVybw2d+4XUIoPLKrPE9qMKbZE+gKnvITGCYvNUz?=
	=?us-ascii?Q?44H8qf8hh34MEaXjiCWfDyKNLxSK/0suxFUYfoYm0FJ1OE+qhkJbPew5H+Us?=
	=?us-ascii?Q?9fTYFYqi0hFyZ15P7YHX3fTybuETMPUxha1jZ/6lnbuBlhmzz16C8zs41Yy2?=
	=?us-ascii?Q?D3xxcbW8xIwj7nxqrqqOKS3N?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f6422af-5b71-4ef2-ec83-08d983e961c2
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 08:07:44.3767 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EL299jobwqQPuQQEpPb7iL4D1ssvIY/hbocHY3HxTwdwoW2dkhAUdDgsv329kQQyl2OheoAApzT10sRlxC80lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6908
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 18U884mv002486
X-loop: linux-lvm@redhat.com
Cc: "linux-lvm@redhat.com" <linux-lvm@redhat.com>,
	"teigland@redhat.com" <teigland@redhat.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-15"; Format="flowed"

On 9/30/21 3:51 PM, Martin Wilck wrote:
> On Thu, 2021-09-30 at 00:06 +0200, Peter Rajnoha wrote:
>> On Tue 28 Sep 2021 12:42, Benjamin Marzinski wrote:
>>> On Tue, Sep 28, 2021 at 03:16:08PM +0000, Martin Wilck wrote:
>>>> I have pondered this quite a bit, but I can't say I have a
>>>> concrete
>>>> plan.
>>>>
>>>> To avoid depending on "udev settle", multipathd needs to
>>>> partially
>>>> revert to udev-independent device detection. At least during
>>>> initial
>>>> startup, we may encounter multipath maps with members that don't
>>>> exist
>>>> in the udev db, and we need to deal with this situation
>>>> gracefully. We
>>>> currently don't, and it's a tough problem to solve cleanly. Not
>>>> relying
>>>> on udev opens up a Pandora's box wrt WWID determination, for
>>>> example.
>>>> Any such change would without doubt carry a large risk of
>>>> regressions
>>>> in some scenarios, which we wouldn't want to happen in our large
>>>> customer's data centers.
>>>
>>> I'm not actually sure that it's as bad as all that. We just may
>>> need a
>>> way for multipathd to detect if the coldplug has happened.=A0 I'm
>>> sure if
>>> we say we need it to remove the udev settle, we can get some method
>>> to
>>> check this. Perhaps there is one already, that I don't know about.
>>> If
>>
>> The coldplug events are synthesized and as such, they all now contain
>> SYNTH_UUID=3D<UUID> key-value pair with kernel>=3D4.13:
>>
>>  =20
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/ABI/testing/sysfs-uevent
>>
>> I've already tried to proposee a patch for systemd/udev that would
>> mark
>> all uevents coming from the trigger (including the one used at boot
>> for
>> coldplug) with an extra key-value pair that we could easily match in
>> rules,
>> but that was not accepted. So right now, we could detect that
>> synthesized uevent happened, though we can't be sure it was the
>> actual
>> udev trigger at boot. For that, we'd need the extra marks. I can give
>> it
>> another try though, maybe if there are more people asking for this
>> functionality, we'll be at better position for this to be accepted.
>=20
> That would allow us to discern synthetic events, but I'm unsure how
> this what help us. Here, what matters is to figure out when we don't
> expect any more of them to arrive.
>=20
> I guess it would be possible to compare the list of (interesting)
> devices in sysfs with the list of devices in the udev db. For
> multipathd, we could
>=20
>   - scan set U of udev devices on startup
>   - scan set S of sysfs devices on startup
>   - listen for uevents for updating both S and U
>   - after each uevent, check if the difference set of S and U is emtpy
>   - if yes, coldplug has finished
>   - otherwise, continue waiting, possibly until some timeout expires.
>=20
> It's more difficult for LVM because you have no daemon maintaining
> state.
>=20

Another performance story:
The legacy lvm2 (2.02.xx) with lvmetad daemon, the event-activation mode
is very likely timeout on a large scale PVs.
When customer met this issue, we suggested them to disable lvmetad.

Heming


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

