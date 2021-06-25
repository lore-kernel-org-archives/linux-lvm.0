Return-Path: <SRS0=uSn1=LT=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78384C2B9F4
	for <linux-lvm@archiver.kernel.org>; Fri, 25 Jun 2021 05:29:33 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11FF860FEB
	for <linux-lvm@archiver.kernel.org>; Fri, 25 Jun 2021 05:29:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11FF860FEB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-V9MNuB34Pf2E_tJkYJl_TQ-1; Fri, 25 Jun 2021 01:29:29 -0400
X-MC-Unique: V9MNuB34Pf2E_tJkYJl_TQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D30C362F9;
	Fri, 25 Jun 2021 05:29:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 10F36369A;
	Fri, 25 Jun 2021 05:29:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8C5441809C99;
	Fri, 25 Jun 2021 05:29:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15P5SxcU004380 for <linux-lvm@listman.util.phx.redhat.com>;
	Fri, 25 Jun 2021 01:29:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D262A117A955; Fri, 25 Jun 2021 05:28:59 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD643117A952
	for <linux-lvm@redhat.com>; Fri, 25 Jun 2021 05:28:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0027800B28
	for <linux-lvm@redhat.com>; Fri, 25 Jun 2021 05:28:56 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.109.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-552-Srb40R70NVKiH5XNqa-hLQ-1;
	Fri, 25 Jun 2021 01:28:54 -0400
X-MC-Unique: Srb40R70NVKiH5XNqa-hLQ-1
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
	(mail-db8eur05lp2109.outbound.protection.outlook.com [104.47.17.109])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-15-rARB1jyBMFiyG_YbmQux_A-1; Fri, 25 Jun 2021 07:28:52 +0200
X-MC-Unique: rARB1jyBMFiyG_YbmQux_A-1
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
	DB9PR04MB8075.eurprd04.prod.outlook.com (2603:10a6:10:25d::10) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.4264.20; Fri, 25 Jun 2021 05:28:51 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::d9ad:152e:66d6:b880]) by
	DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::d9ad:152e:66d6:b880%3]) with mapi id 15.20.4264.023;
	Fri, 25 Jun 2021 05:28:51 +0000
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
To: LVM general discussion and development <linux-lvm@redhat.com>,
	Zdenek Kabelac <zkabelac@redhat.com>, David Teigland <teigland@redhat.com>
Message-ID: <ba88aa20-e176-0a07-5578-20afb39e0950@suse.com>
Date: Fri, 25 Jun 2021 13:28:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.11.0
X-Originating-IP: [123.123.129.130]
X-ClientProxiedBy: HK2P15301CA0004.APCP153.PROD.OUTLOOK.COM
	(2603:1096:202:1::14) To DB7PR04MB4666.eurprd04.prod.outlook.com
	(2603:10a6:5:2b::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from c73.home (123.123.129.130) by
	HK2P15301CA0004.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::14)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.6
	via Frontend Transport; Fri, 25 Jun 2021 05:28:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7287bee-6e50-444b-f516-08d9379a1d7b
