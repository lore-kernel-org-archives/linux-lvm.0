Return-Path: <SRS0=Xehm=GC=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A92C433DB
	for <linux-lvm@archiver.kernel.org>; Wed, 30 Dec 2020 04:54:38 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F321207AF
	for <linux-lvm@archiver.kernel.org>; Wed, 30 Dec 2020 04:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F321207AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-WTJZpkCGPGyZjp6wv48aVA-1; Tue, 29 Dec 2020 23:54:34 -0500
X-MC-Unique: WTJZpkCGPGyZjp6wv48aVA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D00FD801817;
	Wed, 30 Dec 2020 04:54:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA9BD5D762;
	Wed, 30 Dec 2020 04:54:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6C6B35002C;
	Wed, 30 Dec 2020 04:54:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BU4q7Px022758 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 29 Dec 2020 23:52:07 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5962C2026D14; Wed, 30 Dec 2020 04:52:07 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 53B3F2026D49
	for <linux-lvm@redhat.com>; Wed, 30 Dec 2020 04:52:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDCF8101A53F
	for <linux-lvm@redhat.com>; Wed, 30 Dec 2020 04:52:04 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [62.140.7.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-366-H2cWCS6kMxqndDaJQskEtg-1;
	Tue, 29 Dec 2020 23:52:02 -0500
X-MC-Unique: H2cWCS6kMxqndDaJQskEtg-1
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
	(mail-am5eur03lp2050.outbound.protection.outlook.com [104.47.8.50])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-12-aMBZ2PIzO3uVGrqGiahI7w-1; Wed, 30 Dec 2020 05:51:59 +0100
X-MC-Unique: aMBZ2PIzO3uVGrqGiahI7w-1
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
	DB8PR04MB5820.eurprd04.prod.outlook.com (2603:10a6:10:ae::18) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.3721.20; Wed, 30 Dec 2020 04:51:58 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::1c22:83d3:bc1e:6383]) by
	DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::1c22:83d3:bc1e:6383%4]) with mapi id 15.20.3700.031;
	Wed, 30 Dec 2020 04:51:58 +0000
