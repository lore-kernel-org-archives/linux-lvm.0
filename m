Return-Path: <SRS0=kfxi=LC=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 166ECC47082
	for <linux-lvm@archiver.kernel.org>; Tue,  8 Jun 2021 16:50:13 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D32461246
	for <linux-lvm@archiver.kernel.org>; Tue,  8 Jun 2021 16:50:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D32461246
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-LzEsXHFRPXip2PBHFVO_Hg-1; Tue, 08 Jun 2021 12:50:09 -0400
X-MC-Unique: LzEsXHFRPXip2PBHFVO_Hg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A36E188E3CC;
	Tue,  8 Jun 2021 16:50:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D4D9D5D6A8;
	Tue,  8 Jun 2021 16:50:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 78A8D1800BB4;
	Tue,  8 Jun 2021 16:50:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 158GnxKZ024081 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 8 Jun 2021 12:49:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 13DDC9C071; Tue,  8 Jun 2021 16:49:59 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CC6B9C058
	for <linux-lvm@redhat.com>; Tue,  8 Jun 2021 16:49:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5811B80D0E0
	for <linux-lvm@redhat.com>; Tue,  8 Jun 2021 16:49:56 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.109.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-335-nHGRisYNMsKedNVLa__Pvg-1;
	Tue, 08 Jun 2021 12:49:54 -0400
X-MC-Unique: nHGRisYNMsKedNVLa__Pvg-1
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
	(mail-am5eur03lp2051.outbound.protection.outlook.com [104.47.8.51])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-27-eOUHKK13Nj6BYiPcvAkk9Q-2; Tue, 08 Jun 2021 18:49:52 +0200
X-MC-Unique: eOUHKK13Nj6BYiPcvAkk9Q-2
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
	DBBPR04MB6217.eurprd04.prod.outlook.com (2603:10a6:10:c1::19) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.4195.24; Tue, 8 Jun 2021 16:49:48 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::2c69:3d93:4901:ecfc]) by
	DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::2c69:3d93:4901:ecfc%3]) with mapi id 15.20.4195.030;
	Tue, 8 Jun 2021 16:49:48 +0000
