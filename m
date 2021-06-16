Return-Path: <SRS0=KZoJ=LK=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AD3EC48BE6
	for <linux-lvm@archiver.kernel.org>; Wed, 16 Jun 2021 16:22:11 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05FE461164
	for <linux-lvm@archiver.kernel.org>; Wed, 16 Jun 2021 16:22:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05FE461164
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-lXuOyJaZOYuD6Zfhxw0QRg-1; Wed, 16 Jun 2021 12:21:08 -0400
X-MC-Unique: lXuOyJaZOYuD6Zfhxw0QRg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8F08100D1AA;
	Wed, 16 Jun 2021 16:21:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C3E719C66;
	Wed, 16 Jun 2021 16:20:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9B5FC46F58;
	Wed, 16 Jun 2021 16:20:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15GGJgg0021911 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 16 Jun 2021 12:19:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 404DC106A3D; Wed, 16 Jun 2021 16:19:42 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3AE54106A5C
	for <linux-lvm@redhat.com>; Wed, 16 Jun 2021 16:19:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B295C90DE30
	for <linux-lvm@redhat.com>; Wed, 16 Jun 2021 16:19:38 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.109.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-589-vLnJEs35NfGRXHPTqPy0tg-1;
	Wed, 16 Jun 2021 12:19:05 -0400
X-MC-Unique: vLnJEs35NfGRXHPTqPy0tg-1
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
	(mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-17-dAl_vy9gOme1WKCuDmbS2A-2; Wed, 16 Jun 2021 18:19:03 +0200
X-MC-Unique: dAl_vy9gOme1WKCuDmbS2A-2
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
	DB3PR0402MB3676.eurprd04.prod.outlook.com (2603:10a6:8:d::10) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.4219.21; Wed, 16 Jun 2021 16:19:00 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::2c69:3d93:4901:ecfc]) by
	DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::2c69:3d93:4901:ecfc%3]) with mapi id 15.20.4219.025;
	Wed, 16 Jun 2021 16:19:00 +0000
