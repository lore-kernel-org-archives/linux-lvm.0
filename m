Return-Path: <SRS0=ZiKk=GA=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2713C433DB
	for <linux-lvm@archiver.kernel.org>; Mon, 28 Dec 2020 08:36:46 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F316421D94
	for <linux-lvm@archiver.kernel.org>; Mon, 28 Dec 2020 08:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F316421D94
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-Mcb1R-0gPV-ksKaldMbnqg-1; Mon, 28 Dec 2020 03:36:42 -0500
X-MC-Unique: Mcb1R-0gPV-ksKaldMbnqg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD2CD803626;
	Mon, 28 Dec 2020 08:36:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D30906A8E5;
	Mon, 28 Dec 2020 08:36:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0EF9F1809C9F;
	Mon, 28 Dec 2020 08:36:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BS8a79b005657 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 28 Dec 2020 03:36:07 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id ACD9A9D496; Mon, 28 Dec 2020 08:36:07 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A5C227C2C
	for <linux-lvm@redhat.com>; Mon, 28 Dec 2020 08:36:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5ED53805BC3
	for <linux-lvm@redhat.com>; Mon, 28 Dec 2020 08:36:05 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [62.140.7.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-8-5EEaIhvrO366_IrbM8jsXg-1;
	Mon, 28 Dec 2020 03:36:00 -0500
X-MC-Unique: 5EEaIhvrO366_IrbM8jsXg-1
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
	(mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-32-O3dxInmhNKKwPdQN7GCuGg-1; Mon, 28 Dec 2020 09:35:58 +0100
X-MC-Unique: O3dxInmhNKKwPdQN7GCuGg-1
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
	DB8PR04MB6697.eurprd04.prod.outlook.com (2603:10a6:10:10b::33) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.3700.27; Mon, 28 Dec 2020 08:35:56 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::1c22:83d3:bc1e:6383]) by
	DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::1c22:83d3:bc1e:6383%4]) with mapi id 15.20.3700.031;
	Mon, 28 Dec 2020 08:35:56 +0000
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <5ecbb2ae-0378-1891-80d0-791a525f0ae2@suse.com>
Date: Mon, 28 Dec 2020 16:35:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.5.0
X-Originating-IP: [123.123.135.54]
X-ClientProxiedBy: HK2PR02CA0162.apcprd02.prod.outlook.com
	(2603:1096:201:1f::22) To DB7PR04MB4666.eurprd04.prod.outlook.com
	(2603:10a6:5:2b::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from c73.home (123.123.135.54) by
	HK2PR02CA0162.apcprd02.prod.outlook.com (2603:1096:201:1f::22)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27
	via Frontend Transport; Mon, 28 Dec 2020 08:35:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ac0140b-e12d-410f-df68-08d8ab0b9878
X-MS-TrafficTypeDiagnostic: DB8PR04MB6697:
X-Microsoft-Antispam-PRVS: <DB8PR04MB669727D1D30EE8B937165F1897D90@DB8PR04MB6697.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: bGv/udYLly721isb33c9ah4P+YmoPSZeluUDfLtKMQvRuwOgfJ5FaZeRvWgKvcUDoDq+BklKnwp5TgN9FtA5YCPjT2Q3DxyKUVqUskgn+ChijW+ysVKcLnHhOjUQw3ct/HALVqUaS2sFZ/X6p0R+w0DFRcHPIAzYPDgdb5tfil3DzlrNk8ERoCI+6PjOBFrmSYAQIAHGFJHj7rA/sbLyaOVJdsrur/IRxcLLu5PICAK633ISjKgONOg+iglGSho3vRQMi7nnLnjYiLUyxx2uX2W99I98vRSbICphhpOlckGu7B0v+VJOuXlIm/e4dKD3eKNOdJ1gh8IsnC5YYEPevWFytp93oYMeHXYR3OTptsLaFfGkd1Flgwu9aYkOSjXTDbGMn8/4Gzz9TvZQ+qX6G+SlfW+mSRlXSKw+bQCVXFXtPjiCtNW1xBQKHCIkb2iSItN7UwuPPipAmwA7VVIi5qaQchC6TnWAfY/VpVQa22GuWXFHUUB85WElVTcJfIQF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB7PR04MB4666.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(39860400002)(396003)(366004)(376002)(136003)(346002)(26005)(2616005)(66476007)(36756003)(478600001)(4744005)(956004)(86362001)(6486002)(66946007)(6916009)(6666004)(31696002)(316002)(52116002)(4326008)(8676002)(6506007)(8936002)(450100002)(186003)(8886007)(2906002)(6512007)(31686004)(5660300002)(66556008)(16526019)(54906003)(9126006)(45980500001)(43740500002);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WjR5c1Z3NzlFSkhPRW02Y1o5ZUZIZjZFQUVjOGFCRkpMR3F5M1RtcmtBOFBC?=
	=?utf-8?B?SlptL1BaSEhHWmt1UGx5UUFROTliSmpWdE9hK3M3cGh6Wk5kZDNRMEJ2Z0VB?=
	=?utf-8?B?Zm0yYmxDK2dlV2pPR0JXYVdtU2g2ZDFFZ1NpeExBVTVubHVqNHNzckJrTzBn?=
	=?utf-8?B?bWZwWFJGY21LK2p5MEtCcGVaY2JXRVUrSXdhNnVrMVcxRHNIZzQ4emgzWmtU?=
	=?utf-8?B?dnNRejFZa3FuOHgvb3RKaTRsanBCcWlXNUNNK2FwK1hFZHZza3F0YmVMaHBY?=
	=?utf-8?B?TklYMVBGQTJKeU83dkNhTTJaV3pRTXd1NW10b01VNXVveXduUjZ0R0xwRXVM?=
	=?utf-8?B?aWxRZ01ZaHMwaWhaNCs1MURHbW9ZU2hGRFFhM1huaXk0Yzk4WThKUzBVUm5K?=
	=?utf-8?B?Q1FYTVE0aGgxcWVMbXhhNXgxeGRHSnBOZnc3bGZIS3IzUkdIUzc1Z3FFSWN2?=
	=?utf-8?B?Z0RkbzArVDE5L0dtR1RQMGcrWndNUzhybk5hRVFuaktLbVpwU2JKWnlHbmRU?=
	=?utf-8?B?RERvZ3pDZVRmcVFSckF3V0h6T3cvNWh0MlF1ajFza1hhZUFzaksrY0FLWmxJ?=
	=?utf-8?B?YWVwV2FKeXFPTGNlbnB2NldOakNHVFNVWXora2tqK25iRFhEeHhZUE9Jd1B4?=
	=?utf-8?B?NEhpa2s3b0p4c3puNzI5QU0yYm1tbjJzNlYxZkxpalRJcDJXOHF1Ky9oUHlM?=
	=?utf-8?B?WDVNdVY5QzJ4MkFTN1ZuVk1wU2RpUXU4RTMrc0MxTFI4elhHNlJPL1JYVVJG?=
	=?utf-8?B?U1Q3RDJXYnpNOHNPZW9MVmdVTkhKRnlkaGNVR1lsUmgyMDZTMmlSby9nanpy?=
	=?utf-8?B?OU10VlZaYURZMmd1dXJkaEpnOFE0TzJycjFWZUdRTDA4UU5DcHpzT01lS0xs?=
	=?utf-8?B?L1hyU1M3L1ZMOWcwa2FLY0wwdEQ4Vk5LcWlGQXpiTUR5MHRMdndldkZuOVlr?=
	=?utf-8?B?MktIQVJaVndqWmF6NnRDdHJLNWhGTVYwS1NsQitJeW5hQ3lpcnBxTzBORnMx?=
	=?utf-8?B?YytReXBLZ3BjRUx3RmlTNDJEcTFRR0dpYmxBdUhoOS8rZC92ZUVKY2RFK0NP?=
	=?utf-8?B?WDVCdk5YWUswUG1JNDJSZ011NVFFaElHekVpbElPWnFPV2d0WHp0c09OdEVM?=
	=?utf-8?B?VzRZQUdBdUIzNzJDQVRXTkcyR0d0bVFDREorVXZwSFplN05wRzZYay96NEdG?=
	=?utf-8?B?dHFaZTZUM3ZWZXVUQk10UEgxcktMZUphSnBsZmNKTGRPb2NySC9LZmNkRW4x?=
	=?utf-8?B?TjBlaFZEeEFTMGFkejI5VVJkUjR6U21YYWJOdWY3YkhiRGdKUlg5V0xWQmxC?=
	=?utf-8?Q?adkJajlpL+x4I9PO1eRcpVizYVqwy4KcGy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2020 08:35:56.2411 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ac0140b-e12d-410f-df68-08d8ab0b9878
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cRk7fZ+2YF1a3CgmSZ15f4GaATu5lNRE2/Y8nP0Rnj+D+ADAn8sJHc+OIDLOhKB67UuJCBAo45BdKu6gmIvjng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6697
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-lvm@redhat.com
Cc: David Teigland <teigland@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>
Subject: [linux-lvm] discuss: about master branch vgcreate parameter
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

Hello,

On master branch, clvmd had been removed, the "-c | --clustered" is deprecated.

```
~> sudo vgcreate -c n vg1 /dev/sda
The clustered option is deprecated, see --shared.
Run `vgcreate --help' for more information.
~> echo $?
3
```

It looks the -c is useless, it only shows deprecated info and exit.
Is it possible to remove the -c from lvm code?

Thanks & Merry Christmas

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

