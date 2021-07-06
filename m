Return-Path: <SRS0=LwB/=L7=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63382C07E95
	for <linux-lvm@archiver.kernel.org>; Wed,  7 Jul 2021 06:56:04 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEDBD61C82
	for <linux-lvm@archiver.kernel.org>; Wed,  7 Jul 2021 06:56:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEDBD61C82
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-tAbLSY-9NrSYaWwiy0LfRg-1; Wed, 07 Jul 2021 02:56:01 -0400
X-MC-Unique: tAbLSY-9NrSYaWwiy0LfRg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07DD2343CE;
	Wed,  7 Jul 2021 06:55:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D00FF19C44;
	Wed,  7 Jul 2021 06:55:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 15DB34EA2A;
	Wed,  7 Jul 2021 06:55:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1662vVUi019442 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 5 Jul 2021 22:57:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 24F95110DBC8; Tue,  6 Jul 2021 02:57:31 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FF6F110DBC7
	for <linux-lvm@redhat.com>; Tue,  6 Jul 2021 02:57:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 924A31064E69
	for <linux-lvm@redhat.com>; Tue,  6 Jul 2021 02:57:28 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.111.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-560-yOSkRmXmOiyJFHwCt1m1TA-1;
	Mon, 05 Jul 2021 22:57:26 -0400
X-MC-Unique: yOSkRmXmOiyJFHwCt1m1TA-1
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
	(mail-db3eur04lp2056.outbound.protection.outlook.com [104.47.12.56])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-40-tKYgVj5FNsWm1X3ucrZOrA-1; Tue, 06 Jul 2021 04:57:24 +0200
X-MC-Unique: tKYgVj5FNsWm1X3ucrZOrA-1
Received: from AM0PR04MB6529.eurprd04.prod.outlook.com (2603:10a6:208:16f::21)
	by AM0PR04MB4739.eurprd04.prod.outlook.com (2603:10a6:208:c1::32)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31;
	Tue, 6 Jul 2021 02:57:22 +0000
Received: from AM0PR04MB6529.eurprd04.prod.outlook.com
	([fe80::904c:ed81:6580:299d]) by
	AM0PR04MB6529.eurprd04.prod.outlook.com
	([fe80::904c:ed81:6580:299d%6]) with mapi id 15.20.4287.033;
	Tue, 6 Jul 2021 02:57:22 +0000
To: linux-lvm@redhat.com
From: Zhong Lidong <lidong.zhong@suse.com>
Message-ID: <177d20e6-71d1-37ff-f2af-59673e9cba09@suse.com>
Date: Tue, 6 Jul 2021 10:57:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.8.0
X-Originating-IP: [39.71.39.70]
X-ClientProxiedBy: PR1P264CA0007.FRAP264.PROD.OUTLOOK.COM
	(2603:10a6:102:19e::12) To AM0PR04MB6529.eurprd04.prod.outlook.com
	(2603:10a6:208:16f::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from l3-laptop.suse (39.71.39.70) by
	PR1P264CA0007.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19e::12)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.21
	via Frontend Transport; Tue, 6 Jul 2021 02:57:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2d8c4d9-8edc-4efa-7840-08d94029c705
