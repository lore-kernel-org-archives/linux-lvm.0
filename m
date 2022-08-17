Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A78C3F6B0
	for <linux-lvm@archiver.kernel.org>; Tue, 23 Aug 2022 08:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661243315;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JwYplzwH/Gus/1JmwHBlZG+VUToytAp4xoHBEzJPV4Q=;
	b=DMsGMP7nnynh4Q8KACfj9v2Gb36tVcqy56CIVzPYTegH9JvecUlFwEWmVgwg//x/M1noGk
	7oIx2ooj1uTf58Jm+nyx9klEjdzDvob8xYizuE82KUKCPVSkd01rCmjhxNu9F9jKlGrpi0
	bxUkjincfZVuwGLzMN2nSeWWPtLRpOk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-trEhswHSPQy3e__LLkVnZA-1; Tue, 23 Aug 2022 04:28:31 -0400
X-MC-Unique: trEhswHSPQy3e__LLkVnZA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF7523C0D85B;
	Tue, 23 Aug 2022 08:28:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 21658C15BC8;
	Tue, 23 Aug 2022 08:28:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CF47F1946A70;
	Tue, 23 Aug 2022 08:28:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0C0A2193F6E9
 for <linux-lvm@listman.corp.redhat.com>; Wed, 17 Aug 2022 02:03:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D830E492CA5; Wed, 17 Aug 2022 02:03:38 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D395D492C3B
 for <linux-lvm@redhat.com>; Wed, 17 Aug 2022 02:03:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B59A98524C1
 for <linux-lvm@redhat.com>; Wed, 17 Aug 2022 02:03:38 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150084.outbound.protection.outlook.com [40.107.15.84]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413-L7NGMFbvMFWMwbRAryjysQ-1; Tue, 16 Aug 2022 22:03:37 -0400
