Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CA0C3F6B0
	for <linux-lvm@archiver.kernel.org>; Tue, 23 Aug 2022 08:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661243341;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2UkCbYiunM4LC4vS3ClUgYhCMkeyGanBXDa1egbV20Q=;
	b=HqERW8C6C6zXvEZaBsHjjOaIcAAlwh9aNoSES4w/RGyWAlSGZw5FFO3OWy1r6y0M/7Cmf6
	8xEpzegSaBdI/4EnwaDCyRWqKAGI4Z2jM8Wzu9mV8l8YAfFZ9dgUU2qHKq//RrUIEvnEiW
	fRLxdk+hgLkQOCx5m2PmJETPO+ldP8I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-264-gc4KekazNnywJmBYKomgYw-1; Tue, 23 Aug 2022 04:28:29 -0400
X-MC-Unique: gc4KekazNnywJmBYKomgYw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74A768039C1;
	Tue, 23 Aug 2022 08:28:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5C1654010D42;
	Tue, 23 Aug 2022 08:28:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 47D3E1946A6E;
	Tue, 23 Aug 2022 08:28:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9A7161940350
 for <linux-lvm@listman.corp.redhat.com>; Tue, 16 Aug 2022 09:30:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6C3A51121319; Tue, 16 Aug 2022 09:30:42 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 679F11121315
 for <linux-lvm@redhat.com>; Tue, 16 Aug 2022 09:30:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A0DC1C07542
 for <linux-lvm@redhat.com>; Tue, 16 Aug 2022 09:30:42 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80040.outbound.protection.outlook.com [40.107.8.40]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-5fhA-z4wOiGpCo--UvuH7g-1; Tue, 16 Aug 2022 05:30:40 -0400