To: David Teigland <teigland@redhat.com>,
	"linux-lvm@redhat.com" <linux-lvm@redhat.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<CAAMCDef6sSy5X2+-WLR3wx5m7dx9bhmN3EKWyPa31SebS=wRGQ@mail.gmail.com>
	<dd395e820a4cf9b5e807e8de1e456786eebd2044.camel@suse.com>
	<20210607213003.GA8181@redhat.com>
	<1760ea9715bc7a16d4efe10dd95105d663a07228.camel@suse.com>
	<20210608153937.GA21355@redhat.com> <20210615170354.GA357@redhat.com>
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <ce60635c-320a-be17-4c9e-a6c6b1afdeba@suse.com>
Date: Thu, 17 Jun 2021 00:18:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.10.0
In-Reply-To: <20210615170354.GA357@redhat.com>
X-Originating-IP: [123.123.130.132]
X-ClientProxiedBy: HK2PR02CA0202.apcprd02.prod.outlook.com
	(2603:1096:201:20::14) To DB7PR04MB4666.eurprd04.prod.outlook.com
	(2603:10a6:5:2b::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from c73.home (123.123.130.132) by
	HK2PR02CA0202.apcprd02.prod.outlook.com (2603:1096:201:20::14)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15
	via Frontend Transport; Wed, 16 Jun 2021 16:18:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f38e98a-025b-4886-16a0-08d930e272e6
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3676:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB3PR0402MB36767D9FC34D3ED10EA92222970F9@DB3PR0402MB3676.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: Vfxu5mY2dARySGJNdeUyQip6k1jRI7JF45FyNkoqiuHLhqr87jdD1q828tPu82ciJiXB0dF9UlJbu6hxaqkY7m16MEOkv76qZ9XIwWnWN97jNQO1snlLdn+tvtkYBAGd7Iiqe50/SpKtQygxSYPz8YKjErpWBSZgBYSH0VchgE+ge7VonkJyYVAVm+R+If2e8jLxAoKrNBsdvtV03ARTmUCCDIMBaQFvstEXiH0AVCg3Chrd0a1lj6rwKkauzZzYr+PkqWDcqwP7iqtvExFhutGykgUGWOjDshzB/36ABfWaQ+Y7pZ57C1EWzf8Lme4vtWcoyB/rOSXktLwr2m4NvMXGDNPWMzSUNTaNPtJTsopR/R8renG3YS0A7ubsN7K5fqYc68Ax0cNqvaarfNspkMEiFE4FHkci1v0vwZLXDyLbrOirj+eDmPZwNKq1d8mieNL0ciuLaMhlv5yLx8FgjXtYGT3/f0rdCmi+BEdO9Rlb/fUcKq4yb60ug+1oWkU3KM4VY8Z9MVIgH1AU9maW0rDWqIg5UhT1o2dtSpHo9THwnFNOOtw9jZKXkfXa6j9q/kBe+JO6YPTDxwElybJqdC5t44fjA7MB9Y2N7DS8n8o6Q/rFoDBaRFvcPGvBHGnbpW7NGTgILmE16P4lkQGS8OFl22N0W84zx7AJBNYzJKJQvJxhSXREQwdPohbQzmQQ/KaGa9nZG4RJQUH8Jdr/oQKlneCage7I3dd10yFKrNu752ztyc4rylr1ctm9SWeJbUrCWr5x5+q37u7hOLbMcHSGsFjYbD8660du0GsW7PaCDelt0Qq/DwppJrUnMg7q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB7PR04MB4666.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(136003)(376002)(366004)(39840400004)(396003)(346002)(31686004)(31696002)(186003)(966005)(66476007)(478600001)(6666004)(83380400001)(107886003)(5660300002)(6512007)(66556008)(16526019)(8886007)(26005)(8936002)(66946007)(86362001)(6506007)(110136005)(316002)(4326008)(2906002)(54906003)(38100700002)(2616005)(8676002)(53546011)(6486002)(36756003)(956004)(9126006)(45980500001)(43740500002);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkF6d0F0TjI1MXpvVSs4a2ZCOHZuL2RpRDFuUTQwV1Z3bTVRSERvbzlDMkNo?=
	=?utf-8?B?ZWpTTElUdVJUeVZNc3NuM3AyelhmcG5yalJ0ODN3R04xTXUyZk9NZUpiaTla?=
	=?utf-8?B?RkVod0N0VnFINU9uaFpXS1BBQUZaekJzemJJVGlyaTJNQWJER2NJeE5aaitR?=
	=?utf-8?B?aGVXY1BZK1lxYWwvUEYrUlh3aVNFUnFURXVDY1E4THdGbmpEQXZrTXhLYWNx?=
	=?utf-8?B?TkxqTTZVdmZSNlhaNFhtVXVaaCtZYkp4M2dmaVpZTDk4NmFoZGRCMlBBWTNC?=
	=?utf-8?B?SDd6WEZTTmVTTGtXSE8xUmU2SGV0ME9URGVNU2pIejRZTUdFVVE4d2NIZlF5?=
	=?utf-8?B?R3VNeWJrTVROT05qSXgrZ3NOaFFtV244alJSVjkraFEvbTRRTEJmNGl3bWph?=
	=?utf-8?B?WE5ETFNWbno5Sk5UUnByWUs4eHZMNjJycmRGR0pxcEtOYVl6dHlla3oyYmVz?=
	=?utf-8?B?YVkxSjdmRHJBbGM1OGZkdC85ZFFsMFFydlg1cTY0QkpBdThmUnFnMlhzdWJT?=
	=?utf-8?B?OUZTQWlXR3cwdHErTmsxQzRJSzk0dFBKdVhTWGJmNVlEUEI4aEVyODlKdDN6?=
	=?utf-8?B?YkZFRDlaS1NSNmt2aGtkRXFPclYyMjZkcmJjNTZtT0RwUHIvT3pJbUxLU2FY?=
	=?utf-8?B?Y2JNYVNSbjFzc2FJQjVhcklYbjdTTENBQllnMXRIQWZjVTd0bjY1VitGY0Ru?=
	=?utf-8?B?TC9adkphdCtFTU04SGd2bUJ1cEZ5bnpROE9vcmJJYnJjUTBKb2RVdjBhOXlt?=
	=?utf-8?B?TFBZTDlwVmE5STA2L2NCZkFUazRSb3FHVUtIZ3dDNCs2TzRrTjJ2YmdSYm9C?=
	=?utf-8?B?NTBNM0pjQSs0U1hBTWN1aXBoajdmSEcxV052SUx2WjZYbWNpL0M3RXVYUmFJ?=
	=?utf-8?B?a2xWZEs3UFc1U1NvT3Ftbzdaa3E0NmFwNUhBS3ZRanVJRHZDdGszTENFSWdC?=
	=?utf-8?B?R0Q0WWJTL2xxMnFSUEl1QTFkTVN2R24yU2hxY3Z0R3l0TWdhc0RsOXN0Zmtt?=
	=?utf-8?B?NkVhQU13OUNpNy9KWXRDczBvODlDaEduQWdmUEZJMVhaS3NHbElmb0xQT1d6?=
	=?utf-8?B?UnFUeGFsZmVhbEhLcEZSRUxDYUJCRG5lbGhFdktUUDhZN0hpRGF2ZWpoMW1y?=
	=?utf-8?B?K25EQ3JPM1dqUVl5Z255VVAwWmN2Q0l2WHNKRkx0VkhVY2h6ODcraExEY2VL?=
	=?utf-8?B?bk56bWZoUUVKa25QZ2U1dkJLeHFpcWMwbTkvZ0ltcjBkNjV5SFgzMytPM1hP?=
	=?utf-8?B?NFJvNjhhRzdoRXF5Z1pmRkxWSU1IUi9iV1daWVBYN3JWbmFDMTEzVFRYWHNr?=
	=?utf-8?B?VmZYSVhhWlVkU3ZSOXJoWnZNZ0ZQRDl3NGREMDNJOWZuSUhyV1RPR3NZR1U2?=
	=?utf-8?B?VHFNNlJSWHBuL0ZxQmVneTdZMHY5azFiUExBdjJabzdCYmU3VkVhN3JvazFL?=
	=?utf-8?B?bG1VbFdjMG1BOGowZDFoY1lZTDU3UlFrSlV1ZWoxcXFDUWJLclRDbDJENUFZ?=
	=?utf-8?B?QlZrR1praXErWkxOWjkyOC9CSDFkb0x6N1Btb1ZLcVpUa01TbzVESGFjK0Vs?=
	=?utf-8?B?YXZtb1RGWDdUN1Q2YkJEN2x0cm9kWUo1VFcrRUpNYXRYZS9ZNGM5VVVpQ0dG?=
	=?utf-8?B?K01rUStiblpNaCs5cGUxRnYycCtNSzBqOTQxU3FzaWFtOEw5dDBDODQ5RnJT?=
	=?utf-8?B?Z21DZmZNdTFidTUwazdaenpsdWpOdEhuUmNZSzZSUW8yT29qeFQzQTlrTy8z?=
	=?utf-8?Q?eXUNqSpxVuTMSXPZORp5KAy4kvvUXBgfe/iQOf2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f38e98a-025b-4886-16a0-08d930e272e6
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 16:18:59.9438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AlxuVfKz1KgO6ArdoUSGx+oS0EzAdjVepcSBG7FWuZW2jxKzw5cVAIb9XdWr0WH4leTbcnCyzyaulsEna7nydw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3676
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 15GGJgg0021911
X-loop: linux-lvm@redhat.com
Cc: "rogerheflin@gmail.com" <rogerheflin@gmail.com>, prajnoha@redhat.com,
	Martin Wilck <martin.wilck@suse.com>,
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

On 6/16/21 1:03 AM, David Teigland wrote:
> On Tue, Jun 08, 2021 at 10:39:37AM -0500, David Teigland wrote:
>> I think it would be an improvement to:
>>
>> . Make obtain_device_list_from_udev only control how we get the device
>>    list. Then we can easily default to 0 and readdir /dev if it's better.
>>
>> . Use both native md/mpath detection *and* udev info when it's readily
>>    available (don't wait for it), instead of limiting ourselves to one
>>    source of info.  If either source indicates an md/mpath component,
>>    then we consider it true.
>>
>> The second point means we are free to change obtain_device_list_from_udev
>> as we wish, without affecting md/mpath detection.  It may also improve
>> md/mpath detection overall.
> 
> Here are the initial patches I'm testing (libmpathvalid not yet added)
> https://sourceware.org/git/?p=lvm2.git;a=shortlog;h=refs/heads/dev-dct-device-info-1
> 

I compiled & tested the code.
I don't know if I missed something, the result didn't show any progress.
the result of "devices/obtain_device_list_from_udev=0" even got regression: from 23.3 => 39.8

the lvm2 version with dev-dct-device-info-1 branch code
```
sle15sp2-base40g:~ # lvm version
   LVM version:     2.03.13(2)-git (2021-05-07)
   Library version: 1.02.179-git (2021-05-07)
   Driver version:  4.40.0
   Configuration:   ./configure --host=x86_64-suse-linux-gnu --build=x86_64-suse-linux-gnu --program-prefix= --disable-dependency-tracking --prefix=/usr --exec-prefix=/usr --bindir=/usr/bin --sbindir=/usr/sbin --sysconfdir=/etc --datadir=/usr/share --includedir=/usr/include --libdir=/usr/lib64 --libexecdir=/usr/lib --localstatedir=/var --sharedstatedir=/var/lib --mandir=/usr/share/man --infodir=/usr/share/info --disable-dependency-tracking --enable-dmeventd --enable-cmdlib --enable-udev_rules --enable-udev_sync --with-udev-prefix=/usr/ --enable-selinux --enable-pkgconfig --with-usrlibdir=/usr/lib64 --with-usrsbindir=/usr/sbin --with-default-dm-run-dir=/run --with-tmpfilesdir=/usr/lib/tmpfiles.d --with-thin=internal --with-device-gid=6 --with-device-mode=0640 --with-device-uid=0 --with-dmeventd-path=/usr/sbin/dmeventd --with-thin-check=/usr/sbin/thin_check --with-thin-dump=/usr/sbin/thin_dump --with-thin-repair=/usr/sbin/thin_repair --enable-blkid_wiping --enable-lvmpolld --enable-rea
 ltime --with-cache=internal --with-default-locking-dir=/run/lock/lvm --with-default-pid-dir=/run --with-default-run-dir=/run/lvm --enable-fsadm --disable-silent-rules --enable-write_install --with-vdo=none
```

Installation with cmd: make install && dracut -f --add "lvm"

top 10 blame services
```
external_device_info_source = "none"
obtain_device_list_from_udev = 1
event_activation = 1
udev_sync = 1

sle15sp2-base40g:~ # systemd-analyze blame | head -n 10
      2min 4.515s lvm2-pvscan@135:720.service
      2min 4.332s lvm2-pvscan@135:704.service
      2min 3.162s lvm2-pvscan@8:768.service
      2min 2.168s lvm2-pvscan@135:672.service
      2min 2.166s lvm2-pvscan@135:688.service
     1min 55.275s lvm2-pvscan@130:688.service
     1min 52.541s lvm2-pvscan@135:656.service
     1min 52.483s lvm2-pvscan@135:640.service
     1min 51.066s lvm2-pvscan@128:688.service
     1min 51.065s lvm2-pvscan@128:704.service

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

*** compare with my previous test result. (list in below) ***

```
external_device_info_source = "none"
devices/obtain_device_list_from_udev=1
global/event_activation=1
activation/udev_sync=1

      2min 6.736s lvm2-pvscan@70:384.service
      2min 6.628s lvm2-pvscan@70:400.service
      2min 6.554s lvm2-pvscan@69:432.service
      2min 6.518s lvm2-pvscan@69:480.service
      2min 6.478s lvm2-pvscan@69:416.service
      2min 6.277s lvm2-pvscan@69:464.service
      2min 5.791s lvm2-pvscan@69:544.service

devices/obtain_device_list_from_udev=0
global/event_activation=1
activation/udev_sync=1

          34.908s dracut-initqueue.service
          25.440s systemd-udev-settle.service
          23.335s lvm2-pvscan@66:832.service
          23.335s lvm2-pvscan@65:976.service
          23.335s lvm2-pvscan@66:784.service
          23.335s lvm2-pvscan@65:816.service
          23.335s lvm2-pvscan@8:976.service
          23.327s lvm2-pvscan@66:864.service
          23.323s lvm2-pvscan@66:848.service
          23.316s lvm2-pvscan@65:800.service
```

Thanks
Heming

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

