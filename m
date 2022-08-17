Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CCB7C32772
	for <linux-lvm@archiver.kernel.org>; Tue, 23 Aug 2022 08:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661243346;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ONmmcd6Dqv4eH9qn1hAgMwqfIq6AkcOPHHx3sbcsRF4=;
	b=R0MfoWbMXyRoaY6/20/1mgepeJTcb8RYWs59DRZnl1saC0sSLTegEZbsWBb8Lv2jB8KvQY
	5g4QI46+nrj5PHLDwyA4UEo469qb7grlb9wI/ENUPKkOP7JD7A6AvOV+CHoP4/6ad15TKE
	JTMpf7IY1HAKlTwkvPTtn9J+idWk5CA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-135-GSq_Y--wO7aMRgefYA6hKQ-1; Tue, 23 Aug 2022 04:28:30 -0400
X-MC-Unique: GSq_Y--wO7aMRgefYA6hKQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D4A081032966;
	Tue, 23 Aug 2022 08:28:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 59FD9C15BBA;
	Tue, 23 Aug 2022 08:28:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 667901946A5F;
	Tue, 23 Aug 2022 08:28:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 34DD0193F6F6
 for <linux-lvm@listman.corp.redhat.com>; Wed, 17 Aug 2022 08:43:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D784814152E2; Wed, 17 Aug 2022 08:43:55 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D2FBF14152E1
 for <linux-lvm@redhat.com>; Wed, 17 Aug 2022 08:43:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 991971C05AFB
 for <linux-lvm@redhat.com>; Wed, 17 Aug 2022 08:43:55 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2073.outbound.protection.outlook.com [40.107.20.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-351-BgrsuekWOcS_1CICl3koqw-1; Wed, 17 Aug 2022 04:43:52 -0400
X-MC-Unique: BgrsuekWOcS_1CICl3koqw-1
Received: from AM6PR04MB4662.eurprd04.prod.outlook.com (2603:10a6:20b:1b::21)
 by PAXPR04MB8878.eurprd04.prod.outlook.com (2603:10a6:102:20d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19; Wed, 17 Aug
 2022 08:43:49 +0000
Received: from AM6PR04MB4662.eurprd04.prod.outlook.com
 ([fe80::8149:c8e2:d4a4:d497]) by AM6PR04MB4662.eurprd04.prod.outlook.com
 ([fe80::8149:c8e2:d4a4:d497%7]) with mapi id 15.20.5525.011; Wed, 17 Aug 2022
 08:43:49 +0000
Date: Wed, 17 Aug 2022 16:43:43 +0800
From: Heming Zhao <heming.zhao@suse.com>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <20220817084343.33la7o6fdh5txul4@c73>
References: <20220816092820.6xbab36dcmxq5hfm@c73>
 <be332c6b-4b65-6462-c570-ee6d0e81b985@gmail.com>
 <20220816100802.yy3xqvynil4pcspb@c73>
 <204c332e-2a30-b17a-ecc1-58025454eb00@gmail.com>
 <20220817020225.gf6ooxobdf5xhpxe@c73>
 <6fa27852-e898-659f-76a5-52f50f0de898@gmail.com>
In-Reply-To: <6fa27852-e898-659f-76a5-52f50f0de898@gmail.com>
X-ClientProxiedBy: SG2PR01CA0112.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::16) To AM6PR04MB4662.eurprd04.prod.outlook.com
 (2603:10a6:20b:1b::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53232f0d-c5af-4963-c274-08da802c9abb
X-MS-TrafficTypeDiagnostic: PAXPR04MB8878:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: +JjSVuA9ngY1qPkzZaEdeKhFMWAXORseo/8xZpLtcPA1TtqS6notZYaNoadwNpScCT9XKHT48VW74r0UU8dB7INaJifOGVQlHF9cky18OH215B1afU4DFIYtWu9xh1qJQYIT3THNNoorErLY0UGawTT1MEdTuoO/Q5dkgsKA9fDzS3eEq0be/27unuZkyQ0bsxE4AUlepvnzzWbh5fcaZS9n/ZzIX6OeuQ45PHeKpG4mV4K2cb4l5QSKAbEY6un5Bhi5JqLIy8NbHoF+ss6zOlL8BIAD34FniwBr/nJEC02GZYaF0/822PIfgcKYBwoboeu90+usBDIEGGPejAgNRzARulD46Ad7Ey6zq5REbtblTRYA4zRj91UJ4ftAARwgWpYo89211W/gT0YIFPu5u9mEn/o8mx79aQZjlMfyIYduRAJ3Qv8BtjZ7uh//Gi6Q4jn/Muz/W6VGwzvzmjPdJ9ofZie1qlRG4u8bwJIcCVANNxGnGdtQL+17ILyrNSXRImkCU0FMCx9wjtHqkDYwJRp7UahpzfaBJ5D0BLPR/mxEQdtdThY6ChkvlrQDwta4QlVr5Uv/aHkf30QIdFo5NZptoHxYcXfSKT9Amd2P2O3H8IKNORZAhA8E2emOAp0sWJ+bwgYG8HeIZRMtQdpW16StXI6OHYLs+74RPkbz8y8Qsb2SbQaHqeoZ3D4Qd1E1Z6feO356qWdSObwMrvyLNkSZRgovXyKucqjTRJzfY1PUDg9BEWZyxdPsZP9XyT1gCXqwJ5kN82Cv+32MfGN4Xw/aIo4wUjJwE1ZSPBcN7nQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB4662.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(366004)(39860400002)(136003)(396003)(346002)(376002)(26005)(8936002)(5660300002)(44832011)(4326008)(8676002)(66476007)(66556008)(66946007)(41300700001)(6916009)(6486002)(316002)(478600001)(38100700002)(33716001)(1076003)(9686003)(83380400001)(6506007)(6512007)(6666004)(186003)(2906002)(86362001)(21314003);
 DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z1uZcea7g/uTi4SRJL4cRxWz1Fn01dc8teOvOGq9eUYDQ0uxXT/ZJydTUq+/?=
 =?us-ascii?Q?CAZHQicVT2X8Kv0uN+sInIoNJ0p98VQzq+wmiDjIbNZ27j9EMnPokodaZxWu?=
 =?us-ascii?Q?D0iI+muSJXaTYVi9iWc3LlHg+WiSy4UZ0Laza8OgfidoHC6HVmXgYhiq5UDf?=
 =?us-ascii?Q?GMBfVzSU16ZC3emM9E33MgldBNC0NHV8wgzhxrBjp4kqxwPjcBauy50+H7g3?=
 =?us-ascii?Q?xfJkrYHXjgStk2NJsGo1DYXPcB9PX270eyilmM6VHMG6XlDMkGxQ6aUHTOmK?=
 =?us-ascii?Q?0hSI04nsfwyu+cwIncGabDJ9mHIkJXia065URsWdmotvJV4k+/ceL/JSa2qV?=
 =?us-ascii?Q?fM/VL2kNaU7rxV2Jw8DJmaZFU8GEaCVm7j979ttL4S9/zw6y3QNJERIYc8fl?=
 =?us-ascii?Q?gIs6FuDv8N23dC8CpGLAwoja9Vp+M2lNoZEB5e/FLq9HJ72M8JyzonnOnz1c?=
 =?us-ascii?Q?4TH6Q11z/U50T46+m7WuUGslRd4UTy9u/mrCp4TPdIk7mSNBsBIqwFDjjKZf?=
 =?us-ascii?Q?cR+DwegIFKLAiaP9VAk7aLJzTd/IFt3L+Wxo5hjRlnZ35qOd0h3hN18H9lIp?=
 =?us-ascii?Q?V1NIylgNa1A7MNczYz3sp/mM6pJfSvgQoR0eZT6Ny8f+VAk39q4Bg92o8Elh?=
 =?us-ascii?Q?xBxHnWIwFAFJ4tH6NvdfYRBXaA/3ts9F8RIcjNiPgzrLS7cISfLYLR8kceJx?=
 =?us-ascii?Q?m04TxJosOUq6k4ZZa3Xxg8cCvOxMPDrK8/8FDGm85R1X4WC8gWUnq4pNjWvL?=
 =?us-ascii?Q?U4HADvfPSapy79UrZTSS5KhrW13Z6NpM7imhdPMq9oUJEGPzEtqOUFwMsPMo?=
 =?us-ascii?Q?MnAc6R92kGz+0+/ZNAEw1x21WDfll8Np6yK8AZu2xoylc2jOQYxfgV2kWjhI?=
 =?us-ascii?Q?/g6o+74xc92nERpR4HHhDdOLUxKKSPor/40t/Ve2BfGZUDjzUMLdm9NaRa0h?=
 =?us-ascii?Q?aClp2muRSJ2XctWH24LkTC0fElZ4B5fYkk8fcIZLJDydHe3KMWE4+cahiuy/?=
 =?us-ascii?Q?M+WMTL6ZayyL24Ia+7nNjlGa6rSl4edUrV94S+EPTFWp5Qzs7Etf6+9cn4qS?=
 =?us-ascii?Q?SHCSUYNXx1cVH1T3RkECldoBswGIkzzwb4pPiy3x9MmtlOPE1bLl2zIbznls?=
 =?us-ascii?Q?ClGhOBHEKAg7nz6YIBPIl8sHa9KDQpZPf8zwk5VaL63lZ0z5n6y9wcMgjFyA?=
 =?us-ascii?Q?9UArozNMoXWiwZZiQgrlipXbmRSvo3a+MDrG7/EFzU+EiZxEhR++h6wRLXBm?=
 =?us-ascii?Q?4WtSvo9s+ZEaFAYR/ZFIBFG5KkxrVRdgmYZhFHDKqx+Pxgpk4wc7nLpy3WRo?=
 =?us-ascii?Q?io6qUtuh8PtU9NwKNSw+fpmlTltx/xzGuE3bjAKvYJcOFISpaYjeYEbt2fEh?=
 =?us-ascii?Q?mAprn/PvXyg5zv9sZJPtgPbEJzHGjRw2uQH3uk8ycSuAP02uH+MiI1vHJeDL?=
 =?us-ascii?Q?fnm2WbVx/ibVIKNiWQorUw30+dJCorrAqWY78Y3TeOeEGqUjAFghga6sLB04?=
 =?us-ascii?Q?LYR/rT7nfOFrgUtEg+d1VnS7E3mvThCSxnPV7+p4djbi39s2jYhqTeDKt1/v?=
 =?us-ascii?Q?reG6a7zg6McBfXTCxvuoM3GzGgc32j77s6jEHrz4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53232f0d-c5af-4963-c274-08da802c9abb
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4662.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 08:43:49.1446 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 95q9/bMqbMpe5RHNT+2De1tABLcyPHIOqyAZsnvWL8OPbrHhG5NcdOBHxu9Y3dSNmqCndgj8CUxUxN+YcVnaFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8878
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 17, 2022 at 10:06:35AM +0200, Zdenek Kabelac wrote:
> Dne 17. 08. 22 v 4:03 Heming Zhao napsal(a):
> > On Tue, Aug 16, 2022 at 12:26:51PM +0200, Zdenek Kabelac wrote:
> > > Dne 16. 08. 22 v 12:08 Heming Zhao napsal(a):
> > > > Ooh, very sorry, the subject is wrong, not IO performance but cpu high load
> > > > is triggered by pvmove.
> > > > 
> > > > On Tue, Aug 16, 2022 at 11:38:52AM +0200, Zdenek Kabelac wrote:
> > > > > Dne 16. 08. 22 v 11:28 Heming Zhao napsal(a):
> > > > > > Hello maintainers & list,
> > > > > > 
> > > > > > I bring a story:
> > > > > > One SUSE customer suffered lvmpolld issue, which cause IO performance dramatic
> > > > > > decrease.
> > > > > > 
> > > > > > How to trigger:
> > > > > > When machine connects large number of LUNs (eg 80~200), pvmove (eg, move a single
> > > > > > disk to a new one, cmd like: pvmove disk1 disk2), the system will suffer high
> > > > > > cpu load. But when system connects ~10 LUNs, the performance is fine.
> > > > > > 
> > > > > > We found two work arounds:
> > > > > > 1. set lvm.conf 'activation/polling_interval=120'.
> > > > > > 2. write a speical udev rule, which make udev ignore the event for mpath devices.
> > > > > >       echo 'ENV{DM_UUID}=="mpath-*", OPTIONS+="nowatch"' >\
> > > > > >        /etc/udev/rules.d/90-dm-watch.rules
> > > > > > 
> > > > > > Run above any one of two can make the performance issue disappear.
> > > > > > 
> > > > > > ** the root cause **
> > > > > > 
> > > > > > lvmpolld will do interval requeset info job for updating the pvmove status
> > > > > > 
> > > > > > On every polling_interval time, lvm2 will update vg metadata. The update job will
> > > > > > call sys_close, which will trigger systemd-udevd IN_CLOSE_WRITE event, eg:
> > > > > >      2022-<time>-xxx <hostname> systemd-udevd[pid]: dm-179: Inotify event: 8 for /dev/dm-179
> > > > > > (8 is IN_CLOSE_WRITE.)
> > > > > > 
> > > > > > These VGs underlying devices are multipath devices. So when lvm2 update metatdata,
> > > > > > even if pvmove write a few data, the sys_close action trigger udev's "watch"
> > > > > > mechanism to gets notified frequently about a process that has written to the
> > > > > > device and closed it. This causes frequent, pointless re-evaluation of the udev
> > > > > > rules for these devices.
> > > > > > 
> > > > > > My question: Does LVM2 maintainers have any idea to fix this bug?
> > > > > > 
> > > > > > In my view, does lvm2 could drop VGs devices fds until pvmove finish?
> > > > > 
> > > > > Hi
> > > > > 
> > > > > Please provide more info about lvm2  metadata and also some  'lvs -avvvvv'
> > > > > trace so we can get better picture about the layout - also version of
> > > > > lvm2,systemd,kernel in use.
> > > > > 
> > > > > pvmove is progressing by mirroring each segment of an LV - so if there would
> > > > > be a lot of segments - then each such update may trigger udev watch rule
> > > > > event.
> > > > > 
> > > > > But ATM I could hardly imagine how this could cause some 'dramatic'
> > > > > performance decrease -  maybe there is something wrong with udev rules on
> > > > > the system ?
> > > > > 
> > > > > What is the actual impact ?
> > > > > 
> > > > > Note - pvmove was never designed as a high performance operation (in fact it
> > > > > tries to not eat all the disk bandwidth as such)
> > > > > 
> > > > > Regards
> > > > > Zdenek
> > > > 
> > > > My mistake, I write here again:
> > > > The subject is wrong, not IO performance but cpu high load is triggered by pvmove.
> > > > 
> > > > There is no IO performance issue.
> > > > 
> > > > When system is connecting 80~200, the cpu load increase by 15~20, the
> > > > cpu usage by ~20%, which corresponds to about ~5,6 cores and led at
> > > > times to the cores fully utilized.
> > > > In another word: a single pvmove process cost 5-6 (sometime 10) cores
> > > > utilization. It's abnormal & unaccepted.
> > > > 
> > > > The lvm2 is 2.03.05, kernel is 5.3. systemd is v246.
> > > > 
> > > > BTW:
> > > > I change this mail subject from:  lvmpolld causes IO performance issue
> > > > to: lvmpolld causes high cpu load issue
> > > > Please use this mail for later discussing.
> > > 
> > > 
> > > Hi
> > > 
> > > Could you please retest with recent version of lvm2. There have been
> > > certainly some improvements in scanning - which might have caused in the
> > > older releases some higher CPU usage with longer set of devices.
> > > 
> > > Regards
> > > 
> > > Zdenek
> > 
> > The highest lvm2 version in SUSE products is lvm2-2.03.15, does this
> > version include the improvements change?
> > Could you mind to point out which commits related with the improvements?
> > I don't have the reproducible env, I need to get a little detail before
> > asking customer to try new version.
> > 
> 
> 
> Please try to reproduce your customer's problem and see if the newer version
> solves the issue.   Otherwise we could waste hours on theoretical
> discussions what might or might not have helped with this problem. Having a
> reproducer is a starting point for fixing it, if the problem is still there.
> 
> Here is one commit that may possibly affect CPU load:
> 
> d2522f4a05aa027bcc911ecb832450bc19b7fb57
> 
> 
> Regards
> 
> Zdenek

I gave a little bit explain for the root cause in previous mail, And the
work around <2> also matchs my analysis.

The machine connects lots of LUNs. pvmove one disk will trigger lvm2
update all underlying mpath devices (80~200). I guess the update job is
vg_commit() which updates latest metadata info, and the metadata locates in
all PVs. The update job finished with close(2) which trigger hundreds
devices udevd IN_CLOSE_WRITE event. every IN_CLOSE_WRITE will trigger
mpathd udev rules (11-dm-mpath.rules) to start scanning devices. So the
real world will flooding hundreds of multipath processes, the cpus load
become high.

Thanks,
Heming

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

