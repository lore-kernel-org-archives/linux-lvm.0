Return-Path: <SRS0=/fcx=LL=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F2A3C2B9F4
	for <linux-lvm@archiver.kernel.org>; Thu, 17 Jun 2021 03:47:49 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4AA461359
	for <linux-lvm@archiver.kernel.org>; Thu, 17 Jun 2021 03:47:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4AA461359
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-m-dpM1JHNESn2xEEYBjn3w-1; Wed, 16 Jun 2021 23:47:46 -0400
X-MC-Unique: m-dpM1JHNESn2xEEYBjn3w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9641380DDE2;
	Thu, 17 Jun 2021 03:47:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 003BC60CC9;
	Thu, 17 Jun 2021 03:47:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 99B001809CAD;
	Thu, 17 Jun 2021 03:47:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15H3lHFE016970 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 16 Jun 2021 23:47:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5E9E32028789; Thu, 17 Jun 2021 03:47:17 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 54C7E20287C0
	for <linux-lvm@redhat.com>; Thu, 17 Jun 2021 03:47:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 87BCA101D22B
	for <linux-lvm@redhat.com>; Thu, 17 Jun 2021 03:47:12 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.109.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-216-ll1AExCxNI24h2rn3PNVQg-1;
	Wed, 16 Jun 2021 23:47:10 -0400