X-MS-TrafficTypeDiagnostic: DB9PR04MB8075:
X-Microsoft-Antispam-PRVS: <DB9PR04MB807562F620979A921CE681B997069@DB9PR04MB8075.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: VSAYas9w2koZCE6yFyTi/hnLl9w8rvlEDrs8TqoMESfZ/RKOuZoOtCuqxxCZXtFNoz6L/qh25ccogXVQdaOXAD8psgo29DsKA8DlR7yhxVB2f4gDvLugOe3Nb3yw3iMBtCtHk5tzaf1TUTJFf8TW76yr27Zklc8H0V6kLKBNZRd9ng9xBQ1oqzY1elYlnKIk1VEi4fPtDypl1g2uqxLL9Yivz2GG/Mj4diNjE52a+CyuhzK3O5/83AiMisuTxWJf6NFgsF0XTMBuRWWvLRIObHfG8L49I9bgmG+UjOwZRv9huo6XWJpmKjtnJL63eFTU+8xAHfFbZt5XqPFrWIqD1VMO/5I5VDveiyfr/R8Ti+U5wbCAuc82VPgemKP6ZrKsLD3vpCYFa3KXGFXhYlY87GDs1f0tcXPHmIe+bRJAYM4rj6QPqt4c17CUJCNMmYl2gw9ULShZB25/RIPXoDyG1SNBFqbWzX8LhmlIDfIamBCgKpp1P99W6kqzE6Utm4VAU94U5PeB850mTenO8QPh6RrPM+gxgAcQjmvjJEstctuBj0mht0jY/WxkjWgigXkKJhXuHGDG77ccLTPhNBRc1yx7sWoafj/KrV2OQxiPtoP+JyZUdLcwEi1TAmLzWpstEpB+qiTz1IdBySiAPW2gioAqXdWqaEBlBxJijyUea82icxEdanqNiDFl4pPmPj65RhrBvwNRGMDGk2mwggY48aerdc02J+/NTRdGzKcz5NulDwgfpkrB64rpuFfIP0yXey5eoLK0FW3xmZ3L13oFb0sZ2HVgh8Zu+a3bjlJFW5f7XK/YYRf/btE3dleAK9/bueNfUfPOl4e8lgRCJEDZhw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB7PR04MB4666.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(39850400004)(346002)(396003)(136003)(366004)(376002)(16526019)(966005)(26005)(186003)(8886007)(4744005)(5660300002)(6666004)(6506007)(478600001)(8936002)(450100002)(316002)(2906002)(31686004)(2616005)(8676002)(956004)(38100700002)(110136005)(36756003)(86362001)(31696002)(6486002)(66556008)(66946007)(66476007)(6512007)(9126006)(45980500001)(43740500002);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1lmM1JueUkwL0xhYmdYNEEzNTdMdHRWY2FqVk0zMGc4NzJFSTZsanczcUcy?=
	=?utf-8?B?WTcvVGowdHdhV29ETmdFWHVZVDgwTkx6VENXWHZYelIvM0swODc4NW4xOUdX?=
	=?utf-8?B?ZEdQdlQ4VlhlV1BPQlNOR0hScnZhK2hZTjhNMTNBNm9UNi8zTkFZWDFEb056?=
	=?utf-8?B?STZSUlBmeTdzSWUwUWFVeFdxcHFpWVc1NUZaUFNUbitFNWg5TE5vT2paMVFF?=
	=?utf-8?B?ZFNQMVFrTXNMeVpxWm9LNGpSVWliODNBcUduQnFDWjBJOW5EYk04V0hhZEtp?=
	=?utf-8?B?OXlBTVVhUlBrTTVmRFFVNklWWXVMakJtUFgzeXR6Z3h2bW5SRkhueGRDM2x6?=
	=?utf-8?B?dTRsc0lQamVuMXYzVlA4QmJHczBqeEdIUGMyRHdieGIrdERpRkpqN2o1MHpv?=
	=?utf-8?B?aFFUcHp6R05PemZnb2UxaUs3OVJ0bHN4cndzWnQ2SzB2TWtCUG5uMk45S0Fs?=
	=?utf-8?B?MGVkallPV284YytZd1AyL1M5R0MxWVpjQmFDWlNRVXlyWmZiVTVZOUN6YWI2?=
	=?utf-8?B?QTUxdXJjSnJUbHA5L05qOEU4Y3N6ZmpUVm5tV2NaWE9FZUlrTHJNUTZWdjFE?=
	=?utf-8?B?MHYzR05Pd0xwakRZVWNSZnVjY0F5VkhlM2dhcjM0UW5BNjg0bFd2ZmVSSUl0?=
	=?utf-8?B?eEg1UzErSlZmTTI3bmVOU3R4TFY0NTMvNlFqNVJsZ2xITkttd05XL2czTzlQ?=
	=?utf-8?B?aXMvdzZZSkl3dHUveG1FTCt3N3RyeUVQNGV5RTQ3S1NwdFd4T3ZVSzNPM0Zk?=
	=?utf-8?B?bUtrcW1WUWpSU25WSTh5bHZhbS9tdHpvbkMwd3dmNU1RNXl0STZXY1phQ2Zz?=
	=?utf-8?B?QU5kL085ZDAvc1lxZlhUY21wTFFHVmZaRm1uWWtMaGtzM1dlQUdLWVpTOUVC?=
	=?utf-8?B?b1YveGFDdld3NlhnWStGeGUxcHNsTFAvK2d6RDFxaU4zdmdNWHNrUFpKakhj?=
	=?utf-8?B?UVEwbVdFRmFnZkg1bU1VNU5aRzJDTzZxWDk3UjVPVlVhS1B3SnB2OHMyN243?=
	=?utf-8?B?aFBvRXpUZ3ZQMEVVZmpFOVhaMzAvbWhuMTBwUUcwbDZXS1ZNY1hkM01EeTZI?=
	=?utf-8?B?T255ZWJKUDc1REI2Y1cyM3BOQ1JzNkZnOTB4RVJtVnQ2UTZBeE5wY0RPdjdx?=
	=?utf-8?B?L09oalRWSlFaNTZYWUxhWXFTV0p2YjFoRE1kcUNoYWhtMlUwdmw0cDJLMnlj?=
	=?utf-8?B?N0VKbk9wNGtpOG5wcjhUWGpRK21GaGJGdFhaZktWZDJUQnY5Q0pIdmJraGpW?=
	=?utf-8?B?aGFLb0N0SlhuQmFRNTZUR3NNMUczSmNkMnk1TnI3OTdMblBGZWZOZnZQTDkw?=
	=?utf-8?B?QXptelAvUC9LVm01Kys1RHVjZUpiSEhqYzFzbzZ0NG5GbjBwVzFPN3BRU3p3?=
	=?utf-8?B?ZHVUMjlyMkV5SjRad0xJMDZQVkxlZXhCZWlGRjZOK2ZOcFVvQ0hidWlBcUhs?=
	=?utf-8?B?VzNGdURsUUhjb1pyY0VWNG0yZ0dhaU1YT0xGajNpcG9yb1dpOEt3czZvMVQ5?=
	=?utf-8?B?VmdUZG1LQ0xZb1oyTUpEaHNaQjZWMDhQY29GSEhaQ3FDL2RPNlhFSFdNSFVE?=
	=?utf-8?B?SEd3b2tZT05qQmNFZmFsZk9DOE84ZTUyZExyVlZPdlRLUFFWc2pLZW9qLzNa?=
	=?utf-8?B?Si9udm5KZUEzS1RMSW9kajFrZm9hTEJQZzVUOG9zeDlwVjJJYXdqZm5JTW1Z?=
	=?utf-8?B?ZUJrcW9hY01nakp2dmdNYTBKTjVFNGpNZzk3ZWRMS2crMUtIeU5sNVIvaTR2?=
	=?utf-8?Q?2M2RGzJvO5DP7LTtxA6Ds3ep3JLhXRD4Ln0Axyh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7287bee-6e50-444b-f516-08d9379a1d7b
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 05:28:51.0019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c0k+EH3mGWqvymAV5iDYIVvJ3y4h5H2Rws3mxnjHZem1AwG8WzJ4aa1BCKeVQOYcH+X3O/X80vN2jF/SRWzIMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8075
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
Subject: [linux-lvm] Does LVM have any plan/schedule to support btrfs in
	fsadm
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Hello Zdenek & David,

 From URL: https://fedoraproject.org/wiki/Btrfs
The btrfs becomes default filesystem for desktops.

Do we have any plan to add btrfs code for scripts/fsadm.sh?

If the answer is yes. I could share a suse special patch, this patch
had been run about 4 years in suse products.

Thanks,
Heming

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

