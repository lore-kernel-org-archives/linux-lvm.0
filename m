Return-Path: <SRS0=mJoT=IW=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E998BC433DB
	for <linux-lvm@archiver.kernel.org>; Wed, 24 Mar 2021 11:03:59 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5947A61494
	for <linux-lvm@archiver.kernel.org>; Wed, 24 Mar 2021 11:03:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5947A61494
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-_H0w3RDgM5yd-RtSjPjeKA-1; Wed, 24 Mar 2021 07:03:56 -0400
X-MC-Unique: _H0w3RDgM5yd-RtSjPjeKA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A62D0101AFA8;
	Wed, 24 Mar 2021 11:03:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A085694CD;
	Wed, 24 Mar 2021 11:03:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3356818095C9;
	Wed, 24 Mar 2021 11:03:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12OB3HVI028050 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 24 Mar 2021 07:03:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EDC551012C70; Wed, 24 Mar 2021 11:03:16 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E7C7F1012DA2
	for <linux-lvm@redhat.com>; Wed, 24 Mar 2021 11:03:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7440385A5B5
	for <linux-lvm@redhat.com>; Wed, 24 Mar 2021 11:03:14 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.109.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-572-TW6yx-4yOmaqHjy7bkdlsA-1;
	Wed, 24 Mar 2021 07:03:10 -0400
X-MC-Unique: TW6yx-4yOmaqHjy7bkdlsA-1
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-5-wbaslQSmMZWk2TcTheioPQ-1; Wed, 24 Mar 2021 12:03:07 +0100
X-MC-Unique: wbaslQSmMZWk2TcTheioPQ-1
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
	DB7PR04MB4729.eurprd04.prod.outlook.com (2603:10a6:10:21::32) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.3955.24; Wed, 24 Mar 2021 11:03:06 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::c5e3:4b14:8fc0:b393]) by
	DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::c5e3:4b14:8fc0:b393%4]) with mapi id 15.20.3955.027;
	Wed, 24 Mar 2021 11:03:06 +0000