To: Martin Wilck <martin.wilck@suse.com>,
	"teigland@redhat.com" <teigland@redhat.com>,
	"linux-lvm@redhat.com" <linux-lvm@redhat.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<CAAMCDef6sSy5X2+-WLR3wx5m7dx9bhmN3EKWyPa31SebS=wRGQ@mail.gmail.com>
	<dd395e820a4cf9b5e807e8de1e456786eebd2044.camel@suse.com>
	<20210607213003.GA8181@redhat.com>
	<1760ea9715bc7a16d4efe10dd95105d663a07228.camel@suse.com>
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <6ee904a6-d7b8-1457-513c-c31404400e8d@suse.com>
Date: Wed, 9 Jun 2021 00:49:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.10.0
In-Reply-To: <1760ea9715bc7a16d4efe10dd95105d663a07228.camel@suse.com>
X-Originating-IP: [123.123.133.78]
X-ClientProxiedBy: HKAPR03CA0027.apcprd03.prod.outlook.com
	(2603:1096:203:c9::14) To DB7PR04MB4666.eurprd04.prod.outlook.com
	(2603:10a6:5:2b::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from c73.home (123.123.133.78) by
	HKAPR03CA0027.apcprd03.prod.outlook.com (2603:1096:203:c9::14)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.9
	via Frontend Transport; Tue, 8 Jun 2021 16:49:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09fd68b0-72c2-47f5-cabb-08d92a9d6d9b
X-MS-TrafficTypeDiagnostic: DBBPR04MB6217:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB6217B7740F7F20D504564B3297379@DBBPR04MB6217.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: 52T8Ll69SbnK06jOlOzkoQYG2UCshi6Y+e8+vNxxBU3qRpP+FBtEirYeutm77GI9lgWwEOuh3/wOraEBAzWipvCDhGdc0rpzUXHFTCEK8mZVNdW8HscYtodWEczQQgQrvVCGG0FSgNa6tnzI0jj0ujEJ2iIj202wwiH1BlAGCFD7HXgyKTjV9t5BIbCfHCoJkCIlHeHBVSo1LZdu+byhIHrFuLleNGRmqjTs07N/mL4nRG7NTOY3lYZ65vAYIElLLBrp91CfY3OwDis+SkhwezBy4ZmykWa3v3/wQySKgBIGUx/JGCx3uWQ/4dzClSy6CAKnaNXoxkeQHA/v/3e/6/IDY999t9Gas3i07usiGT1S+K/g7GCOxfjD5QtfvYYxQZutzhlc3v93lS3EI8A6MgjJv+5LOh2/UCN+kSmmB2qCxzZNnxKieyKGP5vOrnhpOdmL3TJd0FkXL0z7ZgC54nqY+mmROygU2qf/p+aQj1izpZQslso9Y9LVx7i0DBp6QamV+jc+c5sqpgUr4S06SfUBj19XCda0xg/nzGTa0/he9HOF+SvHcStVPSiJ5Mv/7Xztf/xv+OUtaITByR3lEcGRzTHnmN377zWLuH16sEMmdZM+M72IKwzod3qaxmxnbyd69/GxHkFc2IofpH0+Ekd9i+Iku0RzZHUaxcfVdiRQlQkkhbh8tRmswTWxSgY1nfa1PhUAKWK8tDLtzrQ18g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB7PR04MB4666.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(396003)(39850400004)(366004)(136003)(376002)(346002)(6512007)(38100700002)(5660300002)(36756003)(66946007)(6666004)(66556008)(86362001)(8886007)(66476007)(6486002)(2906002)(6506007)(31686004)(83380400001)(4326008)(53546011)(316002)(54906003)(8936002)(110136005)(8676002)(956004)(2616005)(186003)(478600001)(16526019)(26005)(31696002)(9126006)(45980500001)(43740500002);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?0dAAAzR9xqfPVNB1gHwwXMWH/+z1YNoxZY+zjE9z6Ak0qmmAakin3d4ttCNg?=
	=?us-ascii?Q?SDcYVKeTspJ1Fn6Odc7/nuFRz5WpbYnesF9637IMKh6cMH2SlaWTfhXQsDUZ?=
	=?us-ascii?Q?9eMBxDAYlT/RhAmbaDSQD+rvGilN0m6mL+ZILjpYiMWpJyLBnHz/yA71N6OQ?=
	=?us-ascii?Q?tLab/UB6aPBASvYrHb6wJob1ige3jQd4RVWXz1bYHjjGr4i/LUG1JhGETMMI?=
	=?us-ascii?Q?xuVGSv9K2eCsP/QF59qP43WBsan+JAhBEvFdNPI1WkCOcf2Q2qQKMzzfwApA?=
	=?us-ascii?Q?sd7elVhx+xAYLxV2pEb10YESnlGGH0zuFAKNqAhGqdI2Gb7QCJK49Wlu9JDy?=
	=?us-ascii?Q?Kyco48xl1iWFgJ41eNOMNJTWDbo0xkKld4dPrwfLMjMxkaW806y3iku1RKYM?=
	=?us-ascii?Q?ZGIh23HGdo65eGwO5KLjEV0hLrwhhkxSKI0MCuaaQi7gK7YLNnSAH9WQDt0i?=
	=?us-ascii?Q?rtx+TjSPe7WNOQRgRLI0bQ/KftVm60fVMKFR/P+lFc25UvBWULSr3zM36+02?=
	=?us-ascii?Q?kAZkBcUN5GV4jVscbqTqvLfY4G7u70vqxDzpLWdhBbVtiM50rLOsMls7Wuxf?=
	=?us-ascii?Q?C7JQcQ9+U1HxN3X/RYlcz5LpV/ZDaajTaQEiwkqqgL8KaxbGphZw+BOEDw0q?=
	=?us-ascii?Q?n2/qYUz55srHIm609DDzDM8xWjnGbi0d1Y+975d7a9nC6nfZzyyJfLaWdXHQ?=
	=?us-ascii?Q?pf803UxSZdaquWfzAkj/gg4E840lr89uBQV7Z+hkIoTyRLJl/n9sn4/OYmvv?=
	=?us-ascii?Q?j9qq9/vH8nyO+ZJKI0npIwCXHrdicrZhKKPPAlQ2QmPjXSyomySUriOmifGu?=
	=?us-ascii?Q?cORdddzTTNbxsJcYm+pcjT2+FNIUiUjaOn+/O3d5r78HcJ+GsVgIRS3dl+Zs?=
	=?us-ascii?Q?3Kdi1vp2ChOX2LZmsS4byNbabeGhCN/yZGxiESX7bJgu6yW5vc858oE0Txj9?=
	=?us-ascii?Q?ULnnP6TSVWmeOTYbLF1laTk4oIh/UNRImwM6vTWqbUh0puaV4eg6Upk3Uwcg?=
	=?us-ascii?Q?0W7ZbMpEbXw8gZ3mqu5WAsC9tytxgxVEdmu0+MPMIXaNq8MadvVYtD+CbNMB?=
	=?us-ascii?Q?CsDpxGfQJdpMm++jIZeUxQtAiYzjTqvPMHFw1rl/PpsskFWvGttmXra3mjoL?=
	=?us-ascii?Q?u8BLpP2e9qnpWpiaEH+b9cdwxHhHn3Q9xFW3VX3G6i4sjFVew+XOELz56ltJ?=
	=?us-ascii?Q?c1fGiWTIwfiWMHEoe/ybIJk37pDU2n7sM/8f2VPL3giF5EPfJQkmABlTkg1i?=
	=?us-ascii?Q?3itbbJ7AGftKSfYlZIvec9bzz/kfm8VQrDde0Z5k+U/JheYb/i6nHcp/0d8k?=
	=?us-ascii?Q?5DiR0waXjHgjMNqwpReb9Hdp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09fd68b0-72c2-47f5-cabb-08d92a9d6d9b
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 16:49:48.7573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: urL+F1Ny0KUYrUomiy3A+IZj6v2DB6L92ZWKBhBDGHzZ6n/f+LnxreV4uCPQuf68SeQ++CJIE2N3OQxt5VdhDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6217
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 158GnxKZ024081
X-loop: linux-lvm@redhat.com
Cc: "rogerheflin@gmail.com" <rogerheflin@gmail.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-15"; Format="flowed"

On 6/8/21 4:26 PM, Martin Wilck wrote:
> On Mo, 2021-06-07 at 16:30 -0500, David Teigland wrote:
>> On Mon, Jun 07, 2021 at 10:27:20AM +0000, Martin Wilck wrote:
>>> Most importantly, this was about LVM2 scanning of physical volumes.
>>> The
>>> number of udev workers has very little influence on=A0PV scanning,
>>> because the udev rules only activate systemd service. The actual
>>> scanning takes place in lvm2-pvscan@.service. And unlike udev,
>>> there's
>>> no limit for the number of instances of a given systemd service
>>> template that can run at any given time.
>>
>> Excessive device scanning has been the historical problem in this area,
>> but Heming mentioned dev_cache_scan() specifically as a problem.=A0 That
>> was
>> surprising to me since it doesn't scan/read devices, it just creates a
>> list of device names on the system (either readdir in /dev or udev
>> listing.)=A0 If there are still problems with excessive
>> scannning/reading,
>> we'll need some more diagnosis of what's happening, there could be some
>> cases we've missed.
>=20
> Heming didn't include his measurement results in the initial post.
> Here's a small summary. Heming will be able to provide more details.
> You'll see that the effects are quite drastic, factors 3-4 between
> every step below, factor >60 between best and worst. I'd say these
> results are typical for what we observe also on real-world systems.
>=20
> kvm-qemu, 6 vcpu, 20G memory, 1258 scsi disks, 1015 vg/lv
> Shown is "systemd-analyze blame" output.
>=20
>   1) lvm2 2.03.05 (SUSE SLE15-SP2),
>      obtain_device_list_from_udev=3D1 & event_activation=3D1
>          9min 51.782s lvm2-pvscan@253:2.service
>          9min 51.626s lvm2-pvscan@65:96.service
>      (many other lvm2-pvscan@ services follow)
>   2) lvm2 latest master
>      obtain_device_list_from_udev=3D1 & event_activation=3D1
>          2min 6.736s lvm2-pvscan@70:384.service
>          2min 6.628s lvm2-pvscan@70:400.service
>   3) lvm2 latest master
>      obtain_device_list_from_udev=3D0 & event_activation=3D1
>              40.589s lvm2-pvscan@131:976.service
>              40.589s lvm2-pvscan@131:928.service
>   4) lvm2 latest master
>      obtain_device_list_from_udev=3D0 & event_activation=3D0,
>              21.034s dracut-initqueue.service
>               8.674s lvm2-activation-early.service
>=20
> IIUC, 2) is the effect of _pvscan_aa_quick(). 3) is surprising;
> apparently libudev's device detection causes a factor 3 slowdown.
> While 40s is not bad, you can see that event based activation still
> performs far worse than "serial" device detection lvm2-activation-
> early.service.
>=20
> Personally, I'm sort of wary about obtain_device_list_from_udev=3D0
> because I'm uncertain whether it might break multipath/MD detection.
> Perhaps you can clarify that.
>=20
> Regards
> Martin
>=20
>=20

