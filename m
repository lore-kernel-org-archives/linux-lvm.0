Return-Path: <SRS0=LwB/=L7=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDC32C07E96
	for <linux-lvm@archiver.kernel.org>; Wed,  7 Jul 2021 03:21:02 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C8DF61CB2
	for <linux-lvm@archiver.kernel.org>; Wed,  7 Jul 2021 03:21:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C8DF61CB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-wq_o65wQMwGcn3e3EVaqmw-1; Tue, 06 Jul 2021 23:20:59 -0400
X-MC-Unique: wq_o65wQMwGcn3e3EVaqmw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3564A1966320;
	Wed,  7 Jul 2021 03:20:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0677460CC9;
	Wed,  7 Jul 2021 03:20:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6540F1809C99;
	Wed,  7 Jul 2021 03:20:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1673KXCg013782 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 6 Jul 2021 23:20:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 70D652138BA1; Wed,  7 Jul 2021 03:20:33 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B8FB2138BA0
	for <linux-lvm@redhat.com>; Wed,  7 Jul 2021 03:20:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8FAB1108C0ED
	for <linux-lvm@redhat.com>; Wed,  7 Jul 2021 03:20:30 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.111.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-109-cDALzExaN2qvKcT5L4jbZw-1;
	Tue, 06 Jul 2021 23:20:28 -0400
X-MC-Unique: cDALzExaN2qvKcT5L4jbZw-1
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-ve1eur01lp2051.outbound.protection.outlook.com [104.47.1.51])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-2-og0X2kwWOemUR0y-MOQyUQ-1; Wed, 07 Jul 2021 05:20:26 +0200
X-MC-Unique: og0X2kwWOemUR0y-MOQyUQ-1
Received: from AM0PR04MB6529.eurprd04.prod.outlook.com (2603:10a6:208:16f::21)
	by AM8PR04MB7377.eurprd04.prod.outlook.com (2603:10a6:20b:1de::6)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19;
	Wed, 7 Jul 2021 03:20:25 +0000
Received: from AM0PR04MB6529.eurprd04.prod.outlook.com
	([fe80::904c:ed81:6580:299d]) by
	AM0PR04MB6529.eurprd04.prod.outlook.com
	([fe80::904c:ed81:6580:299d%6]) with mapi id 15.20.4287.033;
	Wed, 7 Jul 2021 03:20:25 +0000
To: linux-lvm@redhat.com
From: Zhong Lidong <lidong.zhong@suse.com>
Message-ID: <501f846a-1d6e-e335-916a-288ab009e38e@suse.com>
Date: Wed, 7 Jul 2021 11:20:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.10.0
X-ClientProxiedBy: PR1P264CA0003.FRAP264.PROD.OUTLOOK.COM
	(2603:10a6:102:19e::8) To AM0PR04MB6529.eurprd04.prod.outlook.com
	(2603:10a6:208:16f::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from l3-laptop.suse (39.71.39.70) by
	PR1P264CA0003.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19e::8)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19
	via Frontend Transport; Wed, 7 Jul 2021 03:20:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0de0dd32-dc06-4125-f99e-08d940f6294d
