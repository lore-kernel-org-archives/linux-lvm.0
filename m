Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E2CCC32774
	for <linux-lvm@archiver.kernel.org>; Tue, 23 Aug 2022 08:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661243315;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=659wXdPwIaz2NP4yE6nBppbGjxFsiePVNk/YJ3ocPt4=;
	b=QsdK0nLU47MB1KjNQ5JPD+NQ5QxC1pe5XgBqIKX3kefYWMaQB19vi5ip/nY18rBeD6kG1D
	yEYU1aqROKE+hVWmlKGEG8s6ucZ5ZMRSNKqGft4V8ywD6EyPUG+4mBw9O4nGbaqysuSIED
	bOMPtC6lUCe0hKXQOCZ1ucezrmEcxj0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-328-QS0t7B-NMsCVy-dRdGG0sA-1; Tue, 23 Aug 2022 04:28:30 -0400
X-MC-Unique: QS0t7B-NMsCVy-dRdGG0sA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CEED085A581;
	Tue, 23 Aug 2022 08:28:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 92A3E2166B26;
	Tue, 23 Aug 2022 08:28:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7374D1946A52;
	Tue, 23 Aug 2022 08:28:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B319E1940350
 for <linux-lvm@listman.corp.redhat.com>; Tue, 16 Aug 2022 10:08:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5D9099458A; Tue, 16 Aug 2022 10:08:13 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 592E4945D9
 for <linux-lvm@redhat.com>; Tue, 16 Aug 2022 10:08:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38B6585A581
 for <linux-lvm@redhat.com>; Tue, 16 Aug 2022 10:08:13 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2078.outbound.protection.outlook.com [40.107.21.78]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-GE2BFlqoPUmHSPRFvLCENg-2; Tue, 16 Aug 2022 06:08:11 -0400
X-MC-Unique: GE2BFlqoPUmHSPRFvLCENg-2
Received: from AM6PR04MB4662.eurprd04.prod.outlook.com (2603:10a6:20b:1b::21)
 by AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3ec::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Tue, 16 Aug
 2022 10:08:08 +0000
Received: from AM6PR04MB4662.eurprd04.prod.outlook.com
 ([fe80::8149:c8e2:d4a4:d497]) by AM6PR04MB4662.eurprd04.prod.outlook.com
 ([fe80::8149:c8e2:d4a4:d497%7]) with mapi id 15.20.5525.011; Tue, 16 Aug 2022
 10:08:08 +0000
Date: Tue, 16 Aug 2022 18:08:02 +0800
From: Heming Zhao <heming.zhao@suse.com>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <20220816100802.yy3xqvynil4pcspb@c73>
References: <20220816092820.6xbab36dcmxq5hfm@c73>
 <be332c6b-4b65-6462-c570-ee6d0e81b985@gmail.com>