my latest test results. there combines 3 cfg items:
devices/obtain_device_list_from_udev
global/event_activation
activation/udev_sync

<0> is under lvm2-2.03.05+
<1> ~ <8> is under lvm2-2.03.12+

all results are from "systemd-analyze blame", and I only
post top n services.


0>
with suse 15sp2 lvm2 version: lvm2-2.03.05+
"systemd-analyze blame" show the top serives:

devices/obtain_device_list_from_udev=3D1
global/event_activation=3D1
activation/udev_sync=3D1

     9min 51.782s lvm2-pvscan@253:2.service <=3D=3D=3D
     9min 51.626s lvm2-pvscan@65:96.service
     9min 51.625s lvm2-pvscan@65:208.service
     9min 51.624s lvm2-pvscan@65:16.service
     9min 51.622s lvm2-pvscan@8:176.service
     9min 51.614s lvm2-pvscan@65:144.service

1>
devices/obtain_device_list_from_udev=3D1
global/event_activation=3D0
activation/udev_sync=3D0

          18.307s dracut-initqueue.service
           6.168s btrfsmaintenance-refresh.service
           4.327s systemd-udev-settle.service
           3.633s wicked.service
           2.976s lvm2-activation-early.service  <=3D=3D=3D
           1.560s lvm2-pvscan@135:832.service
           1.559s lvm2-pvscan@135:816.service
           1.558s lvm2-pvscan@135:784.service
           1.558s lvm2-pvscan@134:976.service
           1.557s lvm2-pvscan@134:832.service
           1.556s dev-system-swap.swap
           1.554s lvm2-pvscan@134:992.service
           1.553s lvm2-pvscan@134:1008.service