X-MC-Unique: L7NGMFbvMFWMwbRAryjysQ-1
Received: from AM6PR04MB4662.eurprd04.prod.outlook.com (2603:10a6:20b:1b::21)
 by DU0PR04MB9493.eurprd04.prod.outlook.com (2603:10a6:10:350::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.28; Wed, 17 Aug
 2022 02:03:33 +0000
Received: from AM6PR04MB4662.eurprd04.prod.outlook.com
 ([fe80::8149:c8e2:d4a4:d497]) by AM6PR04MB4662.eurprd04.prod.outlook.com
 ([fe80::8149:c8e2:d4a4:d497%7]) with mapi id 15.20.5525.011; Wed, 17 Aug 2022
 02:03:32 +0000
Date: Wed, 17 Aug 2022 10:03:26 +0800
From: Heming Zhao <heming.zhao@suse.com>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <20220817020225.gf6ooxobdf5xhpxe@c73>
References: <20220816092820.6xbab36dcmxq5hfm@c73>
 <be332c6b-4b65-6462-c570-ee6d0e81b985@gmail.com>
 <20220816100802.yy3xqvynil4pcspb@c73>
 <204c332e-2a30-b17a-ecc1-58025454eb00@gmail.com>
In-Reply-To: <204c332e-2a30-b17a-ecc1-58025454eb00@gmail.com>
X-ClientProxiedBy: SG2PR01CA0117.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::21) To AM6PR04MB4662.eurprd04.prod.outlook.com
 (2603:10a6:20b:1b::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6432a1b-b650-4c5d-5b68-08da7ff4afcb
X-MS-TrafficTypeDiagnostic: DU0PR04MB9493:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: tCgXRwpXJrjOji8lpRobHKc9ZCiEQ27+PHHzXmuLD7J6w7vcDXF5+bmVEFFUw6RkOdJpXXlxikOZNqtGCh/RKBh8pU5n3gMui1UTJcKWXkcQlMeYBOk5Dhrwh+HyY5j79bOCsIxACxHb7A0fxzPAu7ml3ylPdWLOo9Lp3w82i2bND7yT/9fIn3t9wRjBNlfSIagEqOk3y3gFc7ZXozftjWGLFwOlCUROutLVgM8llVskxve1T0JHZJli4RjlWP0xYR3RjuMh/FU06L4cxxrDyT8ucedqNeY4GTFVf2h8YdnocTuyAkKywBbgeU26RnCLVKmbqo9myKHa0gQh5kP4MXEtfmQYjuP7ypJW6cL/E7T2aMoZF6//OemLHM1SbvsMsV1PwdBxtudhDAENpWky4DMSeHrbHiKnhWjDxiBDg9d1lXCCzf6FfHN6sO6SfVd0IyWg5vuBu6V0jbOMdLsaDe36jzguKF6bEyglvn+zcS8jTWn4+JpFM+2aBQFneHyqBytnejMW111RbvI76EbLW6bPVgGG6mgk8agJLTwYCznZ428Pc1ZEOb+C4GFfFEKpPUtLrA6fyS16cb2u0BgSzfGqF6OKEwv07dz9qX46ECB1EPIFiI/w4ERNa38Bfv0rfTxCZdTSFJSmLgHCK7QIfVdrAXKdWcNueUyzxssQ5IwbvFfhIIzzItTzGi8WAp2M3pdqzF7eSn7ac5zF7dmk/YH/H3kIo5cJQz3KqpSuq5t52uOtF6n0yBHwAErJKDOqpN30IS5VHjSerlgMgXWTztBMAPZ8+yRKKf9eolZqioY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB4662.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(346002)(366004)(396003)(39860400002)(376002)(136003)(6512007)(6666004)(6916009)(316002)(33716001)(4326008)(6506007)(8676002)(38100700002)(41300700001)(9686003)(66476007)(83380400001)(26005)(1076003)(186003)(66556008)(66946007)(6486002)(478600001)(8936002)(44832011)(5660300002)(2906002)(86362001)(21314003);
 DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mk4Vv3YY1HyiNf5/5UKVBmD2VbUjKvZIWRnlNuS8+u1+Iq2taauc4bJKrscX?=
 =?us-ascii?Q?95eCbELYr7oWYndC0b1rTSH8/PDGs4J/bPYH+WURoYL5aB+USzBWTloQKfRV?=
 =?us-ascii?Q?s0o05yTn0AZW6JmayjHbWGyXd/kkfKaC6nJ7wDQPD1UT3RSXafAm7sDRjR4E?=
 =?us-ascii?Q?B4YLODiMDqYG5XqfelnzUi0dvKi32RwWIFQ9IRsG7kRR0F+Hvao/n2UUH4QX?=
 =?us-ascii?Q?iVG1SHjwA1Y3YQu4WY+p1JrTYZT1JYegagQtZ6yWYcju1cun7viBUT9mDcbW?=
 =?us-ascii?Q?gA9A/LQs7ruxwQiQRLlY5gqgKJFgTHKDeVQ4ZWGgivKQbXU7GTrTS27NlyJA?=
 =?us-ascii?Q?4PTx8S2DmxnmrRq+Ay6vDKuDdTlslpEAmp1srCTaClojOzmN63BMlXJuBz1V?=
 =?us-ascii?Q?M8fdP8Vdkn0phsTQ/DTnTDrjUIAyGjnleqb7sp8SQ1uvzaVGL1FpC093zCQN?=
 =?us-ascii?Q?nx5QFvs7r9Xe37eJRmkePq5o+uzvGjepTZ01gLqqBLttSmzt6QWrs4a0HjAq?=
 =?us-ascii?Q?8VHAW/34OqbrU03KlyCuiNL5CJ0HiHZdQ4BuFq6KsRgU0W0ONTLsDk1QmJNv?=
 =?us-ascii?Q?e45gOG3nDkkjn1U3Sp4nmsETDNjbi+9vbBHLhii3SwIq170jEB4uVXu192QA?=
 =?us-ascii?Q?chE2xTYggW1CYPnMB4S3NN4fTbL370BR2dpkn4vlrC8Fky+UFQpOb6ceF+5g?=
 =?us-ascii?Q?sv/Q4PW8e+4bIIsEEj+HhAeeYB/kIGl12FVvnvCP+BuPURf6ZUVgxvGoL+S1?=
 =?us-ascii?Q?cJf8GuiHjzBF6AhVtEbgpSP93E6skOBRFX3I+/Q93fqW31uPllPexG4hYmOT?=
 =?us-ascii?Q?OGNyrXmpWRZEgJb/H33aaW5jL4hfWzdp+tjCqTF8PKx/EBtl8/nn0sBum0vG?=
 =?us-ascii?Q?bECbSBfmsSv785oDm40BPPJOTC8qNwBzYpUdq8l3P6TFGffKChd9TDu/0inO?=
 =?us-ascii?Q?xp5T8mM30/ILPFU4O/TYPr66I8SviQ/IEsHLXC1sNUppDV1CxTZZVTe07AIL?=
 =?us-ascii?Q?L38Ym2sjp95F64J8FKKv49Fk5/CGNqiD2rpIoAdHWcK9bZZt583s9jcaH1GQ?=
 =?us-ascii?Q?7+eyFHPn4IzXSIPib4uRUWDBCO+XtJM9iACpKERHMrRsI7nS2EL8YV5l8tme?=
 =?us-ascii?Q?9RxiG3YtUR8ZLywjyc66ByPbv3KiPJB3XN+kTPlF76m3sC07Z1a/Rcm1oVa5?=
 =?us-ascii?Q?M3jzElfBotgJdrgt1slrx+ppHitMxYKf6ZtnA72tRlMKSWATUACy84VJgoSF?=
 =?us-ascii?Q?iPNoPJFO/eOGL01Hqr804+aGmFxNA28rmJpHhucJyzRAhF+F+Yzlo2w58KdC?=
 =?us-ascii?Q?15oTLA0H2BN0LIjv3434i4fs2McN9hHwSzv22Hlo6HoV1cMX0h/8Pm/twuVn?=
 =?us-ascii?Q?oCcqRp6AZkcRKpoYHo9TS7rAO9JZHpEwr+TA0WeCk+YuxjAs5DPWEcM+2vuk?=
 =?us-ascii?Q?V44BJG0fdbA1EDyEBJMd/Nr1+PmUXYstxyA0vNrxrUS9hFHTnN+aKYTr1L5V?=
 =?us-ascii?Q?q4prKIWDDab+vw2MgJ7dk+U+BRBGWL/StsC55vTVaqTo+rjHnzE+YCl4OwkI?=
 =?us-ascii?Q?8+fzFMwO68sKOYUvrQKP+LpCVJQA+4IcqQh846D+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6432a1b-b650-4c5d-5b68-08da7ff4afcb
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4662.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 02:03:32.6465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tMOqAZhdEApRlxgbYTVoB4oihHYUd1/WB9mafxb1plyi+G1MKs9IBEATZbgNMg4xvcsFYeCaRG8hDGVbHcJ5Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9493
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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

On Tue, Aug 16, 2022 at 12:26:51PM +0200, Zdenek Kabelac wrote:
> Dne 16. 08. 22 v 12:08 Heming Zhao napsal(a):
> > Ooh, very sorry, the subject is wrong, not IO performance but cpu high load
> > is triggered by pvmove.
> > 
> > On Tue, Aug 16, 2022 at 11:38:52AM +0200, Zdenek Kabelac wrote:
> > > Dne 16. 08. 22 v 11:28 Heming Zhao napsal(a):
> > > > Hello maintainers & list,
> > > > 
> > > > I bring a story:
> > > > One SUSE customer suffered lvmpolld issue, which cause IO performance dramatic
> > > > decrease.
> > > > 
> > > > How to trigger:
> > > > When machine connects large number of LUNs (eg 80~200), pvmove (eg, move a single
> > > > disk to a new one, cmd like: pvmove disk1 disk2), the system will suffer high
> > > > cpu load. But when system connects ~10 LUNs, the performance is fine.
> > > > 
> > > > We found two work arounds:
> > > > 1. set lvm.conf 'activation/polling_interval=120'.
> > > > 2. write a speical udev rule, which make udev ignore the event for mpath devices.
> > > >      echo 'ENV{DM_UUID}=="mpath-*", OPTIONS+="nowatch"' >\
> > > >       /etc/udev/rules.d/90-dm-watch.rules
> > > > 
> > > > Run above any one of two can make the performance issue disappear.
> > > > 
> > > > ** the root cause **
> > > > 
> > > > lvmpolld will do interval requeset info job for updating the pvmove status
> > > > 
> > > > On every polling_interval time, lvm2 will update vg metadata. The update job will
> > > > call sys_close, which will trigger systemd-udevd IN_CLOSE_WRITE event, eg:
> > > >     2022-<time>-xxx <hostname> systemd-udevd[pid]: dm-179: Inotify event: 8 for /dev/dm-179
> > > > (8 is IN_CLOSE_WRITE.)
> > > > 
> > > > These VGs underlying devices are multipath devices. So when lvm2 update metatdata,
> > > > even if pvmove write a few data, the sys_close action trigger udev's "watch"
> > > > mechanism to gets notified frequently about a process that has written to the
> > > > device and closed it. This causes frequent, pointless re-evaluation of the udev
> > > > rules for these devices.
> > > > 
> > > > My question: Does LVM2 maintainers have any idea to fix this bug?
> > > > 
> > > > In my view, does lvm2 could drop VGs devices fds until pvmove finish?
> > > 
> > > Hi
> > > 
> > > Please provide more info about lvm2  metadata and also some  'lvs -avvvvv'
> > > trace so we can get better picture about the layout - also version of
> > > lvm2,systemd,kernel in use.
> > > 
> > > pvmove is progressing by mirroring each segment of an LV - so if there would
> > > be a lot of segments - then each such update may trigger udev watch rule
> > > event.
> > > 
> > > But ATM I could hardly imagine how this could cause some 'dramatic'
> > > performance decrease -  maybe there is something wrong with udev rules on
> > > the system ?
> > > 
> > > What is the actual impact ?
> > > 
> > > Note - pvmove was never designed as a high performance operation (in fact it
> > > tries to not eat all the disk bandwidth as such)
> > > 
> > > Regards
> > > Zdenek
> > 
> > My mistake, I write here again:
> > The subject is wrong, not IO performance but cpu high load is triggered by pvmove.
> > 
> > There is no IO performance issue.
> > 
> > When system is connecting 80~200, the cpu load increase by 15~20, the
> > cpu usage by ~20%, which corresponds to about ~5,6 cores and led at
> > times to the cores fully utilized.
> > In another word: a single pvmove process cost 5-6 (sometime 10) cores
> > utilization. It's abnormal & unaccepted.
> > 
> > The lvm2 is 2.03.05, kernel is 5.3. systemd is v246.
> > 
> > BTW:
> > I change this mail subject from:  lvmpolld causes IO performance issue
> > to: lvmpolld causes high cpu load issue
> > Please use this mail for later discussing.
> 
> 
> Hi
> 
> Could you please retest with recent version of lvm2. There have been
> certainly some improvements in scanning - which might have caused in the
> older releases some higher CPU usage with longer set of devices.
> 
> Regards
> 
> Zdenek

The highest lvm2 version in SUSE products is lvm2-2.03.15, does this
version include the improvements change?
Could you mind to point out which commits related with the improvements?
I don't have the reproducible env, I need to get a little detail before
asking customer to try new version. 

Thanks,
Heming

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