X-MC-Unique: 5fhA-z4wOiGpCo--UvuH7g-1
Received: from AM6PR04MB4662.eurprd04.prod.outlook.com (2603:10a6:20b:1b::21)
 by AM0PR04MB5891.eurprd04.prod.outlook.com (2603:10a6:208:12e::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Tue, 16 Aug
 2022 09:30:38 +0000
Received: from AM6PR04MB4662.eurprd04.prod.outlook.com
 ([fe80::8149:c8e2:d4a4:d497]) by AM6PR04MB4662.eurprd04.prod.outlook.com
 ([fe80::8149:c8e2:d4a4:d497%7]) with mapi id 15.20.5525.011; Tue, 16 Aug 2022
 09:30:38 +0000
Date: Tue, 16 Aug 2022 17:28:20 +0800
From: Heming Zhao <heming.zhao@suse.com>
To: linux-lvm@redhat.com, martin.wilck@suse.com
Message-ID: <20220816092820.6xbab36dcmxq5hfm@c73>
X-ClientProxiedBy: SG2PR01CA0194.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::22) To AM6PR04MB4662.eurprd04.prod.outlook.com
 (2603:10a6:20b:1b::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b1590bf-3449-4475-3dda-08da7f69fa85
X-MS-TrafficTypeDiagnostic: AM0PR04MB5891:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: pp8qEv2z1E/BjOHDrLWs9ItTdeZSUnjCOIe9au1P2H1pyqWGA+vRE0WqkOur/5DM0wHRU75Peh0h3nbs9FQhrMz2TI9U1y8moX5aA/t6xP5j1iNvx3GbmKDpJ+W8yBNja2rdSFZwmcdlV701hjYbkMApgUlT7mc1uCWJ1SPSdCjlZDs3vXSQ0oSTc4SgSKttbEUER/8k5PGpUC/Ju08kmJt2j4XCP52qIkKRmUXGE4YEJgUunVLMGT1n0LUiZoMZBPVs4UEChyvcfImE0KdU1MgVyUmA/34SWECSP+5wf1Hs5BTGWzOhnMXJI7eUrD9h/9O3GnsX7LToqapqirYkxJ27LSoRs+FLU/anUGT4WVXjAij9pA5KUWfEJvBsf2shDM7NqIepdvwxHKWahFtF9ak7BVssJnUpykzxDpTs6vmJyDvxDrnP0IqXc+FzQOoGPc8UVY1p/vl0iz9jfBeN0QAq13gXpkPAi+4hPNXMuSgKCfUz+Z1lrvHiH7DoS5x9utJoHS9CKuxG5GdQFeqI5b59jdkWU3fGmGRvCzTwhbcpDmCSw9ItJlxfwvD/C2Jpkj1JB5J0wyiDlRglFfxfnEBbAZd8d4OAqXHBLcnU1efrqwKi1DJXfyAKcKTqjwmmV46mm3NP1/qxG7MFNTsiJaxNIGODSIzKBbsO8L7EIWEYIMVLmy1IGQv/pOUTk+CeY61s4HTpZKnnggvx1xkb59HUOFHmKbPseJa4n5asGk/qJhLR+dJRM9RG/8T6xnAS6E2sjQTFW6D8Nf214YizSlTerFjOjdj2MUYLo6Uw6ag=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB4662.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(39860400002)(346002)(376002)(366004)(396003)(136003)(83380400001)(33716001)(478600001)(41300700001)(6486002)(66476007)(8936002)(8676002)(5660300002)(316002)(6636002)(66946007)(44832011)(66556008)(2906002)(4326008)(186003)(38100700002)(26005)(6512007)(1076003)(6666004)(86362001)(6506007)(9686003)(21314003);
 DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gottlGy2zQ9RJDUlVurAXy98wRBWgGy7E5eDKT+d3ELuJCD1p5ZIyVggpxmB?=
 =?us-ascii?Q?w/lK+7aeE4VSEPzYlmXfnRMCYLf1O61erAvCKz4yCSEcSSGSkQpNX/mPH73k?=
 =?us-ascii?Q?t8pzRdRGTyO2bhwcJThHG0JbHdfMsH/1MTKQGiX4muwXGXmNRMsAE8GevglJ?=
 =?us-ascii?Q?3Dc0OuzEA2x1YFyi9CJwli4OVspW8FlMCSjCApE+DE9SycqDOZk5pCow2FPP?=
 =?us-ascii?Q?gfojluDiZsOdC0/d+FFwccH2YpaumFS5qhImMHiuchVDvcGxGY9RgLS5/zlt?=
 =?us-ascii?Q?Vj5mxbeI9wv5H+BK3oNtja4zTx77W11hI8cCFecx2zXiJQNJu7i0VZvqp3Pv?=
 =?us-ascii?Q?ILlh/EhHeHkGqY6yQs7uLJ52heABTfjfengpG7Ppv8ptK0HNrxp1WBA52sAA?=
 =?us-ascii?Q?ibDkswNDrn9eCn2hgM90BC6P1G73eyRbeI3Cl9F+RtLno+Jfx06zPxra4T8U?=
 =?us-ascii?Q?N2YHvHdbDFdNCP9rlWO5sOvqWUxqF+PXPQKTRgfEA3QYPk2xJWGyNDuelyGH?=
 =?us-ascii?Q?TU59CVXJPM7czaYC/tPmb4iEVvc4iYxhxbBZ6QnMUlTaA2RAOvHhk8dysuVP?=
 =?us-ascii?Q?6VtZKmRfQPtrD+Rv1MpISyNzzqpkTjGK2o+vJePfKgltGU+rGL4XvM0i821F?=
 =?us-ascii?Q?GGZ0kD6yYeAejb4xdsxCoqPIc3dk9fW9MKV+ZOd3K9SCCcqdTwP2P5PrHNx8?=
 =?us-ascii?Q?112YpEEZ6zczIcM5kZZI0/5tXkytLrzO2LQM6VCe9kYWFJfv0auZnLba1ubR?=
 =?us-ascii?Q?viamcWcslhZJbIAjWXMfm3BfNdWAoCKQ0LA8G4rFh/vm8M24qy9Du8WfpvNt?=
 =?us-ascii?Q?0YukukCCeyR9I5EvACgE3ruMo7wH1HoPH6GlfxB/h/SZICTvQZFZvR4PqkMG?=
 =?us-ascii?Q?Qp+pf8SAgWjSwD0pk+N52BBlaa44k5Tu7Z1dhji0+pPRTZIrKo1CMu6CdMxd?=
 =?us-ascii?Q?kRs0CLIEhvpqLgs7SrR9xsXKOykLh2xweeeXdff/OSsVXbcbvsE/ke74p7Cd?=
 =?us-ascii?Q?ykwoJsJfMCk2Bk7Ms1K0HjhJ+zIfONr7d2srGVwvO2nerZyzDQWxxKQk9eDn?=
 =?us-ascii?Q?nRlAApEWlqs3ew8k/bNvXYyBi6sppQ6cPjgFVTtyWRqLrxzFwxwIIcfKDMVp?=
 =?us-ascii?Q?kEYpbfnMzjoyJtk5VMy4IinXdAq0OMJEl2zTF5IsQ93/V6sZNlZybIIzUD8A?=
 =?us-ascii?Q?Ie+KFUDMgXERjhxk8tXcc0KC1YSZNWKbp4Ov2tlccmjDiRhPifMbJhcK/TAG?=
 =?us-ascii?Q?WguhE2L2Jw33Dkn/aqQNyuXomyVOXEDNYf0KQVz5JHPwW2o6v4n5EJ/GXb68?=
 =?us-ascii?Q?2wHwHEVbucJhJJAU5tsXF4NNQl2Jdemzz3T8dTQDFGaZwef8XDnFiPYQnbex?=
 =?us-ascii?Q?7uu2XBm6pQRJ//V/jcJDErFPrslv5UEwZbivWd/AjtNtWCDwtx+MWp/uqkuK?=
 =?us-ascii?Q?N1drH5ccsc906VqxRR3NqYAPdgZ2i/GqxS7P557lLwds2zxksYjOW+mUtQFR?=
 =?us-ascii?Q?s2FfMH6uSLuIyUY/mJat3Yhl5XzKEuEY7mP6e0SceyJoytKK1bgMUPttg1Ns?=
 =?us-ascii?Q?4YJPzcwrK90OA1SYg+cXqWnzNPC3soJS+U6lMA9a?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b1590bf-3449-4475-3dda-08da7f69fa85
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4662.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2022 09:30:38.0332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Rbwd3aUUhcJ9CAXFFru+VoiUiGAYm0E1ml9CNcoFSS+MMnf8WDHpf7sPTAp9yLzUTdoGl7KR7QLH4Jo4W8WCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5891
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Mailman-Approved-At: Tue, 23 Aug 2022 08:28:21 +0000
Subject: [linux-lvm] lvmpolld causes IO performance issue
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
Cc: teigland@redhat.com, zdenek.kabelac@gmail.com
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello maintainers & list,

I bring a story:
One SUSE customer suffered lvmpolld issue, which cause IO performance dramatic
decrease.

How to trigger:
When machine connects large number of LUNs (eg 80~200), pvmove (eg, move a single
disk to a new one, cmd like: pvmove disk1 disk2), the system will suffer high
cpu load. But when system connects ~10 LUNs, the performance is fine.

We found two work arounds:
1. set lvm.conf 'activation/polling_interval=120'.
2. write a speical udev rule, which make udev ignore the event for mpath devices. 
   echo 'ENV{DM_UUID}=="mpath-*", OPTIONS+="nowatch"' >\
    /etc/udev/rules.d/90-dm-watch.rules

Run above any one of two can make the performance issue disappear.

** the root cause **

lvmpolld will do interval requeset info job for updating the pvmove status

On every polling_interval time, lvm2 will update vg metadata. The update job will
call sys_close, which will trigger systemd-udevd IN_CLOSE_WRITE event, eg:
  2022-<time>-xxx <hostname> systemd-udevd[pid]: dm-179: Inotify event: 8 for /dev/dm-179
(8 is IN_CLOSE_WRITE.)

These VGs underlying devices are multipath devices. So when lvm2 update metatdata,
even if pvmove write a few data, the sys_close action trigger udev's "watch"
mechanism to gets notified frequently about a process that has written to the
device and closed it. This causes frequent, pointless re-evaluation of the udev
rules for these devices.

My question: Does LVM2 maintainers have any idea to fix this bug?

In my view, does lvm2 could drop VGs devices fds until pvmove finish?

Thanks,
Heming

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