2>
devices/obtain_device_list_from_udev=3D0
global/event_activation=3D0
activation/udev_sync=3D0

          17.164s dracut-initqueue.service
          10.420s wicked.service
           7.109s btrfsmaintenance-refresh.service
           4.471s systemd-udev-settle.service
           3.415s lvm2-activation-early.service <=3D=3D=3D
           1.679s lvm2-pvscan@135:816.service
           1.678s lvm2-pvscan@135:832.service
           1.677s lvm2-pvscan@134:992.service
           1.675s lvm2-pvscan@135:784.service
           1.674s lvm2-pvscan@134:928.service
           1.673s lvm2-pvscan@134:896.service
           1.673s dev-system-swap.swap
           1.672s lvm2-pvscan@134:1008.service


3>
devices/obtain_device_list_from_udev=3D1
global/event_activation=3D0
activation/udev_sync=3D1

          17.552s dracut-initqueue.service
           7.401s lvm2-activation-early.service <=3D=3D=3D=3D
           6.519s btrfsmaintenance-refresh.service
           5.375s systemd-udev-settle.service
           3.588s wicked.service
           1.723s wickedd-nanny.service
           1.686s wickedd.service
           1.655s lvm2-pvscan@129:992.service
           1.654s lvm2-pvscan@129:960.service
           1.653s lvm2-pvscan@129:896.service
           1.652s lvm2-pvscan@130:784.service
           1.651s lvm2-pvscan@130:768.service


