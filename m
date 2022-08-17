Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25527C32774
	for <linux-lvm@archiver.kernel.org>; Tue, 23 Aug 2022 08:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661243343;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/w6SNTyK2EUqkff+vklhI8eVeZo++yJlr+OvGL+hTzI=;
	b=UaAGq1+erouUj581i0+d0YmWr2flRkqTKpqKg7tU+o40wgyfJib+kD5cMIvdE4tIVR80uC
	OKbDiREvB62tYyn56o9W+Spi7DSVHCOlMhv/SrIfZ7BpDpyVkFivRf+iNaNoZy5fk5zXn7
	TCgaUfWPAH4UzrWTsOtHYFPjFSmFRPI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-htC4T3KvOLihee25ljLq3A-1; Tue, 23 Aug 2022 04:28:31 -0400
X-MC-Unique: htC4T3KvOLihee25ljLq3A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D68B729DD997;
	Tue, 23 Aug 2022 08:28:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BF78E4010D42;
	Tue, 23 Aug 2022 08:28:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A1F7A1946A7B;
	Tue, 23 Aug 2022 08:28:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 057731946A40
 for <linux-lvm@listman.corp.redhat.com>; Wed, 17 Aug 2022 10:47:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E80D91457F21; Wed, 17 Aug 2022 10:47:41 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E30631457F20
 for <linux-lvm@redhat.com>; Wed, 17 Aug 2022 10:47:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C39AC3817A65
 for <linux-lvm@redhat.com>; Wed, 17 Aug 2022 10:47:41 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20059.outbound.protection.outlook.com [40.107.2.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-316-QegFm4M3N7aC-68a9h9avg-1; Wed, 17 Aug 2022 06:47:40 -0400
X-MC-Unique: QegFm4M3N7aC-68a9h9avg-1
Received: from AM6PR04MB4662.eurprd04.prod.outlook.com (2603:10a6:20b:1b::21)
 by AM6PR04MB5014.eurprd04.prod.outlook.com (2603:10a6:20b:12::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Wed, 17 Aug
 2022 10:47:37 +0000
Received: from AM6PR04MB4662.eurprd04.prod.outlook.com
 ([fe80::8149:c8e2:d4a4:d497]) by AM6PR04MB4662.eurprd04.prod.outlook.com
 ([fe80::8149:c8e2:d4a4:d497%7]) with mapi id 15.20.5525.011; Wed, 17 Aug 2022
 10:47:37 +0000
Date: Wed, 17 Aug 2022 18:47:32 +0800
From: Heming Zhao <heming.zhao@suse.com>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <20220817104732.jhu3ug6ahep3rnpq@c73>
References: <20220816092820.6xbab36dcmxq5hfm@c73>
 <be332c6b-4b65-6462-c570-ee6d0e81b985@gmail.com>
 <20220816100802.yy3xqvynil4pcspb@c73>
 <204c332e-2a30-b17a-ecc1-58025454eb00@gmail.com>
 <20220817020225.gf6ooxobdf5xhpxe@c73>
 <6fa27852-e898-659f-76a5-52f50f0de898@gmail.com>
 <20220817084343.33la7o6fdh5txul4@c73>
 <27cd8fd6-1058-fe18-dab6-847d41bf894d@gmail.com>
In-Reply-To: <27cd8fd6-1058-fe18-dab6-847d41bf894d@gmail.com>
X-ClientProxiedBy: SG2PR06CA0213.apcprd06.prod.outlook.com
 (2603:1096:4:68::21) To AM6PR04MB4662.eurprd04.prod.outlook.com
 (2603:10a6:20b:1b::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce2f9535-cb53-4ae9-b3fb-08da803de665
X-MS-TrafficTypeDiagnostic: AM6PR04MB5014:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: liofULGIj+ecOQNEnQIHCCBRs4ukag5wwSU1cpRAb7cT95PixuSl3YsulKF3vAOBFeuHQauHZat4RARVpnwbAmev/QfIslAWh/ifTLyLcrVMBdz2mx7e6P9AUZ8+w3Vfj46CROa7f99jn9munobx/Jc4JQLzOwPNYGxCmfjzt/guaNOYBhxld6z8mt/PnhzPr0XdKTGkMy9G3WzXJZOFYPzMBezT8PGdHFa4DYlUh3NVuCiJ7NceYfhEKJ4/7T3FX+Repm7GrpowdntTx7GcuDfLv5xUeN88tA7Ek04nzt+Km3HFElx+jydi7Zwns7BJ4W5R1H5zgz8YxZ7mUi+sprazmegsae1C4s/OiNNl0XIL9DVQyGPnz5tJFt7iBDHhSBgjjYF10Pe91NFL2veROxhXrRcmjjO5CEI/fxuJU8FA9sVWjDPEFmBkZ7+eumlWoJX/1TH+2NeWsI+B2igj99yPn/1uCxn28ur/lo+hG4/wSaqAz3lxPQU5+UCPwHXSHM60dBy6r6RH7P8syP0nmc5a6zma/HkGIoEC7b84XzLRSzQpw2IgHigwA3sqZ8jEa1lOF+FrEMIkkHZUYLYLIOWJehGmk9fFFF7fgLsUCAhMsUF/8npOuBRC7ptPZ2rI/qw8RNufST/CiBrhCbkxIrDIhYjDm20xR6i9syAfoWDqrHCx2ckmwGk3NvVtX/Hd+AxX6KSeT2Xaf83o0nNS4p/2wHHPk4A63lXzeFrHY/bv6rhR0OhImvWxjEWghRtjNt3GchnVH4yMo69NMPRA4SApRe6+PhHXSyoGYyHiKtU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB4662.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(39860400002)(346002)(366004)(396003)(376002)(136003)(5660300002)(1076003)(33716001)(2906002)(86362001)(38100700002)(44832011)(83380400001)(478600001)(6512007)(41300700001)(6506007)(8676002)(9686003)(26005)(66556008)(8936002)(66476007)(6486002)(66946007)(4326008)(6916009)(316002)(6666004)(186003)(21314003);
 DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oj7GcXNhhIhd2VS0VkIr+uUMCN60pNhBLoAJvtpLPtKmZgAlkUlM51nfxNC+?=
 =?us-ascii?Q?kQ6uW+SxCeWJnwbx+nRpYvGIZxIRqbMhERLkbvGUg4bl6Du636mSPJXr+jad?=
 =?us-ascii?Q?+FJCTi2XMkDzg1cG0S6oUmEMtwpllf7yVIksf4r/ELBENT/1dX8yW930RHar?=
 =?us-ascii?Q?oOWL12fLYQlMWt560yg8d56TOFpZ8oxsq9BCJVwbRmBSWXrV9sgIvNW9GlTR?=
 =?us-ascii?Q?HRs5ZjEpcXw2Y+xNzx0Jlj8NkuVLVrlUxlIzHSrLYp29B2pch1SZ8vVORgIU?=
 =?us-ascii?Q?40Kt5I7r9yoZ5JY9JZjXBfEVB0kzFcQYgDi2b+eGOEWycLMOE3NEXoXiiLv5?=
 =?us-ascii?Q?fpxXhKfaLrG/DR3tTHKNpSbYxGApLC6iBGzcH+85FCFqLefHFkAP4rIpxh6E?=
 =?us-ascii?Q?ATxScVKYiFFvruqiGjjM3o1k99BKnGXUex+wAXB1iWVJCK56ORc61ddZ69Gq?=
 =?us-ascii?Q?9x8lNnh73NZDg4y/hJRWbS4sEdkj8EdqoBVhDHJv2cSi+syp88qyxRuuRs7o?=
 =?us-ascii?Q?XZK5GD6t7Xe1BzXOgMV/MsEPkF7uBEcTfQGROMt9uxDUd+7K9L6EJSBH7qCT?=
 =?us-ascii?Q?uFeeIAtf75ROeKZKj6qpjwMHfXAUOzam0npAZFOWygfJ/kKk8mERYazdVq5h?=
 =?us-ascii?Q?Gr1HodYVmtcfd5Tbruk3Ock28QwTe4+mxff5fy04IYdUrmhT5uz0Kbism3IJ?=
 =?us-ascii?Q?zDCHQTl4mo2gjpDpkD649LRRsCWEgxEludM+LEDhNGgywt8KKvoAn+5OPiTI?=
 =?us-ascii?Q?Dg1XJxVLTaZQv5LvImsM9VhxZxwejhp/1kUDj0lVlSvgNsDXZlcZBmkVoNuo?=
 =?us-ascii?Q?MyL7nYAgE/7M27Cs2XshAYZxVkLUaryfUe5255KXBCGBsCuxkKFGfDqxpl8e?=
 =?us-ascii?Q?fvBYD+Lzyr8iR0KUWNba6n12BZ5hIJkH2NZQ/fEbPTajEBjCucpml8tGsZ27?=
 =?us-ascii?Q?p59j7H6wj0td1aNIKD5DE1cZq6B/fhQnegcJxlBv0aK92k5rpx3bMZGGdoAE?=
 =?us-ascii?Q?Fv6m3mjmXVt55BH0vBzoZoh9S7ZvptjG8CDNrJinY1k5lqvPrHiWEXciP2zs?=
 =?us-ascii?Q?rMwA/YkAJdP2rTrNLAthITR6Y80+C8qPVtJAv9WDJExA3F+S0UMqRnK4VmbH?=
 =?us-ascii?Q?jhh6Oz7JyNzsGQcjQVgGFKP/aU/wuBJjjMaIMs5aQbyXjvNrxmHl1PYBO+ce?=
 =?us-ascii?Q?gQTrHB04R+7+yg8Weutqp1rfKktxPawwzfRQ6BhUGBEffW5TYGTaMRdgU9uV?=
 =?us-ascii?Q?jGMD4aeE4LqSXqJUfmuz3IV3zxk4FFoGoW0jlwYa2R+rIWLseVEgSRXrmb1i?=
 =?us-ascii?Q?i4AGcIIr3IaC2dd6q30qWUmqjo6e6YXjSCu2EAIa42Le0TQVplf839wbsmjt?=
 =?us-ascii?Q?6A7Uwnuce11eLPQv2zDAq8GZtGRaMy3KycK7YvmX9Co9hIEhnx2LBW8brryP?=
 =?us-ascii?Q?r8jZrrz1jSATRom4UPmZInk9g/4wHJhxduZJt+Lui3DnaOgdsza4R2vCenke?=
 =?us-ascii?Q?k13EbK1b5Gqf+cqXcKW2ffcxJgjGuGsqIs4G4y+8ZuOJAE0K4KF1X778bpIn?=
 =?us-ascii?Q?pWZHMChQSd3BQ/VeQJjMN5ouaK9/A2eQgsIb2/zr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce2f9535-cb53-4ae9-b3fb-08da803de665
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4662.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 10:47:37.4850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BAHtJvwThpVVk0+CueoNsFYuj852jheMA1sh4p7hVoY0RKetSJKtLx91OswR466/jO2hQw/jpCk7+UZYig0H2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5014
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Mailman-Approved-At: Tue, 23 Aug 2022 08:28:21 +0000
Subject: Re: [linux-lvm] lvmpolld causes high cpu load issue
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
Cc: linux-lvm@redhat.com, teigland@redhat.com, martin.wilck@suse.com
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 17, 2022 at 11:46:16AM +0200, Zdenek Kabelac wrote:
> Dne 17. 08. 22 v 10:43 Heming Zhao napsal(a):
> > On Wed, Aug 17, 2022 at 10:06:35AM +0200, Zdenek Kabelac wrote:
> > > Dne 17. 08. 22 v 4:03 Heming Zhao napsal(a):
> > > > On Tue, Aug 16, 2022 at 12:26:51PM +0200, Zdenek Kabelac wrote:
> > > > > Dne 16. 08. 22 v 12:08 Heming Zhao napsal(a):
> > > > > > Ooh, very sorry, the subject is wrong, not IO performance but cpu high load
> > > > > > is triggered by pvmove.
> > > > > > 
> > > > > > On Tue, Aug 16, 2022 at 11:38:52AM +0200, Zdenek Kabelac wrote:
> > > > > > > Dne 16. 08. 22 v 11:28 Heming Zhao napsal(a):
> > > > > > > > Hello maintainers & list,
> > > > > > > > 
> > > > > > > > I bring a story:
> > > > > > > > One SUSE customer suffered lvmpolld issue, which cause IO performance dramatic
> > > > > > > > decrease.
> > > > > > > > 
> > > > > > > > How to trigger:
> > > > > > > > When machine connects large number of LUNs (eg 80~200), pvmove (eg, move a single
> > > > > > > > disk to a new one, cmd like: pvmove disk1 disk2), the system will suffer high
> > > > > > > > cpu load. But when system connects ~10 LUNs, the performance is fine.
> > > > > > > > 
> > > > > > > > We found two work arounds:
> > > > > > > > 1. set lvm.conf 'activation/polling_interval=120'.
> > > > > > > > 2. write a speical udev rule, which make udev ignore the event for mpath devices.
> > > > > > > >        echo 'ENV{DM_UUID}=="mpath-*", OPTIONS+="nowatch"' >\
> > > > > > > >         /etc/udev/rules.d/90-dm-watch.rules
> > > > > > > > 
> > > > > > > > Run above any one of two can make the performance issue disappear.
> > > > > > > > 
> > > > > > > > ** the root cause **
> > > > > > > > 
> > > > > > > > lvmpolld will do interval requeset info job for updating the pvmove status
> > > > > > > > 
> > > > > > > > On every polling_interval time, lvm2 will update vg metadata. The update job will
> > > > > > > > call sys_close, which will trigger systemd-udevd IN_CLOSE_WRITE event, eg:
> > > > > > > >       2022-<time>-xxx <hostname> systemd-udevd[pid]: dm-179: Inotify event: 8 for /dev/dm-179
> > > > > > > > (8 is IN_CLOSE_WRITE.)
> > > > > > > > 
> > > > > > > > These VGs underlying devices are multipath devices. So when lvm2 update metatdata,
> > > > > > > > even if pvmove write a few data, the sys_close action trigger udev's "watch"
> > > > > > > > mechanism to gets notified frequently about a process that has written to the
> > > > > > > > device and closed it. This causes frequent, pointless re-evaluation of the udev
> > > > > > > > rules for these devices.
> > > > > > > > 
> > > > > > > > My question: Does LVM2 maintainers have any idea to fix this bug?
> > > > > > > > 
> > > > > > > > In my view, does lvm2 could drop VGs devices fds until pvmove finish?
> > > > > > > 
> > > > > > > Hi
> > > > > > > 
> > > > > > > Please provide more info about lvm2  metadata and also some  'lvs -avvvvv'
> > > > > > > trace so we can get better picture about the layout - also version of
> > > > > > > lvm2,systemd,kernel in use.
> > > > > > > 
> > > > > > > pvmove is progressing by mirroring each segment of an LV - so if there would
> > > > > > > be a lot of segments - then each such update may trigger udev watch rule
> > > > > > > event.
> > > > > > > 
> > > > > > > But ATM I could hardly imagine how this could cause some 'dramatic'
> > > > > > > performance decrease -  maybe there is something wrong with udev rules on
> > > > > > > the system ?
> > > > > > > 
> > > > > > > What is the actual impact ?
> > > > > > > 
> > > > > > > Note - pvmove was never designed as a high performance operation (in fact it
> > > > > > > tries to not eat all the disk bandwidth as such)
> > > > > > > 
> > > > > > > Regards
> > > > > > > Zdenek
> > > > > > 
> > > > > > My mistake, I write here again:
> > > > > > The subject is wrong, not IO performance but cpu high load is triggered by pvmove.
> > > > > > 
> > > > > > There is no IO performance issue.
> > > > > > 
> > > > > > When system is connecting 80~200, the cpu load increase by 15~20, the
> > > > > > cpu usage by ~20%, which corresponds to about ~5,6 cores and led at
> > > > > > times to the cores fully utilized.
> > > > > > In another word: a single pvmove process cost 5-6 (sometime 10) cores
> > > > > > utilization. It's abnormal & unaccepted.
> > > > > > 
> > > > > > The lvm2 is 2.03.05, kernel is 5.3. systemd is v246.
> > > > > > 
> > > > > > BTW:
> > > > > > I change this mail subject from:  lvmpolld causes IO performance issue
> > > > > > to: lvmpolld causes high cpu load issue
> > > > > > Please use this mail for later discussing.
> > > > > 
> > > > > 
> > > > > Hi
> > > > > 
> > > > > Could you please retest with recent version of lvm2. There have been
> > > > > certainly some improvements in scanning - which might have caused in the
> > > > > older releases some higher CPU usage with longer set of devices.
> > > > > 
> > > > > Regards
> > > > > 
> > > > > Zdenek
> > > > 
> > > > The highest lvm2 version in SUSE products is lvm2-2.03.15, does this
> > > > version include the improvements change?
> > > > Could you mind to point out which commits related with the improvements?
> > > > I don't have the reproducible env, I need to get a little detail before
> > > > asking customer to try new version.
> > > > 
> > > 
> > > 
> > > Please try to reproduce your customer's problem and see if the newer version
> > > solves the issue.   Otherwise we could waste hours on theoretical
> > > discussions what might or might not have helped with this problem. Having a
> > > reproducer is a starting point for fixing it, if the problem is still there.
> > > 
> > > Here is one commit that may possibly affect CPU load:
> > > 
> > > d2522f4a05aa027bcc911ecb832450bc19b7fb57
> > > 
> > > 
> > > Regards
> > > 
> > > Zdenek
> > 
> > I gave a little bit explain for the root cause in previous mail, And the
> > work around <2> also matchs my analysis.
> > 
> > The machine connects lots of LUNs. pvmove one disk will trigger lvm2
> > update all underlying mpath devices (80~200). I guess the update job is
> > vg_commit() which updates latest metadata info, and the metadata locates in
> > all PVs. The update job finished with close(2) which trigger hundreds
> > devices udevd IN_CLOSE_WRITE event. every IN_CLOSE_WRITE will trigger
> > mpathd udev rules (11-dm-mpath.rules) to start scanning devices. So the
> > real world will flooding hundreds of multipath processes, the cpus load
> > become high.
> 
> 
> Your 'guess explanation' is not as useful as you might think - as we do not
> know the layout of lvm2 metadata, how many disks are involved into the
> operation, number of segments  and many other things (in RHEL we have
> 'sosreport' to harvest all the needed info).

SUSE also has the similar data collection software. But we can't share any
customer info to public except customer agree to do.
You could ask what your interesting, I will masking the private info
before sharing.

The machine connecting disks are more than 250. The VG has 103 PVs & 79 LVs.

# /sbin/vgs
  VG           #PV #LV #SN Attr   VSize   VFree
  <vgname>     103  79   0 wz--n-  52t    17t

There is no clustered env, all the operations are local.
Each PV is mpath device, which at least has two legs, some PV has three legs.
The LV type is dm linear type.
The operation: pvmove one PV to another PV in the same VG.

> 
> ATM I'm not even sure if you are complaining about how CPU usage of lvmpolld
> or just huge udev rules processing overhead.

The load is generated by multipath. lvmpolld does the IN_CLOSE_WRITE action
which is the trigger.

> 
> If you have too many disks in VG  (again unclear how many there are paths
> and how many distinct PVs) - user may *significantly* reduce burden
> associated with metadata updating by reducing number of 'actively'
> maintained metadata areas in VG - so i.e. if you have 100PVs in VG - you may
> keep metadata only on 5-10 PVs to have 'enough' duplicate copies of lvm2
> metadata within VG (vgchange --metadaatacopies X) - clearly it depends on
> the use case and how many PVs are added/removed from a VG over the
> lifetime....

Thanks for the important info. I also found the related VG config from
/etc/lvm/backup/<vgname>, this file shows 'metadata_copies = 0'.

This should be another solution. But why not lvm2 takes this behavior by
default, or give a notification when pv number beyond a threshold when user
executing pvs/vgs/lvs or pvmove.
There are too many magic switch, users don't know how to adjust them for
better performance.

> 
> There are IMHO still too many variations to guess from - so it's easier to
> create the most similar reproducer to your customer case if you can't reveal
> more physical info about it  and  lvm2 test suite has lot of power to
> emulate most of your system setup combination (it's easy to put there 100
> fake PVs and prepare metadata set similar to customer's one - once we will
> have a local reproducer it's easier to seek for solution.
> 

Sorry from my side, I could share any your interested info under keep
customer data safe.

I'm busy with many bugs, still can't find a time slot to set up a env.
For this performance issue, it relates with mpath, I can't find a easy
way to set up a env. (I suspect it may trigger this issue by setting up
300 fake PVs without mpath, then do pvmove cmd.)

- Heming

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