In-Reply-To: <be332c6b-4b65-6462-c570-ee6d0e81b985@gmail.com>
X-ClientProxiedBy: SI2P153CA0032.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::23) To AM6PR04MB4662.eurprd04.prod.outlook.com
 (2603:10a6:20b:1b::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a299888-4f14-4b8e-55e9-08da7f6f37a1
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: d7ZQJVAQRnXuCMGhPCc47rEhXsb1dzS/iAhii3Ik45LKNa+cJ1NzfjTLmlZnSkR19B/S8uvezGFbpSRQNheJW7vFePXykyNR9J41+iuFToxuT669C72j+YC0Qw8H0sy3IUd/TnyqVdfZgP+KDNfk+xgLHmDEpjASTVAeT21ni/4guKIeIGtrzwebZDbm2NCHYyrbRPbsZxf43Lt6oAR1h8WF4RjExs1hCBKoenlY//FeoNrmn3nJEHjH5oTrMG+0nlPOJfcN6knoMZnuNgU40bvb49R26nJTMXzQJfJVnBtlSjBlDjkHOZEHCNu50zcmmDSe1glQ+LZSzIOURYrWxfl+bg7R9r5iuv2mXD3jJLmf8UzEP2RcaJD13Ervt4cBZJBryabr7GfZ4VxNAL9Cwl1ia1+V3dwbEYG8m2HBbMkONNyk2QehogTOAaEBfLc0zvP54MCwJMhr2RliW/PDOqiYkdirmnJYKLT0gwxDmDWGwg3zqXvFA+l3y1wnYxHrLcoCqVLJaDTsT3Gqs6PcEqwwDKzwerEpeuSPJ3vlRKmQOdPuwAbXNLmH7BmKXkEmkU1/LC/mmFbUJoCe1WMiRL2gCGsEG9h7Qq+D2JBIlVJLLLZiBV+xI3RKakGLFRKLcdEnbzef8xZA0YlSxPU3ArR+xfvMTtQa9RERuJifrbwAAatbmuAR8MV10AfWiH/N929+u1d19D6ZTAdGcBX8+35ws9FMTIddxN8GLERzgxQyLGkERIYsGIWX9SHGApZoVMyQaLW13SBFka53VYtnXTl9xLdLQ8rppqfrCfPkESk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB4662.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(136003)(366004)(396003)(346002)(39860400002)(376002)(66946007)(44832011)(316002)(66556008)(83380400001)(8676002)(41300700001)(6666004)(6916009)(2906002)(4326008)(33716001)(1076003)(186003)(38100700002)(26005)(9686003)(66476007)(6512007)(6486002)(6506007)(478600001)(8936002)(86362001)(5660300002)(21314003);
 DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6bmUhE8GZqFKgieoTomYXIrYv4Kq+E1KcyRNCW6vXzPf3mCCHDcLJ78ILFq+?=
 =?us-ascii?Q?TFPIKMsAWi7bEqGZ09CYHluUGP2SYJRChgmTVSq9XYAf34AGco59shrhsmnI?=
 =?us-ascii?Q?EUiDlaxDzkVKKvzlxq3/DLBiRUrn/cHLg0fh5en/brnCCcZQnpoUwLRuBNB9?=
 =?us-ascii?Q?pZU+CYO0LFv6kkY1rBqtGRTg4pOj0GowDHkHysrZg08x4KU4li5ERQIhnxhM?=
 =?us-ascii?Q?R4bXShmjbtYo2XgRqSioNyDbJUnFMFp3u2xGSceubfDrV0qQkxD34rtlDJVf?=
 =?us-ascii?Q?TJKVBsYCwLQF12Lh0RNO3xS+DJpR3mCryqoII82JsEIODBj036UuC+N4MgzN?=
 =?us-ascii?Q?lDwXIMvEAqYyD3tqmCCkfQUWcrMtuZQWGgs1KJcYLuIB67wfE1gKc8qwzkj/?=
 =?us-ascii?Q?h7RtKjMHpMkzoySfmUc105WS5qjGkyYBkjzAClSmkqPi/kqOnLMr0y6vGqIl?=
 =?us-ascii?Q?dY6OAyDNivSByoBH1Pgm1uIIo43RcjeBAFEIFR7SDhU8AaG/hjGsk9D/mxeX?=
 =?us-ascii?Q?DeO4t+quIIG2SVx4DGc8dYDNFNj6kSpLDgN9afNTo8Hhq/GSUojcVfhCx+OJ?=
 =?us-ascii?Q?62QIbv0EistwncEUHASs58dQsJeRG8fBZNFKYG8Nqt7fGjaYjuslnGSSLSHL?=
 =?us-ascii?Q?JqgcGZSpu/EH5AfkPfg+kmotKIbNj7E3ohdv5c3oSuKk1FAenXbrX2+xnONi?=
 =?us-ascii?Q?nk5DA73sRV6F3C4K0c5EQ97b/VXLx2//Aov/HYaW5Iwp6waYu0eB3xU/9O2a?=
 =?us-ascii?Q?Wqz7qGPDBFZuUxGyQXbG+06KdqABUeINabhaRqYuBZD3Bx8my/C/fmNkKeuI?=
 =?us-ascii?Q?B6y+7iK/juXh8sS9V2jPUNywjd7iayYZN2+3KulTsf2DxNTNfOYtWiVjtaXP?=
 =?us-ascii?Q?qhgbvlxqtBjIPSq5xcIH5vyBnwKUXIkA6a+rQ3Ql+0DnvhHpjYuT3stnqv6J?=
 =?us-ascii?Q?60wKx3Q7dvC6LmOx+1/dPU2o0zmx8sVKTulj7t0XGiYLJveKbpZVhE66ynE3?=
 =?us-ascii?Q?2u0O/MFWUdojwsznreJUCuzvuUn7F6VCBO6/+tIUXESGhHgGk2edxh07K6Q2?=
 =?us-ascii?Q?PQudSe7PDImDVAMgRth2FdnRzj6n8b/ZJPe1TQohK4DSGnqK5GCWMCgZ7325?=
 =?us-ascii?Q?PmW0cBymmCLfvKgb9n0VRPh7TowkRGl5CH1Hx50Zc4kysKvvj/SaOLPKT6f0?=
 =?us-ascii?Q?/iZYrIMKwgD3l9Jz8aofTA4s/7IGuIXoFlf1jcw5E1xGwIkwods485si+CNH?=
 =?us-ascii?Q?sIU7AbLZKGvFo3BYtib7kYHF/znE9+65QQwKdXUtNbTuIrFykdJy3p8Draoa?=
 =?us-ascii?Q?F0WpxbgPAMm56bPae3qo98+UXpwASS9eHRV0E/4JOhW3USIVYJMJn1FC0rIL?=
 =?us-ascii?Q?AZfM8CsqXtyzLjM9bWGD4yCHsTBd0mVJT3V4M1wL4xUkfkZo4m699X6dkRUV?=
 =?us-ascii?Q?hhA8F1CGpdmb5LEC5CHpasx+9kA+Fle/O6eNfLAl6yX1XGlY+jbueEIWxqsL?=
 =?us-ascii?Q?CMrjKJ/Vd/K9oFlIPE3Hwvjou4MxDX8S3LbEBhe9sLp4ipb1CMfWWL1MqDX8?=
 =?us-ascii?Q?Jz8/+of+eDktrA0Z3m5Jq+jo2Yv+D3JXeRQs64T4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a299888-4f14-4b8e-55e9-08da7f6f37a1
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4662.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2022 10:08:07.9795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /BaE1MM3GtAZTjYG8BqMuWxh4MzEYwkVlYlYZ5ZQ+lTYWjo5taDipn89BOFIi3ZwpQQypKu5AK0kWW+4THGqiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8179
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Mailman-Approved-At: Tue, 23 Aug 2022 08:28:21 +0000
Subject: [linux-lvm] lvmpolld causes high cpu load issue
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Ooh, very sorry, the subject is wrong, not IO performance but cpu high load
is triggered by pvmove.

On Tue, Aug 16, 2022 at 11:38:52AM +0200, Zdenek Kabelac wrote:
> Dne 16. 08. 22 v 11:28 Heming Zhao napsal(a):
> > Hello maintainers & list,
> > 
> > I bring a story:
> > One SUSE customer suffered lvmpolld issue, which cause IO performance dramatic
> > decrease.
> > 
> > How to trigger:
> > When machine connects large number of LUNs (eg 80~200), pvmove (eg, move a single
> > disk to a new one, cmd like: pvmove disk1 disk2), the system will suffer high
> > cpu load. But when system connects ~10 LUNs, the performance is fine.
> > 
> > We found two work arounds:
> > 1. set lvm.conf 'activation/polling_interval=120'.
> > 2. write a speical udev rule, which make udev ignore the event for mpath devices.
> >     echo 'ENV{DM_UUID}=="mpath-*", OPTIONS+="nowatch"' >\
> >      /etc/udev/rules.d/90-dm-watch.rules
> > 
> > Run above any one of two can make the performance issue disappear.
> > 
> > ** the root cause **
> > 
> > lvmpolld will do interval requeset info job for updating the pvmove status
> > 
> > On every polling_interval time, lvm2 will update vg metadata. The update job will
> > call sys_close, which will trigger systemd-udevd IN_CLOSE_WRITE event, eg:
> >    2022-<time>-xxx <hostname> systemd-udevd[pid]: dm-179: Inotify event: 8 for /dev/dm-179
> > (8 is IN_CLOSE_WRITE.)
> > 
> > These VGs underlying devices are multipath devices. So when lvm2 update metatdata,
> > even if pvmove write a few data, the sys_close action trigger udev's "watch"
> > mechanism to gets notified frequently about a process that has written to the
> > device and closed it. This causes frequent, pointless re-evaluation of the udev
> > rules for these devices.
> > 
> > My question: Does LVM2 maintainers have any idea to fix this bug?
> > 
> > In my view, does lvm2 could drop VGs devices fds until pvmove finish?
> 
> Hi
> 
> Please provide more info about lvm2  metadata and also some  'lvs -avvvvv'
> trace so we can get better picture about the layout - also version of
> lvm2,systemd,kernel in use.
> 
> pvmove is progressing by mirroring each segment of an LV - so if there would
> be a lot of segments - then each such update may trigger udev watch rule
> event.
> 
> But ATM I could hardly imagine how this could cause some 'dramatic'
> performance decrease -  maybe there is something wrong with udev rules on
> the system ?
> 
> What is the actual impact ?
> 
> Note - pvmove was never designed as a high performance operation (in fact it
> tries to not eat all the disk bandwidth as such)
> 
> Regards
> Zdenek

My mistake, I write here again:
The subject is wrong, not IO performance but cpu high load is triggered by pvmove.

There is no IO performance issue.

When system is connecting 80~200, the cpu load increase by 15~20, the
cpu usage by ~20%, which corresponds to about ~5,6 cores and led at
times to the cores fully utilized.
In another word: a single pvmove process cost 5-6 (sometime 10) cores
utilization. It's abnormal & unaccepted. 

The lvm2 is 2.03.05, kernel is 5.3. systemd is v246. 

BTW:
I change this mail subject from:  lvmpolld causes IO performance issue
to: lvmpolld causes high cpu load issue 
Please use this mail for later discussing.


- Heming

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