To: Zdenek Kabelac <zkabelac@redhat.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
References: <5ecbb2ae-0378-1891-80d0-791a525f0ae2@suse.com>
	<ef6aad1d-4041-2e4d-846d-00ca2f60662b@redhat.com>
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <d8e7c3bf-7c9b-75a8-938d-59a598553fd2@suse.com>
Date: Wed, 30 Dec 2020 12:51:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.5.0
In-Reply-To: <ef6aad1d-4041-2e4d-846d-00ca2f60662b@redhat.com>
X-Originating-IP: [123.123.131.237]
X-ClientProxiedBy: HK2PR02CA0152.apcprd02.prod.outlook.com
	(2603:1096:201:1f::12) To DB7PR04MB4666.eurprd04.prod.outlook.com
	(2603:10a6:5:2b::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from c73.home (123.123.131.237) by
	HK2PR02CA0152.apcprd02.prod.outlook.com (2603:1096:201:1f::12)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19
	via Frontend Transport; Wed, 30 Dec 2020 04:51:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 295ed969-6bfd-4ff0-d46e-08d8ac7ea363
X-MS-TrafficTypeDiagnostic: DB8PR04MB5820:
X-Microsoft-Antispam-PRVS: <DB8PR04MB5820A0EF9B58EBC7B7A2728197D70@DB8PR04MB5820.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: Y9LZFOL5xhClNy6P/bIbh2vq1+8InLoMNgBeRem8Lo4UacQsHnAP26TOZINpuVUBjy5uju7fVHB9UvXl3j9W9OTBPthlWP1utqop0GBgeJqlE6CEbcd97jzKPalWizT8hfOYNodzndU8EjHVp4V1fEYjtqQ7aSCATj8+3/HZgYXiZJ4/5MwZy8Nhp/7uzp+Dv65wNiLWIhcQZDKOMOwegWnLve+h4qv6BQFvudJBuneZZ9v1DoU4UJCTxiM0VBmqEk6Cv/IP0Rrey2yECT2ocjP0Oaa+NRKI9bWkAtLSWpiHOP8i7arcLFKjonS1e/jG5EQZbnbuRF+MqUbDguOExbvyAlPzh+xdRHRor+OerLnO6DYM8F/QumBUXgv2ohA48CFTg+sstuGqgpgb/X4kI3O1HPC/q9NKcCuG3c8+60gEBxsom6InGNvrhF4VdEWNj33ylAVNDGJcvQzG3g8i8iA/02SF9w3nNFvqd3EPhEzrOK63pfcqCHVeNpEY55Fa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB7PR04MB4666.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(376002)(136003)(346002)(39850400004)(396003)(450100002)(66946007)(66476007)(83380400001)(66556008)(6666004)(36756003)(478600001)(6486002)(6512007)(31686004)(5660300002)(26005)(16526019)(186003)(31696002)(52116002)(316002)(6506007)(53546011)(110136005)(86362001)(2616005)(8886007)(8936002)(2906002)(956004)(8676002)(9126006)(45980500001)(43740500002);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RC9WQXhBRDJid3Vkd0NHeWRyejlKTENuT0ZGT2ZNWFRxUStRaklzb1VHRVdD?=
	=?utf-8?B?WnE5MU1weE5ubk5reElXWnBHOXF2TVVkREJnQVZ1dXVyTkNIdis3SmpYYmJC?=
	=?utf-8?B?azQwN3hCUC9oczZTYnhJcWVURGJWYzJrZ3p6Q3VQV1FISFYrY1krVG9QdGVk?=
	=?utf-8?B?ZHdYUXdjOEFnQXVwZXJpbWUrUG8zVlk2SUFDNmExKytDZ1dxb2ZheWkwc3g5?=
	=?utf-8?B?RXZjRzNZOExZa0piL3VCOVlYNlNxN2VZYmhFR1BRTlgzaElUaXZlL1Z2SG1J?=
	=?utf-8?B?TkRsaitTZnFJOFRvSFAxKzQyMEZKc05VSDFPWVNnNWlULzcrTWFwdVlmTXZt?=
	=?utf-8?B?ZE83eE9CYS8vZUtCQWF3TGhGL2JtNWVCS3p6Njhkc09aZDdCTXRDTjlSSnYx?=
	=?utf-8?B?YmpNWkdURmNkdXdjOEw1Q2RRdTZNUFNIZkQ0NlI2dTROSXYzQTJxSmZudGd5?=
	=?utf-8?B?ZHZYbnlSRjNpNHFLNWJEZHlnb2ZhUjNia0ZWK1dsWlBPUEhTdUl1dVhnSGhS?=
	=?utf-8?B?azR0QlFGM1hCcEVzNjBKd1Y1dTlJU3RQbTlOYStlQ2QreERMVjQrbzdjeXZZ?=
	=?utf-8?B?cGtUNUlaNk5QVDNSOHFyRUJSUm5DaFJ0U0hnellKUnBTYkYvVDB5V0ovUGpV?=
	=?utf-8?B?M2MyUVRVWWxTTmkvRXJFYnRUQVRXM0pRUnZrbVlBUVZoRVlqQkpjYzBVZnFi?=
	=?utf-8?B?UEZ5MVhVaHVZdGlxeFQwY29ZS21uM3duSWNvTHIrbFRYRHR5cG9pb0JOTU5p?=
	=?utf-8?B?b0ZzQi9iZEpnWmJ6QS9HNkYrWk0yTThLVUJRNzNNMGlTZVYvREs4MmluODhM?=
	=?utf-8?B?VEtjMHRxNEdzWllNSGx6Z0RKS2lDbW5TVWZ0M0pmRVliQnpFa094UTd6aEcy?=
	=?utf-8?B?dmNnSzNBOTNkaVBqODNHL3JocS92dkkwOFd2aDdGOUQ4RjlmK3o3YjZFbU53?=
	=?utf-8?B?VjlaVFpBaEFsWElPUDhOZ1ZSTHNSTWNBaWtOTkdCWXp5QmFhNHllcDk4RjdJ?=
	=?utf-8?B?YkVoNlQrTmtQcGtsTjRrYjZNdnh0YXI3aDMxTzE3U0hBeWFSbHRtZ3FWVkw0?=
	=?utf-8?B?TStqSm1WN1Mvazg3KytVeDNhVHF4cjhmcmRrd0ZPbndDK21EVXZLaXVBNEQw?=
	=?utf-8?B?bHVlVVVCQnNkTVJ6KzJKYmZEK1dQK01QZ0w4R3hZTXFqQTBOOGtZSGM5TXNQ?=
	=?utf-8?B?ZDBzODh1dVFITU45bkdKeE5odmh2UFlGN2xjSngzMEpZeDRmV09XNU1iV3Y4?=
	=?utf-8?B?MjloNDhSYmlINXJIeWhGQzNPYXVTTlczTm82UEZhcXlvRW5XV3dWa0hLdTFQ?=
	=?utf-8?Q?usz1WV2EXmugsxWyKjdVgXj4j53PUXABfU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2020 04:51:57.8912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-Network-Message-Id: 295ed969-6bfd-4ff0-d46e-08d8ac7ea363
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ztbUpB0sUiSs9tq+Y9vn/9O3dGYhcTEmvy5ouxE8CrYxISrKqdZZI3isNHl08qa0/26psYBcWQXFN6goOWZWcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5820
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-lvm@redhat.com
Subject: Re: [linux-lvm] discuss: about master branch vgcreate parameter
	"--clustered"
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On 12/30/20 3:03 AM, Zdenek Kabelac wrote:
> Dne 28. 12. 20 v 9:35 heming.zhao@suse.com napsal(a):
>> Hello,
>>
>> On master branch, clvmd had been removed, the "-c | --clustered" is deprecated.
>>
>> ```
>> ~> sudo vgcreate -c n vg1 /dev/sda
>> The clustered option is deprecated, see --shared.
>> Run `vgcreate --help' for more information.
>> ~> echo $?
>> 3
>> ```
>>
>> It looks the -c is useless, it only shows deprecated info and exit.
>> Is it possible to remove the -c from lvm code?
>>
> 
> 
> Command keeps this option for backward compatibility.
> So when the option is no longer supported - it should print the 'old usage'
> was replaced with something else.
> 
> I don't quite understand why would you want to remove this logic
> since we would report 'Invalid argument' anyway?
> 
> Zdenek
> 

Before sending pervious mail, I had checked related code, and totally understood
this option for backward compatibility.
 From my perspective, both keep and drop this parameter are acceptable.

This topic is derived from suse's customer report.
They ran "vgcreate -c n", and got failed result. With normally thinking, the "-c y" should
report deprecated info, the "-c n" should run successfully.
(It is a little wield to see this deprecated info for new lvm users.)
And a optional way: lvm remove this option and keep the deprecated info in manpage.
e.g. in vgcreate manpage, to move --cluster option into DESCRIPTION section.

Anyway, if you think this topic is boring/no-sense, let's close this topic.

Thanks.

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