To: Zdenek Kabelac <zkabelac@redhat.com>
References: <1616562549-25903-1-git-send-email-heming.zhao@suse.com>
	<147078353.43143.1616576860174.JavaMail.zimbra@redhat.com>
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <463197f9-1d6c-30ac-7bb8-2ea7e1833d9d@suse.com>
Date: Wed, 24 Mar 2021 19:02:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.8.0
In-Reply-To: <147078353.43143.1616576860174.JavaMail.zimbra@redhat.com>
X-Originating-IP: [123.123.132.137]
X-ClientProxiedBy: HK2PR0302CA0022.apcprd03.prod.outlook.com
	(2603:1096:202::32) To DB7PR04MB4666.eurprd04.prod.outlook.com
	(2603:10a6:5:2b::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from c73.home (123.123.132.137) by
	HK2PR0302CA0022.apcprd03.prod.outlook.com (2603:1096:202::32)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.14
	via Frontend Transport; Wed, 24 Mar 2021 11:03:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19df19d7-4910-4e73-458e-08d8eeb466af
X-MS-TrafficTypeDiagnostic: DB7PR04MB4729:
X-Microsoft-Antispam-PRVS: <DB7PR04MB472923DFB8DD1CCEDBC8C81D97639@DB7PR04MB4729.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: Ggypa6Wh48e9mdbkr07QUWqTLftdXv8MYtnAQA1c4U9DhzdagXmLmRvxdH5bmWgQCmIPPKKvz/qSKO+zTx5jqx6+x5SV9O9jLndeCJSRc3xXlHu7F6a7HnH1P4jmXYOpE6VjbzECKLaN3L9MakucQOEBXt2HuYfBULOI+QVr9OlnO87ebJGZ5sPNRA7j6wD6NaZJFy08HCsjdazzsc1SSLFe0PU/oiTqNHuwvADiHOp8mJ99uZUwW3FqatDtBV/N9cEWqNpgJ2EuCon54gV8FMcglswE+SsknE/hyI3+Rge8hvc+uaPG4X+inwtadxYPzBWbjmCuB+ZGBw+JMosgRdu5JIwgyI6sRkEu7daDJckv+MbCiCcdv6jOrWl9FMGg9yCR40fDDSErzEJ2xSWomwhCDZxaptP71J7BRNvSIhyiyRCtVBL6AXGZkr/QHDHbui5zok6tRcUfR3c4LwFST2FormoHngUidX8L9wgJ+8F7vFGCJK4MatSbvelGtZa7p3YlpMu9gHPEirJz8J5M05xaO4E7O3XtFPskStk2Z6gwOC8QQDvKoVk6I6UZV3p3DWssCemjB8P6t367IJBM/uClw+yfunMShRNPv56CpjDeVnV/N2RNfNYEIOK7fkcs6k9Ym+6hnPIlUdVcH5KAzcMR/Y8CyqxDAQHRBztQllDvqEa+GM5PRjdtGhQvxOF8LcBoQpyN9ghMrZqMQXGnn0xHqzD5hooH23r0dZIu1f0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB7PR04MB4666.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(346002)(136003)(376002)(39860400002)(396003)(366004)(186003)(450100002)(316002)(4326008)(66946007)(31686004)(16526019)(38100700001)(53546011)(66476007)(26005)(6506007)(2616005)(66556008)(36756003)(956004)(2906002)(83380400001)(31696002)(478600001)(86362001)(6486002)(6916009)(8886007)(8676002)(6512007)(5660300002)(8936002)(52116002)(6666004)(9126006)(43740500002)(45980500001);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?R0RRcTRSL3ZkZUZMbFlBVlZlcjBsbFdBZ0FNMnhNRUNGekhGS212bC83bkRS?=
	=?utf-8?B?bHpObXNva3pUTjZpZzlobmdTRXNPVUIwbVZkemNZMFA4SWhnODh5d05oK2l3?=
	=?utf-8?B?SWNWMGRPN2ZPNlR1NElRRWlzRE80MnhXeHZvcVdOQ3owSEZsTXNNUnFvS0tD?=
	=?utf-8?B?VWN5OStxYllvcVIzNmc1aW9YZHpiYUc3ZVplZ2pZamw2SnNxOHIxUjdYcElz?=
	=?utf-8?B?SURyZEM1L1ZCV3crQlVCVStSRGdlNmNhbUxYeEtHa1dlNnVBZWF2cGRBRE5x?=
	=?utf-8?B?TitzWFJ4bmhzTW5QcktGdVZldTRqbVp3V1FNTVJJMTNCQW9rMmk2UlVyc0Nz?=
	=?utf-8?B?UWhUMFNNMFEvSENCZ3RVYW5Ga1hlM2k0SytjdldFL3AxRnYvRXRrYkovUTh1?=
	=?utf-8?B?RU9vc0YvNDVzbEJhSlhLNlM2MXVCSXVqVFhGbWswdURNQStTQXl1MHJEYm04?=
	=?utf-8?B?c3NFd2RWK0x2VDUycm54aytiZDlVUENtZkNTdW5DWVVFazV5M0JBb0h4eWNy?=
	=?utf-8?B?dDU4WWJMT1VDWG8xRXljVmpzQjhmV041MFRSOU5QdGI2aWZmQkRrMmIzOHJl?=
	=?utf-8?B?anZOaTgrekVQd3IrUzgrTmlRbHRjVXczVHVwNHJIVFd4YWhOenVUSDBGa2c5?=
	=?utf-8?B?U3VPb0ZwNjNxYXoxQmNNd1NkNnFQazgzY3FEZThHYTNVcmFoVDFhSEM4N1lX?=
	=?utf-8?B?ckZiQ2x0UXBmZm9jM2xFYlRPYXk3cERTRHovRk5zUFNNZ2U0dXYrc1Y2ZHNV?=
	=?utf-8?B?Vzh4RWYxL05QZmMrQ05iWHAzeDBKczVDaWRnOENLZG91K05XSHpoWkQ1VCtN?=
	=?utf-8?B?dVcrQ3JZVGdIdnI2K2daUVRzNlo5UWpjeG1qc2JiMTkvQ2xoaWlPZ1RyYXM0?=
	=?utf-8?B?TXZYTkovRFVBL0V6OTcyUXZudFlxTDN5ZHBIZFNiU2tpaUpzRWZYR1VGdkYr?=
	=?utf-8?B?ZGJTc0dhS0RvblR2bm5haEtSZFB5R2grZTgrWW02TzlxYXlaZ25iQWFOMURT?=
	=?utf-8?B?Q2RvMjA4b2xTWGlnaTdldGRhNXpLbHF6RDc5OEZoOG5PVWE4VkxPM0FOQ2Q1?=
	=?utf-8?B?c0hyeHdoWXREMUFkN1hGRTAzWm9iSlNEWVN0aVkxMUhMeDkvcVFhaWtYTGoy?=
	=?utf-8?B?OEtNVUNYQmdXOWdsYTFMb0FUUGQxTS9xbnJQaDViTlNXZHJkVStOdmRzNlVT?=
	=?utf-8?B?Witad2VYUDBVejA3K2QyQVdMTzlZMEdvZjJjU1V0VVBOMTlkeTBwTHhQaUl3?=
	=?utf-8?B?bjF3ZUQrWHQ4aWZYUDd5NjE3dm9raFAzcm5IOVJCNnhDTnA3TEhqaEFnWDhF?=
	=?utf-8?B?eXUyV3RaTzhIQ2VJTnJpbFNpWDMyQm5yemtadXcrZW13dDFoL3VzblpRMzVy?=
	=?utf-8?B?S3VWMEFJcFJEWXIxTjVodXk3ZUZRb1ZiZGY3NFlzSE03L1pBMi9JeUhLNjJJ?=
	=?utf-8?B?ZE9YbDRLUit4SUpBemF6Y0pwY3paNS9XS3QvMmR4V1lpcmxjOW5SLytTMEJO?=
	=?utf-8?B?QmVCZnF6NTdCRmt5UlB1OTNubURuRWc0UmVQOHF1QjQwZ3hQbDFYS3JkZnBB?=
	=?utf-8?B?WGJsY29KQTZVUWpxWGdldWJEL0c0Y0FmdkV5UkJPL1d0TE03RGJ4L3VXTTVE?=
	=?utf-8?B?d2NXeW40Q0dlb3lWaXljbFdTcVBRUjk2RjZWMXhTRGd4SXdocUlxLzJVRTRh?=
	=?utf-8?B?aytQd20wVVFQRHZiaDIvVlpjTTE2U1paSFFTTm9TUmphM0pLc1ZidlhGTVBL?=
	=?utf-8?Q?7hG8jNVSbLW1uHonkDTGupxcM/s7+gFRsPF/WzU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19df19d7-4910-4e73-458e-08d8eeb466af
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 11:03:06.0539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: waEd/T4nSD3FuVKMi3X0/hs4hBTqKP1hI2ZkeZUTE5VIjCSK+fnpp5dkjJ/LKj/ncnDvnRlOUL2n24oZiz/DzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4729
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-lvm@redhat.com
Cc: teigland@redhat.com, linux-lvm@redhat.com
Subject: Re: [linux-lvm] [PATCH] [PATCH] stable-2.02 - lvresize: deny
 operation on swap dev without force option
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On 3/24/21 5:07 PM, Zdenek Kabelac wrote:
> 
> 
> ----- Original Message -----
> From: "Zhao Heming" <heming.zhao@suse.com>
> To: linux-lvm@redhat.com, zkabelac@redhat.com, teigland@redhat.com
> Cc: "Zhao Heming" <heming.zhao@suse.com>
> Sent: Wednesday, March 24, 2021 6:09:09 AM
> Subject: [PATCH] [PATCH] stable-2.02 - lvresize: deny operation on swap dev without force option
> 
> When lvmetad is active on system and some memory pages of lvmetad
> swapout, user may issue lvextend/lvresize on swap LV. The resize
> operation will suspend & resume swap device (by reload dm table).
> After suspended swap device, lvmetad will be in UN status for waiting
> swapin pages from suspended swap dev. lvmetad will hung, then
> lvresize will fail to conection to lvmetad. then the resize operation
> will fail, lvresize leaves suspended swap, the logic dead lock is
> happending.
> 
>   
> Hi
> 
> It seems there is something wrong elsewhere.
> There should be no contact to lvmetad while ANY devices are in suspend state.
> Maybe something got reshuffled into wrong place.
> 
> Can you please provide  'lvextend -vvvvv'  when it hangs ?
> 

I can't show your "-vvvvv", the issue was reported from one suse customer.
the syslog shows machine was running lvextend at the start time of lvmetad UN.
the machine running lvm2 version is 2.02.120. some code may different with latest stable-2.02 branch.
the machine became no response and triggered coredump later.

> There should be no contact to lvmetad while ANY devices are in suspend state.

lvextend promise itself doesn't need to contact lvmetad. and if my understanding is correct,
critical_section_inc() is only process internal protection. if another lvm2 cmd calling
lvmetad when lvextend executing, the story will happen on my way.

(in my opinion) the flow:
1. lvmetad some page swapped out
2. lvextend was running, swap device was suspended successfully. (enter critical section)
3. lvmetad kept running (by whatever calling)
4. lvmetad need to swap in some pages but swap device suspended. lvmetad status become UN.
5. the lvextend resumed suspended swap device but failed.
    I guess lvmetad UN may trigger/block kernel dm layer failed to resume. I can't find log/info
    to show the reason of resume failed. From the coredump, lvmetad stacks show lvmetad in
    UN state, and swap status is suspended (dm dev with flags: DMF_BLOCK_IO_FOR_SUSPEND, DMF_SUSPENDED).

Thanks,
heming

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