X-MS-TrafficTypeDiagnostic: AM8PR04MB7377:
X-Microsoft-Antispam-PRVS: <AM8PR04MB737778ED61EC9AF4955AA3BBF81A9@AM8PR04MB7377.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: 04qzLxGdXJJEwbF/O5doRex/h0ge1oJiJtlNJjzdjg/LDX0ewMr6B52L6cZzKcEKDkpOrLtIm5MtSkHJtchlXYS0b29VW4ZZztQnhwfNt88BKjm9IbwANrbGylxlSmN4C1lSZ7iurPrJfAMThqelFjN+zaY7q0YiZ4rLW2UVW9oFVT56IaHaRZrDNPURUmzqz+qHpkxF1Um7Ij/rEGQr61Qz/14vjkWO9H6Z09q1OXcoE4sHCTrsTV3NwbY0FP12UObger4ewsIKR9yQZm4m10/jLge+hQlYOqipLp1NAN+Ypwx+My0VXerga7bRSt34K3BMEAg27aQT1pLVM/SR42P5C/Bmr3z2pQDNoN0LbLsxKZtnwO6Ob4sUZ33nNkA4jL+KbnYmEKb4OIQ+joNggtP+zOnhvPFWoK2RdHWYzNGiySNO49FTNqYrJGH+ykPN/5Q2ii9c8dY/y1GrLUbhboUBiy8EhsIiEHLj1qU3MiCYhKUr76kZA7MW6yLuOc1iWbrSsr+RYmOtOxvY4qy9UcJqhrPQBHLXr2iUcIXFqak3YAM6TM27CaDNK3vp0n/6iIbrKXNAiNICzEGbZLO3MDBTwRk/rlJDaLWqcBTDprBllT2N1n6bOaLOGeAHV/LLgOj5tFdhDK77e3ayC4LxYYf/XN2nwiApETJnh9v6vz/7uJfwebqKYQrvxYsvAv2CExhfDWpkx6V+/0Pe85hJj3F2yEkkoBQU+du4DSzVsUc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:AM0PR04MB6529.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(396003)(39850400004)(346002)(376002)(136003)(366004)(66476007)(66946007)(8936002)(66556008)(186003)(83380400001)(86362001)(5660300002)(8886007)(2616005)(956004)(2906002)(36756003)(31696002)(26005)(6486002)(38100700002)(316002)(31686004)(6512007)(8676002)(6506007)(478600001)(6916009)(43740500002)(45980500001);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?zHw+h6RZEDYJBU3rzGnew0G6yCTPHJueW2a3g0g+FidY3ueE3DMMEgNg?=
	=?Windows-1252?Q?NY5QU+MO66rQ5/wO+MLq8skkdsAuywHM7JAH/4MLWa1rXogxiwzu6rp9?=
	=?Windows-1252?Q?8R6byOiYYYt5TFDMYht1vPdrmUC+dvQRnM+JMW+han5eF+f/cJMueu4f?=
	=?Windows-1252?Q?OUiCmTxheQ0miIqSj4c6SgLriLjZe/lDt0RrFHYrlBRGPpkK5M1xXUd4?=
	=?Windows-1252?Q?sCcPrOTRyBY2SEG92pZiW9EfB6AsXqSGIRv1bJFYL2QyT0h1szDqKf77?=
	=?Windows-1252?Q?rRxn9rZlqXGnFdKnNX+GijhGbfSAvy2fQSPOJPz9suLR1HjViFO5kOzj?=
	=?Windows-1252?Q?sAu22jwQBKY30YFapNBIUcg3JmPpIAVlJU6cZQDi54/FurnoaXgCvdZf?=
	=?Windows-1252?Q?AZ6EZH4MMbRpYZXwoWeu7zvGkxQKhf0LyPI6oEQJxJdtP8zMc+0xXkcD?=
	=?Windows-1252?Q?UIxNGmpQG/EP9klkdBl3EJ7xr4V/GyUFwy2hC0lHRlGHZVT/Mma8wl/Q?=
	=?Windows-1252?Q?4cjTsEVQz0QvBfqPwXHrWT49hx3VmYc3gRx5ij7w97PX/ngM0YI4Rr/e?=
	=?Windows-1252?Q?A6IIk0A8dJVDVMzSDh/ZzAkKgfvU81tF4oCHWfweswaBgbzAIl6Oh2qw?=
	=?Windows-1252?Q?fAvhueItt0xFAEX9JxTvrzYoz2oHS82jRDwfyz3XXXpk33L/2MG/4INf?=
	=?Windows-1252?Q?AuBv2IF3Wc3g9A0wH/0lE0593XpJ31yHbsr4cHGA40VZdP9Hf2idb0UG?=
	=?Windows-1252?Q?6vzRDkhq0dWI4Ekbl/wsUd7mAIEzXTW1YFc2SbL/lQz2wQoVvAlYllOX?=
	=?Windows-1252?Q?kOh9AICioooVQWW2v3n9NMls4QDUFYkdKUq8eDi3wQphSD3UNR5JWtwC?=
	=?Windows-1252?Q?joc3T3MFHGaEkms7netspZt0d0qdOKwWw5/kM0TWRoNoSWKgC9kom+z1?=
	=?Windows-1252?Q?IQ8rTSKAjqfNX3YPVHcXh0MuxrtC4xJ/7+qz3JXYGt5s0ruW1HhTri/b?=
	=?Windows-1252?Q?wOxaWpUyToOWXZ2f3bCpECjlonSOIAVr4lgvF2BgEO0FW69uLRtxgHwQ?=
	=?Windows-1252?Q?DlFiE5OQQtf895J6Omj2Ry/sQ7+gGg+vHKj4Std6zl0uVRJ+NCflpbew?=
	=?Windows-1252?Q?m3XmTx03FazZtEEcUuNYJ2A1oxn6zZHzjI9KVO04s6V/r8q2x9I7AVLv?=
	=?Windows-1252?Q?lZUmXJEBtEsdJBllHU7MZnx1woqVq1T2fiwK/+nAiBSaIxyhF73Sau80?=
	=?Windows-1252?Q?5NC3HMfjo1N+iKcE6aLBmIkc6xjG+qpQcI4VPY8iB/OmgDAw9zCsnRPM?=
	=?Windows-1252?Q?h7QmNrkfS0/FqVBKTrOOBLFrirTCRwOpHjlTFlVGokaJQHYcF1u7Itdl?=
	=?Windows-1252?Q?KqMbqE7mKNb74iyV6+7Fic4GyBrHu+uW3zZWxSkvCWGDK+mf0The0Du7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0de0dd32-dc06-4125-f99e-08d940f6294d
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6529.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 03:20:25.0463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y5v4mgd0UbDba4XqmGtQL8FMw3b9HaVaf2MvKMFJUk0sdTR9gAEovU1Alw8kl8evAzN0xF6GvanYYdyK2S5FQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7377
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-lvm@redhat.com
Subject: [linux-lvm] [RFC PATCH] lvconvert: fix the size of log device when
 converting from linear to mirror
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When converting a large linear device to mirror with --stripes parameter