X-MS-TrafficTypeDiagnostic: AM0PR04MB4739:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB4739DB70989B7FC092DFA9A2F81B9@AM0PR04MB4739.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: UWjweV33F0NrwnTT+Q58eHfziMe/4InBeUnvESLFuuLRxALBbbyB+navcCnmps7fZOA0vAenNEWWtgT9WgmiRiIQHUH/eSrQeT3hMi+R01BOUefXUTjHq037Suyb2PtJmqAq8h1eRbX+lLbYEYfNm91z+y79qu7Ta6lw40D3VBydFqhnmX8dpNlFgL4HzgQA+yeXsg/HVK6ZUScNXV3DzjOxTNxDpqgbFgwYc5gHPBZW7i0s12lfYH8EIxWy5Ve0Mt9i+AfWboWuuwa6SJDALg/ThtTMfwoj6V8Zsm0rQXLq+bKv9HAfEb1CXz+TZR/4L/CtrOpuwlAyloGrGwGfO1pGq8PYv7Va2zlpO5AV7BRW46bUKwX9t+IWwOQO1VdxiGjU7PFsTr+c8Bxq41VBx1H4TWNUBDFRrMvigX2QaXgndhfw67n8ynSBc5E6Z2o4WNnPL3EhnHUwlYhO47YheJHPZMd9nvaVtU55CWugKNFH46mC9VUECRkyno1gf11X6myb+R5Lm0VLMmoszME7aIunKNUajEw9VzpDkoLCR5glWzkrVUZX+/iil0TOEFj8b85sxqiya1KLJ8JdTGxi2jCAAgwldSXUUkyqD7tfNhxEx/eEkz8fm5AC7I3T2M91N4mabb/ObqavEL5ry6vDXt54/MvFuk2VLzFi3+d2NnalGusY17FCwHvogWfwEG+Fv4xh2jXmMNvXR3YZjJgsaShVS7T8oxWWUiAcQhWlBCc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:AM0PR04MB6529.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(39850400004)(366004)(396003)(136003)(346002)(376002)(8936002)(5660300002)(316002)(478600001)(186003)(6512007)(4326008)(956004)(31696002)(66946007)(66556008)(8676002)(16526019)(31686004)(26005)(66476007)(2616005)(36756003)(6486002)(83380400001)(38100700002)(6666004)(6506007)(6916009)(8886007)(107886003)(2906002)(86362001)(43740500002)(45980500001);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?XdP+s7ApQjbG+S14Xp6Mtoi9pM+xW0HoBUPLSiIIYQXOc59zV94JoggT?=
	=?Windows-1252?Q?a0cnIwbglasvE+NbSsRJx8dnQtf5eFrJAHQpDapzwtbyZ+MB6AdbXkT7?=
	=?Windows-1252?Q?7ul4bngmLo5klee8PjXrJIjWRuA780nSEGRhRXl9T5EO9xL2+0/uB5YR?=
	=?Windows-1252?Q?9eoWqq8a1I1TwhDy1JQ4Kythr6gPJAzUye/V6FFWyQDGK5xRbgBIYVGU?=
	=?Windows-1252?Q?VOyLddrR9Xiq27rU1FZiP0s2wZ3sY4d9nQ4hyBXlHmjzIQgM7dWZgOlW?=
	=?Windows-1252?Q?ewK5h5Edvh0TVRrRPMaLs6oC6b86ygV3O7sEneSdaHVjjw6GHKCoc1fg?=
	=?Windows-1252?Q?DQYh9wOporJ+JGVd27mD6Hwqa4aTdBDdQaMdwuqXYfDBtqWPgRl3lISE?=
	=?Windows-1252?Q?idYFg4Ebqtulj11TazH5Yyk9RMMVruG6sAJvVjuM8eRatYL1lD598nkq?=
	=?Windows-1252?Q?i5eWzeLwj2Esq80s1Xvvm7fWK244j6YP9EKa2GbpxQvLU2oezZ5B7R+C?=
	=?Windows-1252?Q?sVMp0wvl5IkUSkGxfBZwE7qBBApBkFjlfjlSMbqGBIYNSc0lmxxxqZNe?=
	=?Windows-1252?Q?ixfgWo/+XjSHoIBQGcLUAuEP5rbq0mOH5oU0ybIFKxxukRDDUfNzi5pG?=
	=?Windows-1252?Q?Ie9ATu2lasXN2H8qqNgWfPUZNZsyoo8x4RBEwp86v3V/Jp1yjQIYJtp1?=
	=?Windows-1252?Q?Sv5rLAUnI5SHLL0E0KZhww7JSBf3bUkqUX1e9BT1WihIImz948KssY7m?=
	=?Windows-1252?Q?jSG3H1gCYyYoYEYBvSqJfjviCgiJHw3JnstnfzYHSF5XVC9wnmj1T3Js?=
	=?Windows-1252?Q?G6NumPkbPBpXzFPQgkweneeVQ8rg9Y44WJpaW6hRP/nJziP36lfBCc3t?=
	=?Windows-1252?Q?YrFyH7+Sk+fEt1ButHxvQjstmi7+HIRnJM3VB0NF3KK4MVgtgxzBUm4e?=
	=?Windows-1252?Q?MSbctSeYm8O+2ZugAsZLx1L0ScOiAbCakaO/+JuvpIRekWEa3+6KNY1m?=
	=?Windows-1252?Q?OFnQ+j9FkxQAEY6THXBwjEbG/wgGBE/d9ClZHonDisbIvgxiT+FSnW+c?=
	=?Windows-1252?Q?vcpQu32zovu8IBuBfZ5i8GYqAEbavuI79juxjyH7iz3WlD8+mZ7jTNbQ?=
	=?Windows-1252?Q?6Hgw+MWBNZSf83PDhIiktWBFqF5JCSPEE1U48o0rbfKCzy4a11Iyte+5?=
	=?Windows-1252?Q?SDExj54NM5M0WCFbQQYcVRg/uaohat8rVhuq6J1uB3uOjbmqB2sXzGw5?=
	=?Windows-1252?Q?g8+4ZiRI0eSa+mpXuXEQ1yuzMVWX+NTiC2VH2+CGeOF29XwoYu8M5Vpw?=
	=?Windows-1252?Q?6iyPgMPTv9DTWl2kciDK3oW8Zl0Y49cAnlTuiybsR+pzlLlhQa0q9uXV?=
	=?Windows-1252?Q?czjZjb8dIrRfmN62KFmb0p0EOhpia5xBYbV+GAW2l7pFRb8wh2KVH4E4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2d8c4d9-8edc-4efa-7840-08d94029c705
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6529.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 02:57:22.7706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LbsVYY4SjrZbTYZrYrowp2b1/XZlI3Xx7oJ2rCgKLcxaV1jnPINfzxTtfv1RjhiwHdURv/dVQ7jozWjt6d1N7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4739
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
X-Mailman-Approved-At: Wed, 07 Jul 2021 02:55:02 -0400
Cc: Lidong Zhong <lidong.zhong@suse.com>
Subject: [linux-lvm] [RFC PATCH] lvconvert: fix the size of log device when
 converting, from linear to mirror
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