X-MC-Unique: ll1AExCxNI24h2rn3PNVQg-1
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
	(mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-11-WhCwgnz4P22VhpIdBZYa4w-1; Thu, 17 Jun 2021 05:47:07 +0200
X-MC-Unique: WhCwgnz4P22VhpIdBZYa4w-1
Received: from VI1PR04MB4671.eurprd04.prod.outlook.com (2603:10a6:803:71::11)
	by VE1PR04MB6720.eurprd04.prod.outlook.com (2603:10a6:803:123::19)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24;
	Thu, 17 Jun 2021 03:47:06 +0000
Received: from VI1PR04MB4671.eurprd04.prod.outlook.com
	([fe80::5c8e:81a1:c7b1:fe44]) by
	VI1PR04MB4671.eurprd04.prod.outlook.com
	([fe80::5c8e:81a1:c7b1:fe44%5]) with mapi id 15.20.4242.019;
	Thu, 17 Jun 2021 03:47:06 +0000
To: David Teigland <teigland@redhat.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<CAAMCDef6sSy5X2+-WLR3wx5m7dx9bhmN3EKWyPa31SebS=wRGQ@mail.gmail.com>
	<dd395e820a4cf9b5e807e8de1e456786eebd2044.camel@suse.com>
	<20210607213003.GA8181@redhat.com>
	<1760ea9715bc7a16d4efe10dd95105d663a07228.camel@suse.com>
	<20210608153937.GA21355@redhat.com> <20210615170354.GA357@redhat.com>
	<ce60635c-320a-be17-4c9e-a6c6b1afdeba@suse.com>
	<20210616163816.GA5811@redhat.com>
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <c5c40605-9859-4086-9717-7381b0309a2c@suse.com>
Date: Thu, 17 Jun 2021 11:46:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.10.0
In-Reply-To: <20210616163816.GA5811@redhat.com>
X-Originating-IP: [123.123.130.132]
X-ClientProxiedBy: HK2P15301CA0013.APCP153.PROD.OUTLOOK.COM
	(2603:1096:202:1::23) To VI1PR04MB4671.eurprd04.prod.outlook.com
	(2603:10a6:803:71::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from c73.home (123.123.130.132) by
	HK2P15301CA0013.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::23)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.0
	via Frontend Transport; Thu, 17 Jun 2021 03:47:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2eaeb592-d2e2-4ec9-27b2-08d931429323
X-MS-TrafficTypeDiagnostic: VE1PR04MB6720:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB67204A5275EDB46863D4CD5D970E9@VE1PR04MB6720.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: ehYW5UKbzpcGrTen8oWn02NYmNcmNi63YFEQz/oJSGVYoQhcjvlvTkoyzzznRBJnE7vpMKf19LtsRA8FIuezR/tVeoOhsAdGmw4pXeW7j4mxDSUUfac51vj+Q3DBR9i+lD2+V3q1gH7z2lQUIscjvd42pCuZemp3xxeZ7yj5682Mefw9czqTlcURBW4z6VVIjJjf2vT63YlbXxtRLcSbDu3Byu2wIdumdIjWCT96OujNr02PXeh2RR3X4dnfLKqartkIHEu55g7ZIJn2sD+Np7YQHCBr7Z0q/q0swV4pX3ae1w24I8opMuwPUiE+1p4h6s8fybdWtb3y8AJQAlzkrbReAmhzUUoZg2+WT2CWCAsqkgKxJqzLj2/hPewkgY3+Q161DKq/bp4Wliewm24ZPF92KivNceq0kVWwm0jmrs3ZTwnJObXu9+9E8f7WLWJYu3nbLiqkNws7OA7MPQEVuZXbkKQEdDk4arbcdYRq+yEKhFspD/Z+Nr8O34Te0Mk4rrudcb6DVbfdN5gMQgWdpE5THvh7rJdScVJ6RvgZuTfC1rcwtQPMYc9Lyk/D3INMmbuuS5iHYh89S39DtGVuCNijvdydzLBZEITfaeYOlCi5o7vD7wncNnSm9MyUkK4mSTZEiDmzjcjwIKSM6TDA8L9aal5ZGq4ehBaalNQV2Z69iL6bJLpV+YZzttIuIJ+6mJAQ4rm7W9zaQjY79MaFtg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:VI1PR04MB4671.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(376002)(136003)(396003)(39850400004)(366004)(346002)(83380400001)(478600001)(26005)(6512007)(6486002)(38100700002)(6916009)(36756003)(16526019)(186003)(86362001)(316002)(54906003)(5660300002)(31686004)(53546011)(6506007)(956004)(6666004)(66946007)(2616005)(66476007)(8886007)(107886003)(2906002)(4326008)(8676002)(66556008)(8936002)(31696002)(9126006)(45980500001)(43740500002);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXpQNFlYcFdJM29wVjhqdzB5QUMraytmcmxnNTRrQ2Z3TFRDNTZkRUdwUnZj?=
	=?utf-8?B?R0xUK1BVVXk0aWNRSmMrbFBvazRpVUlJNGxHRUlwcS9zRVJ1cHZHSk44aTJU?=
	=?utf-8?B?QzJ5U2hTRXRtSXpJNDEvRmluQXJHSzVjbnZuSnlDQkdiRkN0cFYvYXhLUFp3?=
	=?utf-8?B?bTliMEVDeWl5emVRdFNGMjFxZ29aL21wUnVqZVM4a21jWDhBRkc2UnFzL0s3?=
	=?utf-8?B?LzEvNWMxQWVtbi8wenB1ZVpsWEhzbTJwQ0V3MVltL2pqRWtnSnRZdTlpU2kr?=
	=?utf-8?B?aHl3eEEyVnAxMlFrUmJ6ZC9OYWpORGw2QmdJa2VML3A0U1ZPdmVCYkwxbUNt?=
	=?utf-8?B?NzJSS2RYOEZKTis5Z2w2YlRhVEZEK2xTd2lkS1gvRWUwc1dlM3JCVEN2WmVx?=
	=?utf-8?B?Ync0SkV4R3F1bHY2TlBsTEdhRk1LWFFQK2lZVEdVbXVsanNkaTQ0bUUzRGJP?=
	=?utf-8?B?bkhoNjl2S3FnR2wzdlQzMThNdTlrYWFXZkFZTHE3WWp5c3lnZFN3VlZBYTUx?=
	=?utf-8?B?NmNlNjdqQU42eSs3V2FwdnAyQ1B1aUZLVFdJdUdDOHBjZVJRWXdNaFM3cnNJ?=
	=?utf-8?B?RjVZL29PSzA4SzZUa2lRdTJzVVIxLzE3VzR3V01tZUM0b2FJOTJ4RXVtcWYw?=
	=?utf-8?B?MG5hZDFhNVo1S0N2dEtHL0ltTzBpMjkzUlJMbDJSd2FtYkJCWU5sQ3VNcDY1?=
	=?utf-8?B?QUtUTnJWdldBNTF1V01LS2VDU1FOdzFtQWZXd3k4b1E1OWRJNnpyQlAvNHJw?=
	=?utf-8?B?amNKcDRFZjBHWUF3RTZOamFSUC90ZmFjOFpyMVBGdjIxTm1mVldIcWlCSC9Z?=
	=?utf-8?B?RDJPdXBpenZqV0ZxUVFaKysvTlJ0QWJMK2Z6dVJka2NBVzFkeVN5aVFBWHBy?=
	=?utf-8?B?S09zVEt0U1JsYTJTUnoyYmxhN2NKaUp4ODZ0NDNLTW8rclBYdk5iSGttb0ll?=
	=?utf-8?B?WlRFWDA1Wncwb0I2WHhhc2tDOVhyV3hxdDB4SndDODljT20zRHljemZhRVN6?=
	=?utf-8?B?VVJnZEhWUVRtK1lTWTZXdWlIbTNrYjZRUFZkNSt3SGthRGRDS0FMTWJLZDhM?=
	=?utf-8?B?RlYwUXI0dmpJQW0rYjRzZzBtYUNiYldaYkhkRW1qZEhOMjJlc1FTZ0JOaVZw?=
	=?utf-8?B?YmlpR2NxYVBlY0p4bWlqdjYzb1JNMmZsTzMxRGFQNHpFM2JSTlNwcjUxMGl0?=
	=?utf-8?B?WEk5MExYeXVCRjcwY2JPZlhaQytUSzJHdHcvaHU4UjRGU2hReElINlhpblp5?=
	=?utf-8?B?blVMN2lBbmNJS3dXWGZ4OTcyT1RDZmJoc2pjMEVZOC95N3ZiM2FrZmgvNTl4?=
	=?utf-8?B?UC80TUtjd0NRT3pvWFFnQ2NvT2czOWJWUGNyMHVkMmZHbU5uMk9aWlhMa1NS?=
	=?utf-8?B?a0c0b1ZNTm51eVYyRXFrY1NSVTFSOC9uVVN3RlNSS2czc3ErN1M5NVp5c0Ev?=
	=?utf-8?B?YWpBK2o2Tk1mU053aVZLd1Z6KzlsQlFQNlJFYnNSRVh3UURxamRrQk1DV0dG?=
	=?utf-8?B?b1JLWXh5RHAyL2FlNDdBS3N6K3JXaVJzeUpycVZZejd1ckMzZVFMbGdkaTR5?=
	=?utf-8?B?L0poSldyc1VqNTQ5Qzd4aG9xUE55Q0JCamhuNVlJYWhPSk5LbkI4MDNIVFNr?=
	=?utf-8?B?K2Y1MWcycVh0TGduYjF4V0lZME5uaS9GZ0lndFdTTmRTK1FteUFCLzhiVGFn?=
	=?utf-8?B?ejlVWXRmMExoMXZwdmFSMVJyOHdMMnhJd3A2QmpOZW8ycUM4SFc1ak41VFN1?=
	=?utf-8?Q?o2qtMNbSsDKqyJxJnJROfEzzxWdUnPzUqsSS/Fo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eaeb592-d2e2-4ec9-27b2-08d931429323
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4671.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 03:47:05.8961 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7OCPzcUmzGWla9F1x8y1ddxfHg9vPKvtFhmZ1rfM+7uVzOUkLanaDRsGxe72oGpasw4wWUWKFmtdMqIymtlImA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6720
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 15H3lHFE016970
X-loop: linux-lvm@redhat.com
Cc: "rogerheflin@gmail.com" <rogerheflin@gmail.com>,
	"zkabelac@redhat.com" <zkabelac@redhat.com>,
	Martin Wilck <martin.wilck@suse.com>, prajnoha@redhat.com,
	"linux-lvm@redhat.com" <linux-lvm@redhat.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On 6/17/21 12:38 AM, David Teigland wrote:
> On Thu, Jun 17, 2021 at 12:18:47AM +0800, heming.zhao@suse.com wrote:
>> I don't know if I missed something, the result didn't show any progress.
>> the result of "devices/obtain_device_list_from_udev=0" even got regression: from 23.3 => 39.8
>>
>> the lvm2 version with dev-dct-device-info-1 branch code
>> ```
>> sle15sp2-base40g:~ # lvm version
>>    LVM version:     2.03.13(2)-git (2021-05-07)
>>    Library version: 1.02.179-git (2021-05-07)
>>    Driver version:  4.40.0
>>    Configuration:   ./configure --host=x86_64-suse-linux-gnu --build=x86_64-suse-linux-gnu --program-prefix= --disable-dependency-tracking --prefix=/usr --exec-prefix=/usr --bindir=/usr/bin --sbindir=/usr/sbin --sysconfdir=/etc --datadir=/usr/share --includedir=/usr/include --libdir=/usr/lib64 --libexecdir=/usr/lib --localstatedir=/var --sharedstatedir=/var/lib --mandir=/usr/share/man --infodir=/usr/share/info --disable-dependency-tracking --enable-dmeventd --enable-cmdlib --enable-udev_rules --enable-udev_sync --with-udev-prefix=/usr/ --enable-selinux --enable-pkgconfig --with-usrlibdir=/usr/lib64 --with-usrsbindir=/usr/sbin --with-default-dm-run-dir=/run --with-tmpfilesdir=/usr/lib/tmpfiles.d --with-thin=internal --with-device-gid=6 --with-device-mode=0640 --with-device-uid=0 --with-dmeventd-path=/usr/sbin/dmeventd --with-thin-check=/usr/sbin/thin_check --with-thin-dump=/usr/sbin/thin_dump --with-thin-repair=/usr/sbin/thin_repair --enable-blkid_wiping --enable-lvmpolld --enable-
 realtime --with-cache=internal --with-default-locking-dir=/run/lock/lvm --with-default-pid-dir=/run --with-default-run-dir=/run/lvm --enable-fsadm --disable-silent-rules --enable-write_install --with-vdo=none
>> ```
>>
>> Installation with cmd: make install && dracut -f --add "lvm"
>>
>> top 10 blame services
>> ```
>> external_device_info_source = "none"
>> obtain_device_list_from_udev = 1
>> event_activation = 1
>> udev_sync = 1
> 
> Thanks for running that again.  From your previous testing, my conclusion
> was that libudev caused the slowdown.  So, the patch is supposed to avoid
> all libudev calls by default, and rely only on lvm's native device type
> detection.  The default settings to avoid libudev, are:
> 
>    obtain_device_list_from_udev = 0
>    external_device_info_source = "none"
> 
> I'm not sure which of your test results match those settings, but if those
> results are not improved, then we should look further to see if the
> slowdown is caused by something other than libudev calls.
> 

the default value of external_device_info_source is "none" and I didn't change it.
So below (from my last mail) is your wanted result, it's worse than before (23.3 vs 39.8).

```
devices/obtain_device_list_from_udev=0
global/event_activation=1
activation/udev_sync=1

sle15sp2-base40g:~ # systemd-analyze blame | head -n 10
          39.845s lvm2-pvscan@133:576.service
          39.830s lvm2-pvscan@133:640.service
          39.829s lvm2-pvscan@133:720.service
          39.827s lvm2-pvscan@132:736.service
          39.825s lvm2-pvscan@132:656.service
          39.823s lvm2-pvscan@132:672.service
          39.821s lvm2-pvscan@132:720.service
          39.820s lvm2-pvscan@132:544.service
          39.819s lvm2-pvscan@132:624.service
          39.808s lvm2-pvscan@132:576.servic
```

the booting time out problem cause by two side:
1> libudev take much time
2> thousands of lvm2-pvscan@.service running on the same time

the new patch or existing code (with obtain_device_list_from_udev=0) can avoid <1>.
but <2> is still not to avoid. (direct activation can avoid it)

Thanks,
heming

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