in lvconvert command, it will report the following error:



ioctl/libdm-iface.c:1895    device-mapper: reload ioctl on  (254:0)
failed: Invalid argument



and the related kernel messages:



kernel: [ 2290.698171] device-mapper: dirty region log: log device 254:1
too small: need 7078912 bytes

kernel: [ 2290.698248] device-mapper: table: 254:0: mirror: Error
creating mirror dirty log

kernel: [ 2290.698251] device-mapper: ioctl: error adding target to table



Steps to reproduce this problem

~$:pvs

  PV         VG Fmt  Attr PSize  PFree

  /dev/loop0 vg lvm2 a--  10.00t 10.00t

  /dev/loop1 vg lvm2 a--  10.00t 10.00t

  /dev/loop2 vg lvm2 a--  10.00t 10.00t

  /dev/loop3    lvm2 ---  10.00t 10.00t

  /dev/loop4    lvm2 ---  10.00t 10.00t

  /dev/loop5    lvm2 ---  10.00t 10.00t



~$:lvcreate -nlv  -L27T vg

  Logical volume "lv" created.



~$:vgextend vg /dev/loop[3-5]

  Volume group "vg" successfully extended



~$:lvconvert  --type mirror --mirrors 1 --stripes 3 -I256  /dev/vg/lv
/dev/loop3 /dev/loop4 /dev/loop5

  device-mapper: reload ioctl on  (254:0) failed: Invalid argument

  Failed to lock logical volume vg/lv.

~$: lvs

  WARNING: Reading VG vg from disk because lvmetad metadata is invalid.

  LV      VG Attr       LSize  Pool Origin Data%  Meta%  Move Log
Cpy%Sync Convert

  lv      vg -wi-a----- 27.00t

  lv_mlog vg -wi-a-----  4.00m

~$: pvs

  PV         VG Fmt  Attr PSize  PFree

  /dev/loop0 vg lvm2 a--  10.00t     0

  /dev/loop1 vg lvm2 a--  10.00t     0

  /dev/loop2 vg lvm2 a--  10.00t  3.00t

  /dev/loop3 vg lvm2 a--  10.00t 10.00t

  /dev/loop4 vg lvm2 a--  10.00t 10.00t

  /dev/loop5 vg lvm2 a--  10.00t 10.00t



Analysis: In kernel space the required log size depends on the whole

target device size.But in user space, the log size is calculated from

the whole target devices size divided by allocation area number, which

leads to the mismatch here.



Signed-off-by: Lidong Zhong <lidong.zhong@suse.com>

---

 lib/metadata/lv_manip.c | 3 +--

 1 file changed, 1 insertion(+), 2 deletions(-)



diff --git a/lib/metadata/lv_manip.c b/lib/metadata/lv_manip.c

index 7e66afd9c..e8d67c79b 100644

--- a/lib/metadata/lv_manip.c

+++ b/lib/metadata/lv_manip.c

@@ -3730,8 +3730,7 @@ static struct alloc_handle *_alloc_init(struct
cmd_context *cmd,

 	} else {

 		ah->log_area_count = metadata_area_count;

 		ah->log_len = !metadata_area_count ? 0 :

-			_mirror_log_extents(ah->region_size, extent_size,

-					    (existing_extents + new_extents) / ah->area_multiple);

+			_mirror_log_extents(ah->region_size, extent_size, existing_extents +
new_extents);

 	}



 	if (total_extents || existing_extents)

-- 

2.26.2

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