4>
devices/obtain_device_list_from_udev=3D0
global/event_activation=3D0
activation/udev_sync=3D1

          17.975s dracut-initqueue.service
          10.162s wicked.service
           8.238s lvm2-activation-early.service  <=3D=3D=3D
           6.955s btrfsmaintenance-refresh.service
           4.444s systemd-udev-settle.service
           1.800s rsyslog.service
           1.768s wickedd.service
           1.751s kbdsettings.service
           1.751s kdump-early.service
           1.602s lvm2-pvscan@135:832.service
           1.601s lvm2-pvscan@135:816.service
           1.601s lvm2-pvscan@135:784.service
           1.600s lvm2-pvscan@134:1008.service
           1.599s dev-system-swap.swap
           1.598s lvm2-pvscan@134:832.service

5>
devices/obtain_device_list_from_udev=3D0
global/event_activation=3D1
activation/udev_sync=3D1

          34.908s dracut-initqueue.service
          25.440s systemd-udev-settle.service
          23.335s lvm2-pvscan@66:832.service  <=3D=3D=3D
          23.335s lvm2-pvscan@65:976.service
          23.335s lvm2-pvscan@66:784.service
          23.335s lvm2-pvscan@65:816.service
          23.335s lvm2-pvscan@8:976.service
          23.327s lvm2-pvscan@66:864.service
          23.323s lvm2-pvscan@66:848.service
          23.316s lvm2-pvscan@65:800.service

6>
devices/obtain_device_list_from_udev=3D0
global/event_activation=3D1
activation/udev_sync=3D0

          36.222s lvm2-pvscan@134:912.service <=3D=3D=3D
          36.222s lvm2-pvscan@134:816.service
          36.222s lvm2-pvscan@134:784.service
          36.221s lvm2-pvscan@133:816.service
          36.221s lvm2-pvscan@133:848.service
          36.220s lvm2-pvscan@133:928.service
          36.220s lvm2-pvscan@133:768.service
          36.219s lvm2-pvscan@133:992.service
          36.218s lvm2-pvscan@133:784.service
          36.218s lvm2-pvscan@134:800.service
          36.218s lvm2-pvscan@133:864.service
          36.217s lvm2-pvscan@133:896.service
          36.209s lvm2-pvscan@133:960.service
          36.197s lvm2-pvscan@134:1008.service


7>
devices/obtain_device_list_from_udev=3D1
global/event_activation=3D1
activation/udev_sync=3D1

      2min 6.736s lvm2-pvscan@70:384.service <=3D=3D=3D
      2min 6.628s lvm2-pvscan@70:400.service
      2min 6.554s lvm2-pvscan@69:432.service
      2min 6.518s lvm2-pvscan@69:480.service
      2min 6.478s lvm2-pvscan@69:416.service
      2min 6.277s lvm2-pvscan@69:464.service
      2min 5.791s lvm2-pvscan@69:544.service


8>
devices/obtain_device_list_from_udev=3D1
global/event_activation=3D1
activation/udev_sync=3D0

     2min 27.091s lvm2-pvscan@129:944.service <=3D=3D=3D
     2min 26.952s lvm2-pvscan@129:912.service
     2min 26.950s lvm2-pvscan@129:880.service
     2min 26.947s lvm2-pvscan@129:960.service
     2min 26.947s lvm2-pvscan@129:928.service
     2min 26.947s lvm2-pvscan@129:832.service
     2min 26.938s lvm2-pvscan@129:848.service
     2min 26.733s lvm2-pvscan@129:864.service
     2min 16.241s lvm2-pvscan@66:976.service
     2min 15.166s lvm2-pvscan@66:992.service


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

